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

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Rakuten Store")
      end

      def present?
        seller_id.present?
      end

      def close
        button = StampsButton.new @browser.img(css: "div[id^=connectrakutenwindow-]>div:nth-child(2)>img")
        5.times do
          button.safe_click
          break unless present?
        end
      end

      def seller_id
        StampsTextbox.new @browser.text_field(name: "RakutenSellerID")
      end

      def ftp_username
        StampsTextbox.new (@browser.text_fields(name: "AuthToken").first)
      end

      def ftp_password
        StampsTextbox.new (@browser.text_fields(name: "AuthToken").last)
      end

      def test_connection
        button = StampsButton.new @browser.span(text: 'Test Connection')
        10.times do
          button.safe_click
          button.safe_click
          button.safe_click
          break if button.present?
        end
      end

      def map_rakuten_sku
        checkbox_field = (@browser.checkboxes(css: "input[type=button][id^=checkbox]").last)
        verify_field = checkbox_field.parent.parent.parent.parent
        attribute_name = "class"
        attribute_value = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        settings = RakutenSettings.new @browser
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
        stop_test "Rakuten Store Connect failed.  Settings Modal did not open.  "
      end
    end

    class ModifyRakutenStore < Rakuten

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

  end
end
