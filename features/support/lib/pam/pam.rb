module Stamps
  module Pam
    class PaymentAdministratorManager < Browser::StampsModal
      def visit
        modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

        case modal_param.test_env.downcase
          when /cc/
            url = "http://qa-clientsite:82/pam/Default.asp"
          when /sc/
            url = "http://site.qasc.stamps.com:82/pam/"
          when /stg/
            url = "https://site.staging.stamps.com:82/pam/"
          else
            expect("#{modal_param.test_env} is not a valid Registration URL prefix selection.  Check your test!").to eql ""
        end

        logger.info "Visit: #{url}"
        browser.goto url
        logger.info "Visited: #{browser.url}"
        self
      end

      def present?
        browser.h5(text: "Customer Search").present?
      end

      def wait_until_present
        browser.h5(text: "Customer Search").wait_until_present 6
      end

      def customer_search
        modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

        customer_search_page = Pam::CustomerSearch.new(modal_param)

        case modal_param.test_env.downcase
          when /cc/
            url = "http://qa-clientsite:82/pam/AccountSearch.asp"
          when /sc/
            url = "http://site.qasc.stamps.com:82/pam/AccountSearch.asp"
          when /stg/
            url = "https://site.staging.stamps.com:82/pam/AccountSearch.asp"
          else
            expect("#{modal_param.test_env} is not a valid Registration URL prefix selection.  Check your test!").to eql ""
        end

        browser.goto url

        30.times do
          #search.wait_until_present
          sleep(2)
          return customer_search_page if customer_search_page.present?
        end
        expect(customer_search_page).to be_present
      end
    end
  end
end