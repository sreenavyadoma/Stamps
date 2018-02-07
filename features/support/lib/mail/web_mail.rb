# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::Base
      include Stamps::Mail::MailModals
      include PrintFormPanel::PrintFormBlurOut

      #assign({})

      def sign_in_modal
        cache[:sign_in].nil? || !cache[:sign_in].present? ? cache[:sign_in] = MailSignIn::MailSignInModal.new(param) : cache[:sign_in]
      end

      def toolbar_menu
        cache[:menu].nil? || !cache[:menu].present? ? cache[:menu] = MailToolbarMenu.new(param) : cache[:menu]
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
            if cache[:stamps].nil? || !cache[:stamps].present?
              cache[:stamps] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::MailStamps)
            end
            return cache[:stamps]
          when :label
            if cache[:label].nil? || !cache[:label].present?
              cache[:label] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::ShippingLabel)
            end
            return cache[:label]
          when :envelope
            if cache[:envelope].nil? || !cache[:envelope].present?
              cache[:envelope] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::Envelope)
            end
            return cache[:envelope]
          when :cm3610, :cm3710, :cm3910, :cm3930, :cm3810, :cm3830
            if cache[:cm].nil? || !cache[:cm].present?
              cache[:cm] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CertifiedMail)
            end
            return cache[:cm]
          # when :cm3610
          #   if cache[:cm3610].nil? || !cache[:cm3610].present?
          #     cache[:cm3610] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3610)
          #   end
          #   return cache[:cm3610]
          # when :cm3710
          #   if cache[:cm3710].nil? || !cache[:cm3710].present?
          #     cache[:cm3710] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3710)
          #   end
          #   return cache[:cm3710]
          # when :cm3910
          #   if cache[:cm3910].nil? || !cache[:cm3910].present?
          #     cache[:cm3910] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3910)
          #   end
          #   return cache[:cm3910]
          # when :cm3930
          #   if cache[:cm3930].nil? || !cache[:cm3930].present?
          #     cache[:cm3930] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3930)
          #   end
          #   return cache[:cm3930]
          # when :cm3810
          #   if cache[:cm3810].nil? || !cache[:cm3810].present?
          #     cache[:cm3810] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3810)
          #   end
          #   return cache[:cm3810]
          # when :cm3830
          #   if cache[:cm3830].nil? || !cache[:cm3830].present?
          #     cache[:cm3830] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::CM3830)
          #   end
          #   return cache[:cm3830]
          when :roll
            if cache[:roll].nil? || !cache[:roll].present?
              cache[:roll] = Class.new(Browser::Base).new(param).extend(PrintFormPanel::Roll)
            end
            return cache[:roll]
          when :manage_printing_options
            raise 'Not Implemented'
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