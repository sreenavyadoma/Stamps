#AB_ORDERSAUTO_3516
module Stamps
  module Mail
    module MailToolbarLeftSide
      def favorites; end

      def mail_toolbar_model
        cache[:mail_toolbar_model].nil? || !cache[:mail_toolbar_model].present? ? cache[:mail_toolbar_model] = PrintModal::MailPrintModal.new(param) : cache[:mail_toolbar_model]
      end

      def print_button
        cache[:print_button].nil? || !cache[:print_button].present? ? cache[:print_button] = StampsField.new(driver.span(text: 'Print')) : cache[:print_button]
      end
    end

    module MailToolbarRightSide
      def reset_fields
        cache[:reset_fields] = StampsField.new(driver.span(css: "span[class*='sdc-icon-reset']")) if cache[:reset_fields].nil? || !cache[:reset_fields].present?
        cache[:reset_fields]
      end

      def feedback
        cache[:feedback] = StampsField.new(driver.span(css: "span[class*='sdc-icon-feedback']")) if cache[:feedback].nil? || !cache[:feedback].present?
        cache[:feedback]
      end

      def settings
        cache[:settings] = StampsField.new(driver.span(css: "span[class*='sdc-icon-settings']")) if cache[:settings].nil? || !cache[:settings].present?
        cache[:settings]
      end
    end

    class MailToolbarMenu < WebApps::Base
      include MailToolbarLeftSide
      include MailToolbarRightSide


    end
  end
end