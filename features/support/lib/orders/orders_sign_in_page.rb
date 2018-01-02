module Stamps
  module Orders
    module Authentication
      class NewWelcomeModal < Browser::Base
        attr_reader :title, :msg_container, :next_button, :close_button, :add_manual_order

        def initialize(param)
          super
          @title=StampsField.new(browser.div(text: 'Welcome!'))
          @msg_container=StampsField.new(browser.div(id: 'sdc-window-tutorial-innerCt'))
          @next_button=StampsField.new(browser.span(text: 'Next'))
          @close_button=StampsField.new(browser.img(css: 'img[class$=x-tool-close]'))
          @add_manual_order=AddManualOrderModal.new(param)
        end

        def present?
          title.present?
        end

        def wait_until_present(*args)
          title.wait_until_present(*args)
        end

        def close
          close_button.click_while_present
        end

        def message
          msg_container.text
        end

        def next
          10.times do
            logger.message message
            next_button.click
            return add_manual_order if add_manual_order.present?
          end
        end
      end

      #todo-Rob add caching
      class OrdersLandingPage < Browser::Base
        attr_reader :username_textbox, :password_textbox, :sign_in_btn, :title, :signed_in_user

        def initialize(param)
          super
          @username_textbox=StampsTextbox.new(browser.text_field(css: "[placeholder=USERNAME]"))
          @password_textbox=StampsTextbox.new(browser.text_field(css: "[placeholder=PASSWORD]"))
          @sign_in_btn=StampsField.new(browser.span(text: "Sign In"))
          @title=StampsField.new(browser.div(text: 'Sign In'))
          @signed_in_user=StampsField.new(browser.span(id: "userNameText"))
        end

        def remember_my_username
          raise "remember_my_username not yet implemented."
        end

        def validation_message
          StampsField.new(browser.span id: 'InvalidUsernameMsg')
        end

        def blur_out
          title.blur_out
        end

        def present?
          username_textbox.present?
        end

        def wait_until_present(*args)
          username_textbox.wait_until_present(*args)
        end

        def wait_while_present(*args)
          username_textbox.wait_while_present(*args)
        end

        def username(str)
          username_textbox.click
          username_textbox.clear
          username_textbox.click
          username_textbox.set(str)
          username_textbox.click
        end

        def password(str)
          password_textbox.click
          password_textbox.clear
          password_textbox.set(str)
          password_textbox.click
          password_textbox.click
        end

        def login
          sign_in_btn.click
          sign_in_btn.click
          sign_in_btn.click
        end

        def first_time_sign_in(usr, pw)
          marketplace=Orders::Stores::Marketplace.new(param)
          username.wait_until_present(6)

          10.times do
            username.wait_until_present(2)
            username.set(usr)
            blur_out
            password.set(pw)
            blur_out
            sign_in_btn.click
            blur_out
            sign_in_btn.click
            blur_out

            marketplace.wait_until_present(6)
            if marketplace.present?
              logger.message "-"
              logger.message "Username: #{usr}"
              logger.message "Username: #{usr}"
              logger.message "-"
              return marketplace
            end
          end
          expect(validation_message.text).to eql ""
          expect("Market Place modal is not present").to eql "First Time Sign In" unless marketplace.present?
        end

        def load_sign_in_page
          case param.test_env
            when /cc/
              url="http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
            when /sc/
              url="http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
            when /stg/
              url="https://print.testing.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
            when /rating/
              url="http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
            else
              url="http://#{param.test_env}/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
          end

          logger.message "-"
          logger.message "URL: #{url}"
          logger.message "-"

          browser.goto(url)
          if browser.text.include? "Server Error"
            logger.error browser.text
            raise browser.text
          end

          logger.message "-"
          logger.message "Page loaded: #{browser.url}"
          logger.message "-"

          case param.web_app
            when :orders
              expect(browser.url).to include "Orders"
            when :mail
              expect(browser.url.downcase).to include "webpostage"
            else
              # do nothing
          end
          browser.url
        end

        def orders_sign_in(usr, pw)
          begin
            loading_orders=StampsField.new(browser.div(text: "Loading orders..."))
            invalid_username=StampsField.new(browser.span(id: "InvalidUsernameMsg"))
            new_welcome=NewWelcomeModal.new(param)
            security_questions=SecurityQuestionsSuccess.new(param)
            server_error=Stamps::Orders::OrdersRuntimeError::ServerError.new(param)

            expect(browser.url).to include "Orders"

            logger.message "#"*15
            logger.message "Username: #{usr}"
            logger.message "#"*15

            wait_until_present(4)
            30.times do
              begin
                 return signed_in_user.text if signed_in_user.present?
                if present?
                  username(usr)
                  password(pw)
                  login
                  wait_while_present(2)
                  #expect(server_error).to_not be_present, server_error.message
                  raise server_error.message if server_error.present?
                  security_questions.wait_until_present(2)
                  return security_questions if security_questions.present?
                  logger.message invalid_username.text if invalid_username.present?
                  10.times {logger.message loading_orders.text if loading_orders.present?}
                end
                new_welcome.wait_until_present(2)
                if new_welcome.present?
                  logger.message new_welcome.message
                  add_manual_order=new_welcome.next
                  expect(add_manual_order).to be_present
                  import_from_csv=add_manual_order.next
                  expect(import_from_csv).to be_present
                  import_from_stores=import_from_csv.next
                  expect(import_from_stores).to be_present
                  learn_more=import_from_stores.next
                  expect(learn_more).to be_present
                  learn_more.close
                end
                signed_in_user.wait_until_present(2)
              rescue Exception => e
                logger.error e.message
                logger.error e.backtrace.join "\n"
                raise e
              end
            end
          rescue Exception => e
            logger.error e.message
            logger.error e.backtrace.join("\n")
            raise e
          end
          nil
        end

        #todo-Rob fix this
        def orders_sign_in_sec_questions(usr, pw)
          security_questions=SecurityQuestions.new(param)

          expect(browser.url).to include "Orders"

          logger.message "#"*15
          logger.message "Username: #{usr}"
          logger.message "#"*15

          username.wait_until_present(8)
          20.times do
              if username.present?
                username.set(usr)
                password.set(pw)
                sign_in_btn.click
                security_questions.wait_until_present(2)
                return security_questions if security_questions.present?
              end
          end
          expect(security_questions).to be_present, ""
        end
      end
    end
  end
end
