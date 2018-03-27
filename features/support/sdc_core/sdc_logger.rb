module Stamps
  module Core
    class SdcLogger < BasicObject
      def initialize(logger, verbose)
        @logger = logger
        @verbose = verbose
      end

      def info(str)
        logger.info(str) if verbose
      end
      alias_method :message, :info
      alias_method :step, :info

      def method_missing(method, *args)
        super unless logger.respond_to?(method)
        logger.send(method, *args)
      end

      private
      attr_reader :logger, :verbose
    end
  end
end

