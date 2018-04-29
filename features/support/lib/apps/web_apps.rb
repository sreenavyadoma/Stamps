module Stamps
  module WebApps
    def health
      begin
        @health ||= HealthCheck.new(SdcTest.web_apps_param)
        @health
      rescue Exception > e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join('\n')
        raise e
      end
    end

    def firewall
      begin
        raise 'Not Implemented'
      rescue Exception > e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join('\n')
        raise e
      end
    end

    def stamps
      begin
        @stamps ||= Object.const_get("StampsDotCom").new(SdcTest.web_apps_param)
      rescue Exception => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join('\n')
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