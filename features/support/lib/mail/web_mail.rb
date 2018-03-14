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
        cache[:sign_in].nil? || !cache[:sign_in].present? ? cache[:sign_in] = MailSignIn::MailSignInModal.new(param) : cache[:sign_in]
      end

      def toolbar_menu
        cache[:menu].nil? || !cache[:menu].present? ? cache[:menu] = MailToolbarMenu.new(param) : cache[:menu]
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
            if cache[:stamps].nil? || !cache[:stamps].present?
              cache[:stamps] = Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::MailStamps)
              cache[:stamps].print_media = print_media #todo-Rob fix this in new page object
            end
            return cache[:stamps]
          when :label
            if cache[:label].nil? || !cache[:label].present?
              cache[:label] = Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::ShippingLabel)
              cache[:label].print_media = print_media #todo-Rob fix this in new page object
            end
            return cache[:label]
          when :envelope
            if cache[:envelope].nil? || !cache[:envelope].present?
              cache[:envelope] = Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Envelope)
              cache[:envelope].print_media = print_media #todo-Rob fix this in new page object
            end
            return cache[:envelope]
          when :certified_mail
            if cache[:cm].nil? || !cache[:cm].present?
              cache[:cm] = Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::CertifiedMail)
              cache[:cm].print_media = print_media #todo-Rob fix this in new page object
            end
            return cache[:cm]
          when :roll
            if cache[:roll].nil? || !cache[:roll].present?
              cache[:roll] = Object.const_get('Mail::Base').new(param).extend(PrintFormPanel::Roll)
              cache[:roll].print_media = print_media #todo-Rob fix this in new page object
            end
            return cache[:roll]
          when :manage_printing_options
            raise 'Not Implemented'
          else
            # ignore
        end

        raise ArgumentError, "Invalid print media: #{print_media}"
      end

      def print_preview
        cache[:print_preview].nil? || !cache[:print_preview].present? ? cache[:print_preview] = PrintPreviewPanel::PrintPreview.new(param).extend(PrintPreviewPanel::StampsPrintPreview) : cache[:print_preview]
      end

      def mail_toolbar
        cache[:mail_toolbar].nil? || !cache[:mail_toolbar].present? ? cache[:mail_toolbar] = MailToolbar.new(param, print_media): cache[:mail_toolbar]
      end

      def mail_external_sites
        cache[:mail_external_sites].nil? || !cache[:mail_external_sites].present? ? cache[:mail_external_sites] = MailExternalSites.new(param) : cache[:mail_external_sites]
      end

      def print_media_obj
        cache[:print_media].nil? || !cache[:print_media].present? ? cache[:print_media] = PrintFormPanel::PrintOn.new(param) : cache[:print_media]
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