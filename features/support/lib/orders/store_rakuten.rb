module Orders
  module Stores
    class RakutenSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "Rakuten Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Rakuten < OrdersObject
      class RakutenSku < OrdersObject
        def check
          @browser.checkbox(css: "input[type=button][id^=checkbox]").set
          @browser.checkbox(css: "input[type=button][id^=checkbox]").set
        end

        def uncheck
          @browser.checkbox(css: "input[type=button][id^=checkbox]").clear
          @browser.checkbox(css: "input[type=button][id^=checkbox]").clear
        end
      end

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Rakuten Store")
      end

      def present?
        window_title.present?
      end

      def close
        button = StampsButton.new @browser.img(css: "div[id^=connectrakutenwindow-]>div:nth-child(2)>img")
        5.times do
          button.safe_click
          break unless present?
        end
      end

      def seller_id
        StmpsTextbox.new @browser.textarea(name: "RakutenSellerID")
      end

      def ftp_username
        StmpsTextbox.new (@browser.textareas(name: "AuthToken").first)
      end

      def ftp_password
        StmpsTextbox.new (@browser.textareas(name: "AuthToken").last)
      end

      def test_connection
        button = StampsButton.new @browser.span(text: 'Test Connection')
        10.times do
          button.safe_click
          button.safe_click
          break if browser_helper.present? @browser.span(text: "Connect")
        end
      end

      def map_rakuten_sku
        RakutenSku.new @browser
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        settings = RakutenSettings.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser
        store
        20.times do
          button.safe_click
          button.safe_click
          sleep 2 unless button.present?

        end
      end
    end
  end
end
