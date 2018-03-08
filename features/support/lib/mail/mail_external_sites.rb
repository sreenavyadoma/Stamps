module Stamps
  module Mail
    class MailExternalSites < WebApps::Base
      def net_stamps_home_btn
        browser.windows.last.use
        15.times do
        (cache[:net_stamps_home_btn].nil?||!cache[:net_stamps_home_btn].present?)?cache[:net_stamps_home_btn] = StampsField.new(browser.img(css: "img[src*=home_logo]")):cache[:net_stamps_home_btn]
        end
      end
    end
  end
end