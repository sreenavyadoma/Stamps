module Stamps
  class HealthCheck < Browser::Base
    def health_check
      case param.test_env.downcase
        when /sc/
          browser.goto("https://printext.qasc.stamps.com/orders/healthcheck.aspx")
        when /cc/
          browser.goto("https://printext.qacc.stamps.com/orders/healthcheck.aspx")
        when /stg/
          browser.goto("https://print.testing.stamps.com/orders/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.test_env}"
      end
      sleep(1)
      log.message browser.text
      browser.text
    end

    def address_book
      param.test_env = 'stg' if param.test_env.downcase == 'staging'
      case param.test_env.downcase
        when /sc/
          browser.goto("https://printext.qasc.stamps.com/addressbook/healthcheck.aspx")
        when /cc/
          browser.goto("https://printext.qacc.stamps.com/addressbook/healthcheck.aspx")
        when /stg/
          browser.goto("https://print.testing.stamps.com/addressbook/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.test_env}"
      end
      sleep(1)
      log.message browser.text
      browser.text
    end

    def or_reports
      case param.test_env.downcase
        when /sc/
          browser.goto("https://orext.qasc.stamps.com/ORReports/healthcheck.aspx")
        when /cc/
          browser.goto("https://orext.qacc.stamps.com/orreports/healthcheck.aspx")
        when /stg/
          browser.goto("https://or.staging.stamps.com/orreports/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.test_env}"
      end
      sleep(1)
      log.message browser.text
      browser.text
    end

    def or_postage_tools
      case param.test_env.downcase
        when /sc/
          browser.goto("https://orext.qasc.stamps.com/postagetools/healthcheck.aspx")
        when /cc/
          browser.goto("https://orext.qacc.stamps.com/postagetools/healthcheck.aspx")
        when /stg/
          browser.goto("https://or.staging.stamps.com/postagetools/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.test_env}"
      end
      sleep(1)
      log.message browser.text
      browser.text
    end
  end

end