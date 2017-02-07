module Stamps
  module Orders
    class LearnMoreModal < Browser::Modal
      attr_reader :title, :msg_container, :next_button, :cancel_button, :learn_button, :close_button

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Learn More')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @close_button = StampsElement.new browser.span(text: 'Close')
        @cancel_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_button = StampsElement.new browser.span(text: 'Learn More')
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
      end

      def cancel
        cancel_button.click_while_present
      end

      def message
        msg_container.text
      end

      def close
        logger.message message
        close_button.click_while_present
      end
    end

    class ImportFromStoresModal < Browser::Modal
      attr_reader :title, :msg_container, :next_button, :close_button, :learn_more

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Import from Stores')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_more = LearnMoreModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
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
          return learn_more if learn_more.present?
        end
      end
    end

    class ImportFromCsvModal < Browser::Modal
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_stores

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Import from CSV')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_stores = ImportFromStoresModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
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
          return import_from_stores if import_from_stores.present?
        end
      end
    end

    class AddManualOrderModal < Browser::Modal
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_csv

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Add Manual Order')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_csv = ImportFromCsvModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
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
          return import_from_csv if import_from_csv.present?
        end
      end
    end

    class NewWelcomeModal < Browser::Modal
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

    class WelcomeModal < Browser::Modal
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

    class OrdersLandingPage < Browser::Modal
      attr_reader :username, :password, :sign_in_btn, :title

      def initialize(param)
        super(param)
        @username = StampsTextbox.new browser.text_field(id: "UserNameTextBox")
        @password = StampsTextbox.new browser.text_field(id: "PasswordTextBox")
        @sign_in_btn = StampsElement.new browser.button(id: "signInButton")
        @title = StampsElement.new browser.h1(text: 'Sign In')
      end

      def remember_my_username
        "Not yet implemented.".should eql "remember_my_username"
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
        validation_message.should eql ""
        "Market Place modal is not present".should eql "First Time Sign In" unless market_place.present?
      end

      def orders_sign_in *args
        loading_orders = StampsElement.new browser.div(text: "Loading orders...")
        invalid_username = StampsElement.new browser.span(id: "InvalidUsernameMsg")
        new_welcome = NewWelcomeModal.new(param)

        "Check that URL is valid: #{browser.url}".should eql "Orders Sign-in page is not loaded!" unless browser.url.include? "Orders"

        case args.length
          when 1
            if args[0] == :default
              usr = ENV["USR"]
              pw = ENV["PW"]
            else
              raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
            end
          when 2
            usr = args[0]
            pw = args[1]
          else
            "Invalid parameter. Usage: sign_in :default or sign_in username,password".should eql "Invalid Parameter: usr=#{usr}, pw=#{pw}"
        end

        usr.should be_truthy
        pw.should be_truthy

        logger.message "#"*15
        logger.message "Username: #{usr}"
        logger.message "#"*15

        username.safely_wait_until_present(8)

        signed_in_user = StampsElement.new(browser.span(text: usr))
        4.times do
          begin
            if username.present?
              username.set usr
              password.set pw
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
                "Invalid Username: #{usr}/#{pw}".should eql invalid_username.text
              end
            end

            8.times {sleep(0.25) if username.present?}

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
              "Invalid Username: #{usr}/#{pw}".should eql invalid_username.text
            end

            new_welcome.wait_until_present(3)
            if new_welcome.present?
              logger.message new_welcome.message
              add_manual_order = new_welcome.next
              add_manual_order.present?.should be true
              import_from_csv = add_manual_order.next
              import_from_csv.present?.should be true
              import_from_stores = import_from_csv.next
              import_from_stores.present?.should be true
              learn_more = import_from_stores.next
              learn_more.present?.should be true
              learn_more.close
            end
            signed_in_user.safely_wait_until_present(3)
            break if signed_in_user.present?
          rescue Exception => e
            logger.error e.backtrace.join "\n"
            raise e
          end
        end

        expect("Unable to sign-in with credentials usr=#{usr}, pw=#{pw}").to eql("Sign-in failed in #{param.test_env}") if username.present?

        logger.message "#"*15
        logger.message "Signed-in User: #{signed_in_user.text}"
        logger.message "#"*15

        signed_in_user.text
      end
    end
  end
end
