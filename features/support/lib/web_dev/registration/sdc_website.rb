module Stamps
  module Registration
    class SdcWebsite < Browser::StampsModal
      attr_reader :get_started_btn, :registration
      def initialize(param)
        super
        @get_started_btn = StampsElement.new(browser.button(css: "div[class*='pull-right']>button[class*=register]"))
        @registration = WebRegistration.new(param)
      end

      def load_page
        case param.test_env.downcase
          when /cc/
            url = "http://sdcwebsite.qacc.stamps.com/"
          when /sc/
            url = "http://sdcwebsite.qasc.stamps.com/"
          when /stg/
            url = "http://sdcwebsite.staging.stamps.com/"
          else
            #do nothing
        end
        logger.info "Visit:  #{url}"
        browser.goto(url)
        get_started_btn.wait_until_present(3)
        expect(get_started_btn).to be_present
      end

      def get_started
        3.times do
          get_started_btn.click
          registration.wait_until_present(12)
          return registration if registration.present?
        end
      end
    end
  end
end