module Stamps
  module Core
    class ElementFinder
      ABSOLUTE_MAX_WAIT_TIME_SECONDS = 12

      def initialize(driver)
        @driver = driver
      end

      def element(locator, max_time_in_sec)
        if max_time_in_sec < 0 || max_time_in_sec > ABSOLUTE_MAX_WAIT_TIME_SECONDS
          max_time_in_sec = ABSOLUTE_MAX_WAIT_TIME_SECONDS
        end
        begin
          driver.wait_until(timeout: 2) do |driver|
            driver.element(locator).to_subtype.present?
          end
          return driver.element(locator).to_subtype
        rescue
          # ignore
        end
        nil
      end

      protected
      attr_reader :driver
    end
  end
end