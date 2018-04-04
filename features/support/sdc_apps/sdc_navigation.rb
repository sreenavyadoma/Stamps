module Stamps
  class SignedInUser < SdcPageObject
    element(:signed_in_user) { {id: 'userNameText'} }
    element(:sign_out_link) { {id: "signOutLink"} }

    def sign_out(iter: 10)
      signed_in_user.safe_wait_until_present

      iter.to_i.times do
        signed_in_user.click unless sign_out_link.present?
        sign_out_link.safe_click
        sign_out_link.safe_send_keys(:enter)
      end

      sign_out_link.safe_wait_while_present
    end

    def method_missing(method, *args, &block)
      super unless signed_in_user.respond_to? method
      signed_in_user.send(method, *args, &block)
    end
  end

  class SdcNavigation
    def user_drop_down
      @user_drop_down ||= Object.const_get('SignedInUser').new
    end

    def method_missing(method, *args, &block)
      super unless @user_drop_down.respond_to? method
      @user_drop_down.send(method, *args, &block)
    end
  end
end