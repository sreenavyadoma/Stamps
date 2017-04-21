module Stamps
  module Registration
    module Footer
      class ProfileFooter < Browser::StampsModal
        attr_reader :privacy_policy, :copyright_link, :trust_elogo, :live_chat_button

        def initialize(param)
          super
          @privacy_policy = StampsElement.new(browser.link(id: "'profile-page']/footer/div/small/a[1]"))
          @copyright_link = StampsElement.new(browser.link(id: "'profile-page']/footer/div/small/a[2]"))
          @trust_elogo = StampsElement.new(browser.img(id: "Registration/images/global/logo_truste.png"))
          @live_chat_button = StampsElement.new(browser.link(text: "Live Chat"))
        end
      end

    end
  end
end