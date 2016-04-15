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

    def print_on selection
      drop_down = Postage::PrintOn.new @browser
      drop_down.select selection

      if selection.include? 'Stamps'
        stamps
      elsif selection.include? 'Shipping Label'
        shipping_label
      elsif selection.include? 'Envelope'
        envelope
      elsif selection.include? 'Certified Mail'
        certified_mail
      else
        raise "#{selection} is not a valid Print Postage Print-On Selection"
      end
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