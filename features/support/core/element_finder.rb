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
          element = driver.element(locator).to_subtype
          Watir::Wait.until
          element.wait_until_present(max_time_in_sec)
        rescue
          element = nil
        end
        element
      end

      protected
      attr_reader :driver
    end
  end
end