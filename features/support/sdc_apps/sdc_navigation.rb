module Stamps

  class SignedInUser < WatirDrops::PageObject
    element(:signed_in_user) { SdcElement.new(browser.a(id: "username")) }
    element(:sign_out_link) { SdcElement.new(browser.a(id: "signOutLink")) }

    def sign_out(iter: 2)
      signed_in_user.safe_wait_until_present
      signed_in_user.hover unless sign_out_link.present?
      sign_out_link.safe_wait_until_present(timeout: 1)
      sign_out_link.safe_click
      #sign_out_link.safe_send_keys(:enter)
    end
  end

  class SdcNavigation
    def user_drop_down
      @user_drop_down ||= Object.const_get('SignedInUser').new
    end
  end

end

