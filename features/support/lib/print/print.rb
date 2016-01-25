# encoding: utf-8
module Print
  class PrintPostage < Print::Postage::PrintObject

    def sign_in_page
      Print::SignInPage.new @browser
    end

    def navigation_bar
      Print::NavBar.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def print_on
      Postage::PrintOn.new @browser
    end

    def stamps
      Print::Postage::Stamps.new @browser
    end

    def shipping_label
      Print::Postage::ShippingLabel.new @browser
    end

    def envelope
      Print::Postage::Envelope.new @browser
    end

    def certified_mail
      Print::Postage::CertifiedMail.new @browser
    end

    def footer
      Print::Postage::Footer.new @browser
    end
  end
end