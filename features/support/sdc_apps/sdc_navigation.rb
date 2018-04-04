module Stamps
  class SignedInUser
    element(:signed_in_user) { {id: 'userNameText'} }
    element(:sign_out) { {id: "signOutLink"} }

    def method_missing(method, *args, &block)
      super unless signed_in_user.respond_to? method
    end
  end

  class SdcNavigation
    def user_drop_down

    end
  end
end