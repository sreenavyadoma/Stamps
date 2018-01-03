# encoding: utf-8
#AB_ORDERSAUTO_3516
module Stamps
  module Mail
    module MailToolbarLeftSide
      def favorites

      end

      def print

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

    class MailToolbarMenu < Browser::Base
      include MailToolbarLeftSide
      include MailToolbarRightSide
    end
  end
end