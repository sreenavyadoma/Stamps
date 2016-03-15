module Healthcheck
  class Healthcheck < Stamps::Browser::BrowserObject
    def visit env
      case env
        when :qasc
          @browser.goto ""
        when :qacc

      end
    end

    def healthcheck
      log.info "get health check info from UI and log it here."
    end
  end
end