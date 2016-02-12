module WebReg
  class NewAccountWelcomePage < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.h1(:text => "Congratulations on your new account!")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.h1(:text => "Congratulations on your new account!")
    end
  end

  class ChooseSupplies < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.h1(:text => "Customize your Welcome Kit")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.button(:text => "Place Order")
    end

    def place_order
      button = Button.new @browser.button(:id => "mincartButtonTop")
      welcome_page = NewAccountWelcomePage.new @browser
      10.times do
        button.safe_click
        button.safe_click
        sleep 2
        return welcome_page if welcome_page.present?
      end
    end
  end
end