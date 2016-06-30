module Stamps

  class HealthCheck < Browser::Modal
    def visit
      logger.message "HealthCheck:"
      logger.message "HealthCheck: --------------------------- Begin"
      logger.message "HealthCheck:"
      case ENV['URL'].downcase
        when /sc/
          browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          logger.message "HealthCheck: QASC"
          sleep 1
          logger.message "#{browser.text}"
          browser.goto "https://printext.qasc.stamps.com/webpostage/healthcheck.aspx"
          logger.message "HealthCheck: QASC"
        when /cc/
          browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          logger.message "HealthCheck: QACC Healthcheck:"
          sleep 1
          logger.message "#{browser.text}"
          browser.goto "https://printext.qacc.stamps.com/webpostage/healthcheck.aspx"
          logger.message "HealthCheck: QACC Healthcheck:"
        when /staging/
          browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          logger.message "HealthCheck: Staging Healthcheck:"
          sleep 1
          logger.message "#{browser.text}"
          browser.goto "https://print.testing.stamps.com/webpostage/healthcheck.aspx"
          logger.message "HealthCheck: Staging Healthcheck:"
        else
          logger.info "Invalid environment type!"
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
      sleep 1
      health_check = browser.text
      logger.message "#{health_check}"
      logger.message "Test #{(health_check.include? "All tests passed")?"Passed":"Failed"}"

      health_check.should include "All tests passed"

      logger.message "HealthCheck: --------------------------- End"
      logger.message ""
      sleep 1
    end
  end
end