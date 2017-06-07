module Stamps
  module Orders
    module OrderDetailsCommon

      class ShipFromAddress < Browser::StampsModal
        attr_reader :drop_down, :text_box, :manage_shipping_address

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
          @manage_shipping_address = ShipFrom::ManageShippingAddresses.new(param)
        end

        def select(str)
          return manage_shipping_address if manage_shipping_address.present?
          drop_down.click
          sleep(1)
          selection = StampsElement.new((str.downcase.include?('default'))?browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0]:browser.li(text: /#{str}/))

          if str.downcase.include?("manage shipping")
            15.times do
              sleep(0.35)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              return manage_shipping_address if manage_shipping_address.present?
              expect(manage_shipping_address.present?).to be(true), "Manage Shipping Address modal did not come up."
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

      module ServiceCost
        def cost_label
          labels = browser.label(text: "Service:").parent.labels
          cost_element = nil
          labels.each do |label|
            cost_element = label if label.text.include?('.')
          end
          cost_element
        end

        def cost
          helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def inline_cost(service_name)
          cost_label = StampsElement.new(browser.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
          10.times do
            begin
              drop_down.click unless cost_label.present?
              if cost_label.present?
                service_cost = helper.remove_dollar_sign(cost_label.text)
                logger.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                drop_down.click if cost_label.present?
                return service_cost.to_f.round(2)
              end
            rescue
              #ignore
            end
          end
        end
      end

      class OrdersService < Browser::StampsModal
        attr_reader :text_box, :drop_down
        def initialize(param, form_type)
          super(param)
          case form_type
            when :single_order
              @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm][id$=targetEl]>div>div>div>div>div>div>div>input[id^=service]"))
              @drop_down = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
            when :multi_order_dom
              @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
              @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
            when :multi_order_int
              @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
              @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
            else
              expect([:single_order, :multi_order_dom, :multi_order_int]).to include(form_type)
          end
          @blur_element = Stamps::Orders::Details::BlurOutElement.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def select(str)
          logger.info "Select service #{str}"
          sleep(0.35)
          selection = StampsElement.new(browser.td(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text"))
          10.times do
            begin
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              logger.info "Selected service #{text_box.text} - #{(text_box.text.include? str)?"success": "service not selected"}"
              sleep(0.15)
              break if text_box.text.include?(str)
            rescue
              #ignore
            end
          end
          expect(text_box.text).to include(str)
        end

        def tooltip(selection)
          button = drop_down
          selection_label = StampsElement.new(browser.tr(css: "tr[data-qtip*='#{selection}']"))
          10.times do
            begin
              button.click unless selection_label.present?
              sleep(0.15)
              if selection_label.present?
                tooltip = selection_label.attribute_value("data-qtip")
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              #ignore
            end
          end
          blur_out
        end

        def disabled?(service)

          @details_services = data_for(:orders_services, {})

          selection_field = browser.li(id: "#{@details_services[service]}")
          #selection_element = browser.tr css: "tr[data-qtip*='#{service}']"
          selection_label = StampsElement.new selection_field

          10.times do |index|
            drop_down.click unless selection_label.present?
            sleep(0.35)
            if selection_field.present?
              disabled_field = StampsElement.new(selection_field.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep(0.35)
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    drop_down.click
                    return result
                  end
                end
              rescue
                #ignore
              end
            else
              sleep(0.35)
              return true if index == 5 #try to look for service in service selection drop-down 3 times before declaring it's disabled.
            end
          end
        end

        def enabled? service
          !(disabled? service)
        end
      end

      class OrderDetailsWeight < Browser::StampsModal
        attr_reader :lb, :oz
        def initialize(param, form_type)
          super(param)
          case form_type
            when :single_order
              text_box = browser.text_field(name: 'WeightLbs')
              inc_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=up]")
              dec_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=down]")
              @lb = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

              text_box = browser.text_field(name: 'WeightOz')
              inc_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=up]")
              dec_btn = browser.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=down]")
              @oz = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

            when :multi_order
              text_box = browser.text_field(name: 'WeightLbs')
              inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=up]")
              dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=down]")
              @lb = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

              text_box = browser.text_field(name: 'WeightOz')
              inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=up]")
              dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=down]")
              @oz = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
            else
              expect([:single_order, :multi_order]).to include(form_type)
          end
        end
      end
    end
  end
end