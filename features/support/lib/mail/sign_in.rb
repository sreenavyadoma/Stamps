module Stamps
  module Mail
    class SignInModal < Browser::Modal
      attr_reader :username_textbox, :password_textbox, :sign_in_button, :sign_in_link, :whats_new_modal, :verifying_account_info,
                  :signed_in_user, :invalid_msg

      def initialize param
        super param
        @username_textbox ||= TextBoxElement.new browser.text_field(Locators::SignIn.username)
        @password_textbox ||= TextBoxElement.new browser.text_field(Locators::SignIn.password)
        @sign_in_button ||= ElementWrapper.new browser.button(id: "signInButton")
        @sign_in_link ||= ElementWrapper.new browser.link(text: "Sign In")
        @verifying_account_info = ElementWrapper.new browser.div text: "Verifying account information..."
        @signed_in_user = ElementWrapper.new browser.span id: "userNameText"
        @invalid_msg = ElementWrapper.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"

      end

      def present?
        sign_in_link.present?
      end

      def wait_until_present *args
        sign_in_link.safely_wait_until_present *args
      end

      def error

      end

      def username usr
        sign_in_link.safe_click unless username_textbox.present?
        username_textbox.set usr
      end

      def password pw
        sign_in_link.safe_click unless password_textbox.present?
        password_textbox.set pw
      end

      def login
        sign_in_button.safe_click
        sign_in_button.safe_click
        sign_in_button.send_keys :enter
      end

      def remember_username
        checkbox_field = browser.text_field css: "input[id=rememberUser]"
        verify_field = browser.text_field css: "label[class=checkbox]"

        Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
      end

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

        10.times do
          username username
          password password
          login

          logger.info verifying_account_info.text if verifying_account_info.present?
          logger.info "Signed in username is #{signed_in_user.text}" if signed_in_user.present?
          logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

          sleep 2
          break if signed_in_user.present?

          if invalid_msg.present?
            $invalid_message = true
            logger.info "Invalid message is #{invalid_msg.text}"
            logger.info "Message present is #{$invalid_message}"
            break
          end

        end
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        logger.info "Password is #{password}"
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

        sign_in_link = ElementWrapper.new browser.link(text: "Sign In")
        username_textbox = TextBoxElement.new browser.text_field(Locators::SignIn.username)
        password_textbox = TextBoxElement.new browser.text_field(Locators::SignIn.password)
        remember_username = Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
        sign_in_button = ElementWrapper.new browser.button(id: "signInButton")
        verifying_account_info = ElementWrapper.new browser.div(text: "Verifying account information...")
        signed_in_user = ElementWrapper.new browser.span(id: "userNameText")
        invalid_msg = ElementWrapper.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"

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
        ElementWrapper.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"
      end

      def forgot_username
        sign_in_link = ElementWrapper.new browser.link(text: "Sign In")
        button = ElementWrapper.new browser.a css: "a[class*=forgotUsername]"
        forgot_username_modal = ForgotUsernameModal.new param
        5.times do
          sign_in_link.safe_click
          button.safe_click
          sleep 1
          return forgot_username_modal if forgot_username_modal.present?
        end
        stop_test "Unable to open Forgot Username Modal, check your code." unless forgot_password_modal.present?
      end

      def forgot_password
        sign_in_link = ElementWrapper.new browser.link(text: "Sign In")
        button = ElementWrapper.new browser.a css: "a[class*=forgotPassword]"
        forgot_password_modal = ForgotPasswordModal.new param
        5.times do
          sign_in_link.safe_click
          button.safe_click
          sleep 1
          return forgot_password_modal if forgot_password_modal.present?
        end
        stop_test "Unable to open Forgot Password Modal, check your code." unless forgot_password_modal.present?
      end

    end

    class MailLandingPage < Browser::Modal
      attr_reader :sign_in_modal

      def initialize param
        super param
        @sign_in_modal ||= SignInModal.new param
      end

      def is_url_correct?
        browser.url.include? "stamps.com/Webpostage"
      end

      def wait_until_url_loads
        20.times do
          sleep 1
          break if browser.url.include? "stamps.com/Webpostage"
        end
      end

      def present?
        sign_in_modal.present?
      end

      def wait_until_present *args
        sign_in_modal.wait_until_present *args
      end
    end
  end
end