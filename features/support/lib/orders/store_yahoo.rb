module Stamps
  module Orders
    module Stores
      class YahooSettings < StoreSettings
        def window_title
          BrowserElement.new browser.div text: "Yahoo Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Yahoo < Browser::Modal

        def window_title
          BrowserElement.new browser.div(text: "Connect your Yahoo Store")
        end

        def present?
          window_title.present?
        end

        def store_id
          BrowserTextBox.new browser.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div[id^=textfield]>div[id$=bodyEl]>div>div>input")
        end

        def contact_token
          parent = browser.span(text: "Partner Store Contract Token").parent.parent
          input = parent.divs[0].div.div.text_box
          raise "Contact Token textbox does not exist or textbox locator is wrong." unless input.present?
          BrowserTextBox.new input
        end

        def first_order_id_to_import
          BrowserTextBox.new browser.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div:nth-child(4)>div>div>div>div>div>div>input")
        end

        def connect_button
          BrowserElement.new browser.span(text: "Connect")
        end

        def connect
          button = BrowserElement.new browser.span(text: "Connect")
          settings = YahooSettings.new param
          server_error = Orders::Stores::ServerError.new param
          importing_order = Orders::Stores::ImportingOrdersModal.new param

          max_server_error_retry_count = 5

          20.times do |counter|
            button.safe_click
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              stop_test "Server Error: \n#{error_str}" unless counter < max_server_error_retry_count
            end
            return settings if settings.present?
          end
          stop_test "Yahoo Store Connect failed.  Settings Modal did not open.  "
        end

        def reconnect
          button = BrowserElement.new browser.span(text: "Connect")
          server_error = Orders::Stores::ServerError.new param
          manage_stores = ManageStores.new param
          importing_order = Orders::Stores::ImportingOrdersModal.new param

          max_server_error_retry_count = 5

          20.times do |counter|
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              stop_test "Server Error: \n#{error_str}" unless counter < max_server_error_retry_count
            end
            return manage_stores if manage_stores.present?
          end
          stop_test "Yahoo Store Connect failed.  Settings Modal did not open.  "
        end

        def reconnect_old
          button = BrowserElement.new browser.span(text: "Connect")
          manage_stores = ManageStores.new param
          importing_order = Orders::Stores::ImportingOrdersModal.new param

          10.times do
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep 1
            return manage_stores if manage_stores.present?
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
          end
        end
      end

      class ModifyYahooStore < Yahoo

        def window_title
          BrowserElement.new(browser.div text: "Modify your Yahoo Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class YahooPage < Browser::Modal
        def present?
          browser.url.include? "shopify.com"
        end

        def username
          BrowserTextBox.new browser.text_field(id: 'login-input')
        end

        def password
          BrowserTextBox.new browser.text_field(id: 'password')
        end

        def sign_in
          button = BrowserElement.new browser.text_field(css: "input[value='Log in']")
          settings_page = ShopifySettings.new param

          10.times do
            button.safe_click
            sleep 5
            return settings_page if settings_page.present?
          end
        end
      end
    end
  end
end