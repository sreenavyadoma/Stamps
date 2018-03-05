module Stamps
  module Core
    class ActionMethods
      attr_reader :driver, :finder
      def initialize(driver, finder)
        @driver = driver
        @finder = finder
      end

      def set(text, locator, max_time_in_sec)
        element = finder.element(locator, max_time_in_sec)
        throw_or_log_error(locator, call[0]) if element.nil?

        browser.text_field(name: "new_user_first_name").wait_until_present
        # need helper class that will create element based on locator
        browser.text_field(name: "new_user_first_name").wait_until(&:present?).click
        browser.text_field(name: "new_user_first_name").wait_until(message: 'foo') { |field| field.present? }
        browser.text_field(name: "new_user_first_name").wait_until(timeout: 60, &:present?)
      end

      def send_keys(text, locator, max_time_in_sec)

      end

      def click(locator, max_time_in_sec)
        element = finder.element(locator, max_time_in_sec)
        raise "Unable to locate element with locator #{locator.to_s}" if element.nil?
        element.click
      end

      def wait_until_present

      end

      def wait_while_present

      end

      def throw_or_log_error(locator, method_name_from)
        # set a flag that enables framework to throw an exception or log error. throwOrLogError
        raise "#{method_name_from} - Unable to locate element with locator #{locator.to_s}"
      end
    end
  end
end