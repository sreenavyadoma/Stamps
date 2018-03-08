module Stamps
  module Orders
    module Stores
=begin
      class BigCommerceSettings < StoreSettings
        def window_title
          StampsField.new driver.div text: "BigCommerce Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end
=end

      class BigCommerce < WebApps::Base

        def window_title
          StampsField.new driver.div(text: "Connect your Bigcommerce Store")
        end

        def present?
          window_title.present?
        end

        def external_link
          StampsField.new driver.u(text: "here.")
        end

      end

      class ModifyBigCommerceStore < BigCommerce
      end

      class BigCommercePage < WebApps::Base
      end
    end
  end
end