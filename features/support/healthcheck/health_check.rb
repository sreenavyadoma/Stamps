module Stamps
  class HealthCheck < WebApps::Base
    def health_check
      case param.env.downcase
        when /sc/
          driver.goto("https://printext.qasc.stamps.com/orders/healthcheck.aspx")
        when /cc/
          driver.goto("https://printext.qacc.stamps.com/orders/healthcheck.aspx")
        when /stg/
          driver.goto("https://print.testing.stamps.com/orders/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.env}"
      end
      sleep(1)
      log.message driver.text
      driver.text
    end

    def address_book
      param.env = 'stg' if param.env.downcase == 'staging'
      case param.env.downcase
        when /sc/
          driver.goto("https://printext.qasc.stamps.com/addressbook/healthcheck.aspx")
        when /cc/
          driver.goto("https://printext.qacc.stamps.com/addressbook/healthcheck.aspx")
        when /stg/
          driver.goto("https://print.testing.stamps.com/addressbook/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.env}"
      end
      sleep(1)
      log.message driver.text
      driver.text
    end

    def or_reports
      case param.env.downcase
        when /sc/
          driver.goto("https://orext.qasc.stamps.com/ORReports/healthcheck.aspx")
        when /cc/
          driver.goto("https://orext.qacc.stamps.com/orreports/healthcheck.aspx")
        when /stg/
          driver.goto("https://or.staging.stamps.com/orreports/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.env}"
      end
      sleep(1)
      log.message driver.text
      driver.text
    end

    def or_postage_tools
      case param.env.downcase
        when /sc/
          driver.goto("https://orext.qasc.stamps.com/postagetools/healthcheck.aspx")
        when /cc/
          driver.goto("https://orext.qacc.stamps.com/postagetools/healthcheck.aspx")
        when /stg/
          driver.goto("https://or.staging.stamps.com/postagetools/healthcheck.aspx")
        else
          raise "Invalid environment selection: #{param.env}"
      end
      sleep(1)
      log.message driver.text
      driver.text
    end
  end

end