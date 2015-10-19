module Postage
  class SignInPage < PostageObject

    def visit *args
      if args.length == 1
        ENV['URL'] = args[0]
      end
      url = "https://#{Stamps.url_prefix}.stamps.com/webpostage/"
      @browser.goto url
      log "Page loaded.  #{url}"
      self
    end

    def sign_in *args
      case args[0]
        when Hash
          username = args[0]['username']
          password = args[0]['password']
        when Array
          if args[0].length == 2
            username = args[0][0]
            password = args[0][1]
          else
            log "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
            username = ENV["USR"]
            password = ENV["PW"]
          end
        else
          log "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
          username = ENV["USR"]
          password = ENV["PW"]
      end

      sign_in_link = Link.new @browser.link :text => "Sign In"
      username_textbox = Textbox.new @browser.text_field :id => "UserNameTextBox"
      password_textbox = Textbox.new @browser.text_field :id => "PasswordTextBox"
      sign_in_button = Button.new @browser.button :id => "signInButton"
      verifying_account_info = Label.new @browser.div :text => "Verifying account information..."
      signed_in_user = Label.new @browser.span :id => "userNameText"

      log "#{username} is #{(sign_in_button.present?)?"signed-in!":"not signed-in."}"
      sign_in_link.safe_click
      15.times {
        if username_textbox.present?
          username_textbox.set username
          password_textbox.set password
          sign_in_button.safe_click
          sleep 2
          verifying_account_info.wait_while_present
          signed_in_user.wait_until_present
          break if signed_in_user.present?
        elsif sign_in_link.present?
          sign_in_link.safe_click
        elsif signed_in_user.present?
          break
        end
        log "#{username} is #{(sign_in_button.present?)?"signed-in!":"not signed-in."}"
      }
      log "#{username} is #{(sign_in_button.present?)?"signed-in!":"not signed-in."}"

      ENV["SIGNED_IN_USER"] = username

    end

  end
end