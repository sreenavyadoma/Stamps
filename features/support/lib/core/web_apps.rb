module Stamps
  class StampsWebApps < Browser::Modal

    attr_reader :navigation_bar

    def initialize param
      super param
      @navigation_bar ||= Navigation::NavigationBar.new param
      @orders ||= WebOrders.new param
      @mail ||= WebMail.new param
    end

    def visit page
      raise "Don't forget to LAUNCH YOUR BROWSER FIRST!" if browser.nil?

      case page
        when :orders
          app_name ="Orders"
        when :print_postage
          app_name ="Webpostage"
        else
          raise "#{page} is not a valid page."
      end

      ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'

      case ENV['URL'].downcase
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{app_name}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /sc/
          url = "http://printext.qasc.stamps.com/#{app_name}/"
        when /stg/
          url = "https://print.testing.stamps.com/#{app_name}/"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /./
          url = "http://#{ENV['URL']}.stamps.com/#{app_name}/"
        else
          url = ENV['URL']
      end

      browser.goto url
      if browser.text.include? "Server Error"
        logger.error browser.text
        raise browser.text
      end
      logger.info "Page loaded: #{browser.url}"
    end

    def orders
      begin
        @orders
      rescue Exception => e
        logger.error ""
        logger.error "#{e.message}"
        logger.error "#{e.backtrace.join "\n"}"
        logger.error ""
        raise e
      end
    end

    def mail
      begin
        @mail
      rescue Exception => e
        logger.error ""
        logger.error "#{e.message}"
        logger.error "#{e.backtrace.join "\n"}"
        logger.error ""
        raise e
      end
    end
  end
end