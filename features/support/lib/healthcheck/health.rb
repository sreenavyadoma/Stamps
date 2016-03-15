module Stamps

  def health
    HealthCheck.new @browser
  end

  class HealthCheck < Stamps::Browser::BrowserObject
    def visit
      case ENV['URL'].downcase
        when /qasc/
          @browser.goto "https://printext.qasc.stamps.com/orders/healthcheck.aspx"
          log.info "QASC Orders:"
          log.info "#{@browser.pre.text}"
          @browser.goto "https://printext.qasc.stamps.com/webpostage/healthcheck.aspx"
          log.info "QASC Web Postage:"
          log.info "#{@browser.pre.text}"
        when /qacc/
          @browser.goto "https://printext.qacc.stamps.com/orders/healthcheck.aspx"
          log.info "QACC Orders:"
          log.info "#{@browser.pre.text}"
          @browser.goto "https://printext.qacc.stamps.com/webpostage/healthcheck.aspx"
          log.info "QACC Web Postage:"
          log.info "#{@browser.pre.text}"
        when /staging/
          @browser.goto "https://print.testing.stamps.com/orders/healthcheck.aspx"
          log.info "Staging Orders:"
          log.info "#{@browser.pre.text}"
          @browser.goto "https://print.testing.stamps.com/webpostage/healthcheck.aspx"
          log.info "Staging Web Postage:"
          log.info "#{@browser.pre.text}"
        else
          log.info "Invalid environment type"
          raise "Raise an exception"
      end
    end
  end
end