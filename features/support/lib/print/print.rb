# encoding: utf-8
module Stamps
  module Print
    class PrintPostage < Print::Postage::PrintObject

      def sign_in
        Print::SignInModal.new param
      end

      def navigation_bar
        Print::NavBar.new param
      end

      def toolbar
        Print:Toolbar.new param
      end

      def print_on selection

        drop_down = Postage::PrintOn.new param
        drop_down.select selection

        begin
          if selection.include? 'Shipping Label'
            Print::Postage::ShippingLabel.new param
          elsif selection.include? 'Stamps'
            Print::Postage::Stamps.new param
          elsif selection.include? 'Envelope'
            Print::Postage::Envelope.new param
          elsif selection.include? 'Certified Mail'
            Print::Postage::CertifiedMail.new param
          elsif selection.include? 'Roll'
            Print::Postage::Roll.new param
          else
            raise "#{selection} is not a valid Print Postage Print-On Selection"
          end
        end
      end

      def footer
        Print::Postage::Footer.new param
      end
    end
  end
end