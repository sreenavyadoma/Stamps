module Stamps
  module Registration
    class SdcWebsite < Browser::Base

      def get_started_btn
        cache[:get_started_btn].nil? || !cache[:get_started_btn].present? ? cache[:get_started_btn] = StampsField.new(browser.button(css: "div[class*='pull-right']>button[class*=register]")) :cache[:get_started_btn]
      end



      def registration
        cache[:registration] = WebRegistration.new(param) if cache[:registration].nil?
        cache[:registration]
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

    end
  end
end