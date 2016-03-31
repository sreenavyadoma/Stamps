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
        when /qasc/
          @browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: QASC"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://printext.qasc.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: QASC"
          sleep 1
          log.message "#{@browser.text}"
        when /qacc/
          @browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: QACC Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://printext.qacc.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: QACC Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
        when /staging/
          @browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          log.message "HealthCheck: Staging Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
          @browser.goto "https://print.testing.stamps.com/webpostage/healthcheck.aspx"
          log.message "HealthCheck: Staging Healthcheck:"
          sleep 1
          log.message "#{@browser.text}"
        else
          log.info "Invalid environment type!"
          log.info "Teardown: Begin tearing down test"
          Stamps::Test.teardown
          log.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
      log.message "HealthCheck:"
      log.message "HealthCheck: --------------------------- End"
      log.message "HealthCheck:"
      sleep 1
    end
  end
end