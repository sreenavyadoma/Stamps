module Stamps
  module Orders
    class WelcomeModal < Browser::Modal
      private
      def okay_button
        browser.span text: 'OK'
      end

      public
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
          element_helper.safe_click okay_button
          break unless okay_button.present?
        }
      end
    end

    class OrdersLandingPage < Browser::Modal
      def username
        TextBoxElement.new browser.text_field Orders::Locators::SignIn::username
      end

      def password
        TextBoxElement.new browser.text_field Orders::Locators::SignIn::password
      end

      def sign_in_button
        button = browser.button Orders::Locators::SignIn::sign_in
        input = browser.text_field Orders::Locators::SignIn::sign_in
        ElementWrapper.new (button.present?)?button:input
      end

      def remember_my_username
        stop_test "Not yet implemented."
      end

      def first_time_sign_in usr, pw
        username_textbox = self.username
        password_textbox = self.password
        button = self.sign_in_button

        market_place = Orders::Stores::MarketPlace.new param

        10.times do
          username_textbox.wait_until_present
          username_textbox.set usr
          password_textbox.set pw
          button.safe_send_keys :enter
          button.safe_click

          return market_place if market_place.present?
        end
        nil
      end

      def sign_in *args
        username_textbox = self.username
        password_textbox = self.password
        button = self.sign_in_button

        grid = Orders::Grid::OrdersGrid.new param
        navbar = Navigation::NavigationBar.new param #todo sign_in page should extend NavigationBar???
        plugin_issue = ErrorStampsPluginIssue.new param
        toolbar = Orders::Toolbar::Toolbar.new param
        market_place = Orders::Stores::MarketPlace.new param
        loading_orders = ElementWrapper.new browser.div text: "Loading orders..."

        raise "Orders Sign-in page is not loaded!" unless browser.url.include? "Orders"

        case args.length
          when 1
            if args[0] == :default
              username = ENV["USR"]
              password = ENV["PW"]
            else
              raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
            end
          when 2
            username = args[0]
            password = args[1]
          else
            raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
        end

        raise "Username or Password is not set. Check your cucumber.yml file or Jenkins job." if username.nil? || password.nil?

        logger.info "Username: #{username}"
        logger.info "Username: #{username}"
        logger.info "Username: #{username}"

        3.times do
          begin
            break if grid.present?
            username_textbox.wait_until_present
            username_textbox.set username
            password_textbox.set password
            button.safe_send_keys :enter
            button.safe_click
            button.safe_click

            10.times do
              if username_textbox.present?
                sleep 1
              else
                break
              end
            end

            loading_orders.safely_wait_until_present 3

            20.times do
              if loading_orders.present?
                logger.info loading_orders.safe_text
                sleep 1
              else
                break
              end
            end

            break if grid.present?
            break if grid.present?
            break if grid.present?
            break if grid.present?
            break if grid.present?

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            if market_place.present?
              market_place.close
              break
            end

            logger.info "#{username} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

            grid.wait_until_present
            logger.info "#{username} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            break if grid.present?
          rescue Exception => e
            logger.error e.backtrace.join "\n"
            raise e
          end
        end

        begin
          logger.info 'LOGIN FAILED!'
          logger.info 'LOGIN FAILED!'
          logger.info 'LOGIN FAILED!'
          logger.info "Teardown Test!"
          stop_test "Sign-in failed!  Username #{username} is unable to sign-in on #{ENV["URL"]}"
        end unless navbar.present?

        logger.info "Signed-in Username is #{navbar.username.text}"

        if plugin_issue.present?
          TestHelper.teardown
          stop_test "Stamps.com Plugin Issue"
        end

      end
    end
  end
end