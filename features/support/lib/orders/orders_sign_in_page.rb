module Stamps
  module Orders
    module Authentication
      class NewWelcomeModal < Browser::StampsModal
        attr_reader :title, :msg_container, :next_button, :close_button, :add_manual_order

        def initialize(param)
          super
          @title = StampsElement.new(browser.div(text: 'Welcome!'))
          @msg_container = StampsElement.new(browser.div(id: 'sdc-window-tutorial-innerCt'))
          @next_button = StampsElement.new(browser.span(text: 'Next'))
          @close_button = StampsElement.new(browser.img(css: 'img[class$=x-tool-close]'))
          @add_manual_order = AddManualOrderModal.new(param)
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

      class OrdersLandingPage < StampsSignInBase
        attr_reader :username, :password, :sign_in_btn, :title

        def initialize(param)
          super
          browser.text_field(css: "input[class*=x-form-checkbox]")
          browser.a(text: "Download Software for Windows")
          @username = StampsTextBox.new browser.text_field(css: "input[placeholder=USERNAME]")
          @password = StampsTextBox.new browser.text_field(css: "input[placeholder=PASSWORD]")
          @sign_in_btn = StampsElement.new browser.span(css: "div[id^=app-main-][id$=-targetEl]>div>div>div>div>div:nth-child(6)>div>div>a>span>span>span[id$=btnInnerEl]")

          if param.url.to_sym == :stg
            @username = StampsTextBox.new browser.text_field(id: "UserNameTextBox")
            @password = StampsTextBox.new browser.text_field(id: "PasswordTextBox")
            @sign_in_btn = StampsElement.new browser.button(id: "signInButton")
          end
          @title = StampsElement.new browser.div(text: 'Sign In')
        end

        def remember_my_username
          expect("Not yet implemented.").to eql "remember_my_username"
        end

        def validation_message
          StampsElement.new(browser.span id: 'InvalidUsernameMsg').text
        end

        def blur_out
          title.blur_out
        end

        def first_time_sign_in(usr, pw)
          market_place = Orders::Stores::MarketPlace.new(param)
          username.wait_until_present(6)

          20.times do
            username.wait_until_present(2)
            username.set(usr)
            blur_out
            password.set(pw)
            blur_out
            sign_in_btn.click
            blur_out
            sign_in_btn.click
            blur_out

            market_place.wait_until_present(6)
            if market_place.present?
              logger.message "-"
              logger.message "Username: #{usr}"
              logger.message "Username: #{usr}"
              logger.message "-"
              return market_place
            end
          end
          expect(validation_message).to eql ""
          expect("Market Place modal is not present").to eql "First Time Sign In" unless market_place.present?
        end

        def orders_sign_in(usr, pw)
          begin
            loading_orders = StampsElement.new browser.div(text: "Loading orders...")
            invalid_username = StampsElement.new browser.span(id: "InvalidUsernameMsg")
            new_welcome = NewWelcomeModal.new(param)
            security_questions = SecurityQuestions.new(param)

            expect(browser.url).to include "Orders"

            logger.message "#"*15
            logger.message "Username: #{usr}"
            logger.message "#"*15

            username.wait_until_present(4)
            20.times do
              begin
                username.click
                if username.present?
                  username.set(usr)
                  password.set(pw)
                  sign_in_btn.click
                  sign_in_btn.click

                  security_questions.wait_until_present(8)
                  return security_questions if security_questions.present?

                  30.times do
                    logger.message loading_orders.text if loading_orders.present?
                    break unless loading_orders.present?
                  end

                  if invalid_username.present?
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    expect("Invalid Username: #{usr}/#{pw}").to eql invalid_username.text
                  end

                  8.times { sleep(0.25) if username.present? }

                  if invalid_username.present?
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    logger.error invalid_username.text
                    expect("Invalid Username: #{usr}/#{pw}").to eql invalid_username.text
                  end
                end

                new_welcome.wait_until_present(3)
                if new_welcome.present?
                  logger.message new_welcome.message
                  add_manual_order = new_welcome.next
                  expect(add_manual_order.present?).to be(true)
                  import_from_csv = add_manual_order.next
                  expect(import_from_csv.present?).to be(true)
                  import_from_stores = import_from_csv.next
                  expect(import_from_stores.present?).to be(true)
                  learn_more = import_from_stores.next
                  expect(learn_more.present?).to be(true)
                  learn_more.close
                end
                signed_in_user.wait_until_present(4)
                break if signed_in_user.present?
              rescue Exception => e
                logger.error e.message
                logger.error e.backtrace.join "\n"
                raise e
              end
              signed_in_user.text
            end

            expect(signed_in_user.text).to eql(usr)

            logger.message "#"*15
            logger.message "Signed-in User: #{signed_in_user.text}"
            logger.message "#"*15

            signed_in_user.text
          rescue Exception => e
            logger.error e.message
            logger.error e.backtrace.join("\n")
            raise e
          end
        end

        def orders_sign_in_sec_questions(usr, pw)
          security_questions = SecurityQuestions.new(param)

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
          expect(security_questions.present?).to be(true), ""
        end
      end
    end
  end
end
