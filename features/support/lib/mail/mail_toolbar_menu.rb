# encoding: utf-8
#AB_ORDERSAUTO_3516
module Stamps
  module Mail
    module MailToolbarLeftSide
      def favorites

      end

      def mail_toolbar_model
        (cache[:mail_toolbar_model].nil?||!cache[:mail_toolbar_model].present?)?cache[:mail_toolbar_model]=PrintModal::MailPrintModal.new(param):cache[:mail_toolbar_model]
      end

      def print_button
        (cache[:print_button].nil?||!cache[:print_button].present?)?cache[:print_button] = StampsField.new(browser.span(text: 'Print')):cache[:print_button]
      end
    end

    module MailToolbarRightSide
      def reset_fields
        StampsField.new(browser.span(css: "span[class*='sdc-icon-reset']"))
      end

      def feedback

      end

      def settings

      end
    end

    class MailToolbarMenu < Browser::BaseCache
      include MailToolbarLeftSide
      include MailToolbarRightSide
      assign({})

    end
  end
end