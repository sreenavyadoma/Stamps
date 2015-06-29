module Batch
  class LoginPage < BatchPage
    private
    LOGIN_FIELDS = {
        :sign_in_link_loc => {:text => 'Sign In'},
        :username_loc => {:id => 'UserNameTextBox'},
        :password_loc => {:id => 'PasswordTextBox'},
        :sign_in_button_loc => {:id => 'signInButton'}
    }

    def page_title
      @browser.title
    end

    def verify_page
      page_title
    end

    def username_field
      @browser.text_field(LOGIN_FIELDS[:username_loc])
    end

    def password_field
      @browser.text_field(LOGIN_FIELDS[:password_loc])
    end

    def sign_in_button
      @browser.button(LOGIN_FIELDS[:sign_in_button_loc])
    end

    public

    def visit
      @browser.goto url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      log "Visited #{url}"
    end

    def sign_in(*args)
      case args.count
        when 0
          # user default sign in credentials
          username = helper.default_sign_in_credentials['username']
          password = helper.default_sign_in_credentials['password']
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

      5.times do
        visit
        if username_field.present?
          username_field.wait_until_present
          self.username = username
          self.password = password
          click sign_in_button, "SignIn"
          sign_in_button.wait_while_present(60)
        end
        break if toolbar_present?
      end
    end

    def username=(username)
      set_text username_field, username, 'Username'
    end

    def password=(password)
      set_text password_field, password, 'Password'
    end
  end
end