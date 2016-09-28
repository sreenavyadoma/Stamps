# encoding: utf-8
module Stamps
  module Mail
    class WebMail < MailForm
      attr_reader :landing_page, :toolbar, :drop_down, :footer, :shipping_label, :netstamps,
                  :envelope, :certified_mail, :roll

      def initialize param
        super param
        @landing_page ||= MailSignInModal.new param
        @toolbar ||= Toolbar.new param
        @drop_down = PrintOn.new param
        @footer ||= Footer.new param
        @shipping_label ||= ShippingLabel.new param
        @netstamps ||= NetStamps.new param
        @envelope ||= Envelope.new param
        @certified_mail ||= CertifiedMail.new param
        @roll ||= Roll.new param
      end

      def present?
        toolbar.present?
      end

      def wait_until_present *args
        toolbar.wait_until_present *args
      end

      def print_on selection
        drop_down.select selection
        if selection.include? 'Shipping Label'
          shipping_label
        elsif selection.include? 'Stamps'
          netstamps
        elsif selection.include? 'Envelope'
          envelope
        elsif selection.include? 'Certified Mail'
          certified_mail
        elsif selection.include? 'Roll'
          roll
        else
          raise "#{selection} is not a valid Print Mail Print-On Selection"
        end
      end

    end
  end
end