module WebReg
  class Supplies < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.button(:id => "mincartButtonTop")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.button(:id => "mincartButtonTop")
    end

    def place_order
      button = Button.new @browser.button(:id => "mincartButtonTop")
      welcome_page = NewAccountWelcomePage.new
      5.times do
        button.safe_click
        sleep 1
        break if welcome_page.present?
      end
    end
  end
end