module Stamps
  module Orders
    module Stores
=begin
      class AmazonSettings < StoreSettings
        def window_title
          StampsField.new driver.div(text: "Amazon Settings")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end
=end

      class Amazon < WebApps::Base
        class OrderSource < WebApps::Base
          def textbox
            StampsTextbox.new(driver.text_field name: "AmazonMarketplace")
          end

          def dropdown
            StampsField.new(driver.divs(css: "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[2])
          end

          def select(selection)
            dd = dropdown
            text_field = textbox
            selection_field = StampsField.new(driver.li text: selection)

            10.times do
              dd.click unless selection_field.present?
              sleep(0.35)
              selection_field.click
              selection_field.click
              break if text_field.text.include? selection
            end

            log.info "Order Source #{selection} was #{(text_field.text.include? selection) ? "Selected" : "NOT selected"}"
          end

          def amazon
            select "Amazon.com"
          end

          def non_amazon
            select "Non-Amazon"
          end
        end

        class ProductIdentifier < WebApps::Base
          def textbox
            StampsTextbox.new(driver.text_field css: "input[name^=combo-][name$=-inputEl]")
          end

          def dropdown
            StampsField.new((driver.divs(css: "div[id^=combo-][id$=-trigger-picker]")).last)
          end

          def select(selection)
            dd = dropdown
            text_field = textbox
            selection_field = StampsField.new(driver.li text: selection)

            10.times do
              dd.click unless selection_field.present?
              sleep(0.35)
              selection_field.click
              selection_field.click
              break if text_field.text.include? selection
            end

            log.info "Product Identifier #{selection} was #{(text_field.text.include? selection) ? "Selected" : "NOT selected"}"
          end

          def use_sku
            select "Use SKU"
          end

          def use_asin
            select "Use the ASIN"
          end

        end

        def window_title
          StampsField.new(driver.div text: "Connect your Amazon Store")
        end

        def present?
          driver.span(text: "Verify Seller ID").present?
        end

        def close
          button = StampsField.new driver.img(css: "div[id^=connectamazonwindow-][id$=header-targetEl]>div>img")
          5.times do
            button.click
            break unless present?
          end
        end

        def seller_id
          StampsTextbox.new driver.text_field(name: "AmazonSellerID")
        end

        def auth_token
          StampsTextbox.new driver.text_field(name: "AuthToken")
        end

        def verify_seller_id
          button = StampsField.new(driver.span text: "Verify Seller ID")
          3.times do
            button.click
          end
        end

        def order_source
          OrderSource.new(param)
        end

        def product_identifier
          ProductIdentifier.new(param)
        end

        def connect
          button = StampsField.new driver.span(text: "Connect")
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          10.times do
            button.click
            5.times do
              if importing_order.present?
                log.info importing_order.message
                importing_order.ok
              end
              if server_error.present?
                error_str = server_error.message
                log.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
            end
            break unless button.exist?
          end

          close if present? #close modal if it's present
          expect(server_error.message).to eql "" if server_error.present?
        end

        def connect_expecting_store_settings
          button = (StampsField.new(driver.span text: "Connect"))
          settings = AmazonSettings.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          20.times do
            button.click
            5.times do
              if server_error.present?
                error_str = server_error.message
                log.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
              if importing_order.present?
                log.info importing_order.message
                importing_order.ok
              end
              return settings if settings.present?
            end
            return settings if settings.present?
          end



          self.close if self.present?
          expect(server_error.message).to eql "" if server_error.present?
          settings
        end
      end

      class ModifyAmazonStore < Amazon

        def window_title
          StampsField.new(driver.div text: "Modify your Amazon Store Connection")
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