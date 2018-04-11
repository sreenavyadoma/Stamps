module Stamps

  class SignedInUser < SdcPageObject
    # button(:signed_in_user, required: true) { {id: 'userNameText'} }
    # element(:sign_out_link) { {id: "signOutLink"} }

    _element(:signed_in_user) { browser.a(id: "username") }
    _element(:sign_out_link) { browser.a(id: "signOutLink") }

    def sign_out(iter: 2)
      signed_in_user.safe_wait_until_present
      signed_in_user.hover unless sign_out_link.present?
      sign_out_link.safe_wait_until_present(timeout: 1)
      sign_out_link.safe_click
      sign_out_link.safe_send_keys(:enter)
      sleep(1)
    end
  end

  class SdcNavigation
    def user_drop_down
      @user_drop_down ||= Object.const_get('SignedInUser').new
    end
  end

end

