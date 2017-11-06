module Stamps
  module Registration
    module Footer

      class ProfileFooter < Browser::StampsModal
        attr_reader :privacy_policy_link, :copyright_link, :trust_elogo, :live_chat_button

        def initialize(param)
          super
          @privacy_policy_link=StampsField.new(browser.a(css: "[data-pgtitle='Privacy Policy']"))
          @copyright_link=StampsField.new(browser.a(css: "[data-pgtitle='Copyright']"))
          @trust_elogo=StampsField.new(browser.img(css: "img[src$='logo_truste.png']"))
          @live_chat_button=StampsField.new(browser.button(value: "Live Chat"))
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

