module Postage
  class SignInPage < PostageObject

    def visit *args
      if args.length == 1
        ENV['URL'] = args[0]
      end

      if ENV['URL'] == "ss"
        url = "http://#{Stamps::Test.url_prefix}.stamps.com/webpostage/"
      else
        url = "https://#{Stamps::Test.url_prefix}.stamps.com/webpostage/"
      end

      @browser.goto url
      log.info "Page loaded.  #{url}"
      self
    end

    def sign_in *args
      case args
        when Hash
          username = args[0]['username']
          password = args[0]['password']
        when Array
          if args.length == 2
            username = args[0]
            password = args[1]
          else
            log.info "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
            username = ENV["USR"]
            password = ENV["PW"]
          end
        else
          log.info "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
          username = ENV["USR"]
          password = ENV["PW"]
      end

      sign_in_link = Link.new @browser.link :text => "Sign In"
      username_textbox = Textbox.new @browser.text_field :id => "UserNameTextBox"
      password_textbox = Textbox.new @browser.text_field :id => "PasswordTextBox"
      sign_in_button = Button.new @browser.button :id => "signInButton"
      verifying_account_info = Label.new @browser.div :text => "Verifying account information..."
      signed_in_user = Label.new @browser.span :id => "userNameText"

      10.times {
        sign_in_link.safe_click unless username_textbox.present?
        username_textbox.set username

        sign_in_link.safe_click unless password_textbox.present?
        password_textbox.set password

        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        sleep 1
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        sleep 1
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        sleep 1
        sign_in_link.safe_click unless sign_in_button.present?
        sign_in_button.safe_click
        sleep 1
        sign_in_link.safe_click unless sign_in_button.present?
        sleep 1

        #log.info "Verifying account info... #{(verifying_account_info.present?)?"true":"false"}"
        if verifying_account_info.present?
          #log.info "#{(verifying_account_info.present?)?"Verifying account info....":"Verifying account info done or not visible"}"
          verifying_account_info.wait_while_present
          signed_in_user.wait_until_present
          log.info "Signed in username is #{signed_in_user.text}"
        end

        log.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

        break if signed_in_user.present?
      }
      log.info "#{username} is #{(signed_in_user.present?)?"signed-in!":"not signed-in."}"

      ENV["SIGNED_IN_USER"] = username

    end

  end
end