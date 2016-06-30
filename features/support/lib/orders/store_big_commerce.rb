module Stamps
  module Orders
    module Stores
      class BigCommerceSettings < StoreSettings
        def window_title
          BrowserElement.new browser.div text: "BigCommerce Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class BigCommerce < Browser::Modal

        def window_title
          BrowserElement.new browser.div(:text => "Connect your Bigcommerce Store")
        end

        def present?
          window_title.present?
        end

        def external_link
          BrowserElement.new browser.u(text: "here.")
        end

      end

      class ModifyBigCommerceStore < BigCommerce
      end

      class BigCommercePage < Browser::Modal
      end
    end
  end
end