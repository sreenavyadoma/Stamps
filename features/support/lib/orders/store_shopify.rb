module Orders
  module Stores
    class ShopifySettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "Shopify Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Shopify < OrdersObject

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Shopify Store")
      end

      def present?
        window_title.present?
      end

      def shopify_domain
        StampsTextbox.new (@browser.text_fields(css: "input[name^=textfield-][name$=-inputEl]").last)
      end

      def test_connection
        button = StampsButton.new @browser.span(text: "Test Connection")
        connected = connect_button
        20.times do
          button.safe_click
          button.safe_click
          sleep 1
          break if connected.present?
        end
      end

      def connect_button
        StampsButton.new @browser.span(text: "Connect")
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        settings = ShopifySettings.new @browser
        shopify = ShopifyPage.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        10.times do
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          return settings if settings.present?
          return shopify if shopify.present?
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return settings if settings.present?
          return shopify if shopify.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return settings if settings.present?
          return shopify if shopify.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return settings if settings.present?
          return shopify if shopify.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return settings if settings.present?
          return shopify if shopify.present?
        end
        stop_test "Shopify Store Connect failed.  Settings Modal did not open.  "
      end

      def reconnect
        button = StampsButton.new @browser.span(text: "Connect")
        manage_stores = ManageStores.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        10.times do
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          return manage_stores if manage_stores.present?
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return manage_stores if manage_stores.present?
        end
      end
    end

    class ModifyShopifyStore < Shopify

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Shopify Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class ShopifyPage < OrdersObject
      def present?
        @browser.url.include? "shopify.com"
      end

      def username
        StampsTextbox.new @browser.text_field(id: 'login-input')
      end

      def password
        StampsTextbox.new @browser.text_field(id: 'password')
      end

      def sign_in
        button = StampsButton.new @browser.input(css: "input[value='Log in']")
        settings_page = ShopifySettings.new @browser

        10.times do
          button.safe_click
          sleep 5
          return settings_page if settings_page.present?
        end
      end
    end
  end
end
