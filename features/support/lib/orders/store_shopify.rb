module Stamps
  module Orders
    module Stores
      class ShopifySettings < StoreSettings
        def window_title
          StampsElement.new browser.div text: "Shopify Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class Shopify < Browser::StampsBrowserElement

        def window_title
          StampsElement.new(browser.div text: "Connect your Shopify Store")
        end

        def present?
          window_title.present?
        end

        def shopify_domain
          StampsTextbox.new(browser.text_fields(css: "input[name^=textfield-][name$=-inputEl]").last)
        end

        def connect_button
          StampsElement.new browser.span(text: "Connect")
        end

        def connect
          button = StampsElement.new browser.span(text: "Connect")
          settings = ShopifySettings.new(param)
          shopify = ShopifyPage.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          10.times do
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
            return settings if settings.present?
            return shopify if shopify.present?
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return settings if settings.present?
            return shopify if shopify.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return settings if settings.present?
            return shopify if shopify.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return settings if settings.present?
            return shopify if shopify.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return settings if settings.present?
            return shopify if shopify.present?
          end
          expect("Shopify Store Connect failed.  Settings Modal did not open.  ").to eql ""
        end

        def reconnect
          button = StampsElement.new browser.span(text: "Connect")
          manage_stores = ManageStores.new(param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          10.times do
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            button.safe_click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
            return manage_stores if manage_stores.present?
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
            sleep(0.35)
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            return manage_stores if manage_stores.present?
          end
        end
      end

      class ModifyShopifyStore < Shopify

        def window_title
          StampsElement.new(browser.div text: "Modify your Shopify Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class ShopifyPage < Browser::StampsBrowserElement
        def present?
          browser.url.include? "shopify.com"
        end

        def username
          StampsTextbox.new browser.text_field(id: 'login-input')
        end

        def password
          StampsTextbox.new browser.text_field(id: 'password')
        end

        def sign_in
          button = StampsElement.new browser.text_field(css: "input[value='Log in']")
          settings_page = ShopifySettings.new(param)

          10.times do
            button.safe_click
            sleep(5)
            return settings_page if settings_page.present?
          end
        end
      end
    end
  end
end