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
              expect([:single_order, :multi_order]).to include(form_type)
          end
          @manage_shipping_address = ShipFrom::ManageShippingAddresses.new(param)
        end

        def select(str)
          return manage_shipping_address if manage_shipping_address.present?
          drop_down.click
          sleep(1)
          selection = StampsElement.new((str.downcase.include?('default'))?browser.li(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=selected]"):browser.li(text: /#{str}/))

          if str.downcase.include?("manage shipping")
            15.times do
              sleep(0.35)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              return manage_shipping_address if manage_shipping_address.present?
              expect(manage_shipping_address).to be_present, "Manage Shipping Address modal did not come up."
            end
          else
            15.times do
              sleep(0.35)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              sleep(0.35)
              return if text_box.text.size > 1
            end
          end
        end
      end
    end
  end
end