module Stamps
  module Pam
    class PaymentAdministratorManager < Browser::StampsModal
      attr_reader :header, :customer_search_page, :customer_profile_page
      def initialize(param)
        super
        @header = StampsElement.new(browser.h5(text: "Customer Search"))
        @customer_search_page ||= CustomerSearchPage.new(param)
      end

      def visit
        case param.test_env.downcase
          when /cc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@qa-clientsite:82/pam/Default.asp"
          when /sc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.qasc.stamps.com:82/pam/Default.asp"
          when /stg/
            url = "https://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.staging.stamps.com:82/pam/Default.asp"
          else
            url = nil
        end
        expect(url).not_to be_nil, "URL is nil. Check your ENV['URL'] parameter."
        logger.info "Visit: #{url}"
        sleep(1)
        browser.goto(url)
        sleep(1)
        self
      end

      def present?
        header.present?
      end

      def wait_until_present(*args)
        header.wait_until_present(*args)
      end

      def customer_search
        StampsElement.new(browser.a(css: 'a[href*=AccountSearch]')).click_while_present
        expect(customer_search_page).to be_present, "PAM Customer Search page did not load."
        customer_search_page
      end
    end
  end
end