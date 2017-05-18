module Stamps
  module Orders
    module OrderDetailsCommon
      class ShipFromAddress < Browser::StampsModal
        attr_reader :drop_down, :text_box, :manage_shipping_adddress, :blur_element

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
    end
  end
end