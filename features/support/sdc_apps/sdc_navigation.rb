module Stamps

  class SignedInUser < SdcPage
    page_obj(:signed_in_user, tag: :a) { {id: "username"} }
    page_obj(:sign_out_link, tag: :a) { {id: "signOutLink"} }

    def sign_out
      signed_in_user.safe_wait_until_present
      signed_in_user.hover unless sign_out_link.present?
      sign_out_link.safe_wait_until_present(timeout: 1)
      sign_out_link.safe_click
    end
  end

  module SdcNavigation
    class << self
      def user_drop_down
        @user_drop_down ||= Object.const_get('SignedInUser').new
      end
    end
  end

end

