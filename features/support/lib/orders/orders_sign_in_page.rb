module Stamps
  module Orders
    class NewWelcomeModal < Browser::StampsHtmlField
      attr_reader :title, :msg_container, :next_button, :close_button, :add_manual_order

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Welcome!')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @add_manual_order = AddManualOrderModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present(*args)
        title.safely_wait_until_present(*args)
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
          next_button.safe_click
          return add_manual_order if add_manual_order.present?
        end
      end
    end

    class WelcomeModal < Browser::StampsHtmlField
      attr_reader :okay_button

      def initialize(param)
        super(param)
        @okay_button = StampsElement.new browser.span(text: 'OK')
      end

      def present?
        okay_button.present?
      end

      def wait_until_present
        begin
          okay_button.wait_until_present
        rescue
          #ignore
        end
      end

      def ok
        5.times{
          okay_button.safe_click
          break unless okay_button.present?
        }
      end
    end

    class OrdersLandingPage < StampsSignInBase
      attr_reader :username, :password, :sign_in_btn, :title

      def initialize(param)
        super(param)
        @username = StampsTextbox.new browser.text_field(id: "UserNameTextBox")
        @password = StampsTextbox.new browser.text_field(id: "PasswordTextBox")
        @sign_in_btn = StampsElement.new browser.button(id: "signInButton")
        @title = StampsElement.new browser.h1(text: 'Sign In')
      end

      def remember_my_username
        expect("Not yet implemented.").to eql "remember_my_username"
      end

      def validation_message
        element_helper.text (browser.span id: 'InvalidUsernameMsg')
      end

      def blur_out
        title.safe_double_click
        title.safe_click
      end

      def first_time_sign_in usr, pw
        market_place = Orders::Stores::MarketPlace.new(param)

        username.safely_wait_until_present 6

        20.times do
          username.safely_wait_until_present 2
          username.set usr
          blur_out
          password.set pw
          blur_out
          sign_in_btn.safe_send_keys(:enter)
          blur_out
          sign_in_btn.safe_click
          blur_out

          market_place.wait_until_present 6
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

      def orders_sign_in(credentials)
        user_credentials(credentials)
        begin
          loading_orders = StampsElement.new browser.div(text: "Loading orders...")
          invalid_username = StampsElement.new browser.span(id: "InvalidUsernameMsg")
          new_welcome = NewWelcomeModal.new(param)

          expect(browser.url).to include "Orders"

          logger.message "#"*15
          logger.message "Username: #{usr}"
          logger.message "#"*15

          username.safely_wait_until_present(8)
          8.times do
            begin
              if username.present?
                username.set(usr)
                password.set(pw)
                sign_in_btn.safe_send_keys(:enter)

                30.times do
                  logger.message loading_orders.safe_text if loading_orders.present?
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

              new_welcome.wait_until_present(3)
              if new_welcome.present?
                logger.message new_welcome.message
                add_manual_order = new_welcome.next
                expect(add_manual_order.present?).to be true
                import_from_csv = add_manual_order.next
                expect(import_from_csv.present?).to be true
                import_from_stores = import_from_csv.next
                expect(import_from_stores.present?).to be true
                learn_more = import_from_stores.next
                expect(learn_more.present?).to be true
                learn_more.close
              end
              signed_in_user.wait_until_present(4)
              break if signed_in_user.present?
            rescue Exception => e
              logger.error e.backtrace.join "\n"
              raise e
            end
            usr
          end

          expect(signed_in_user.text).to eql(usr)

          logger.message "#"*15
          logger.message "Signed-in User: #{signed_in_user.text}"
          logger.message "#"*15

          signed_in_user.text
        rescue Exception => e
          logger.message e.message
          logger.message e.backtrace.join("\n")
        end
      end
    end
  end
end
