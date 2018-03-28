module Stamps
  module Mail
    module MailSignIn
      #todo-Rob fix this, very unprofession
      class MoreInfoPage < WebApps::Base
        def present?
          driver.windows.size > 1
        end

        def title
          driver.windows.last.title
        end

        def close
          driver.windows.last.close
        end
      end

      class RememberUsername < WebApps::Base
        attr_reader :remember_user_field

        def initialize(param)
          super
          @remember_user_field = StampsField.new driver.checkbox(id: 'rememberUser')
        end

        def present?
          remember_user_field.present?
        end

        def check
          driver.checkbox(css: 'input[id=rememberUser]').set
          driver.checkbox(css: 'input[id=rememberUser]').set
        end

        def uncheck
          driver.checkbox(css: 'input[id=rememberUser]').clear
          driver.checkbox(css: 'input[id=rememberUser]').clear
        end
      end

      class MailLandingPage < WebApps::Base
        def sign_in_modal
          @sign_in_modal = MailSignInModal.new(param) if @sign_in_modal.nil? || !@sign_in_modal.present?
          @sign_in_modal
        end

        def url
          driver.url
        end

        def is_url_correct?
          driver.url.include? 'stamps.com/Webpostage'
        end

        def wait_until_url_loads
          20.times do
            sleep(0.35)
            break if driver.url.include? 'stamps.com/Webpostage'
          end
        end

        def present?
          sign_in_modal.present?
        end

        def wait_until_present(*args)
          sign_in_modal.wait_until_present(*args)
        end
      end

      #todo-Rob refactor MoreInfoPage
      #todo-Rob fix this, very unprofession
      class MoreInfoPage < WebApps::Base
        def present?
          driver.windows.size > 1
        end

        def title
          driver.windows.last.title
        end

        def close
          driver.windows.last.close
        end
      end

      class RememberUsername < WebApps::Base
        attr_reader :remember_user_field

        def initialize(param)
          super
          @remember_user_field = StampsField.new driver.checkbox(id: 'rememberUser')
        end

        def present?
          remember_user_field.present?
        end

        def check
          driver.checkbox(css: 'input[id=rememberUser]').set
          driver.checkbox(css: 'input[id=rememberUser]').set
        end

        def uncheck
          driver.checkbox(css: 'input[id=rememberUser]').clear
          driver.checkbox(css: 'input[id=rememberUser]').clear
        end
      end

      class MailLandingPage < WebApps::Base
        def sign_in_modal
          @sign_in_modal = MailSignInModal.new(param) if @sign_in_modal.nil? || !@sign_in_modal.present?
          @sign_in_modal
        end

        def url
          driver.url
        end

        def is_url_correct?
          driver.url.include? 'stamps.com/Webpostage'
        end

        def wait_until_url_loads
          20.times do
            sleep(0.35)
            break if driver.url.include? 'stamps.com/Webpostage'
          end
        end

        def present?
          sign_in_modal.present?
        end

        def wait_until_present(*args)
          sign_in_modal.wait_until_present(*args)
        end
      end

      #todo-Rob refactor MoreInfoPage
      class MoreInfoPage < WebApps::Base
        def present?
          driver.windows.size > 1
        end

        def title
          driver.windows.last.title
        end

        def close
          driver.windows.last.close
        end
      end

      class RememberUsername < WebApps::Base
        attr_reader :remember_user_field

        def initialize(param)
          super
          @remember_user_field = StampsField.new driver.checkbox(id: 'rememberUser')
        end

        def present?
          remember_user_field.present?
        end

        def check
          driver.checkbox(css: 'input[id=rememberUser]').set
          driver.checkbox(css: 'input[id=rememberUser]').set
        end

        def uncheck
          driver.checkbox(css: 'input[id=rememberUser]').clear
          driver.checkbox(css: 'input[id=rememberUser]').clear
        end
      end

      class MailLandingPage < WebApps::Base
        def sign_in_modal
          @sign_in_modal = MailSignInModal.new(param) if @sign_in_modal.nil? || !@sign_in_modal.present?
          @sign_in_modal
        end

        def url
          driver.url
        end

        def is_url_correct?
          driver.url.include? 'stamps.com/Webpostage'
        end

        def wait_until_url_loads
          20.times do
            sleep(0.35)
            break if driver.url.include? 'stamps.com/Webpostage'
          end
        end

        def present?
          sign_in_modal.present?
        end

        def wait_until_present(*args)
          sign_in_modal.wait_until_present(*args)
        end
      end

      class WhatsNewModal < WebApps::Base
        attr_reader :x_btn, :more_info_btn, :continue_btn, :more_info_page, :window_title

        def initialize(param)
          super
          @x_btn = StampsField.new driver.img(css: 'div[id^=dialoguemodal]>div>img[class*=x-tool-close]')
          @more_info_btn = StampsField.new driver.span(text: 'More Info')
          @continue_btn = StampsField.new driver.span(text: 'Continue')
          @more_info_page = MoreInfoPage.new(param)
          @window_title = StampsField.new driver.span(css: "div[id^=title][class*='x-window-header-title x-window-header-title-default']>div[id^=title-][id$=-textEl]")
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
          raise 'More Info page did not open.'
        end

        def continue
          continue_btn.click_while_present
        end
      end

      class MailSignInModal < WebApps::Base
        
        def username_textbox
          (cache[:username_textbox].nil? || !cache[:username_textbox].present?) ? cache[:username_textbox] = StampsTextbox.new(driver.text_field(id: 'UserNameTextBox')) : cache[:username_textbox]
        end

        def password_textbox
          (cache[:password_textbox].nil? || !cache[:password_textbox].present?) ? cache[:password_textbox] = StampsTextbox.new(driver.text_field(id: 'PasswordTextBox')) : cache[:password_textbox]
        end

        def sign_in_button
          (cache[:sign_in_button].nil? || !cache[:sign_in_button].present?) ? cache[:sign_in_button] = StampsField.new(driver.button(id: 'signInButton')) : cache[:sign_in_button]
        end

        def invalid_msg
          (cache[:invalid_msg].nil? || !cache[:invalid_msg].present?) ? cache[:invalid_msg] = StampsField.new(driver.div(css: 'div[id*=InvalidUsernamePasswordMsg]')) : cache[:invalid_msg]
        end

        def whats_new_modal
          (cache[:whats_new_modal].nil? || !cache[:whats_new_modal].present?) ? cache[:whats_new_modal] = WhatsNewModal.new(param) : cache[:whats_new_modal]
        end

        def verifying_account_info
          (cache[:account_info].nil? || !cache[:account_info].present?) ? cache[:account_info] = StampsField.new(driver.div(text: 'Verifying account information...')) : cache[:account_info]
        end

        def remember_username_checkbox
          (cache[:remember_username].nil? || !cache[:remember_username].present?) ? cache[:remember_username] = StampsWatirCheckbox.new(driver.checkbox(id: 'rememberUser')) : cache[:remember_username]
        end

        def invalid_username_password
          (cache[:invalid_username].nil? || !cache[:invalid_username].present?) ? cache[:invalid_username] = StampsField.new(driver.div(id: 'InvalidUsernamePasswordMsg')) : cache[:invalid_username]
        end

        def signed_in_user
          (cache[:signed_in_user].nil? || !cache[:signed_in_user].present?) ? cache[:signed_in_user] = StampsField.new(driver.span(id: 'userNameText')) : cache[:signed_in_user]
        end

        def sign_in_form
          (cache[:sign_in_form].nil? || !cache[:sign_in_form].present?) ? cache[:sign_in_form] = StampsField.new(driver.form(css: 'form[class=form-signin]')) : cache[:sign_in_form]
        end

        def server_error
          (cache[:server_error].nil? || !cache[:server_error].present?) ? cache[:server_error] = Stamps::Orders::OrdersRuntimeError::ServerError.new(param) : cache[:server_error]
        end

        def present?
          sign_in_link.present?
        end

        def sign_in_link
          (cache[:sign_in_link].nil? || !cache[:sign_in_link].present?) ? cache[:sign_in_link] = StampsField.new(driver.a(css: 'a[class*=signInLink]')) : cache[:sign_in_link]
        end

        def wait_until_present(*args)
          sign_in_link.wait_until_present(*args)
        end

        def show_sign_in_modal
          3.times do
            sign_in_link.hover unless username_textbox.present?
            sign_in_link.click unless username_textbox.present?
            break if username_textbox.present?
          end
        end

        def username(str)
          show_sign_in_modal
          username_textbox.click
          username_textbox.clear
          username_textbox.set(str)
        end

        def password(str)
          show_sign_in_modal
          password_textbox.click
          password_textbox.clear
          password_textbox.set(str)
          sign_in_form.click
          sign_in_form.double_click
          sign_in_form.click
          show_sign_in_modal
        end

        def login
          show_sign_in_modal
          sign_in_button.click
          sign_in_button.click
        end

        def mail_sign_in(usr, pw)
          wait_until_present(3)
          begin
            10.times do
              break if signed_in_user.present?
              username(usr)
              password(pw)
              login
              5.times do
                begin
                  if signed_in_user.present?
                    log.info("Signed-in user: #{signed_in_user.text}")
                    break
                  end
                  if whats_new_modal.present?
                    whats_new_modal.continue
                    whats_new_modal.close
                    break
                  end
                rescue
                  # do nothing
                end
              end
              signed_in_user.wait_until_present(2)
              raise "Server Error: #{server_error.message}" if server_error.present?
              if whats_new_modal.present?
                whats_new_modal.continue
                break
              end
              break if signed_in_user.present?
            end
            return signed_in_user.text
          rescue StandardError => e
            @error = e
          end

          unless @error.nil?
            log.error "\n---\n#{"Unable to sign-in with credentials #{usr}/#{pw}"}\n#{@error.class.name}: #{@error.message}\n---\n"
            log.error @error.backtrace.join("\n")
            @error.message
            @error.backtrace.join("\n")
            raise @error
          end
          raise "Unable to sign-in with credentials #{usr}/#{pw}"
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
              log.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
              username = ENV['USR']
              password = ENV['PW']
            end
          else
            log.info 'Using Default Sign-in Credentials.'
            username = ENV['USR']
            password = ENV['PW']
            log.info "USERNAME: #{username}, PASSWORD: #{password}"
          end

          sign_in_link = StampsField.new driver.link(text: 'Sign In')
          username_textbox = StampsTextbox.new driver.text_field(id: 'UserNameTextBox')
          password_textbox = StampsTextbox.new driver.text_field(id: 'PasswordTextBox')
          remember_username = Stamps::WebApps::StampsCheckbox.new checkbox_field, verify_field, 'class', 'checked'
          sign_in_button = StampsField.new driver.button(id: 'signInButton')
          verifying_account_info = StampsField.new driver.div(text: 'Verifying account information...')
          signed_in_user = StampsField.new driver.span(id: 'userNameText')
          invalid_msg = StampsField.new driver.div css: 'div[id*=InvalidUsernamePasswordMsg]'

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

            #log.info "Verifying account info... #{(verifying_present?)?"true":"false"}"
            if verifying_present?
              #log.info "#{(verifying_present?)?"Verifying account info....":"Verifying account info done or not visible"}"
              verifying_wait_while_present
              signed_in_user.wait_until_present
              log.info "Signed in username is #{signed_in_user.text}"
            end

            log.info "#{username} is #{(signed_in_user.present?) ? "signed-in!" : "not signed-in."}"

            break if signed_in_user.present?

            expect(invalid_msg.text).to eql "Invalid Username & Password. #{@username}/#{@password}" if invalid_msg.present?

          }
          log.info "#{username} is #{(signed_in_user.present?) ? "signed-in!" : "not signed-in."}"
          log.info "Password is #{password}"

          # def invalid_username_password
          #   StampsField.new driver.div css: "div[id*=InvalidUsernamePasswordMsg]"
          # end

          # def forgot_username
          #   sign_in_link=StampsField.new driver.link(text: "Sign In")
          #   button=StampsField.new driver.a css: "a[class*=forgotUsername]"
          #   forgot_username_modal=ForgotUsernameModal.new(param)
          #   5.times do
          #     sign_in_link.click
          #     button.click
          #     sleep(0.35)
          #     return forgot_username_modal if forgot_username_modal.present?
          #   end
          #   expect("Unable to open Forgot Username Modal, check your code.").to eql "" unless forgot_password_modal.present?
          # end

          # def forgot_password
          #   sign_in_link=StampsField.new driver.link(text: "Sign In")
          #   button=StampsField.new driver.a css: "a[class*=forgotPassword]"
          #   forgot_password_modal=ForgotPasswordModal.new(param)
          #   5.times do
          #     sign_in_link.click
          #     button.click
          #     sleep(0.35)
          #     return forgot_password_modal if forgot_password_modal.present?
          #   end
          #   expect("Unable to open Forgot Password Modal, check your code.").to eql "" unless forgot_password_modal.present?
          # end

        end

         def forgot_username
           sign_in_link = StampsField.new driver.link(text: 'Sign In')
           button = StampsField.new driver.a css: 'a[class*=forgotUsername]'
           forgot_username_modal = ForgotUsernameModal.new(param)
           5.times do
             #sign_in_link.click
             sign_in_link.hover
             button.click
             sleep(0.35)
             return forgot_username_modal if forgot_username_modal.present?
           end
           expect('Unable to open Forgot Username Modal, check your code.').to eql '' unless forgot_password_modal.present?
         end

        def forgot_password
          sign_in_link = StampsField.new driver.link(text: 'Sign In')
          button = StampsField.new driver.a css: 'a[class*=forgotPassword]'
          forgot_password_modal = ForgotPasswordModal.new(param)
          5.times do
            #sign_in_link.click
            sign_in_link.hover
            button.click
            sleep(0.35)
            return forgot_password_modal if forgot_password_modal.present?
          end
          #expect("Unable to open Forgot Password Modal, check your code.").to eql "" unless forgot_password_modal.present?
        end

         def invalid_username_password
           StampsField.new driver.div css: 'div[id*=InvalidUsernamePasswordMsg]'
         end
      end
    end
  end
end