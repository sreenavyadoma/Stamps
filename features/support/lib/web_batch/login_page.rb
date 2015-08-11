module Batch
  class LoginPage < BatchPage
    private
    LOGIN_FIELDS ||= {
        :sign_in_link_loc => {:text => 'Sign In'},
        :username_loc => {:id => 'UserNameTextBox'},
        :password_loc => {:id => 'PasswordTextBox'},
        :sign_in_button_loc => {:id => 'signInButton'}
    }

    public
    def page_title
      @browser.title
    end

    def verify_page
      page_title
    end

    def username_textbox
      @browser.text_field(LOGIN_FIELDS[:username_loc])
    end

    def password_textbox
      @browser.text_field(LOGIN_FIELDS[:password_loc])
    end

    def sign_in_btn
      @browser.button(LOGIN_FIELDS[:sign_in_button_loc])
    end


    def visit
      @browser.goto url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      log "Visited #{url}"
      self
    end

    def sign_in(*args)
      grid = Grid.new @browser
      navigation = self.navigation_bar
      welcome_modal = WelcomeModal.new(@browser)
      welcome_orders_page = WelcomeOrdersPage.new(@browser)
      toolbar = self.toolbar
      case args.count
        when 0
          # user default sign in credentials
          # credentials = batch_helper.rand_login_credentials
          username = log_param "username", ENV["USR"] #credentials["username"]
          password = log_param "password", ENV["PW"] #credentials["password"]
        when 1
          if args[0].is_a? Hash
            username = args[0]['username']
            password = args[0]['password']
          else
            raise 'Argument Parameter Error.'
          end
        when 2
          username = args[0]
          password = args[1]
        else
          raise 'Argument Parameter Error.'
      end

      20.times do
        visit
        begin
          if username_textbox.present?
            username_textbox.wait_until_present
            self.username = username
            self.password = password
            browser_helper.click sign_in_btn, "SignIn"
            sign_in_btn.wait_while_present(5)
            toolbar.wait_until_present
            begin
              navigation.orders
            rescue
              #ignroe
            end
            if welcome_modal.present?
              welcome_modal.ok
              break
            end

            if welcome_orders_page.present?
              welcome_orders_page.continue
              break
            end
          end

          grid.wait_until_present 60
          break if toolbar.present? || grid.present?
          visit
        rescue
          #ignore
        end
      end
    end

    def username=(username)
      browser_helper.set_text username_textbox, username, 'Username'
    end

    def password=(password)
      browser_helper.set_text password_textbox, password, 'Password'
    end

    def sign_in_button
      sign_in_btn.click
    end
  end
end