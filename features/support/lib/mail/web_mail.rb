# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::StampsBrowserElement
      attr_accessor :sign_in_modal, :mail_toolbar, :mail_toolbar, :print_form , :print_media

      def initialize(param)
        super(param)
        @print_media = PrintFormPanel::PrintOn.new(param)
        @sign_in_modal = MailSignInModal.new(param)
        @mail_toolbar = MailToolbar.new(param)
      end

      def print_on(selection)
        param.print_media = print_media.print_on(selection)
        case param.print_media
          when :stamps
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::MailStamps)
          when :labels
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