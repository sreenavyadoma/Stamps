module Orders
  module Stores
    class EtsySettings < StoreSettings
      def window_title
        StampsLabel.new @browser.div text: "Etsy Settings"
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class Etsy < OrdersObject

      def window_title
        StampsLabel.new(@browser.div :text => "Connect your Etsy Store")
      end

      def present?
        window_title.present?
      end

      def etsy_username
        StampsTextbox.new @browser.text_field(css: "div[id^=connectetsywindow-][id$=-body]>div>div>div>div>div>div>div>div>div>div>div>div>div>div>div>div>div>div>div>input")
      end

      def find_my_shops
        button = StampsButton.new @browser.span(text: "Find My Shops")
        button.safe_click
        button.safe_click
      end

      def available_shops
        button = StampsButton.new ((@browser.text_fields(css: "input[id^=combo-][id$=-inputEl]")).last)
        button.safe_click
        button.safe_click
      end

      def connect username, password
        button = StampsButton.new @browser.span(text: "Connect")
        etsy_page = EtsyPage.new @browser
        sign_in_page = EtsySignInPage.new @browser

        10.times do
          button.send_keys :enter
          button.safe_click
          sleep 2
          if sign_in_page.present?
            sign_in_page.username.set username
            sign_in_page.password.set password
            page = sign_in_page.sign_in
            10.times do
              sleep 1
              break if page.present?
            end
            settings = page.allow_access
            return settings
          end

          if etsy_page.present?
            settings = etsy_page.allow_access
            return settings
          end
        end
        raise "Rakuten Store Connect failed.  Settings Modal did not open.  "
      end
    end

    class ModifyEtsyStore < Etsy

      def window_title
        StampsLabel.new(@browser.div :text => "Modify your Etsy Store Connection")
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
        StampsLabel.new(@browser.div :text => "Modify your Rakuten Store Connection")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window_title.wait_until_present
      end
    end

    class EtsySignInPage < OrdersObject
      def present?
        browser_helper.present? @browser.text_field(id: 'username-existing')
      end

      def username
        StampsTextbox.new @browser.text_field(id: 'username-existing')
      end

      def password
        StampsTextbox.new @browser.text_field(id: 'password-existing')
      end

      def sign_in
        button = StampsInput.new @browser.input(id: 'signin_button')
        etsy_page = EtsyPage.new @browser

        10.times do
          button.send_keys :enter
          button.safe_click
          return etsy_page if etsy_page.present?
        end
      end
    end

    class EtsyPage < OrdersObject
      def present?
        @browser.url.include? "etsy.com"
      end

      def allow_access
        button = StampsInput.new @browser.input(css: 'input[type=submit]')
        settings = EtsySettings.new @browser

        10.times do
          @browser.execute_script("window.scrollBy(0,400)")
          @browser.execute_script("window.scrollBy(0,400)")
          button.send_keys :enter
          button.safe_click
          sleep 2
          return settings if settings.present?
        end
      end
    end

  end
end
