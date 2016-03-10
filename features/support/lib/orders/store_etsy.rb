module Orders
  module Stores
    class EtsySettings < StoreSettings
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

    class Etsy < OrdersObject

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

      def etsy_username

      end

      def find_my_shops

      end

      def available_shops

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
        raise "Rakuten Store Connect failed.  Settings Modal did not open.  "
      end
    end

    class ReconnectEtsyStore < Etsy

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
