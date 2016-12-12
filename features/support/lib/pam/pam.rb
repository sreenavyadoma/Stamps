module Stamps
  module Pam
    class PaymentAdministratorManager < Browser::Modal
      def visit
        helper.test_env = 'stg' if helper.test_env.downcase == 'staging'

        case helper.test_env.downcase
          when /cc/
            url = "http://qa-clientsite:82/pam/"
          when /sc/
            url = "http://site.qasc.stamps.com:82/pam/"
          when /stg/
            url = "https://site.staging.stamps.com:82/pam/"
          else
            "#{helper.test_env} is not a valid Registration URL prefix selection.  Check your test!".should eql ""
        end

        logger.info "Visit: #{url}"
        browser.goto url
        #self..wait_until_present
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
        helper.test_env = 'stg' if helper.test_env.downcase == 'staging'

        customer_search_page = Pam::CustomerSearch.new param

        case helper.test_env.downcase
          when /cc/
            url = "http://qa-clientsite:82/pam/AccountSearch.asp"
          when /sc/
            url = "http://site.qasc.stamps.com:82/pam/AccountSearch.asp"
          when /stg/
            url = "https://site.staging.stamps.com:82/pam/AccountSearch.asp"
          else
            "#{helper.test_env} is not a valid Registration URL prefix selection.  Check your test!".should eql ""
        end

        browser.goto url

        30.times do
          #search.wait_until_present
          sleep 2
          return customer_search_page if customer_search_page.present?
        end
        customer_search_page.present?.should be true
      end
    end
  end
end