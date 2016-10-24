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
        navbar = Navigation::NavigationBar.new param #todo sign_in page should extend NavigationBar???
        plugin_issue = ErrorStampsPluginIssue.new param
        toolbar = Stamps::Orders::Toolbar::Toolbar.new param
        market_place = Orders::Stores::MarketPlace.new param
        loading_orders = ElementWrapper.new browser.div(text: "Loading orders...")

        raise "Orders Sign-in page is not loaded!" unless browser.url.include? "Orders"

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
            raise "Invalid parameter. Usage: sign_in :default or sign_in username,password"
        end

        usr.should be_truthy

        logger.message "-"
        logger.message "Username: #{usr}"
        logger.message "Username: #{usr}"
        logger.message "-"

        username.safely_wait_until_present 8

        5.times do
          begin
            break if grid.present?
            username.set usr
            password.set pw
            sign_in_btn.safe_send_keys :enter
            sign_in_btn.safe_click
            sign_in_btn.safe_click

            2.times do
              if username.present?
                sleep 1
              else
                break
              end
            end

            loading_orders.safely_wait_until_present 2

            3.times do
              if loading_orders.present?
                logger.step loading_orders.safe_text
                logger.step loading_orders.safe_text
                logger.step loading_orders.safe_text
                loading_orders.safely_wait_while_present 5
              else
                break
              end
            end

            grid.wait_until_present 2
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

            toolbar.wait_until_present 60

            logger.info "#{usr} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

            # grid.wait_until_present
            logger.info "#{usr} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            break if grid.present?
          rescue Exception => e
            logger.error e.backtrace.join "\n"
            raise e
          end
        end

        "Orders Login Failed. Username: #{usr}\n#{browser.url}".should eql "" unless toolbar.present?
      end
    end
  end
end