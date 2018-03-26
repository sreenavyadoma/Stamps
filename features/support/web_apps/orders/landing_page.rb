module Stamps
  module Orders
=begin
    class LandingPage < Core::PageObject
      class << self
        attr_reader :username_loc, :password_loc, :sign_in_loc
        @username_loc = {css: '[placeholder=USERNAME]'}
        @password_loc = {css: '[placeholder=PASSWORD]'}
        @sign_in_loc = {text: 'Sign In'}
      end
      attr_reader :username_textbox, :password_textbox, :sign_in_btn, :title, :signed_in_user

      def initialize(param)
        super
        @username_textbox = StampsTextbox.new(driver.text_field(css: '[placeholder=USERNAME]'))
        @password_textbox = StampsTextbox.new(driver.text_field(css: '[placeholder=PASSWORD]'))
        @sign_in_btn = StampsField.new(driver.span(text: 'Sign In'))
        @title = StampsField.new(driver.div(text: 'Sign In'))
        @signed_in_user = StampsField.new(driver.span(id: 'userNameText'))
      end

      def username_textbox

      end

      def remember_my_username
        raise 'remember_my_username not yet implemented.'
      end

      def validation_message
        StampsField.new(driver.span id: 'InvalidUsernameMsg')
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
        marketplace = Orders::Stores::Marketplace.new(param)
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
            log.message '-'
            log.message "Username: #{usr}"
            log.message "Username: #{usr}"
            log.message '-'
            return marketplace
          end
        end
        expect(validation_message.text).to eql ''
        expect('Market Place modal is not present').to eql 'First Time Sign In' unless marketplace.present?
      end

      def load_sign_in_page
        url = case param.env
                when :qacc
                  "http://printext.qacc.stamps.com/#{(param.web_app == :orders) ? 'orders' : 'webpostage/default2.aspx'}"
                when :qasc
                  "http://printext.qasc.stamps.com/#{(param.web_app == :orders) ? 'orders' : 'webpostage/default2.aspx'}"
                when :stg
                  "https://print.testing.stamps.com/#{(param.web_app == :orders) ? 'orders' : 'webpostage/default2.aspx'}"
                when :rating
                  "http://printext.qacc.stamps.com/#{(param.web_app == :orders) ? 'orders' : 'webpostage/default2.aspx'}"
                else
                  "http://#{param.env}/#{(param.web_app == :orders) ? 'orders' : 'webpostage/default2.aspx'}"
              end
        log.message '-'
        log.message "URL: #{url}"
        log.message '-'

        driver.goto(url)
        if driver.text.include? 'Server Error'
          log.error driver.text
          raise "Server Error:\n #{driver.text}"
        end

        case param.web_app
          when :orders
            expect(driver.url).to include 'Orders'
          when :mail
            expect(driver.url.downcase).to include 'webpostage'
          else
            # do nothing
        end
        driver.url
      end

      def orders_sign_in(usr, pw)
        begin
          loading_orders = StampsField.new(driver.div(text: 'Loading orders...'))
          invalid_username = StampsField.new(driver.span(id: 'InvalidUsernameMsg'))
          new_welcome = NewWelcomeModal.new(param)
          security_questions = SecurityQuestionsSuccess.new(param)
          server_error = Stamps::Orders::OrdersRuntimeError::ServerError.new(param)

          expect(driver.url).to include 'Orders'

          log.message '#' * 15
          log.message "Username: #{usr}"
          log.message '#' * 15

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
                log.message invalid_username.text if invalid_username.present?
                loading_orders.wait_until_present(4)
                10.times {log.message loading_orders.text if loading_orders.present?}
              end
              new_welcome.wait_until_present(2)
              if new_welcome.present?
                log.message new_welcome.message
                add_manual_order = new_welcome.next
                expect(add_manual_order).to be_present
                import_from_csv = add_manual_order.next
                expect(import_from_csv).to be_present
                import_from_stores = import_from_csv.next
                expect(import_from_stores).to be_present
                learn_more = import_from_stores.next
                expect(learn_more).to be_present
                learn_more.close
              end
              signed_in_user.wait_until_present(2)
            rescue StandardError => e
              log.error e.message
              log.error e.backtrace.join "\n"
              raise e
            end
          end
        rescue StandardError => e
          log.error e.message
          log.error e.backtrace.join("\n")
          raise e
        end
        nil
      end

      #todo-Rob fix this
      def orders_sign_in_sec_questions(usr, pw)
        security_questions = SecurityQuestions.new(param)

        expect(driver.url).to include 'Orders'

        log.message '#' * 15
        log.message "Username: #{usr}"
        log.message '#' * 15

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
        expect(security_questions).to be_present, ''
      end
    end
=end
  end
end