module Stamps
  module Registration
    class SdcWebsite < Browser::StampsModal
      attr_reader :get_started_btn, :registration

      def initialize(param)
        super
        @get_started_btn = StampsElement.new(browser.button(css: "div[id=left-content]>button[class*=register]"))
        @registration ||= Stamps::Registration::WebRegistration.new(param)
      end

      def load_page
        case param.test_env.downcase
          when /cc/
            url = "http://sdcwebsite.qasc.stamps.com/"
          when /sc/
            url = "http://sdcwebsite.qacc.stamps.com/"
          when /stg/
            url = "http://sdcwebsite.staging.stamps.com/"
          else
            #do nothing
        end
        logger.info "Visit:  #{url}"
        browser.goto(url)
      end

      def get_started
        10.times do
          get_started_btn.click
          sleep(1)
          return get_started_btn if get_started_btn.present?
        end
      end
    end
  end
end