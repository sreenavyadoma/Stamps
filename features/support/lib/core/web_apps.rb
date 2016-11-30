module Stamps
  class StampsCom < Browser::Modal

    attr_reader :orders, :mail, :navigation_bar

    def initialize param
      super param
      @navigation_bar ||= Navigation::NavigationBar.new param
      @orders ||= WebOrders.new param
      @mail ||= WebMail.new param
    end

    def visit page
      browser.should_not be_nil

      case page
        when :orders
          app_name ="Orders"
        when :mail
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
          url = "http://printext.qasc.stamps.com/#{app_name}/default2.aspx" #http://printext.qasc.stamps.com/webpostage/default2.aspx OLD:http://printext.qasc.stamps.com/#{app_name}/
        when /stg/
          url = "https://print.testing.stamps.com/#{app_name}/"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /./
          url = "http://#{ENV['URL']}.stamps.com/#{app_name}/"
        else
          url = ENV['URL']
      end

      logger.message "-"
      logger.message "URL: #{url}"
      logger.message "-"

      browser.goto url
      if browser.text.include? "Server Error"
        logger.error browser.text
        raise browser.text
      end

      logger.message "-"
      logger.message "Page loaded: #{browser.url}"
      logger.message "-"
      browser.url
    end
  end

  class StampsWebAppsSignIn < Browser::Modal
    def visit page
      browser.should_not be_nil

      case page
        when :orders
          case ENV['URL'].downcase
            when /ss/
              url = "http://printss600.qacc.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            when /cc/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            when /sc/
              url = "http://printext.qasc.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            when /staging/
              url = "https://print.testing.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            when /rating/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            when /./
              url = "http://#{ENV['URL']}.stamps.com/webpostage/SignIn/Default.aspx?env=Orders&"
            else
              url = ENV['URL']
          end
        when :mail
          case ENV['URL'].downcase
            when /ss/
              url = "http://printss600.qacc.stamps.com/webpostage/SignIn/Default.aspx"
            when /cc/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx"
            when /sc/
              url = "http://printext.qasc.stamps.com/webpostage/SignIn/Default.aspx"
            when /staging/
              url = "https://print.testing.stamps.com/webpostage/SignIn/Default.aspx"
            when /rating/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx"
            when /./
              url = "http://#{ENV['URL']}.stamps.com/webpostage/SignIn/Default.aspx"
            else
              url = ENV['URL']
          end
        else
          raise "#{page} is not a valid page."
      end

      browser.goto url
      logger.info "Page loaded: #{browser.url}"
    end
  end

end
