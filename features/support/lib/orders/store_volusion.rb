module Orders
  module Stores
    class Volusion < OrdersObject
      def api_url url
        textbox = StampsTextbox.new @browser.text_field(css: "div>input[id^=textfield-][id$=-inputEl][name^=textfield-][name$=-inputEl][class*=required]")
        textbox.set_until url
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
        connected = connect_button

      end
    end
  end
end
