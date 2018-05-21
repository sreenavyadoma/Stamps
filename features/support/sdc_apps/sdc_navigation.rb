module SdcNavigation
  class SignedInUser < SdcPage
    page_object(:signed_in_user, tag: :a) { {id: 'username'} }
    page_object(:sign_out_link, tag: :a) { {id: 'signOutLink'} }
  end

  class MailSignInModal < SdcPage
    page_object(:sign_in_link,required: 40) { {xpath: '//a[contains(@class, "signInLink")]'} }
    page_object(:username, tag: :text_field) { {id: 'UserNameTextBox'} }
    page_object(:password, tag: :text_field) { {id: 'PasswordTextBox'} }
    page_object(:sign_in){{id: 'signInButton'}}
    page_object(:remember_username, tag: :checkbox) { {id: 'rememberUser'} }
    page_object(:invalid_sign_in) { {xpath: '//div[contains(@id, "InvalidUsernamePasswordMsg")]//label'} }
  end

  def user_drop_down
    SignedInUser.new
  end
  module_function :user_drop_down

  def mail_sign_in_modal
    MailSignInModal.new
  end
  module_function :mail_sign_in_modal

end
