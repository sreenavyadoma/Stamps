module WebReg
  class Registration < Stamps::Browser::BrowserObject
    def visit *args
      if args.length == 1
        case args[0]
          when :qa
            ENV['URL'] = "qa"
          else
            raise "#{args[0]} is not a valid Registration URL prefix selection.  Check your test!"
        end
      end

      case ENV['URL']
        when /qa/
          url = "https://qa-registration.stamps.com/registration"
        else
          raise "#{ENV['URL']} is not a valid Registration URL prefix selection.  Check your test!"
      end

      @browser.goto url
      sign_up_for_new_account = StampsLabel.new @browser.h1(:text => "Sign up for a new account")
      sign_up_for_new_account.wait_until_present
      log.info "Page loaded.  #{url}"
      self
    end

    def profile
      Profile.new @browser
    end
  end
end