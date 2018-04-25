module Stamps
  module CommonNavigation
    def mail

    end

    def orders

    end

    def contacts

    end

    def history

    end
  end

  module Mail
    class SignInModal < SdcPage

      page_obj(:username) { {id: "UserNameTextBox"} }
      page_obj(:password) { {id: "PasswordTextBox"} }
      page_obj(:sign_in_button){{id: "signInButton"}}
      page_obj(:signed_in_user){{id: "userNameText"}}
      page_obj(:sign_in_form) { {xpath: "//*[contains(@class, 'form-signin')]"} }
      page_obj(:remember_username){{id: "rememberUser"}}

    end

    class SdcMail < SdcPage
      include CommonNavigation

      page_url { |env| "https://print#{env}.stamps.com/webpostage/default2.aspx" }

      page_obj(:sign_in_link) { {xpath: '//a[contains(@class, "signInLink")]'} }

      def sign_in_modal
        @sign_in_modal ||= SignInModal.new(param)
      end

      def print_form

      end

      def toolbar

      end

      def status_bar

      end
    end
  end
end