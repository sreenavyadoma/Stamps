module Stamps
  class HealthCheck < Browser::StampsModal

    def health_check
      modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

      case modal_param.test_env.downcase
        when /sc/
          url = "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          logger.message "Visit: #{url}"
          browser.goto url
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /cc/
          url = "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          logger.message "Visit: #{url}"
          browser.goto url
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /stg/
          url = "https://print.testing.stamps.com/orders/healthcheck.aspx"
          logger.message "-"
          logger.message "-"
          logger.message "Print - Orders"
          logger.message "Visit: #{url}"
          browser.goto url
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Orders: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"
        else
          # do nothing
      end

      logger.message browser.text

      if browser.text.include? "Server Error"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      if browser.text.downcase.include? "server not found"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      logger.message browser.url
      expect(browser.text).to include "All tests passed"
    end

    def address_book
      modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

      case modal_param.test_env.downcase
        when /sc/
          logger.message "Print - Address Book"
          browser.goto "https://printext.qasc.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "Print - Address Book"
          browser.goto "https://printext.qacc.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /stg/
          logger.message "Print - Address Book"
          browser.goto "https://print.testing.stamps.com/addressbook/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "Print - Address Book: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        else

      end

      if browser.text.include? "Server Error"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      if browser.text.downcase.include? "server not found"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      logger.info browser.url
      expect(browser.text).to include "All tests passed"
    end

    def or_reports
      modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

      case modal_param.test_env.downcase
        when /sc/
          logger.message "OR - Reports"
          browser.goto "https://orext.qasc.stamps.com/ORReports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "OR - Reports"
          browser.goto "https://orext.qacc.stamps.com/orreports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /stg/
          logger.message "OR - Reports"
          browser.goto "https://or.staging.stamps.com/orreports/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Reports: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        else
          # do nothing
      end

      if browser.text.include? "Server Error"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      if browser.text.downcase.include? "server not found"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      if browser.text.downcase.include? "server not found"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      logger.info browser.url
      expect(browser.text).to include "All tests passed"
    end

    def or_postage_tools
      modal_param.test_env = 'stg' if modal_param.test_env.downcase == 'staging'

      case modal_param.test_env.downcase
        when /sc/
          logger.message "OR - Postage Tools"
          browser.goto "https://orext.qasc.stamps.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /cc/
          logger.message "OR - Postage Tools"
          browser.goto "https://orext.qacc.stamps.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        when /stg/
          logger.message "OR - Postage Tools"
          browser.goto "https://or.staging.stamps.com/postagetools/healthcheck.aspx"
          logger.message "#{browser.url}"
          logger.message "#{browser.text}"
          logger.message "OR - Postage Tools: Test #{(browser.text.include? "All tests passed")?"Passed":"Failed"}"
          logger.message "-"
          logger.message "-"

        else
          # do nothing
      end

      if browser.text.include? "Server Error"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      if browser.text.downcase.include? "server not found"
        logger.error "\n#{browser.url}\n#{browser.text}"
        raise "\n#{browser.url}\n#{browser.text}"
      end

      logger.info browser.url
      expect(browser.text).to include "All tests passed"
    end
  end

end