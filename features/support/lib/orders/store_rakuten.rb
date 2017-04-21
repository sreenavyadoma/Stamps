module Stamps
  module Orders
    module Stores
      class RakutenSettings < StoreSettings
        def window_title
          StampsElement.new browser.div text: "Rakuten Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Rakuten < Browser::StampsModal

        def window_title
          StampsElement.new(browser.div text: "Connect your Rakuten Store")
        end

        def present?
          seller_id.present?
        end

        def close
          button = StampsElement.new browser.img(css: "div[id^=connectrakutenwindow-]>div:nth-child(2)>img")
          5.times do
            button.click
            break unless present?
          end
        end

        def seller_id
          StampsTextBox.new browser.text_field(name: "RakutenSellerID")
        end

        def ftp_username
          StampsTextBox.new(browser.text_fields(name: "AuthToken").first)
        end

        def ftp_password
          StampsTextBox.new(browser.text_fields(name: "AuthToken").last)
        end

        def map_rakuten_sku
          checkbox_field = (browser.checkboxes(css: "input[type=button][id^=checkbox]").last)
          verify_field = checkbox_field.parent.parent.parent.parent
          attribute_name = "class"
          attribute_value = "checked"
          StampsCheckBox.new checkbox_field, verify_field, attribute_name, attribute_value
        end

        def connect
          button = StampsElement.new browser.span(text: "Connect")
          settings = RakutenSettings.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          connecting_button = StampsElement.new browser.span(text: "Connecting...")

          max_server_error_retry_count = 5

          15.times do |counter|
            button.click
            sleep(2)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str = server_error.message
              logger.info error_str
              server_error.ok
              expect("Server Error: \n#{error_str}").to eql "" unless counter < max_server_error_retry_count
            end
            if connecting_button.element.visible?
              logger.info connecting_button.text
            end
            return settings if settings.present?
          end
          expect("Rakuten Store Connect failed.  Settings Modal did not open, unable to connect.").to eql ""
        end
      end

      class ModifyRakutenStore < Rakuten

        def window_title
          StampsElement.new(browser.div text: "Modify your Rakuten Store Connection")
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