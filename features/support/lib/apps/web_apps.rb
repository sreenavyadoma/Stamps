module Stamps
  module WebApp
    def health
      begin
        @health = HealthCheck.new(modal_param) if @health.nil?
        @health
      rescue StandardError > e
        test_config.logger.error e.message
        test_config.logger.error e.backtrace.join('\n')
        raise e
      end
    end

    def stamps
      begin
        @stamps = StampsDotCom.new(modal_param) if @stamps.nil?
        @stamps
      rescue StandardError > e
        test_config.logger.error e.message
        test_config.logger.error e.backtrace.join('\n')
        raise e
      end
    end
  end
end