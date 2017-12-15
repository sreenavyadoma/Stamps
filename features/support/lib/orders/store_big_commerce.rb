module Stamps
  module Orders
    module Stores
      class BigCommerceSettings < StoreSettings
        def window_title
          StampsField.new browser.div text: "BigCommerce Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class BigCommerce < Browser::Base

        def window_title
          StampsField.new browser.div(text: "Connect your Bigcommerce Store")
        end

        def present?
          window_title.present?
        end

        def external_link
          StampsField.new browser.u(text: "here.")
        end

      end

      class ModifyBigCommerceStore < BigCommerce
      end

      class BigCommercePage < Browser::Base
      end
    end
  end
end