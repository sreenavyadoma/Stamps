module Stamps
  module Orders
    class LearnMoreModal < Browser::Modal
      attr_reader :title, :msg_container, :next_button, :cancel_button, :learn_button, :close_button

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.div(text: 'Learn More')
        @msg_container ||= ElementWrapper.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @close_button ||= ElementWrapper.new browser.span(text: 'Close')
        @cancel_button ||= ElementWrapper.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_button ||= ElementWrapper.new browser.span(text: 'Learn More')
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

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.div(text: 'Import from Stores')
        @msg_container ||= ElementWrapper.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button ||= ElementWrapper.new browser.span(text: 'Next')
        @close_button ||= ElementWrapper.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_more ||= LearnMoreModal.new param
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

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.div(text: 'Import from CSV')
        @msg_container ||= ElementWrapper.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button ||= ElementWrapper.new browser.span(text: 'Next')
        @close_button ||= ElementWrapper.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_stores ||= ImportFromStoresModal.new param
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

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.div(text: 'Add Manual Order')
        @msg_container ||= ElementWrapper.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button ||= ElementWrapper.new browser.span(text: 'Next')
        @close_button ||= ElementWrapper.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_csv ||= ImportFromCsvModal.new param
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

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.div(text: 'Welcome!')
        @msg_container ||= ElementWrapper.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button ||= ElementWrapper.new browser.span(text: 'Next')
        @close_button ||= ElementWrapper.new browser.img(css: 'img[class$=x-tool-close]')
        @add_manual_order ||= AddManualOrderModal.new param
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
          return add_manual_order if add_manual_order.present?
        end
      end
    end

    class WelcomeModal < Browser::Modal
      attr_reader :okay_button

      def initialize param
        super param
        @okay_button ||= ElementWrapper.new browser.span(text: 'OK')
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

      def initialize param
        super param
        @username ||= TextBoxElement.new browser.text_field(id: "UserNameTextBox")
        @password ||= TextBoxElement.new browser.text_field(id: "PasswordTextBox")
        @sign_in_btn ||= ElementWrapper.new browser.button(id: "signInButton")
        @title = ElementWrapper.new browser.h1(text: 'Sign In')
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
        market_place = Orders::Stores::MarketPlace.new param

        username.safely_wait_until_present 6

        20.times do
          username.safely_wait_until_present 2
          username.set usr
          blur_out
          password.set pw
          blur_out
          sign_in_btn.safe_send_keys :enter
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

      def sign_in *args
        grid = Orders::Grid::OrdersGrid.new param
        navbar = Navigation::NavigationBar.new param
        plugin_issue = ErrorStampsPluginIssue.new param
        toolbar = Stamps::Orders::Toolbar::Toolbar.new param
        market_place = Orders::Stores::MarketPlace.new param
        loading_orders = ElementWrapper.new browser.div(text: "Loading orders...")
        invalid_username = ElementWrapper.new browser.span(id: "InvalidUsernameMsg")
        new_welcome = NewWelcomeModal.new param

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

        logger.message "-"
        logger.message "Username: #{usr}"
        logger.message "Username: #{usr}"
        logger.message "-"

        username.safely_wait_until_present 8

        15.times do
          begin
            break if grid.present?

            if username.present?
              username.set usr
              password.set pw
              sign_in_btn.safe_send_keys :enter

              5.times do
                if loading_orders.present?
                  logger.message loading_orders.safe_text
                  logger.message loading_orders.safe_text
                  logger.message loading_orders.safe_text
                  loading_orders.safely_wait_while_present 2
                else
                  break
                end
              end
              if invalid_username.present?
                logger.error invalid_username.text
                logger.error invalid_username.text
                logger.error invalid_username.text
                logger.error invalid_username.text
                logger.error invalid_username.text
                "Invalid Username: #{usr}/#{pw}".should eql invalid_username.text
              end

              #loading_orders.safely_wait_until_present 2
            end

            2.times do
              if username.present?
                sleep 1
              else
                break
              end
            end

            if invalid_username.present?
              logger.error invalid_username.text
              logger.error invalid_username.text
              logger.error invalid_username.text
              logger.error invalid_username.text
              logger.error invalid_username.text
              "Invalid Username: #{usr}/#{pw}".should eql invalid_username.text
            end

            if market_place.present?
              market_place.close
              break
            end

            grid.wait_until_present 2
            toolbar.wait_until_present 5

            market_place.wait_until_present 2
            if market_place.present?
              market_place.close
              break
            end

            new_welcome.wait_until_present 2
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

            logger.info "#{usr} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

            # grid.wait_until_present
            logger.info "#{usr} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            break if grid.present?
            break if grid.present?
            break if grid.present?
            break if grid.present?
            break if grid.present?
          rescue Exception => e
            logger.error e.backtrace.join "\n"
            raise e
          end
        end
      end
    end
  end
end
