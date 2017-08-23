module Stamps
  module Pam
    class CustomerNotFoundPage < Browser::StampsModal
      def status_reason
        StampsElement.new(browser.td(:css, '[class=TD3][align=middle]'))
      end

      def present?
        status_reason.present?
      end
    end

    class MeterInfoNotAvailable < Browser::StampsModal
      def page_title
        StampsElement.new(browser.td(:text, 'Error'))
      end

      def error_message
        StampsElement.new(browser.td(:css, 'td.TD3:nth-child(2)'))
      end

      def present?
        page_title.present?
      end
    end
  end
end