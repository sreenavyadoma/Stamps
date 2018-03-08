module Stamps
  module Registration
    module Navigation
      class RegistrationNavigationBar < WebApps::Base
        def stamps_logo
          cache[:stamps_logo] = StampsField.new(browser.img(id: "sdc-logo")) if cache[:stamps_logo].nil? || !cache[:stamps_logo].present?
          cache[:stamps_logo]
        end

        def usps_logo
          cache[:usps_logo] = StampsField.new(browser.img(css: "img[src*=logo_usps_vendor_]")) if cache[:usps_logo].nil? || !cache[:stamps_logo].present?
          cache[:usps_logo]
        end

        def present?
          stamps_logo.present?
        end

        def wait_until_present(*args)
          stamps_logo.wait_until_present(*args)
        end
      end

    end
  end
end
