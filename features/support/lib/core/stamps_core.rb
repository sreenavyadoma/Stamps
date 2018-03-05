module Stamps
  module DeviceType
    ANDROID = :android
    IOS = :ios
  end

  class StampsElementFinder
    ABSOLUTE_MAX_WAIT_TIME_SECONDS = 12

    attr_reader :driver
    def initialize(driver)
      @driver = driver
    end

    def element(locator, max_time_in_sec)
      if (max_time_in_sec < 0 || max_time_in_sec > ABSOLUTE_MAX_WAIT_TIME_SECONDS)
        max_time_in_sec = ABSOLUTE_MAX_WAIT_TIME_SECONDS
      end
      begin
        element = driver.element(locator).to_subtype
        element.wait_until_present(max_time_in_sec)
      rescue
        element = nil
      end
      element
    end
  end

  class StampsActionMethods
    attr_reader :driver, :finder
    def initialize(driver, finder)
      @driver = driver
      @finder = finder
    end

    def set(text, locator, max_time_in_sec)
      element = finder.element(locator, max_time_in_sec)
      raise "Unable to locate element with locator #{locator.to_s}" if element.nil?
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

  end

  class StampsPageObject
    attr_reader :driver
    def initialize(driver)
      @driver = driver
      @finder = StampsElementFinder.new(driver)
      @actions = StampsActionMethods.new(driver, finder, call[0])
    end

    def is_loaded?
      raise NotImplementedError, "#{self.class.name}#is_loaded? is an abstract method."
    end
  end

end