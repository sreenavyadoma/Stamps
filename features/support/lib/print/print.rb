# encoding: utf-8
module Stamps
  module Print
    class PrintPostage < Browser::Modal
      attr_reader :landing_page, :navigation_bar, :toolbar, :drop_down, :footer, :shipping_label, :net_stamps,
                  :envelope, :certified_mail, :roll

      def initialize param
        super param
        @landing_page ||= Print::SignInModal.new param
        @navigation_bar ||= Print::NavBar.new param
        @toolbar ||= Print::Toolbar.new param
        @drop_down = Postage::PrintOn.new param
        @footer ||= Print::Postage::Footer.new param
        @shipping_label ||= Print::Postage::ShippingLabel.new param
        @net_stamps ||= Print::Postage::NetStamps.new param
        @envelope ||= Print::Postage::Envelope.new param
        @certified_mail ||= Print::Postage::CertifiedMail.new param
        @roll ||= Print::Postage::Roll.new param
      end

      def print_on selection
        drop_down.select selection
        if selection.include? 'Shipping Label'
          shipping_label
        elsif selection.include? 'Stamps'
          net_stamps
        elsif selection.include? 'Envelope'
          envelope
        elsif selection.include? 'Certified Mail'
          certified_mail
        elsif selection.include? 'Roll'
          roll
        else
          raise "#{selection} is not a valid Print Postage Print-On Selection"
        end
      end
    end
  end
end