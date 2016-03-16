module Stamps

  def health
    HealthCheck.new @browser
  end

  class HealthCheck < Stamps::Browser::BrowserObject
    def visit
      log.message "HealthCheck: --------------------------- Begin"
      case ENV['URL'].downcase
        when /qasc/
          @browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          log.message "QASC Orders:"
          log.message "#{@browser.pre.text}"
          @browser.goto "https://printext.qasc.stamps.com/webpostage/healthcheck.aspx"
          log.message "QASC Web Postage:"
          log.message "#{@browser.pre.text}"
        when /qacc/
          @browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          log.message "QACC Orders:"
          log.message "#{@browser.pre.text}"
          @browser.goto "https://printext.qacc.stamps.com/webpostage/healthcheck.aspx"
          log.message "QACC Web Postage:"
          log.message "#{@browser.pre.text}"
        when /staging/
          @browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          log.message "Staging Orders:"
          log.message "#{@browser.pre.text}"
          @browser.goto "https://print.testing.stamps.com/webpostage/healthcheck.aspx"
          log.message "Staging Web Postage:"
          log.message "#{@browser.pre.text}"
        else
          log.info "Invalid environment type"
          raise "Raise an exception"
      end
      log.message "HealthCheck: --------------------------- End"
    end
  end
end