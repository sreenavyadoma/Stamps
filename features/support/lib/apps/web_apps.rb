module WebApp
  def health
    @health ||= HealthCheck.new(modal_param)
  end

  def stamps
    @stamps ||= StampsCom.new(modal_param)
  end
end