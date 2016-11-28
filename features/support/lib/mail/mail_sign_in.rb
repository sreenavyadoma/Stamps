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

    class RememberUsername < Browser::Modal
      attr_reader :remember_user_element

      def initialize param
        super param
        @remember_user_element = ElementWrapper.new browser.checkbox(id: "rememberUser")
      end

      def present?
        remember_user_element.present?
      end

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

    class MailSignInModal < Browser::Modal

      attr_reader :username_textbox, :password_textbox, :sign_in_button, :sign_in_link, :whats_new_modal, :verifying_account_info,
                  :signed_in_user, :invalid_msg, :remember_username_checkbox

      def initialize param
        super param
        @username_textbox = TextboxElement.new browser.text_field(Locators::SignIn.username)
        @password_textbox = TextboxElement.new browser.text_field(Locators::SignIn.password)
        @sign_in_button = ElementWrapper.new browser.button(id: "signInButton")
        @sign_in_link = ElementWrapper.new browser.link(text: "Sign In")
        @verifying_account_info = ElementWrapper.new browser.div text: "Verifying account information..."
        @signed_in_user = ElementWrapper.new browser.span id: "userNameText"
        @invalid_msg = ElementWrapper.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"
        @whats_new_modal ||= WhatsNewModal.new param
        @remember_username_checkbox ||= WatirCheckbox.new browser.checkbox(id: "rememberUser")
      end

      def present?
        sign_in_link.present?
      end

      def wait_until_present(*args)
        sign_in_link.safely_wait_until_present *args
      end

      def error

      end

      def remember_username(check)
        sign_in_link.safe_click unless remember_username_checkbox.present?
        if !!check
          remember_username_checkbox.check
        else
          remember_username_checkbox.uncheck
        end
      end

      def remember_username_checked?
        sign_in_link.safe_click unless remember_username_checkbox.present?
        remember_username_checkbox.checked?
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
          whats_new_modal.close if whats_new_modal.present?

          50.times do
            logger.message verifying_account_info.safe_text
            whats_new_modal.close if whats_new_modal.present?
            verifying_account_info.safely_wait_while_present 2
            whats_new_modal.close if whats_new_modal.present?
            break unless verifying_account_info.present?
            whats_new_modal.close if whats_new_modal.present?
          end

          whats_new_modal.close if whats_new_modal.present?

          logger.info "Signed in username is #{signed_in_user.text}" if signed_in_user.present?
          logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

          whats_new_modal.close if whats_new_modal.present?

          break if signed_in_user.present?

          if invalid_msg.present?
            $invalid_message = true
            logger.info "Invalid message is #{invalid_msg.text}"
            logger.info "Message present is #{$invalid_message}"
            break
          end

        end

        whats_new_modal.close if whats_new_modal.present?
        signed_in_user.safely_wait_until_present 6
        whats_new_modal.close if whats_new_modal.present?
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        "User #{username} was unable to sign-in. Is #{ENV['URL']} up? *signed in user drop-down did not appear on the screen*".should eql "Sign-in Successful for #{username} in #{ENV['URL']}" unless signed_in_user.present?
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
        "".should eql "Unable to sign in to Mail with credentials #{username}/#{password}" if sign_in_link.present?
        "".should eql "What's New modal did not appear upon login"
      end

      def sign_in_username_check *args
        credentials = user_credentials *args
        username = credentials[0]

        #todo-fix username

        10.times do
          username username
          break if username_textbox.present?

        end

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
        username_textbox = TextboxElement.new browser.text_field(Locators::SignIn.username)
        password_textbox = TextboxElement.new browser.text_field(Locators::SignIn.password)
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
          "Unable to open Forgot Username Modal, check your code.".should eql "" unless forgot_password_modal.present?
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
          "Unable to open Forgot Password Modal, check your code.".should eql "" unless forgot_password_modal.present?
        end

      end
    end

    class MailLandingPage < Browser::Modal
      attr_reader :sign_in_modal

      def initialize param
        super param
        @sign_in_modal ||= MailSignInModal.new param
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