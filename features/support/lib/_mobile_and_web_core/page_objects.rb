module Stamps
  module Core

    ##
    #
    module Cache
      class << self
        def included(base)
          base.extend ClassMethods
        end

        module ClassMethods
          def assign(cache)
            @cache = cache
          end

          def cache
            raise(ArgumentError, "Cache not set for #{self.to_s.split('::').last}") if @cache.nil?
            @cache
          end
        end
      end
    end

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