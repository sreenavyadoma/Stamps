# encoding: utf-8
module Stamps
  module Mail
    class WebMail < Browser::StampsModal
      include PrintFormPanel::PrintFormBlurOut
      def sign_in_modal
        (cache[:sign_in_modal].nil?||!cache[:sign_in_modal].present?)?cache[:sign_in_modal]=MailSignIn::MailSignInModal.new(param):cache[:sign_in_modal]
      end

      def mail_toolbar
        (cache[:mail_toolbar].nil?||!cache[:mail_toolbar].present?)?cache[:mail_toolbar]=MailToolbar.new(param):cache[:mail_toolbar]
      end

      def print_media
        (cache[:print_media].nil?||!cache[:print_media].present?)?cache[:print_media]=PrintFormPanel::PrintOn.new(param):cache[:print_media]
      end

      def print_on(selection)
        wait_until_present(5)
        blur_out
        expect(print_media).to be_present, "Print-on drop-down is not present."
        param.print_media=print_media.select_print_on(selection)
      end

      def print_form
        case param.print_media
          when :stamps
            return (cache[:stamps].nil?||!cache[:stamps].present?)?cache[:stamps]=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::MailStamps):cache[:stamps]
          when :label
            return (cache[:label].nil?||!cache[:label].present?)?cache[:label]=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::ShippingLabel):cache[:label]
          when :envelope
            return (cache[:envelope].nil?||!cache[:envelope].present?)?cache[:envelope]=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Envelope):cache[:envelope]
          when :certified_mail

            return (cache[:envelope].nil?||!cache[:envelope].present?)?cache[:envelope]=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail):cache[:envelope]

            @print_form=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail) if @print_form.nil?||@print_form.param.print_media!=:certified_mail
          when :certified_mail_3910_3930
            @print_form=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail39103930) if @print_form.nil?||@print_form.param.print_media!=:certified_mail_3910_3930
          when :certified_mail_3810
            @print_form=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail3810) if @print_form.nil?||@print_form.param.print_media!=:certified_mail_3810
          when :certified_mail_3830
            @print_form=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::CertifiedMail3830) if @print_form.nil?||@print_form.param.print_media!=:certified_mail_3830
          when :roll
            @print_form=PrintFormPanel::PrintForm.new(param).extend(PrintFormPanel::Roll) if @print_form.nil?||@print_form.param.print_media!=:roll
          when :manage_printing_options
            @print_form
          else
            # do nothing
        end
        nil
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