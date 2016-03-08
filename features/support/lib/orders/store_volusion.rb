module Orders
  module Stores

    class VolusionSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "Volusion Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Volusion < OrdersObject
      def present?
        browser_helper.present? @browser.div(text: "Connect your Volusion Store")
      end

      def api_url url
        textbox = StampsTextbox.new @browser.text_field(css: "div>input[id^=textfield-][id$=-inputEl][name^=textfield-][name$=-inputEl][class*=required]")
        textbox.set url
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
        button = connect_button
        settings = VolusionSettings.new @browser
        server_error = Orders::ServerError.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        20.times do
          button.safe_click
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
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
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          button.safe_click
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
          if server_error.present?
            log.info server_error.message
            server_error.ok
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
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          return settings if settings.present?
        end

        self.close if self.present?
        raise server_error.message if server_error.present?
        settings
      end

    end

  end
end
