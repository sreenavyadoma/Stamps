module Stamps
  module Orders
    module Stores
=begin
      class ThreeDCartSettings < StoreSettings
        def window_title
          StampsField.new driver.div(text: "3dcart Settings")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class ThreeDCart < Browser::Base

        class ProductWeightUnit < Browser::Base
          def select(selection)
            drop_down=StampsField.new(driver.divs(css: "div[id^=combo-][id$=-trigger-picker]").last)
            textbox=StampsTextbox.new driver.text_field(css: "input[name^=combo-][name$=-inputEl][role=combobox]")
            selection_field=StampsField.new driver.li(text: "#{selection}")
            10.times do
              drop_down.click unless selection_field.present?
              selection_field.click
              break if textbox.text.include? selection
            end
          end
        end

        def present?
          driver.div(text: "Connect your 3DCart Store").present?
        end

        def close
          button=StampsField.new(driver.imgs(css: "img[class*='x-tool-img x-tool-close']").last)
          5.times do
            button.click
            break unless present?
          end
        end

        def api_user_key
          StampsTextbox.new driver.text_field(css: "input[name^=textfield-][name$=-inputEl][type=password]")
        end

        def store_url
          StampsTextbox.new(driver.text_fields(css: "input[name^=textfield-][name$=-inputEl][type=text]").last)
        end

        def weight_unit
          ProductWeightUnit.new(param)
        end

        def connect_button
          StampsField.new driver.span(text: "Connect")
        end

        def connect
          button=StampsField.new driver.span(text: "Connect")
          settings=ThreeDCartSettings.new(param)
          importing_order=Orders::Stores::ImportingOrdersModal.new(param)
          server_error=Orders::Stores::ServerError.new(param)
          connecting_button=StampsField.new driver.span(text: "Connecting...")

          max_server_error_retry_count=5

          20.times do |counter|
            button.click
            sleep(0.35)
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str=server_error.message
              log.info error_str
              server_error.ok
              expect("Server Error: \n#{error_str}").to eql "" unless counter < max_server_error_retry_count
            end
            log.info connecting_button.text if connecting_button.field.visible?
            return settings if settings.present?
          end
          expect("Rakuten Store Connect failed.  Settings Modal did not open.  ").to eql ""
        end

        def reconnect
          button=StampsField.new driver.span(text: "Connect")
          manage_stores=ManageStores.new(param)
          importing_order=Orders::Stores::ImportingOrdersModal.new(param)
          server_error=Orders::Stores::ServerError.new(param)
          connecting_button=StampsField.new driver.span(text: "Connecting...")

          max_server_error_retry_count=5

          10.times do |counter|
            button.click
            sleep(0.35)
            if importing_order.present?
              log.info importing_order.message
              importing_order.ok
            end
            if server_error.present?
              error_str=server_error.message
              log.info error_str
              server_error.ok
              expect("Server Error: \n#{error_str}").to eql "" unless counter < max_server_error_retry_count
            end
            log.info connecting_button.text if connecting_button.field.visible?
            return manage_stores if manage_stores.present?
          end
        end
      end

      class Modify3DCartStore < ThreeDCart

        def window_title
          StampsField.new(driver.div text: "Modify your 3DCart Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end
=end
    end
  end
end