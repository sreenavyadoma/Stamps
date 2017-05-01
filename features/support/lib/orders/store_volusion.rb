module Stamps
  module Orders
    module Stores
      class VolusionSettings < StoreSettings
        def window_title
          StampsElement.new browser.div text: "Volusion Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Volusion < Browser::StampsModal
        def present?
          connect_button.present?
        end

        def api_url url
          textbox = StampsTextBox.new browser.text_field(css: "div>input[id^=textfield-][id$=-inputEl][name^=textfield-][name$=-inputEl][class*=required]")
          textbox.set url
        end

        def connect_button
          StampsElement.new browser.span(text: "Connect")
        end

        def connect
          button = connect_button
          settings = VolusionSettings.new(modal_param)
          server_error = Orders::Stores::ServerError.new(modal_param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(modal_param)

          20.times do
            button.click
            5.times do
              if importing_order.present?
                logger.info importing_order.message
                importing_order.ok
              end
              if server_error.present?
                error_str = server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{error_msg}").to eql ""
              end
              break unless present?
            end
            begin
              return settings if settings.present?
            end unless present?
          end

          self.close if self.present?
          expect(server_error.message).to eql "" if server_error.present?
          settings
        end

        def reconnect
          button = connect_button
          manage_stores = ManageStores.new(modal_param)
          server_error = Orders::Stores::ServerError.new(modal_param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(modal_param)

          20.times do
            button.click
            5.times do
              if importing_order.present?
                logger.info importing_order.message
                importing_order.ok
              end
              if server_error.present?
                error_str = server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
              break unless present?
            end
            begin
              return manage_stores if manage_stores.present?
            end unless present?
          end


        end
      end

      class ModifyVolusionStore < Volusion

        def window_title
          StampsElement.new(browser.div text: "Modify your Volusion Store Connection")
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