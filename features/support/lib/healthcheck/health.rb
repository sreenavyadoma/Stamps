module Stamps

  def health
    HealthCheck.new @browser, @scenario_name
  end

  class HealthCheck < Stamps::Browser::BrowserObject
    def visit
      log.message "HealthCheck:"
      log.message "HealthCheck: --------------------------- Begin"
      log.message "HealthCheck:"
      case ENV['URL'].downcase
        when /sc/
          @browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: QASC"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://printext.qasc.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: QASC"
        when /cc/
          @browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: QACC Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://printext.qacc.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: QACC Healthcheck:"
        when /staging/
          @browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: Staging Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://print.testing.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: Staging Healthcheck:"
        else
          log.info "Invalid environment type!"
          log.info "Teardown: Begin tearing down test"
          Stamps::Test.teardown
          log.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
      sleep 1
      health_check = @browser.text
      log.message "#{health_check}"
      log.message "Test #{(health_check.include? "All tests passed")?"Passed":"Failed"}"

      health_check.should include "All tests passed"

      log.message "HealthCheck: --------------------------- End"
      log.message ""
      sleep 1
    end
  end
end