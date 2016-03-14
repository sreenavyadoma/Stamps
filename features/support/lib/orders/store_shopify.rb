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
        end
        raise "Rakuten Store Connect failed.  Settings Modal did not open.  "
      end
    end

    class ModifyShopifyStore < Etsy

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Etsy Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class ReconnectShopifyStore < Etsy

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Rakuten Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class ShopifySignInPage < OrdersObject
      def present?
        browser_helper.present? @browser.text_field(id: 'username-existing')
      end

      def username
        StampsTextbox.new @browser.text_field(id: 'username-existing')
      end

      def password
        StampsTextbox.new @browser.text_field(id: 'password-existing')
      end

      def sign_in
        button = StampsInput.new @browser.input(id: 'signin_button')
        etsy_page = EtsyPage.new @browser

        10.times do
          button.send_keys :enter
          button.safe_click
          return etsy_page if etsy_page.present?
        end
      end
    end

    class ShopifyPage < OrdersObject
      def present?
        @browser.url.include? "etsy.com"
      end

      def allow_access
        button = StampsInput.new @browser.input(css: 'input[type=submit]')
        settings = EtsySettings.new @browser

        3.times do
          @browser.execute_script("window.scrollBy(0,400)")
          button.send_keys :enter
          button.safe_click
          sleep 5
          return settings if settings.present?
        end
        raise "Etsy Page:  Clicking Allow Access did not open Etsy Store Settings modal."
      end

      def allow_access_after_reconnect
        button = StampsInput.new @browser.input(css: 'input[type=submit]')
        manage_stores = ManageStores.new @browser

        3.times do
          @browser.execute_script("window.scrollBy(0,400)")
          button.send_keys :enter
          button.safe_click
          sleep 5
          return manage_stores if manage_stores.present?
        end
        raise "Etsy Page:  Clicking Allow Access did not open Etsy Store Settings modal."
      end
    end

  end
end
