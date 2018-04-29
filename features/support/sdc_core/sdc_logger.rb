module Stamps
  class SdcLogger < BasicObject

    def initialize(verbose: true)
      @@logger = create_logger
      @@verbose = verbose
    end

    def create_logger
      logger = ::Log4r::Logger.new(':')
      logger.outputters = ::Log4r::Outputter.stdout
      logger
    end

    class << self
      def logger
        @@logger
      end

      def verbose
        @@verbose
      end

      def info(*args)
        logger.info(*args) if verbose
      end
      alias_method :message, :info
      alias_method :step, :info

      def method_missing(method, *args)
        super unless logger.respond_to?(method)
        logger.send(method, *args)
      end
    end
  end
end

