# encoding: utf-8
module Stamps
  module Mail

    class Base < WebApps::Base
      attr_accessor :print_media
    end

    class WebMail < Mail::Base
      include Stamps::Mail::MailModals
      include PrintFormPanel::PrintFormBlurOut

      def sign_in_modal
        @sign_in ||= MailSignIn::MailSignInModal.new(param)
      end

      def toolbar_menu
        @menu ||= MailToolbarMenu.new(param)
      end

      def print_on(selection)
        wait_until_present(5)
        blur_out
        raise "Print-on drop-down is not present." unless print_media_obj.present?
        @print_media = print_media_obj.select_print_on(selection) #todo-Rob might need to decouple this further?
      end

      def print_form
        case print_media
          when :stamps
            @stamps ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::MailStamps)
            @stamps.print_media = print_media #todo-Rob Fix print_media
            return @stamps
          when :label
            @label ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::ShippingLabel)
            @label.print_media = print_media
            return @label
          when :envelope
            @envelope ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Envelope)
            @envelope.print_media = print_media
            return @envelope
          when :certified_mail
            @certified_mail ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::CertifiedMail)
            @certified_mail.print_media = print_media
            return @certified_mail
          when :roll
            @roll ||= Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Roll)
            @roll.print_media = print_media
            return @roll
          when :manage_printing_options
            raise 'Not Implemented'
          else
            # ignore
        end

        raise ArgumentError, "Invalid print media: #{print_media}"
      end

      def print_preview
        @print_preview ||= PrintPreviewPanel::PrintPreview.new(param).extend(PrintPreviewPanel::StampsPrintPreview)
      end

      def mail_toolbar
        @mail_toolbar ||= MailToolbar.new(param, print_media)
      end

      def mail_external_sites
        @mail_external_sites ||= MailExternalSites.new(param)
      end

      def print_media_obj
        @print_media_obj ||= PrintFormPanel::PrintOn.new(param)
      end

      def present?
        print_media_obj.present?
      end

      def wait_until_present(*args)
        print_media_obj.wait_until_present(*args)
      end
    end

  end
end