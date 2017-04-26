module Stamps
  module WebApp
    def health
      @health ||= HealthCheck.new(param)
    end

    def stamps
      @stamps ||= StampsCom.new(param)
    end
  end
end