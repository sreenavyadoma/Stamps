module Stamps
  module Orders
    module LoadingOrders
      def loading_orders
        (cache[:loading_orders].nil?||!cache[:loading_orders].present?)?cache[:loading_orders]=StampsField.new(browser.div(text: 'Loading orders...')):cache[:loading_orders]
      end
    end

    module MarketPlaceStoreModals
      def paypal_store
        (cache[:paypal_store].nil?||!cache[:paypal_store].present?)?cache[:paypal_store]=Stamps::Orders::Stores::PayPal.new(param):cache[:paypal_store]
      end

      def rakuten
        (cache[:rakuten].nil?||!cache[:rakuten].present?)?cache[:rakuten]=Stamps::Orders::Stores::Rakuten.new(param):cache[:rakuten]
      end

      def square_store
        (cache[:square_store].nil?||!cache[:square_store].present?)?cache[:square_store]=Stamps::Orders::Stores::Square.new(param):cache[:square_store]
      end

      def shipstation
        (cache[:shipstation].nil?||!cache[:shipstation].present?)?cache[:shipstation]=Stamps::Orders::Stores::OpenCart.new(param):cache[:shipstation]
      end
    end

    module StampsOrdersModals
      def orders_print_modal
        (cache[:orders_print_modal].nil?||!cache[:orders_print_modal].present?)?cache[:orders_print_modal]=Stamps::Orders::Printing::OrdersPrintModal.new(param):cache[:orders_print_modal]
      end

      def orders_settings
        (cache[:orders_settings].nil?||!cache[:orders_settings].present?)?cache[:orders_settings]=Stamps::Orders::OrdersSettings::OrdersSettingsModal.new(param):cache[:orders_settings]
      end

      def marketplace
        (cache[:marketplace].nil?||!cache[:marketplace].present?)?cache[:marketplace]=Stamps::Orders::Stores::Marketplace.new(param):cache[:marketplace]
      end
    end
    
    module TermsAndConditions
      class TermsAndConditionsModal < Stamps::Browser::StampsModal
        def present?
          i_agree_button.present?
        end

        def wait_until_present(*args)
          i_agree_button.wait_until_present(*args)
        end

        def i_agree_button
          (cache[:i_agree].nil?||!cache[:i_agree].present?)?cache[:i_agree]=StampsInput.new(browser.iframe(css: "iframe[id^=component-]").input(class: 'acceptBtn stamps')):cache[:i_agree]
        end

        def i_agree
          15.times do
            i_agree_button.click
            break unless present?
          end
        end

        def form_body
          (cache[:form_body].nil?||!cache[:form_body].present?)?cache[:form_body]=StampsField.new(browser.iframe(css: "iframe[id^=component-]").form.div(css: "[class=form-body]").ps[0]):cache[:form_body]
        end

        def close
          (cache[:close].nil?||!cache[:close].present?)?cache[:close]=StampsField.new(browser.img(css: "[class*=x-tool-close]")):cache[:close]
        end
      end

      def terms_conditions
        (cache[:terms_conditions].nil?||!cache[:terms_conditions].present?)?cache[:terms_conditions]=TermsAndConditionsModal.new(param):cache[:terms_conditions]
      end
    end
  end
end
