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

      class Shopify < Browser::StampsModal

        def window_title
          StampsElement.new(browser.div text: "Connect your Shopify Store")
        end

        def present?
          window_title.present?
        end

        def shopify_domain
          StampsTextBox.new(browser.text_fields(css: "input[name^=textfield-][name$=-inputEl]").last)
        end

        def connect_button
          StampsElement.new browser.span(text: "Connect")
        end

        def connect
          button = StampsElement.new browser.span(text: "Connect")
          settings = ShopifySettings.new(modal_param)
          shopify = ShopifyPage.new(modal_param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(modal_param)

          10.times do
            button.click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            button.click
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
          manage_stores = ManageStores.new(modal_param)
          importing_order = Orders::Stores::ImportingOrdersModal.new(modal_param)

          10.times do
            button.click
            if importing_order.present?
              logger.info importing_order.message
              importing_order.ok
            end
            button.click
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

      class ShopifyPage < Browser::StampsModal
        def present?
          browser.url.include? "shopify.com"
        end

        def username
          StampsTextBox.new browser.text_field(id: 'login-input')
        end

        def password
          StampsTextBox.new browser.text_field(id: 'password')
        end

        def sign_in
          button = StampsElement.new browser.text_field(css: "input[value='Log in']")
          settings_page = ShopifySettings.new(modal_param)

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