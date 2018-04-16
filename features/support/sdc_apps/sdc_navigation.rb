module Stamps
  module SdcNavigation

    class SignedInUser < SdcPage
      page_obj(:signed_in_user, tag: :a) { {id: "username"} }
      page_obj(:sign_out_link, tag: :a) { {id: "signOutLink"} }
    end

    class << self
      def user_drop_down
        @user_drop_down ||= Object.const_get('SdcNavigation::SignedInUser').new
      end
    end
  end

end

