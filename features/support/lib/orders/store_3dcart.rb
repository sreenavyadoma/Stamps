module Stamps
  module Orders
    module Stores
      class ThreeDCartSettings < StoreSettings
        def window_title
          BrowserElement.new browser.div(text: "3dcart Settings")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class ThreeDCart < Browser::Modal

        class ProductWeightUnit < Browser::Modal
          def select selection
            drop_down = BrowserElement.new (browser.divs(css: "div[id^=combo-][id$=-trigger-picker]").last)
            textbox = TextboxElement.new browser.text_field(css: "input[name^=combo-][name$=-inputEl][role=combobox]")
            selection_field = BrowserElement.new browser.li(text: "#{selection}")
            10.times do
              drop_down.safe_click unless selection_field.present?
              selection_field.safe_click
              break if textbox.text.include? selection
            end
          end
        end

        def present?
          browser.div(text: "Connect your 3DCart Store").present?
        end

        def close
          button = BrowserElement.new (browser.imgs(css: "img[class*='x-tool-img x-tool-close']").last)
          5.times do
            button.safe_click
            break unless present?
          end
        end

        def api_user_key
          TextboxElement.new browser.text_field(css: "input[name^=textfield-][name$=-inputEl][type=password]")
        end

        def store_url
          TextboxElement.new (browser.text_fields(css: "input[name^=textfield-][name$=-inputEl][type=text]").last)
        end

        def weight_unit
          ProductWeightUnit.new(param)
        end

        def connect_button
          BrowserElement.new browser.span(text: "Connect")
        end

        def connect
          button = BrowserElement.new browser.span(text: "Connect")
          settings = ThreeDCartSettings.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          connecting_button = BrowserElement.new browser.span(text: "Connecting...")

          max_server_error_retry_count = 5

          20.times do |counter|
            button.safe_click
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              "Server Error: \n#{error_str}".should eql "" unless counter < max_server_error_retry_count
            end
            logger.info connecting_button.text if connecting_button.element.visible?
            return settings if settings.present?
          end
          "Rakuten Store Connect failed.  Settings Modal did not open.  ".should eql ""
        end

        def reconnect
          button = BrowserElement.new browser.span(text: "Connect")
          manage_stores = ManageStores.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          connecting_button = BrowserElement.new browser.span(text: "Connecting...")

          max_server_error_retry_count = 5

          10.times do |counter|
            button.safe_click
            sleep 1
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              "Server Error: \n#{error_str}".should eql "" unless counter < max_server_error_retry_count
            end
            logger.info connecting_button.text if connecting_button.element.visible?
            return manage_stores if manage_stores.present?
          end
        end
      end

      class Modify3DCartStore < ThreeDCart

        def window_title
          BrowserElement.new(browser.div text: "Modify your 3DCart Store Connection")
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
end