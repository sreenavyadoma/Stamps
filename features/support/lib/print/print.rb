# encoding: utf-8
module Print
  class PrintPostage < Print::Postage::PrintObject

    def sign_in
      Print::SignInModal.new @browser
    end

    def navigation_bar
      Print::NavBar.new @browser
    end

    def toolbar
      #we'll get to this when it comes time to buy stamps and prefs
    end

    def media_text_box
      StampsTextbox.new (@browser.text_field :css => "input[id*=printmediadroplist]")
    end

    def print_on selection
      mbox = media_text_box
      drop_down = Postage::PrintOn.new @browser
      drop_down.select selection

      5.times {
        begin
          if selection.include? 'Shipping Label'
            Print::Postage::ShippingLabel.new @browser
          elsif selection.include? 'Stamps'
            Print::Postage::Stamps.new @browser
          elsif selection.include? 'Envelope'
            Print::Postage::Envelope.new @browser
          elsif selection.include? 'Certified Mail'
            Print::Postage::CertifiedMail.new @browser
          elsif selection.include? 'Roll'
            Print::Postage::Roll.new @browser
          else
            raise "#{selection} is not a valid Print Postage Print-On Selection"
          end

          begin
            break if mbox.text.include? selection
            break if mbox.text.include? selection
            drop_down.safe_click unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            break if mbox.text.include? selection
          rescue
            #ignore
          end

        end
      }
    end

    def footer
      Print::Postage::Footer.new @browser
    end
  end
end