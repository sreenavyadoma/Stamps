module WebReg
  class NewAccountWelcomePage < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.h1(:text => "Congratulations on your new account!")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.h1(:text => "Congratulations on your new account!")
    end
  end
end