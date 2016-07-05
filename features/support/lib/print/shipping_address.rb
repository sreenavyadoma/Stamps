# encoding: utf-8
module Stamps
  module Print
    module Postage
      class ManageShippingAddresses < Browser::Modal
        def close
          browser_helper.safe_click (browser.img :css => "img[class*='x-tool-img x-tool-close']")
        end

        def wait_until_present
          window_title.wait_until_present
        end

        def present?
          window_title.present?
        end

        def window_title
          BrowserElement.new (browser.span :text => "Manage Shipping Addresses")
        end

      end
    end
  end
end