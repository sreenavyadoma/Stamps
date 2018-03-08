module Stamps
  module Orders
    module Stores
      module Rakuten
        class Store < WebApps::Base

          def window_title
            StampsField.new(driver.div text: "Connect your Rakuten Store")
          end

          def present?
            seller_id.present?
          end

          def close
            button = StampsField.new driver.img(css: "div[id^=connectrakutenwindow-]>div:nth-child(2)>img")
            5.times do
              button.click
              break unless present?
            end
          end

          def seller_id
            StampsTextbox.new driver.text_field(name: "RakutenSellerID")
          end

          def ftp_username
            StampsTextbox.new(driver.text_fields(name: "AuthToken").first)
          end

          def ftp_password
            StampsTextbox.new(driver.text_fields(name: "AuthToken").last)
          end

          def map_rakuten_sku
            checkbox_field = (driver.checkboxes(css: "input[type=button][id^=checkbox]").last)
            verify_field = checkbox_field.parent.parent.parent.parent
            attribute_name = "class"
            attribute_value = "checked"
            StampsCheckbox.new checkbox_field, verify_field, attribute_name, attribute_value
          end

          def connect
            button = StampsField.new driver.span(text: "Connect")
            settings = RakutenSettings.new(param)
            importing_order = Orders::Stores::ImportingOrdersModal.new(param)
            server_error = Orders::Stores::ServerError.new(param)
            connecting_button = StampsField.new driver.span(text: "Connecting...")

            max_server_error_retry_count = 5

            15.times do |counter|
              button.click
              sleep(2)
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
              if connecting_button.field.visible?
                log.info connecting_button.text
              end
              return settings if settings.present?
            end
            expect("Rakuten Store Connect failed.  Settings Modal did not open, unable to connect.").to eql ""
          end
        end
      end
    end
  end
end