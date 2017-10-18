# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::StampsModal
      include PrintFormPanel::PrintFormBlurOut
      def sign_in_modal
        @sign_in_modal = MailSignInModal.new(param) if @sign_in_modal.nil? || !@sign_in_modal.present?
        @sign_in_modal
      end

      def mail_toolbar
        @mail_toolbar = MailToolbar.new(param) if @mail_toolbar.nil? || !@mail_toolbar.present?
        @mail_toolbar
      end

      def print_media
        @print_media = PrintFormPanel::PrintOn.new(param) if @print_media.nil? || !@print_media.present?
        @print_media
      end

      def print_on(selection)
        wait_until_present(5)
        blur_out
        expect(print_media).to be_present, "Print-on drop-down is not present."
        param.print_media = print_media.print_on_selection(selection)
      end

      def print_form
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
          when :certified_mails_3830
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMails3830) if @print_form.nil? || @print_form.print_media != :certified_mails_3830
          when :rolls
            @print_form = PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Rolls) if @print_form.nil? || @print_form.print_media != :rolls
          when :manage_printing_options
            @print_form
          else
            # do nothing
        end
        expect(@print_form).to be_present, "#(selection) form is not present."
        @print_form
      end

      def present?
        print_media.present?
      end

      def wait_until_present(*args)
        print_media.wait_until_present(*args)
      end
    end
  end
end