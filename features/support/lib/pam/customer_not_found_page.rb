module Stamps
  module Pam
    class CustomerNotFoundPage < Browser::StampsModal
      attr_reader :status_text
      def initialize(param)
        super
        @status_text = 'No records found'
      end

      def present?
        browser.text.include?(status_text)
      end

      def status_reason
        return status_text if present?
        'OK'
      end
    end
  end
end