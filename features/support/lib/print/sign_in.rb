module Stamps
  module Print
    class SignInModal < Browser::Modal

      def sign_in *args
        case args
          when Hash
            username = args[0]['username']
            password = args[0]['password']
          when Array
            if args.length == 2
              username = args[0]
              password = args[1]
            else
              logger.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
              username = ENV["USR"]
              password = ENV["PW"]
            end
          else
            logger.message "Using Default Sign-in Credentials."
            username = ENV["USR"]
            password = ENV["PW"]
            logger.message "USERNAME: #{username}, PASSWORD: #{password}"
        end

        sign_in_link = BrowserElement.new browser.link(text: "Sign In")
        username_textbox = BrowserTextBox.new browser.text_field(Print::Locators::SignIn.username)
        password_textbox = BrowserTextBox.new browser.text_field(Print::Locators::SignIn.password)
        sign_in_button = BrowserElement.new browser.button(id: "signInButton")
        verifying_account_info = BrowserElement.new browser.div(text: "Verifying account information...")
        signed_in_user = BrowserElement.new browser.span(id: "userNameText")
        invalid_msg = BrowserElement.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"

        3.times {
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

          #logger.info "Verifying account info... #{(verifying_account_info.present?)?"true":"false"}"
          if verifying_account_info.present?
            #logger.info "#{(verifying_account_info.present?)?"Verifying account info....":"Verifying account info done or not visible"}"
            verifying_account_info.wait_while_present
            signed_in_user.wait_until_present
            logger.info "Signed in username is #{signed_in_user.text}"
          end

          logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

          break if signed_in_user.present?

          if invalid_msg.present?
            $invalid_message = true
            logger.info "Invalid message is #{invalid_msg.text}"
            logger.info "Message present is #{$invalid_message}"
            break
          end

        }
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        logger.info "Password is #{password}"
      end

      def remember_username
        checkbox_field = browser.text_box css: "input[id=rememberUser]"
        verify_field = browser.text_box css: "label[class=checkbox]"

        Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def sign_in_and_remember *args
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
              logger.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
              username = ENV["USR"]
              password = ENV["PW"]
            end
          else
            logger.message "Using Default Sign-in Credentials."
            username = ENV["USR"]
            password = ENV["PW"]
            logger.message "USERNAME: #{username}, PASSWORD: #{password}"
        end

        sign_in_link = BrowserElement.new browser.link(text: "Sign In")
        username_textbox = BrowserTextBox.new browser.text_field(Print::Locators::SignIn.username)
        password_textbox = BrowserTextBox.new browser.text_field(Print::Locators::SignIn.password)
        remember_username = Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
        sign_in_button = BrowserElement.new browser.button(id: "signInButton")
        verifying_account_info = BrowserElement.new browser.div(text: "Verifying account information...")
        signed_in_user = BrowserElement.new browser.span(id: "userNameText")
        invalid_msg = BrowserElement.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"

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

          #logger.info "Verifying account info... #{(verifying_account_info.present?)?"true":"false"}"
          if verifying_account_info.present?
            #logger.info "#{(verifying_account_info.present?)?"Verifying account info....":"Verifying account info done or not visible"}"
            verifying_account_info.wait_while_present
            signed_in_user.wait_until_present
            logger.info "Signed in username is #{signed_in_user.text}"
          end

          logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

          break if signed_in_user.present?

          if invalid_msg.present?
            $invalid_message = invalid_msg.text
            logger.info "Invalid message is #{$invalid_message}"
            break
          end

        }
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        logger.info "Password is #{password}"

        ENV["SIGNED_IN_USER"] = username
        visit :print_postage

      end

      def invalid_username_password
        BrowserElement.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"
      end


      def forgot_username
        sign_in_link = BrowserElement.new browser.link(text: "Sign In")
        button = BrowserElement.new browser.a css: "a[class*=forgotUsername]"
        forgot_username_modal = Print::ForgotUsernameModal.new param
        5.times do
          sign_in_link.safe_click
          button.safe_click
          sleep 1
          return forgot_username_modal if forgot_username_modal.present?
        end
        stop_test "Unable to open Forgot Username Modal, check your code." unless forgot_password_modal.present?
      end

      def forgot_password
        sign_in_link = BrowserElement.new browser.link(text: "Sign In")
        button = BrowserElement.new browser.a css: "a[class*=forgotPassword]"
        forgot_password_modal = Print::ForgotPasswordModal.new param
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
end