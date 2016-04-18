module Stamps
  class StampsWebApps < OrdersObject

    def visit page
      case page
        when :orders
          app_name ="orders"
        when :print_postage
          app_name ="webpostage"
        else
          raise "#{page} is not a valid page."
      end

      case ENV['URL'].downcase
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{app_name}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /sc/
          url = "http://printext.qasc.stamps.com/#{app_name}/"
        when /staging/
          url = "https://print.testing.stamps.com/#{app_name}/"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /./
          url = "http://#{ENV['URL']}.stamps.com/#{app_name}/"
        else
          url = ENV['URL']
      end

      log.info "Visit: #{url}"
      5.times do
        @browser.goto url
        sleep 1
        break if @browser.url.include? ENV['URL'].downcase
      end
      log.info "Page loaded: #{url}"
      self
    end
  end
end