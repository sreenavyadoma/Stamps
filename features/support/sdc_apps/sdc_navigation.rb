module Stamps
  module SdcNavigation

    class SignedInUser < SdcPage
      page_object(:signed_in_user) { {id: 'userNameText'} }
      page_object(:sign_out_link, tag: :a) { {id: 'signOutLink'} }
    end

    class MailSignInModal < SdcPage
      page_object(:sign_in_link) { {xpath: '//a[contains(@class, "signInLink")]'} }
      page_object(:username, tag: :text_field) { {id: 'UserNameTextBox'} }
      page_object(:password, tag: :text_field) { {id: 'PasswordTextBox'} }
      page_object(:sign_in){{id: 'signInButton'}}
      page_object(:remember_username, tag: :checkbox) { {id: 'rememberUser'} }
    end

    class << self
      def user_drop_down
        @user_drop_down ||= Object.const_get('SdcNavigation::SignedInUser').new
      end

      def mail_sign_in_modal
        @mail_sign_in_modal ||= Object.const_get('SdcNavigation::MailSignInModal').new
      end
    end
  end

end

