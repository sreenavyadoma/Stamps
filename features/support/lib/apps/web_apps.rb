module Stamps
  module WebApps
    def health
      begin
        @health = HealthCheck.new(SdcTest.web_apps_param) if @health.nil?
        @health
      rescue Exception > e
        SdcTest.log.error e.message
        SdcTest.log.error e.backtrace.join('\n')
        raise e
      end
    end

    def firewall
      begin
        raise 'Not Implemented'
      rescue Exception > e
        SdcTest.log.error e.message
        SdcTest.log.error e.backtrace.join('\n')
        raise e
      end
    end

    def stamps
      begin
        @stamps = StampsDotCom.new(SdcTest.web_apps_param) if @stamps.nil?
        @stamps
      rescue Exception > e
        SdcTest.log.error e.message
        SdcTest.log.error e.backtrace.join('\n')
        raise e
      end
    end
  end
end

#todo-Rob Object.const_get
#Object.const_get("#{ENV['PLATFORM']}StampsDotCom").new(SdcTest.web_apps_param)
# use subclassing to encapsulate
# core setup, ask where it is running and instantiate proper object. then setup appropriate landing page.
# Create DeviceType and OsType objects.
#