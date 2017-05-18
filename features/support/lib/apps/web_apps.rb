module WebApp
  def health
    @health ||= HealthCheck.new(modal_param)
  end

  def stamps
    @stamps ||= StampsDotCom.new(modal_param)
  end
end