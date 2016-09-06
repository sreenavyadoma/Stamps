module Stamps
  module Mail
    class MoreInfoPage < Browser::Modal
      def present?
        browser.windows.size > 1
      end

      def title
        browser.windows.last.title
      end

      def close
        browser.windows.last.close
      end
    end

    class WhatsNewModal < Browser::Modal
      attr_reader :x_btn, :more_info_btn, :continue_btn, :more_info_page, :window_title

      def initialize param
        super param
        @x_btn = ElementWrapper.new browser.img css: 'img.x-tool-close'
        @more_info_btn = ElementWrapper.new browser.span css: 'span[id*=sdc-undefinedwindow-more]'
        @continue_btn = ElementWrapper.new (browser.span text: "Continue")
        @more_info_page = MoreInfoPage.new param
        @window_title = ElementWrapper.new browser.span css: "span[id^=dialoguemodal-][id$=_header_hd-textEl]"
      end

      def present?
        x_btn.present?
      end

      def wait_until_present *args
        x_btn.safely_wait_until_present *args
      end

      def close
        x_btn.click_while_present
      end

      def more_info
        10.times do
          more_info_btn.safe_click
          sleep 1
          return more_info_page if more_info_page.present?
        end
        raise "More Info page did not open."
      end

      def continue
        10.times{
          continue_btn.safe_click
          sleep 1
          break unless continue_btn.present?
        }
      end
    end

    class SignInModal < Browser::Modal

      class RememberUsernameCheckbox < Browser::Modal
        def check
          browser.checkbox(css: "input[id=rememberUser]").set
          browser.checkbox(css: "input[id=rememberUser]").set
        end

        #Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
        def uncheck
          browser.checkbox(css: "input[id=rememberUser]").clear
          browser.checkbox(css: "input[id=rememberUser]").clear
        end
      end

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
        @whats_new_modal ||= WhatsNewModal.new param
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

      def remember_username_checkbox
        RememberUsernameCheckbox.new param
      end

      def user_credentials *args
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
        [username, password]
      end

      def sign_in *args
        credentials = user_credentials *args
        username = credentials[0]
        password = credentials[1]

        10.times do
          username username
          password password
          login

          75.times do
            logger.info verifying_account_info.safe_text
            break unless verifying_account_info.present?
          end

          verifying_account_info.safely_wait_while_present 5

          logger.info "Signed in username is #{signed_in_user.text}" if signed_in_user.present?
          logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

          break if signed_in_user.present?

          if invalid_msg.present?
            $invalid_message = true
            logger.info "Invalid message is #{invalid_msg.text}"
            logger.info "Message present is #{$invalid_message}"
            break
          end

        end

        signed_in_user.safely_wait_until_present 6
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        raise "SIGN IN FAILED FOR USER: #{username}! The environment might be down!" unless signed_in_user.present?
      end

      def sign_in_first_time *args
        credentials = user_credentials *args
        username = credentials[0]
        password = credentials[1]

        5.times do
          username username
          password password
          login

          20.times do
            logger.info verifying_account_info.safe_text
            break unless verifying_account_info.present?
          end

          verifying_account_info.safely_wait_while_present 5

          return whats_new_modal if whats_new_modal.present?
        end
        raise "Unable to sign in to Mail with credentials #{username}/#{password}" if sign_in_link.present?
        raise "What's New modal did not appear upon login"
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

      def sign_in_menu *args

        case args
          when Hash
            check_username = args[0]['username']
          when Array
            if args.length == 1
              check_username = args[0]
            else
              logger.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
              check_username = ENV["USR"]
            end
          else
            logger.message "Using Default Sign-in Credentials."
            check_username = ENV["USR"]
            logger.message "CHECK USERNAME: #{check_username}"
        end

        10.times {
          sign_in_link.safe_click unless username_textbox.present?
          logger.info "Remembered username is #{username_textbox.text}"
          logger.info "Expected username is #{check_username}"

          if username_textbox.text == check_username
            $remember_username_status = "checked"
          else
            $remember_username_status = "unchecked"
          end

          logger.info "Remembered username status is #{$remember_username_status}"

          break if username_textbox.present?

          if invalid_msg.present?
            $invalid_message = true
            logger.info "Invalid message is #{invalid_msg.text}"
            logger.info "Message present is #{$invalid_message}"
            break
          end

        }

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

      def url
        browser.url
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
end