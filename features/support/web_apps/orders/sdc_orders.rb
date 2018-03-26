module Stamps
  module Orders
    class LandingPage < PageObject
      element(:username, required: true) { SdcElement.new(browser.text_field(name: 'NsSerial')) }
      element(:password, required: true) { SdcElement.new(browser.text_field(name: 'unauthFromZip')) }
      element(:sign_in, required: true) { SdcElement.new(browser.text_field(name: 'NsSerial')) }
      element(:remember_me) { SdcChooser.new(SdcElement.new(browser.span(:id, 'checkbox-1026-displayEl')), SdcElement.new(browser.div(css: '[class*=remember-username-checkbox]')), 'class', 'checked') }

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def sign_in_with(usr, pwd)
        username.set usr
        password.set pwd
        sign_in.click
      end
    end

    class SdcOrders < PageObject
      def landing_page
        @landing_page ||= LandingPage.new
      end
    end
  end

  class SdcWebsite < PageObject
    class << self
      def visit
        case SdcEnv.web_app
          when :orders
            case SdcEnv.env
              when :qacc
                Orders::LandingPage.visit('ext.qacc')
              when :qasc
                Orders::LandingPage.visit('ext.qasc')
              when :stg
                Orders::LandingPage.visit('.testing')
            end
          when :mail

        end

      end

      def orders
        @orders ||= Orders::SdcOrders.new
      end

      def mail
        @mail
      end
    end
  end
end

# ext.qacc
# ext.qasc
# .testing
#
# webpostage/default2.aspx
# orders
#