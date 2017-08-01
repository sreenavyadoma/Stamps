# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::StampsModal
      attr_accessor :sign_in_modal, :mail_toolbar, :mail_toolbar, :print_form , :print_media

      def initialize(param)
        super
        @print_media = PrintFormPanel::PrintOn.new(param)
        @sign_in_modal = MailSignInModal.new(param)
        @mail_toolbar = MailToolbar.new(param)
      end

      def print_on(selection)
        param.print_media = print_media.print_on(selection)
        case param.print_media
          when :stamps
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::MailStamps) if @print_form.nil? || @print_form.print_media != :stamps
          when :labels
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::ShippingLabels) if @print_form.nil? || @print_form.print_media != :labels
          when :envelopes
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Envelopes) if @print_form.nil? || @print_form.print_media != :envelopes
          when :certified_mails
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMails) if @print_form.nil? || @print_form.print_media != :certified_mails
          when :certified_mails_3910_3930
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMails39103930) if @print_form.nil? || @print_form.print_media != :certified_mails_3910_3930
          when :certified_mails_3810
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMails3810) if @print_form.nil? || @print_form.print_media != :certified_mails_3810
          when :rolls
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Rolls) if @print_form.nil? || @print_form.print_media != :rolls
          else
            # do nothing
        end
        expect(@print_form.present?).to be(true), "#(selection) form is not present."
      end

      def present?
        toolbar.present?
      end

      def wait_until_present(*args)
        toolbar.wait_until_present(*args)
      end
    end
  end
end