module Stamps
  class HealthCheck < Stamps::Browser::BrowserObject
    def visit
      case ENV['URL'].downcase
        when /qasc/
          @browser.goto ""
        when /qacc/
          @browser.goto ""
        else
          raise "Raise an exception"
      end
    end

    def healthcheck
      log.info "get health check info from UI and log it here."
    end
  end
end