module Stamps
  module Mail
    class MailExternalSites < Browser::StampsModal
      def net_stamps_home_btn
        browser.windows.last.use
        (cache[:net_stamps_home_btn].nil?||!cache[:net_stamps_home_btn].present?)?cache[:net_stamps_home_btn] = StampsField.new(browser.img(css: "img[src*=home_logo]")):cache[:net_stamps_home_btn]
      end

      private
      def cache
        @cache ||= {}
      end
    end
  end
end