module Stamps
  module Orders
    module Stores
=begin
      class YahooSettings < StoreSettings
        def window_title
          StampsField.new driver.div text: "Yahoo Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end
=end

      class Yahoo < WebApps::Base

        def window_title
          StampsField.new driver.div(text: "Connect your Yahoo Store")
        end

        def present?
          window_title.present?
        end

        def store_id
          StampsTextbox.new driver.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div[id^=textfield]>div[id$=bodyEl]>div>div>input")
        end

        def contact_token
          parent = driver.span(text: "Partner Store Contract Token").parent.parent
          input = parent.divs[0].div.div.textbox
          raise "Contact Token textbox does not exist or textbox locator is wrong." unless input.present?
          StampsTextbox.new input
        end

        def first_order_id_to_import
          StampsTextbox.new driver.text_field(css: "div[id^=connectyahoowindow-][id$=-body]>div>div>div>div>div[class*=x-box-layout-ct]>div>div>div:nth-child(4)>div>div>div>div>div>div>input")
        end

        def connect_button
          StampsField.new driver.span(text: "Connect")
        end

        def connect
          button = StampsField.new driver.span(text: "Connect")
          settings = YahooSettings.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          max_server_error_retry_count = 5

          20.times do |counter|
            button.click
            sleep(0.35)
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              log.info error_str
              server_error.ok
              expect("Server Error: \n#{error_str}").to eql "" unless counter < max_server_error_retry_count
            end
            return settings if settings.present?
          end
          expect("Yahoo Store Connect failed.  Settings Modal did not open.  ").to eql ""
        end

        def reconnect
          button = StampsField.new driver.span(text: "Connect")
          server_error = Orders::Stores::ServerError.new(param)
          manage_stores = ManageStores.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          max_server_error_retry_count = 5

          20.times do |counter|
            button.click
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              log.info error_str
              server_error.ok
              expect("Server Error: \n#{error_str}").to eql "" unless counter < max_server_error_retry_count
            end
            return manage_stores if manage_stores.present?
          end
          expect("Yahoo Store Connect failed. Settings Modal did not open.").to eql ""
        end

        def reconnect_old
          button = StampsField.new driver.span(text: "Connect")
          manage_stores = ManageStores.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          10.times do
            button.click
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            button.click
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
            return manage_stores if manage_stores.present?
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
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
            sleep(0.35)
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
            sleep(0.35)
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
            sleep(0.35)
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

      class ModifyYahooStore < Yahoo

        def window_title
          StampsField.new(driver.div text: "Modify your Yahoo Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class YahooPage < WebApps::Base
        def present?
          driver.url.include? "shopify.com"
        end

        def username
          StampsTextbox.new driver.text_field(id: 'login-input')
        end

        def password
          StampsTextbox.new driver.text_field(id: 'password')
        end

        def sign_in
          button = StampsField.new driver.text_field(css: "input[value='Log in']")
          settings_page = ShopifySettings.new(param)

          10.times do
            button.click
            sleep(5)
            return settings_page if settings_page.present?
          end
        end
      end
    end
  end
end