module Stamps
  module Registration
    module Footer

      class ProfileFooter < Browser::StampsModal
        attr_reader :privacy_policy_link, :copyright_link, :trust_elogo, :live_chat_button

        def initialize(param)
          super
          @privacy_policy_link = StampsElement.new(browser.a(id: "a[data-pgtitle='Privacy Policy']"))
          @copyright_link = StampsElement.new(browser.link(id: "'profile-page']/footer/div/small/a[2]"))
          @trust_elogo = StampsElement.new(browser.img(id: "Registration/images/global/logo_truste.png"))
          @live_chat_button = StampsElement.new(browser.link(text: "Live Chat"))
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