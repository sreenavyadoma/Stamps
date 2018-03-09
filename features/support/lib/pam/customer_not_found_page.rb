module Stamps
  module Pam
    class CustomerNotFoundPage < WebApps::Base
      def status_reason
        StampsField.new(driver.td(:css, '[class=TD3][align=middle]'))
      end

      def present?
        status_reason.present?
      end
    end

    class MeterInfoNotAvailable < WebApps::Base
      def page_title
        StampsField.new(driver.td(:text, 'Error'))
      end

      def error_message
        StampsField.new(driver.td(:css, 'td.TD3:nth-child(2)'))
      end

      def present?
        page_title.present?
      end
    end
  end
end