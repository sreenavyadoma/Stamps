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
        Print::Postage::Stamps.new @browser
      elsif selection.include? 'Shipping Label'
        Print::Postage::ShippingLabel.new @browser
      elsif selection.include? 'Envelope'
        Print::Postage::Envelope.new @browser
      elsif selection.include? 'Certified Mail'
        Print::Postage::CertifiedMail.new @browser
      else
        raise "#{selection} is not a valid Print Postage Print-On Selection"
      end
    end

    def footer
      Print::Postage::Footer.new @browser
    end
  end
end