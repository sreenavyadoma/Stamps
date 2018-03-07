module Stamps
  module Core
    class StampsLogDecorator < SimpleDelegator
      attr_accessor :scenario_name, :verbose
      def initialize(logger)
        @logger = logger
        super
      end

      def info(str)
        super(str) if verbose
      end
      alias_method :message, :info
      alias_method :step, :info

      def debug(str)
        super(str) if verbose
      end

    end
  end
end

