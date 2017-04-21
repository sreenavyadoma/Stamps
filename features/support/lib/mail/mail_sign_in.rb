module Stamps
  module Mail
    class MoreInfoPage < Browser::StampsModal
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


    class RememberUsername < Browser::StampsModal
      attr_reader :remember_user_element

      def initialize(param)
        super
        @remember_user_element = StampsElement.new browser.checkbox(id: "rememberUser")
      end

      def present?
        remember_user_element.present?
      end

      def check
        browser.checkbox(css: "input[id=rememberUser]").set
        browser.checkbox(css: "input[id=rememberUser]").set
      end

      #Stamps::Browser::CheckBoxElement.new checkbox_field, verify_field, "class", "checked"
      def uncheck
        browser.checkbox(css: "input[id=rememberUser]").clear
        browser.checkbox(css: "input[id=rememberUser]").clear
      end
    end

    class MailLandingPage < Browser::StampsModal
      attr_reader :sign_in_modal

      def initialize(param)
        super
        @sign_in_modal = MailSignInModal.new(param)
      end

      def url
        browser.url
      end

      def is_url_correct?
        browser.url.include? "stamps.com/Webpostage"
      end

      def wait_until_url_loads
        20.times do
          sleep(0.35)
          break if browser.url.include? "stamps.com/Webpostage"
        end
      end

      def present?
        sign_in_modal.present?
      end

      def wait_until_present(*args)
        sign_in_modal.wait_until_present(*args)
      end
    end

    class WhatsNewModal < Browser::StampsModal
      attr_reader :x_btn, :more_info_btn, :continue_btn, :more_info_page, :window_title

      def initialize(param)
        super
        @x_btn = StampsElement.new browser.img(class: 'x-tool-img x-tool-close')
        @more_info_btn = StampsElement.new browser.span(text: 'More Info')
        @continue_btn = StampsElement.new browser.span(text: "Continue")
        @more_info_page = MoreInfoPage.new(param)
        @window_title = StampsElement.new browser.span(css: "div[id^=title][class*='x-window-header-title x-window-header-title-default']>div[id^=title-][id$=-textEl]")
      end

      def present?
        continue_btn.present?
      end

      def wait_until_present(*args)
        continue_btn.wait_until_present(*args)
      end

      def close
        x_btn.click_while_present
      end

      def more_info
        10.times do
          more_info_btn.click
          sleep(0.35)
          return more_info_page if more_info_page.present?
        end
        raise "More Info page did not open."
      end

      def continue
        continue_btn.click_while_present
      end
    end

    class MailSignInModal < StampsSignInBase

      attr_reader :username_textbox, :password_textbox, :sign_in_button, :sign_in_link, :whats_new_modal, :verifying_account_info, :invalid_msg,
                  :remember_username_checkbox, :invalid_username_password

      def initialize(param)
        super
        @username_textbox = StampsTextBox.new browser.text_field(id: "UserNameTextBox")
        @password_textbox = StampsTextBox.new browser.text_field(id: "PasswordTextBox")
        @sign_in_button = StampsElement.new browser.button(id: "signInButton")
        @sign_in_link = StampsElement.new browser.a(css: "a[class*=signInLink]")
        @verifying_account_info = StampsElement.new browser.div(text: "Verifying account information...")
        @invalid_msg = StampsElement.new browser.div(css: "div[id*=InvalidUsernamePasswordMsg]")
        @whats_new_modal = WhatsNewModal.new(param)
        @remember_username_checkbox = WatirCheckBoxWrapper.new browser.checkbox(id: "rememberUser")
        @invalid_username_password = StampsElement.new browser.div(id: "InvalidUsernamePasswordMsg")
        @username = ""
        @password = ""
      end

      def present?
        sign_in_link.present?
      end

      def wait_until_present(*args)
        sign_in_link.wait_until_present(*args)
      end

      def show_sign_in_modal
        sign_in_link.click unless username_textbox.present?
      end

      def username(usr)
        show_sign_in_modal
        username_textbox.set(usr)
      end

      def password(pw)
        show_sign_in_modal
        password_textbox.set(pw)
      end

      def login
        show_sign_in_modal
        sign_in_button.click
        sign_in_button.click
      end

      def mail_sign_in(credentials)
        begin
          user_credentials(credentials)
          5.times do
            break if signed_in_user.present?
            username(usr)
            password(pw)
            login
            50.times do
              begin
                logger.message(verifying_account_info.text)
                break if signed_in_user.present?
                if whats_new_modal.present?
                  whats_new_modal.continue
                  break
                end
              rescue
                # do nothing
              end
            end
            signed_in_user.wait_until_present(2)
            if whats_new_modal.present?
              whats_new_modal.continue
              break
            end
            break if signed_in_user.present?
          end
          expect(signed_in_user.text).to eql(usr)
          logger.message "#"*15
          logger.message "Signed-in User: #{signed_in_user.text}"
          logger.message "#"*15
          signed_in_user.text
        rescue Exception => e
          logger.error ""
          logger.error "#{e.message}"
          logger.error "\n#{e.backtrace.join "\n"}"
          logger.error ""
        end
      end

      # todo-rob revisit code below

      def error

      end

      def remember_username(check)
        show_sign_in_modal
        if !!check
          remember_username_checkbox.check
        else
          remember_username_checkbox.uncheck
        end
      end

      def remember_username_checked?
        remember_username_checkbox.checked?
      end

      def usr_check(*args)
        credentials = user_credentials(*args)
        username = credentials[0]

        #todo-fix username

        10.times do
          username username
          break if username_textbox.present?

        end

      end

      def sign_in_and_remember(*args)
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

        sign_in_link = StampsElement.new browser.link(text: "Sign In")
        username_textbox = StampsTextBox.new browser.text_field(id: "UserNameTextBox")
        password_textbox = StampsTextBox.new browser.text_field(id: "PasswordTextBox")
        remember_username = Stamps::Browser::StampsCheckBox.new checkbox_field, verify_field, "class", "checked"
        sign_in_button = StampsElement.new browser.button(id: "signInButton")
        verifying_account_info = StampsElement.new browser.div(text: "Verifying account information...")
        signed_in_user = StampsElement.new browser.span(id: "userNameText")
        invalid_msg = StampsElement.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"

        10.times {
          sign_in_link.click unless username_textbox.present?
          username_textbox.set username

          sign_in_link.click unless password_textbox.present?
          password_textbox.set password

          sign_in_link.click unless sign_in_button.present?
          sign_in_button.click
          break if signed_in_user.present?
          sign_in_link.click unless sign_in_button.present?
          sign_in_button.click
          break if signed_in_user.present?
          sign_in_link.click unless sign_in_button.present?
          sign_in_button.click
          break if signed_in_user.present?
          sign_in_link.click unless sign_in_button.present?
          sign_in_button.click
          break if signed_in_user.present?
          sign_in_link.click unless sign_in_button.present?
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

          expect(invalid_msg.text).to eql "Invalid Username & Password. #{@username}/#{@password}" if invalid_msg.present?

        }
        logger.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"
        logger.info "Password is #{password}"

        def invalid_username_password
          StampsElement.new browser.div css: "div[id*=InvalidUsernamePasswordMsg]"
        end

        def forgot_username
          sign_in_link = StampsElement.new browser.link(text: "Sign In")
          button = StampsElement.new browser.a css: "a[class*=forgotUsername]"
          forgot_username_modal = ForgotUsernameModal.new(param)
          5.times do
            sign_in_link.click
            button.click
            sleep(0.35)
            return forgot_username_modal if forgot_username_modal.present?
          end
          expect("Unable to open Forgot Username Modal, check your code.").to eql "" unless forgot_password_modal.present?
        end

        def forgot_password
          sign_in_link = StampsElement.new browser.link(text: "Sign In")
          button = StampsElement.new browser.a css: "a[class*=forgotPassword]"
          forgot_password_modal = ForgotPasswordModal.new(param)
          5.times do
            sign_in_link.click
            button.click
            sleep(0.35)
            return forgot_password_modal if forgot_password_modal.present?
          end
          expect("Unable to open Forgot Password Modal, check your code.").to eql "" unless forgot_password_modal.present?
        end

      end
    end
  end
end