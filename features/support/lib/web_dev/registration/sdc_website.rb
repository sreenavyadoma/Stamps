module Stamps
  module Registration
    class SdcWebsite < Browser::BaseCache
      attr_reader :get_started_btn, :registration
      def initialize(param)
        super
        @get_started_btn=StampsField.new(browser.button(css: "div[class*='pull-right']>button[class*=register]"))
        @registration=WebRegistration.new(param)
      end

      def load_page
        case param.test_env.downcase
          when /cc/
            url="http://sdcwebsite.qacc.stamps.com/"
          when /sc/
            url="http://sdcwebsite.qasc.stamps.com/"
          when /stg/
            url="http://sdcwebsite.staging.stamps.com/"
          else
            #do nothing
        end
        logger.info "Visit:  #{url}"
        browser.goto(url)
        get_started_btn.wait_until_present(10)
        expect(get_started_btn).to be_present
      end

      def get_started #todo-MH move this functionality to step def, keeping page objects pure
        10.times do
          get_started_btn.click
          registration.wait_until_present(5)
          return registration if registration.present?
        end
        expect(browser.url).to include('profile')
      end
    end
  end
end