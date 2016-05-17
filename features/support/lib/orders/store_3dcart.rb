module Orders
  module Stores
    class ThreeDCartSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div(text: "3DCart Settings")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class ThreeDCart < OrdersObject

      class ProductWeightUnit < OrdersObject
        def select selection
          drop_down = StampsButton.new (@browser.divs(css: "div[id^=combo-][id$=-trigger-picker]").last)
          textbox = StampsTextbox.new @browser.text_field(css: "input[name^=combo-][name$=-inputEl][role=combobox]")
          selection_field = StampsLabel.new @browser.li(text: "#{selection}")
          10.times do
            drop_down.safe_click unless selection_field.present?
            selection_field.safe_click
            break if textbox.text.include? selection
          end
        end
      end

      def present?
        browser_helper.present? @browser.div(:text => "Connect your 3DCart Store")
      end

      def close
        button = StampsButton.new (browser.imgs(css: "img[class*='x-tool-img x-tool-close']").last)
        5.times do
          button.safe_click
          break unless present?
        end
      end

      def api_user_key
        StampsTextbox.new @browser.text_field(css: "input[name^=textfield-][name$=-inputEl][type=password]")
      end

      def store_url
        StampsTextbox.new (@browser.text_fields(css: "input[name^=textfield-][name$=-inputEl][type=text]").last)
      end

      def weight_unit
        ProductWeightUnit.new @browser
      end

      def connect_button
        StampsButton.new @browser.span(text: "Connect")
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        settings = ThreeDCartSettings.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser
        server_error = Orders::Stores::ServerError.new @browser
        connecting_button = StampsButton.new @browser.span(text: "Connecting...")

        max_server_error_retry_count = 5

        20.times do |counter|
          button.safe_click
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if server_error.present?
            error_str = server_error.message
            log.info error_str
            server_error.ok
            stop_test "Server Error: \n#{error_str}" unless counter < max_server_error_retry_count
          end
          log.info connecting_button.text if connecting_button.visible?
          return settings if settings.present?
        end
        stop_test "Rakuten Store Connect failed.  Settings Modal did not open.  "
      end

      def reconnect
        button = StampsButton.new @browser.span(text: "Connect")
        manage_stores = ManageStores.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser
        server_error = Orders::Stores::ServerError.new @browser
        connecting_button = StampsButton.new @browser.span(text: "Connecting...")

        max_server_error_retry_count = 5

        10.times do |counter|
          button.safe_click
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if server_error.present?
            error_str = server_error.message
            log.info error_str
            server_error.ok
            stop_test "Server Error: \n#{error_str}" unless counter < max_server_error_retry_count
          end
          log.info connecting_button.text if connecting_button.visible?
          return manage_stores if manage_stores.present?
        end
      end
    end

    class Modify3DCartStore < ThreeDCart

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your 3DCart Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end
  end
end
