module Stamps
  module Orders
    module Stores
=begin
      class EtsySettings < StoreSettings
        def window_title
          StampsField.new driver.div text: "Etsy Settings"
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end
=end

      class Etsy < WebApps::Base

        def window_title
          StampsField.new(driver.div text: "Connect your Etsy Store")
        end

        def present?
          window_title.present?
        end

        def etsy_username
          StampsTextbox.new(driver.text_fields(css: "input[type=text][role=textbox][data-ref=inputEl]").last)
        end

        def find_my_shops
          button = StampsField.new driver.span(text: "Find My Shops")
          button.click
          button.click
        end

        def available_shops
          button = StampsField.new((driver.text_fields(css: "input[id^=combo-][id$=-inputEl]")).last)
          button.click
          button.click
        end

        def connect username, password
          button = StampsField.new driver.span(text: "Connect")
          etsy_page = EtsyPage.new(param)
          sign_in_page = EtsySignInPage.new(param)

          10.times do
            button.click
            sleep(2)
            if sign_in_page.present?
              sign_in_page.username.set username
              sign_in_page.password.set password
              page = sign_in_page.sign_in
              10.times do
                sleep(0.35)
                break if page.present?
              end
              settings = page.allow_access
              sleep(0.35)
              return settings
            end

            if etsy_page.present?
              settings = etsy_page.allow_access
              sleep(0.35)
              return settings
            end
          end
          "Etsy Store Connect failed.  Settings Modal did not open.  "
        end

        def reconnect username, password
          button = StampsField.new driver.span(text: "Connect")
          etsy_page = EtsyPage.new(param)
          sign_in_page = EtsySignInPage.new(param)

          10.times do
            button.click
            sleep(2)
            if sign_in_page.present?
              sign_in_page.username.set username
              sign_in_page.password.set password
              page = sign_in_page.sign_in
              10.times do
                sleep(0.35)
                break if page.present?
              end
              settings = page.allow_access_after_reconnect
              sleep(0.35)
              return settings
            end

            if etsy_page.present?
              settings = etsy_page.allow_access_after_reconnect
              sleep(0.35)
              return settings
            end
          end
          expect("Etsy Store Connect failed. Settings Modal did not open.").to eql ""
        end
      end

      class ModifyEtsyStore < Etsy

        def window_title
          StampsField.new(driver.div text: "Modify your Etsy Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class ReconnectEtsyStore < Etsy

        def window_title
          StampsField.new(driver.div text: "Modify your Rakuten Store Connection")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window_title.wait_until_present
        end
      end

      class EtsySignInPage < WebApps::Base
        def present?
          driver.text_field(id: 'username-existing').present?
        end

        def username
          StampsTextbox.new driver.text_field(id: 'username-existing')
        end

        def password
          StampsTextbox.new driver.text_field(id: 'password-existing')
        end

        def sign_in
          button = StampsField.new driver.text_field(id: 'signin_button')
          etsy_page = EtsyPage.new(param)

          10.times do
            button.click
            button.click
            return etsy_page if etsy_page.present?
          end
        end
      end

      class EtsyPage < WebApps::Base
        def present?
          driver.url.include? "etsy.com"
        end

        def allow_access
          button = StampsField.new driver.text_field(css: 'input[type=submit]')
          settings = EtsySettings.new(param)

          3.times do
            driver.execute_script("window.scrollBy(0,400)")
            button.click
            button.click
            sleep(5)
            return settings if settings.present?
          end
          expect("Etsy Page:  Clicking Allow Access did not open Etsy Store Settings modal.").to eql ""
        end

        def allow_access_after_reconnect
          button = StampsField.new driver.text_field(css: 'input[type=submit]')
          manage_stores = ManageStores.new(param)

          3.times do
            driver.execute_script("window.scrollBy(0,400)")
            button.click
            button.click
            sleep(5)
            return manage_stores if manage_stores.present?
          end
          expect("Etsy Page:  Clicking Allow Access did not open Etsy Store Settings modal.").to eql ""
        end
      end

    end
  end
end