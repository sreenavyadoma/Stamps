module Orders
  module Stores
    class AmazonSettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div(text: "Amazon Settings")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Amazon < OrdersObject
      class OrderSource < OrdersObject
        def text_box
          StampsTextbox.new (@browser.text_field :name => "AmazonMarketplace")
        end

        def drop_down
          StampsButton.new (@browser.divs :css => "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[2]
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = StampsLabel.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
            selection_field.safe_click
            break if text_field.text.include? selection
          end

          log.info "Order Source #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
        end

        def amazon
          select "Amazon.com"
        end

        def non_amazon
          select "Non-Amazon"
        end
      end

      class ProductIdentifier < OrdersObject
        def text_box
          StampsTextbox.new (@browser.text_field :css => "input[name^=combo-][name$=-inputEl]")
        end

        def drop_down
          StampsButton.new ((@browser.divs(css: "div[id^=combo-][id$=-trigger-picker]")).last)
        end

        def select selection
          dd = drop_down
          text_field = text_box
          selection_field = StampsLabel.new (@browser.li :text => selection)

          10.times do
            dd.safe_click unless selection_field.present?
            sleep 1
            selection_field.safe_click
            selection_field.safe_click
            break if text_field.text.include? selection
          end

          log.info "Product Identifier #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
        end

        def use_sku
          select "Use SKU"
        end

        def use_asin
          select "Use the ASIN"
        end

      end

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Amazon Store")
      end

      def present?
        browser_helper.present? @browser.span(:text => "Verify Seller ID")
      end

      def close
        button = StampsButton.new @browser.img(css: "div[id^=connectamazonwindow-][id$=header-targetEl]>div>img")
        5.times do
          button.safe_click
          break unless present?
        end
      end

      def seller_id
        StampsTextbox.new @browser.text_field(:name => "AmazonSellerID")
      end

      def auth_token
        StampsTextbox.new @browser.text_field(:name => "AuthToken")
      end

      def verify_seller_id
        button = StampsButton.new (@browser.span :text => "Verify Seller ID")
        3.times do
          button.safe_click
        end
      end

      def order_source
        OrderSource.new @browser
      end

      def product_identifier
        ProductIdentifier.new @browser
      end

      def connect
        button = StampsButton.new @browser.span(text: "Connect")
        server_error = Orders::Stores::ServerError.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        20.times do
          button.safe_click
          sleep 1
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.safe_click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          break unless present?
          sleep 1
          if server_error.present?
            log.info server_error.message
            server_error.ok
          end
        end
        self.close if self.present?
        stop_test server_error.message if server_error.present?
      end

      def connect_expecting_store_settings
        button = (StampsButton.new(@browser.span :text => "Connect"))
        settings = AmazonSettings.new @browser
        server_error = Orders::Stores::ServerError.new @browser
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        20.times do
          button.safe_click
          sleep 2
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
            return settings if settings.present?
          end
          return settings if settings.present?
        end

        self.close if self.present?
        stop_test server_error.message if server_error.present?
        settings
      end
    end

    class ModifyAmazonStore < Amazon

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Amazon Store Connection")
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
