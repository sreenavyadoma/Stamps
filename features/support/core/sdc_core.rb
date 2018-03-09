module Stamps
  module Core
    class SdcDriver < SimpleDelegator
      def initialize(driver)
        super
      end
    end

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
