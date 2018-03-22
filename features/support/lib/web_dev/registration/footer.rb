module Stamps
  module Registration
    module Footer

      class ProfileFooter < WebApps::Base

        def privacy_policy_link
          cache[:privacy_policy_link] = StampsField.new(driver.a(css: "[data-pgtitle='Privacy Policy']")) if cache[:privacy_policy_link].nil?
          cache[:privacy_policy_link]
        end

        def copyright_link
          cache[:copyright_link] = StampsField.new(driver.a(css: "[data-pgtitle='Copyright']")) if cache[:copyright_link].nil?
          cache[:copyright_link]
        end

        def trust_elogo
          cache[:trust_elogo] =StampsField.new(driver.img(css: "img[src$='logo_truste.png']")) if cache[:trust_elogo].nil?
          cache[:trust_elogo]
        end

        def live_chat_button
          cache[:live_chat_button] =StampsField.new(driver.button(value: "Live Chat")) if cache[:live_chat_button].nil?
          cache[:live_chat_button]
        end


        def present?
          privacy_policy_link.present?
        end

        def wait_until_present(*args)
          privacy_policy_link.wait_until_present(*args)
        end
      end

    end
  end
end

