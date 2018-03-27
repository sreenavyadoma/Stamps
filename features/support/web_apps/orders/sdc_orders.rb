module Stamps
  module Orders
    class LandingPage < PageObject
      element(:username, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=USERNAME]')) }
      element(:password, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=PASSWORD]')) }
      element(:sign_in, required: true) { SdcElement.new(browser.span(text: 'Sign In')) }
      element(:loading_orders) { SdcElement.new(browser.div(text: 'Loading orders...')) }
      element(:remember_me) { SdcChooser.new(SdcElement.new(browser.span(:id, '[class*=remember-username-checkbox]')),
                                             SdcElement.new(browser.div(css: '[class*=remember-username-checkbox] [id$=-displayEl]')),
                                             'class', 'checked') }

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd, persist = 2)
        username.set usr
        password.set pwd
        persist.times do
          begin
            sign_in.click
            sign_in.send_keys :enter
          rescue
            # ignore
          end
        end
        username.wait_while_present(timeout: 10)
        loading_orders.wait_while_present(timeout: 10)
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
        case SdcEnv.sdc_app
          when :orders
            case SdcEnv.env
              when :qacc
                Orders::LandingPage.visit('ext.qacc')
              when :qasc
                Orders::LandingPage.visit('ext.qasc')
              when :stg
                Orders::LandingPage.visit('.testing')
              when :prod
                Orders::LandingPage.visit('')
              else
                # ignore
            end
          when :mail
            raise "Mail not implemented!"
          else
            raise ArgumentError, "SDC Website not defined."
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
