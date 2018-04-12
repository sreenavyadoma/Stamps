module Stamps

  class SignedInUser < WatirDrops::PageObject
    element(:signed_in_user) { SdcElement.new(browser.a(id: "username")) }
    element(:sign_out_link) { SdcElement.new(browser.a(id: "signOutLink")) }

    def sign_out
      signed_in_user.safe_wait_until_present
      signed_in_user.hover unless sign_out_link.present?
      sign_out_link.safe_wait_until_present(timeout: 1)
      sign_out_link.safe_click
    end
  end

  class ISignedInUser < WatirDrops::PageObject
    element(:signed_in_user) { SdcElement.new(browser.find_element(id: "username")) }
    element(:sign_out_link) { SdcElement.new(browser.find_element(id: "signOutLink")) }

    def sign_out
      super
    end
  end

  module SdcNavigationInstHelper
    def nav_inst
      if SdcEnv.browser
        "SignedInUser"
      elsif SdcEnv.ios || SdEnv.android
        "ISignedInUser"
      else
        raise ArgumentError, 'Can not determine if mobile or browser test'
      end
    end
  end

  class SdcNavigation
    include SdcNavigationInstHelper
    def user_drop_down
      @user_drop_down ||= Object.const_get(nav_inst).new
    end
  end

end

