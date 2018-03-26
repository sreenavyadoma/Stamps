module Stamps
  module Core
    class ElementWrapper
      def initialize(driver, locator)
        @driver = driver
        @finder = ElementFinder.new(driver)
        #@actions = ActionMethods.new(driver, finder, call[0])
      end
    end

=begin
    class PageObject
      def initialize(driver)
        @driver = driver
        @finder = ElementFinder.new(driver)
        @actions = StampsActionMethods.new(driver, finder, call[0])
      end

      def is_loaded?
        raise NotImplementedError, "#{self.class.name}#is_loaded? is an abstract method."
      end

      protected
      attr_reader :driver, :locators
    end
=end
  end

end

