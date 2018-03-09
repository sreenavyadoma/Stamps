module Stamps
  module Orders
    ##
    # Orders Loading Orders... modal
    module LoadingOrders
      def loading_orders
        cache[:loading_orders].nil? || !cache[:loading_orders].present? ? cache[:loading_orders] = StampsField.new(driver.div(text: 'Loading orders...')) : cache[:loading_orders]
      end
    end

    ##
    # Orders floating modals
    class StampsOrdersModals < Stamps::WebApps::Base
      
      def orders_print_modal
        cache[:orders_print_modal] = Printing::OrdersPrintModal.new(param) if cache[:orders_print_modal].nil?
        cache[:orders_print_modal]
      end

      def orders_settings_modal
        cache[:orders_settings] = OrdersSettings::OrdersSettingsModal.new(param) if cache[:orders_settings].nil?
        cache[:orders_settings]
      end

      def split_order_modal
        cache[:split_order] = SplitOrder::Modal.new(param) if cache[:split_order].nil?
        cache[:split_order]
      end

      def insurance_terms_conditions
        ::SingleOrder::InsuranceTermsConditions.new(param) #todo-Rob-usps-terms move set_and_agree_to_terms out of page object onto step def.
      end

      def manage_shipping_addresses
        cache[:manage_shipping_addresses].nil? ? cache[:manage_shipping_addresses] = ShipFrom::ManageShippingAddresses.new(param) : cache[:manage_shipping_addresses]
      end

      def add_shipping_address
        cache[:add_shipping_address].nil? ? cache[:add_shipping_address] = ShipFrom::AddShippingAddress.new(param) : cache[:add_shipping_address]
      end

      def delete_shipping_address
        cache[:delete_shipping_address].nil? ? cache[:delete_shipping_address] = ShipFrom::DeleteShippingAddress.new(param) : cache[:delete_shipping_address]
      end
    end

    module TermsAndConditions
      class TermsAndConditionsModal < Stamps::WebApps::Base
        
        def present?
          i_agree_button.present?
        end

        def wait_until_present(*args)
          i_agree_button.wait_until_present(*args)
        end

        def i_agree_button
          cache[:i_agree] = StampsInput.new(driver.iframe(css: "iframe[id^=component-]").input(class: 'acceptBtn stamps')) if cache[:i_agree].nil? || !cache[:i_agree].present?
          cache[:i_agree]
        end

        def i_agree
          15.times do
            i_agree_button.click
            break unless present?
          end
        end

        def form_body
          cache[:form_body] = StampsField.new(driver.iframe(css: "iframe[id^=component-]").form.div(css: "[class=form-body]").ps[0]) if cache[:form_body].nil? || !cache[:form_body].present?
          cache[:form_body]
        end

        def close
          cache[:close] = StampsField.new(driver.img(css: "[class*=x-tool-close]")) if cache[:close].nil? || !cache[:close].present?
          cache[:close]
        end
      end

      def terms_conditions
        cache[:terms_conditions] = TermsAndConditionsModal.new(param) if cache[:terms_conditions].nil?
        cache[:terms_conditions]
      end
    end
  end
end
