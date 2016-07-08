module Stamps
  # https://or.staging.stamps.com/postagetools/healthcheck.aspx
  # https://or.staging.stamps.com/orreports/healthcheck.aspx
  # https://printext.qasc.stamps.com/addressbook/healthcheck.aspx

  class HealthCheck < Browser::Modal

    def health_check
      case ENV['URL'].downcase
        when /sc/
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /staging/
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        else
          logger.info "Invalid environment type!"
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
    end

    def address_book
      case ENV['URL'].downcase
        when /sc/
          logger.message "Print - Address Book"
          browser.goto "https://printext.qasc.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "Print - Address Book"
          browser.goto "https://printext.qacc.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /staging/
          logger.message "Print - Address Book"
          browser.goto "https://print.testing.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        else
          logger.info "Invalid environment type!"
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
    end

    def or_reports
      case ENV['URL'].downcase
        when /sc/
          logger.message "OR - Reports"
          browser.goto "https://or.qasc.stamps.com/orreports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "OR - Reports"
          browser.goto "https://or.qasc.qacc.com/orreports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /staging/
          logger.message "OR - Reports"
          browser.goto "https://or.staging.stamps.com/orreports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        else
          logger.info "Invalid environment type!"
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
    end

    def or_postage_tools
      case ENV['URL'].downcase
        when /sc/
          logger.message "OR - Postage Tools"
          browser.goto "https://or.qasc.stamps.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "OR - Postage Tools"
          browser.goto "https://or.qasc.qacc.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        when /staging/
          logger.message "OR - Postage Tools"
          browser.goto "https://or.staging.stamps.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          browser.text.should include "All tests passed"
          logger.message "-"
          logger.message "-"

        else
          logger.info "Invalid environment type!"
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          stop_test "#{ENV['URL']} is not a valid URL selection"
      end
    end
  end
end