module WebApp
  def health
    begin
      @health ||= HealthCheck.new(modal_param)
    rescue Exception => e
      config.logger.message e.message
      config.logger.message e.backtrace.join("\n")
    end
  end

  def stamps
    begin
      @stamps ||= StampsDotCom.new(modal_param)
    rescue Exception => e
      test_config.logger.message e.message
      test_config.logger.message e.backtrace.join("\n")
    end
  end
end