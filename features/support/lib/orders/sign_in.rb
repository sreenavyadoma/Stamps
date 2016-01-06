module Orders

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
    private
    def continue_span
      @browser.span :text => "Continue"
    end

    public
    def present?
      browser_helper.present? continue_span
    end

    def wait_until_present
      begin
        continue_span.wait_until_present
      rescue
        #ignore
      end
    end

    def continue
      5.times{
        if browser_helper.present? continue_span
          browser_helper.click continue_span, 'continue'
        end
        break unless browser_helper.present? continue_span
      }
    end
  end

  class SignInPage < OrdersObject

    def username
      Textbox.new @browser.text_field Locators::SignIn::username
    end

    def password
      Textbox.new @browser.text_field Locators::SignIn::password
    end

    def sign_in
      Input.new @browser.input Locators::SignIn::sign_in
    end

    def remember_my_username
      raise "Not yet implemented."
    end

    def visit *args
      if args.length == 1
        ENV['URL'] = args[0]
      end

      if ENV['URL'] == "ss"
        url = "http://#{Stamps::Test.url_prefix}.stamps.com/orders/"
      elsif ENV['URL'].include? "."
        url = "http://#{ENV['URL']}.stamps.com/orders/"
      else
        url = "https://#{Stamps::Test.url_prefix}.stamps.com/orders/"
      end

      @browser.goto url
      log.info "Page loaded.  #{url}"
      self
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
      navbar = NavBar.new @browser
      welcome_modal = WelcomeModal.new @browser
      welcome_orders_page = WelcomeOrdersPage.new @browser
      plugin_issue = ErrorStampsPluginIssue.new @browser
      toolbar = Orders::Toolbar::Toolbar.new @browser

      20.times do
        begin
          break if grid.present?
          if username_textbox.present?
            username_textbox.wait_until_present
            username_textbox.set username
            password_textbox.set password
            sign_in_button.safe_send_keys :enter
            sign_in_button.safe_send_keys :enter

            log.info "#{username} is #{(navbar.present?)?"signed-in!":"not signed-in."}"

            grid.wait_until_present
            log.info "#{username} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            break if grid.present?

            if welcome_modal.present?
              welcome_modal.ok
              break
            end

            if welcome_orders_page.present?
              welcome_orders_page.continue
              break
            end

            if plugin_issue.present?
              plugin_issue.close
              break
            end

            log.info "#{username} is #{(navbar.present?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Orders Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            break if grid.present?

            begin
              navbar.orders.click
              toolbar.wait_until_present
            rescue
              visit
            end
            visit
          else
            visit
          end
        rescue Exception => e
          log.info e
        end
      end

      log.info "Signed-in Username is #{navbar.username.text}"

      if plugin_issue.present?
        raise "Stamps.com Plugin Issue"
      end

    end
  end

end