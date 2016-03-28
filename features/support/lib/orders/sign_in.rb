module Orders
  module LandingPage
    class WelcomeModal < OrdersObject
      private
      def okay_button
        @browser.span :text => 'OK'
      end

      public
      def present?
        browser_helper.present? okay_button
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
          browser_helper.click okay_button, 'OK'
          break unless browser_helper.present? okay_button
        }
      end
    end

    class WelcomeOrdersPage < OrdersObject
      def present?
        browser_helper.present? (@browser.span :text => "Continue")
      end

      def close
        button = StampsButton.new @browser.img(css: 'img[class*=x-tool-close]')
        5.times do
          button.safe_click
          break unless button.present?
        end
      end

      def wait_until_present
        browser_helper.wait_until_present (@browser.span :text => "Continue")
      end

      def continue
        button = StampsButton.new (@browser.span :text => "Continue")
        10.times{
          button.safe_click
          break unless button.present?
        }
      end
    end

    class SignInPage < OrdersObject

      def username
        StampsTextbox.new @browser.text_field Orders::Locators::SignIn::username
      end

      def password
        StampsTextbox.new @browser.text_field Orders::Locators::SignIn::password
      end

      def sign_in
        StampsInput.new @browser.input Orders::Locators::SignIn::sign_in
      end

      def remember_my_username
        stop_test "Not yet implemented."
      end

      def visit
        case ENV['URL'].downcase
          when /ss/
            url = "http://printss600.qacc.stamps.com/orders/"
          when /cc/
            url = "http://printext.qacc.stamps.com/orders/"
          when /sc/
            url = "http://printext.qasc.stamps.com/orders/"
          when /staging/
            url = "http://print.staging.stamps.com/orders/"
          when /rating/
            url = "http://printext.qacc.stamps.com/orders/"
          when /./
            url = "http://#{ENV['URL']}.stamps.com/orders/"
          else
            url = ENV['URL']
        end

        log.info "Visit: #{url}"
        5.times do
          @browser.goto url
          sleep 1
          break if @browser.url.include? ENV['URL'].downcase
        end
        log.info "Page loaded: #{url}"
        self
      end

      def first_time_sign_in usr, pw
        username_textbox = self.username
        password_textbox = self.password
        sign_in_button = self.sign_in

        grid = Orders::Grid::OrdersGrid.new @browser
        welcome_orders_page = WelcomeOrdersPage.new @browser
        market_place = Orders::Stores::MarketPlace.new @browser

        30.times do
          username_textbox.wait_until_present
          username_textbox.set_until usr
          password_textbox.set pw
          sign_in_button.safe_send_keys :enter
          sign_in_button.safe_send_keys :enter
          sign_in_button.safe_click
          sign_in_button.safe_click

          welcome_orders_page.wait_until_present
          welcome_orders_page.close if welcome_orders_page.present?
          welcome_orders_page.continue if welcome_orders_page.present?

          #market_place.wait_until_present
          market_place.close if market_place.present?
          break if grid.present?
          end
        end

      def sign_in_with_credentials *args
        case args
          when Hash
            username = args['username']
            password = args['password']
          when Array
            if args.length == 2
              username = args[0]
              password = args[1]
            else
              log.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
              username = ENV["USR"]
              password = ENV["PW"]
            end
          else
            log.info "Using Default Sign-in Credentials: #{ENV["USR"]}"
            username = ENV["USR"]
            password = ENV["PW"]
        end

        username_textbox = self.username
        password_textbox = self.password
        sign_in_button = self.sign_in

        grid = Orders::Grid::OrdersGrid.new @browser
        navbar = Orders::Navigation::NavigationBar.new @browser
        welcome_modal = WelcomeModal.new @browser
        welcome_orders_page = WelcomeOrdersPage.new @browser
        plugin_issue = ErrorStampsPluginIssue.new @browser
        toolbar = Orders::Toolbar::Toolbar.new @browser
        market_place = Orders::Stores::MarketPlace.new @browser

        5.times do
          begin
            break if grid.present?
            if username_textbox.present?
              username_textbox.wait_until_present
              username_textbox.set username
              password_textbox.set password
              sign_in_button.safe_send_keys :enter
              sign_in_button.safe_send_keys :enter
              sign_in_button.safe_click
              sign_in_button.safe_click

              if welcome_orders_page.present?
                welcome_orders_page.continue
                break
              end

              if market_place.present?
                market_place.close
                break
              end

              log.info "#{username} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

              grid.wait_until_present
              log.info "#{username} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

              break if grid.present?
              break if grid.present?
              break if grid.present?
              break if grid.present?

              toolbar.wait_until_present
              grid.wait_until_present
              break if grid.present?
              break if grid.present?
              break if grid.present?
              visit
            else
              visit
            end
          rescue Exception => e
            log.info e
          end
        end

        begin
          log.info 'LOGIN FAILED!'
          log.info 'LOGIN FAILED!'
          log.info 'LOGIN FAILED!'
          log.info "Teardown Test!"
          Stamps::Test.teardown
          stop_test "Sign-in failed!  Username #{username} is unable to sign-in on #{ENV["URL"]}"
        end unless navbar.present?

        log.info "Signed-in Username is #{navbar.username.text}"

        if plugin_issue.present?
          Stamps::Test.teardown
          stop_test "Stamps.com Plugin Issue"
        end

      end
    end
  end
end