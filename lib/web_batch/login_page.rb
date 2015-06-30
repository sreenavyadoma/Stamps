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

    def username_textbox
      @browser.text_field(LOGIN_FIELDS[:username_loc])
    end

    def password_textbox
      @browser.text_field(LOGIN_FIELDS[:password_loc])
    end

    def sign_in_button_field
      @browser.button(LOGIN_FIELDS[:sign_in_button_loc])
    end

    public

    def visit
      @browser.goto url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      log "Visited #{url}"
      self
    end

    def sign_in(*args)
      case args.count
        when 0
          # user default sign in credentials
          credentials = batch_helper.rand_login_credentials
          username = log_param "username", credentials["username"]
          password = log_param "password", credentials["password"]
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
        if username_textbox.present?
          username_textbox.wait_until_present
          self.username = username
          self.password = password
          field_helper.click sign_in_button_field, "SignIn"
          sign_in_button_field.wait_while_present(60)
        end
        break if toolbar.present?
      end
    end

    def username=(username)
      field_helper.set_text username_textbox, username, 'Username'
    end

    def password=(password)
      field_helper.set_text password_textbox, password, 'Password'
    end

    def sign_in_button
      sign_in_button_field.click
    end
  end
end