module Stamps
  module Core

    class PageObject
      attr_reader :driver, :locators
      def initialize(driver)
        @driver = driver
        @locators = {}
        @finder = ElementFinder.new(driver)
        @actions = StampsActionMethods.new(driver, finder, call[0])
      end

      def is_loaded?
        raise NotImplementedError, "#{self.class.name}#is_loaded? is an abstract method."
      end
    end
  end



end