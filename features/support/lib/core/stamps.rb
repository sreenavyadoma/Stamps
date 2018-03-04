module Stamps
  module DeviceType
    ANDROID = :android
    IOS = :ios
  end

  class StampsElementFinder
    ABSOLUTE_MAX_WAIT_TIME_SECONDS = 10

    def element(locator, maxTimeInSec)
      if (maxTimeInSec < 0 || maxTimeInSec > ABSOLUTE_MAX_WAIT_TIME_SECONDS)
        maxTimeInSec = ABSOLUTE_MAX_WAIT_TIME_SECONDS
      end

    end
  end

  class StampsActionMethods
    def type(text, locator, max_time_in_sec)
      element = finder.element(locator, max_time_in_sec)
      browser.text_field(name: "new_user_first_name").wait_until_present

      # need helper class that will create element based on locator
      browser.text_field(name: "new_user_first_name").wait_until(&:present?).click
      browser.text_field(name: "new_user_first_name").wait_until(message: 'foo') { |field| field.present? }
      browser.text_field(name: "new_user_first_name").wait_until(timeout: 60, &:present?)
    end
  end

  class StampsPageObject
    attr_reader :driver
    def initialize(driver)
      @driver = driver

    end

    def is_loaded?
      raise NotImplementedError, "#{self.class.name}#is_loaded? is an abstract method."
    end
  end

end