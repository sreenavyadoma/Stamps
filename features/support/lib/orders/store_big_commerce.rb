module Orders
  module Stores
    class BigCommerceSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "BigCommerce Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class BigCommerce < OrdersObject

      def window_title
        StampsLabel.new @browser.div(:text => "Connect your Bigcommerce Store")
      end

      def present?
        window_title.present?
      end

      def external_link
        StampsLink.new @browser.u(text: "here.")
      end

    end

    class ModifyBigCommerceStore < BigCommerce
    end

    class BigCommercePage < OrdersObject
    end
  end
end
