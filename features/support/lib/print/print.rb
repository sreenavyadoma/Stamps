# encoding: utf-8
module Print
  class PrintPostage < PrintObject

    def sign_in_page
      Print::SignInPage.new @browser
    end

    def navbar
      Print::NavBar.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def print_on
      Postage::PrintOn.new @browser
    end

    def stamps
      Postage::Stamps.new @browser
    end

    def shipping_label
      Postage::ShippingLabel.new @browser
    end
  end
end