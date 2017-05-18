module Stamps
  module Orders
    module OrderDetailsCommon
      class ShipFromAddress < Browser::StampsModal
        attr_reader :drop_down, :text_box, :manage_shipping_adddress

        def initialize(param, form_type)
          super(param)
          case form_type
            when :single_order
              @text_box = StampsTextBox.new browser.text_fields(name: "ShipFrom")[0]
              @drop_down = StampsElement.new browser.divs(css: "div[id^=shipfromdroplist][id$=trigger-picker]")[0]
            when :multi_order
              @text_box = StampsTextBox.new browser.text_fields(name: "ShipFrom")[1]
              @drop_down = StampsElement.new browser.divs(css: "div[id^=shipfromdroplist][id$=trigger-picker]")[1]
            else
              # invalid selection.
              expect([:single_order, :multi_order]).to include(form_type)
          end
          @manage_shipping_adddress = ShipFrom::ManageShippingAddresses.new(param)
        end

        def select(str)
          return manage_shipping_adddress if manage_shipping_adddress.present?
          drop_down.click
          sleep(1)
          selection = StampsElement.new((str.downcase.include?('default'))?browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0]:browser.li(text: /#{str}/))
          sleep(1)

          if str.downcase.include?("manage shipping")
            15.times do
              sleep(0.35)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              return manage_shipping_adddress if manage_shipping_adddress.present?
              expect(manage_shipping_adddress).to be_present, "Manage Shipping Address modal did not come up."
            end
          else
            15.times do
              sleep(0.35)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              sleep(0.35)
              return if text_box.text.downcase.include?(str.downcase)
            end
          end
        end
      end

      class Service < Browser::StampsModal
        attr_reader :text_box, :drop_down
        def initialize(param, form_type)
          super(param)
          case form_type
            when :single_order
              @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm][id$=targetEl]>div>div>div>div>div>div>div>input[id^=service]"))
              @drop_down = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
            when :multi_order
              @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
              @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
            else
              expect([:single_order, :multi_order]).to include(form_type)
          end
        end

        def select(str)
          logger.info "Select service #{str}"

          sel_arr = str.split(/\s+/)
          substr = (sel_arr.size>=2?"#{sel_arr[0]} #{sel_arr[1]}":"#{sel_arr[0]}")

          selection = StampsElement.new browser.td(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text")

          20.times do
            begin
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              blur_out
              logger.info "Selected service #{text_box.text} - #{(text_box.text.include? str)?"success": "service not selected"}"
              break if text_box.text.include?(substr)
            rescue
              #ignore
            end
          end
          logger.info "#{text_box.text} service selected."

          # Test if selected service includes abbreviated selection.
          expect(text_box.text).to include(substr)
          text_box.text
        end
      end


    end
  end
end