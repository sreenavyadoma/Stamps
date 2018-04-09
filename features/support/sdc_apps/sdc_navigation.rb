module Stamps

  class SignedInUser < SdcPageObject
    button(:signed_in_user, required: true) { {id: 'userNameText'} }
    element(:sign_out_link) { {id: "signOutLink"} }

    def sign_out
      signed_in_user.safe_wait_until_present
      signed_in_user.hover unless sign_out_link.present?
      sign_out_link.safe_wait_until_present(timeout: 2)
      sign_out_link.safe_click
    end
  end

  class SdcNavigation
    def user_drop_down
      @user_drop_down ||= Object.const_get('SignedInUser').new
    end
  end

end