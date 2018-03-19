module Stamps
  class SdcDriver < BasicObject
    def initialize(driver)
      @driver = driver
    end

    def method_missing(method, *args)
      super unless driver.respond_to?(method)
      driver.send(method, *args)
    end

    private
    attr_reader :driver
  end

  module Core

    class Base
      class << self
        attr_accessor :driver
      end
      def initialize(driver)
        self.class.driver = driver
      end

      def driver; self.class.driver; end
    end
  end
end
