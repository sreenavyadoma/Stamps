# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::Modal
      attr_accessor :sign_in_modal, :mail_toolbar, :mail_footer, :print_form_type, :print_form, :printing_on

      def initialize(param)
        super(param)
        @printing_on = PrintFormPanel::PrintOn.new(param)
        @sign_in_modal = MailSignInModal.new(param)
        @mail_toolbar = MailToolbar.new(param)
        @mail_footer = MailFooter.new(param)
      end

      def print_on(selection)
        print_form = printing_on.print_on(selection)
        case print_form
          when :stamps
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Stamps)
          when :paper
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::ShippingLabels)
          when :envelopes
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Envelopes)
          when :certified_mail
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail)
          when :rolls
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Rolls)
          else
            # do nothing
        end
        expect(@print_form.present?).to be(true)
      end

      def present?
        toolbar.present?
      end

      def wait_until_present *args
        toolbar.wait_until_present *args
      end
    end
  end
end