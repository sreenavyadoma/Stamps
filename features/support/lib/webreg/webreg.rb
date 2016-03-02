module WebReg
  class Registration < Stamps::Browser::BrowserObject
    def visit
      case ENV['URL'].downcase
        when /cc/
          url = "https://qa-registration.stamps.com/registration"
        when /sc/
          url = "https://registrationext.qasc.stamps.com/registration"
        when /staging/
          url = "https://registration.staging.stamps.com/registration/"
        else
          raise "#{ENV['URL']} is not a valid Registration URL prefix selection.  Check your test!"
      end

      log.info "Visit:  #{url}"
      @browser.goto url
      sign_up_for_new_account = StampsLabel.new @browser.h1(:text => "Sign up for a new account")
      sign_up_for_new_account.wait_until_present
      log.info "Page loaded.  #{@browser.url}"
      self
    end

    def profile
      Profile.new @browser
    end
  end
end