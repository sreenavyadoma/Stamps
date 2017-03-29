module Stamps
  module Orders
    module Stores
      class AmazonSettings < StoreSettings
        def window_title
          StampsElement.new browser.div(text: "Amazon Settings")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Amazon < Browser::StampsModal
        class OrderSource < Browser::StampsModal
          def text_box
            StampsTextbox.new(browser.text_field name: "AmazonMarketplace")
          end

          def drop_down
            StampsElement.new(browser.divs(css: "div[id^=combo-][id$=-triggerWrap][class$=x-form-trigger-wrap-default]>div[id^=combo-][id$=-trigger-picker]")[2])
          end

          def select(selection)
            dd = drop_down
            text_field = text_box
            selection_field = StampsElement.new(browser.li text: selection)

            10.times do
              dd.click unless selection_field.present?
              sleep(0.35)
              selection_field.click
              selection_field.click
              break if text_field.text.include? selection
            end

            logger.info "Order Source #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
          end

          def amazon
            select "Amazon.com"
          end

          def non_amazon
            select "Non-Amazon"
          end
        end

        class ProductIdentifier < Browser::StampsModal
          def text_box
            StampsTextbox.new(browser.text_field css: "input[name^=combo-][name$=-inputEl]")
          end

          def drop_down
            StampsElement.new((browser.divs(css: "div[id^=combo-][id$=-trigger-picker]")).last)
          end

          def select(selection)
            dd = drop_down
            text_field = text_box
            selection_field = StampsElement.new(browser.li text: selection)

            10.times do
              dd.click unless selection_field.present?
              sleep(0.35)
              selection_field.click
              selection_field.click
              break if text_field.text.include? selection
            end

            logger.info "Product Identifier #{selection} was #{(text_field.text.include? selection)?"Selected":"NOT selected"}"
          end

          def use_sku
            select "Use SKU"
          end

          def use_asin
            select "Use the ASIN"
          end

        end

        def window_title
          StampsElement.new(browser.div text: "Connect your Amazon Store")
        end

        def present?
          browser.span(text: "Verify Seller ID").present?
        end

        def close
          button = StampsElement.new browser.img(css: "div[id^=connectamazonwindow-][id$=header-targetEl]>div>img")
          5.times do
            button.click
            break unless present?
          end
        end

        def seller_id
          StampsTextbox.new browser.text_field(name: "AmazonSellerID")
        end

        def auth_token
          StampsTextbox.new browser.text_field(name: "AuthToken")
        end

        def verify_seller_id
          button = StampsElement.new(browser.span text: "Verify Seller ID")
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
          button = StampsElement.new browser.span(text: "Connect")
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          10.times do
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
            end
            break unless button.exist?
          end

          close if present? #close modal if it's present
          expect(server_error.message).to eql "" if server_error.present?
        end

        def connect_expecting_store_settings
          button = (StampsElement.new(browser.span text: "Connect"))
          settings = AmazonSettings.new(param)
          server_error = Orders::Stores::ServerError.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          20.times do
            button.click
            5.times do
              if server_error.present?
                error_str = server_error.message
                logger.info error_str
                server_error.ok
                expect("Server Error: \n#{error_str}").to eql ""
              end
              if importing_order.present?
                logger.info importing_order.message
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
          StampsElement.new(browser.div text: "Modify your Amazon Store Connection")
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