module Stamps
  class StampsWebApps < Browser::Modal
    def visit page
      raise "Don't forget to LAUNCH YOUR BROWSER FIRST!" if browser.nil?

      case page
        when :orders
          app_name ="orders"
        when :print_postage
          app_name ="webpostage"
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
      logger.info "Page loaded: #{browser.url}"
    end
  end
end