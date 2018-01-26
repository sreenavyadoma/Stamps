# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::BaseCache
      include Stamps::Mail::MailModals
      include PrintFormPanel::PrintFormBlurOut

      assign({})

      def sign_in_modal
        cache[:sign_in_modal].nil? || !cache[:sign_in_modal].present? ? cache[:sign_in_modal] = MailSignIn::MailSignInModal.new(param) : cache[:sign_in_modal]
      end

      def toolbar_menu
        cache[:toolbar_menu].nil? || !cache[:toolbar_menu].present? ? cache[:toolbar_menu] = MailToolbarMenu.new(param) : cache[:toolbar_menu]
      end

      def print_on(selection)
        wait_until_present(5)
        blur_out
        raise "Print-on drop-down is not present." unless print_media.present?
        param.print_media = print_media.select_print_on(selection)
      end

      def print_form
        case param.print_media
        when :stamps
          if cache[:stamps_print_form].nil? || !cache[:stamps_print_form].present?
            cache[:stamps_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::MailStamps)
          end
          return cache[:stamps_print_form]
        when :label
          if cache[:label_print_form].nil? || !cache[:label_print_form].present?
            cache[:label_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::ShippingLabel)
          end
          return cache[:label_print_form]
        when :envelope
          if cache[:envelope_print_form].nil? || !cache[:envelope_print_form].present?
            cache[:envelope_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::Envelope)
          end
          return cache[:envelope_print_form]
        when :certified_mail
          if cache[:certified_mail_print_form].nil? || !cache[:certified_mail_print_form].present?
            cache[:certified_mail_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::CertifiedMail)
          end
          return cache[:certified_mail_print_form]
        when :certified_mail_3910_3930
          if cache[:certified_mail_3910_3930_print_form].nil? || !cache[:certified_mail_3910_3930_print_form].present?
            cache[:certified_mail_3910_3930_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::CertifiedMail39103930)
          end
          return cache[:certified_mail_3910_3930_print_form]
        when :certified_mail_3810
          if cache[:certified_mail_3810_print_form].nil? || !cache[:certified_mail_3810_print_form].present?
            cache[:certified_mail_3810_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::CertifiedMail3810)
          end
          return cache[:certified_mail_3810_print_form]
        when :certified_mail_3830
          if cache[:certified_mail_3830_print_form].nil? || !cache[:certified_mail_3830_print_form].present?
            cache[:certified_mail_3830_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::CertifiedMail3830)
          end
          return cache[:certified_mail_3830_print_form]
        when :roll
          if cache[:roll_print_form].nil? || !cache[:roll_print_form].present?
            cache[:roll_print_form] = Stamps::Mail::PrintFormPanel::Form.new(param).extend(PrintFormPanel::Roll)
          end
          return cache[:roll_print_form]
        when :manage_printing_options
          raise "manage_printing_options is not implemented."
          else
            # ignore
        end

        raise ArgumentError, "Invalid print media: #{param.print_media}"
      end

      def print_preview
        cache[:print_preview].nil? || !cache[:print_preview].present? ? cache[:print_preview] = PrintPreviewPanel::PrintPreview.new(param).extend(PrintPreviewPanel::StampsPrintPreview) : cache[:print_preview]
      end

      def mail_toolbar
        cache[:mail_toolbar].nil? || !cache[:mail_toolbar].present? ? cache[:mail_toolbar] = MailToolbar.new(param) : cache[:mail_toolbar]
      end

      def mail_external_sites
        cache[:mail_external_sites].nil? || !cache[:mail_external_sites].present? ? cache[:mail_external_sites] = MailExternalSites.new(param) : cache[:mail_external_sites]
      end

      def print_media
        cache[:print_media].nil? || !cache[:print_media].present? ? cache[:print_media] = PrintFormPanel::PrintOn.new(param) : cache[:print_media]
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