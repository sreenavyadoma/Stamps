module Stamps
  module Registration
    module Footer

      class ProfileFooter < Browser::StampsModal
        attr_reader :privacy_policy_link, :copyright_link, :trust_elogo, :live_chat_button

        def initialize(param)
          super
          @privacy_policy_link = StampsElement.new(browser.link( :text, "Privacy Policy"))
          @copyright_link = StampsElement.new(browser.link(css: "'profile-page']/footer/div/small/a[2]"))
          @trust_elogo = StampsElement.new(browser.img(css: "img[src$='logo_truste.png']"))
          @live_chat_button = StampsElement.new(browser.button(value: "Live Chat"))

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

