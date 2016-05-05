module Print
  class SignInModal < StampsWebApps

    def sign_in *args
      visit :print_postage
      case args
        when Hash
          username = args[0]['username']
          password = args[0]['password']
        when Array
          if args.length == 2
            username = args[0]
            password = args[1]
          else
            log.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
            username = ENV["USR"]
            password = ENV["PW"]
          end
        else
          log.message "Using Default Sign-in Credentials."
          username = ENV["USR"]
          password = ENV["PW"]
          log.message "USERNAME: #{username}, PASSWORD: #{password}"
      end

      sign_in_link = StampsLink.new @browser.link(:text => "Sign In")
      username_textbox = StampsTextbox.new @browser.text_field(Print::Locators::SignIn.username)
      password_textbox = StampsTextbox.new @browser.text_field(Print::Locators::SignIn.password)
      sign_in_button = StampsButton.new @browser.button(:id => "signInButton")
      verifying_account_info = StampsLabel.new @browser.div(:text => "Verifying account information...")
      signed_in_user = StampsLabel.new @browser.span(:id => "userNameText")

      10.times {
        sign_in_link.safe_click unless username_textbox.present?
        username_textbox.set username

        sign_in_link.safe_click unless password_textbox.present?
        password_textbox.set password

        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        break if signed_in_user.present?
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        break if signed_in_user.present?
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        break if signed_in_user.present?
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        break if signed_in_user.present?
        sign_in_link.safe_click unless sign_in_button.present?
        break if signed_in_user.present?

        #log.info "Verifying account info... #{(verifying_account_info.present?)?"true":"false"}"
        if verifying_account_info.present?
          #log.info "#{(verifying_account_info.present?)?"Verifying account info....":"Verifying account info done or not visible"}"
          verifying_account_info.wait_while_present
          signed_in_user.wait_until_present
          log.info "Signed in username is #{signed_in_user.text}"
        end

        log.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

        break if signed_in_user.present?
      }
      log.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

      ENV["SIGNED_IN_USER"] = username
      visit :print_postage

    end

    def forgot_username
      sign_in_link = StampsLink.new @browser.link(:text => "Sign In")
      button = StampsButton.new @browser.a :css => "a[class*=forgotUsername]"
      forgot_username_modal = Print::ForgotUsernameModal.new @browser
      5.times do
        sign_in_link.safe_click
        button.safe_click
        sleep 1
        return forgot_username_modal if forgot_username_modal.present?
      end
      stop_test "Unable to open Forgot Username Modal, check your code." unless forgot_password_modal.present?
    end

    def forgot_password
      sign_in_link = StampsLink.new @browser.link(:text => "Sign In")
      button = StampsButton.new @browser.a :css => "a[class*=forgotPassword]"
      forgot_password_modal = Print::ForgotPasswordModal.new @browser
      5.times do
        sign_in_link.safe_click
        button.safe_click
        sleep 1
        return forgot_password_modal if forgot_password_modal.present?
      end
      stop_test "Unable to open Forgot Password Modal, check your code." unless forgot_password_modal.present?
    end

  end
end