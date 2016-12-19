module Stamps
  class StampsCom < Browser::Modal
    attr_reader :orders, :mail, :navigation_bar

    def initialize param
      super param
      @navigation_bar ||= Navigation::NavigationBar.new param
      @orders ||= WebOrders.new param
      @mail ||= WebMail.new param
    end

    def load_page
      browser.should_not be_nil
      helper.web_app.should  eq(:mail).or(eq(:orders))
      helper.test_env.should be_truthy

      case helper.web_app
        when :orders
          app_name ="orders"
        when :mail
          app_name ="webpostage"
        else
          #do nothing
      end

      helper.test_env.should be_truthy
      helper.test_env = 'stg' if helper.test_env.downcase == 'staging'

      case helper.test_env.downcase
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{app_name}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /sc/
          url = "http://printext.qasc.stamps.com/#{app_name}/"
          url = "http://printext.qasc.stamps.com/#{app_name}/default2.aspx" if ENV['web_app'].downcase == 'mail'
        when /stg/
          url = "https://print.testing.stamps.com/#{app_name}/"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{app_name}/"
        when /./
          url = "http://#{helper.test_env}.stamps.com/#{app_name}/"
        else
          url = helper.test_env
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
          case helper.test_env.downcase
            when /ss/
              url = "http://printss600.qacc.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            when /cc/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            when /sc/
              url = "http://printext.qasc.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            when /staging/
              url = "https://print.testing.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            when /rating/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            when /./
              url = "http://#{helper.test_env}.stamps.com/webpostage/SignIn/Default.aspx?helper.test_env=Orders&"
            else
              url = helper.test_env
          end
        when :mail
          case helper.test_env.downcase
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
              url = "http://#{helper.test_env}.stamps.com/webpostage/SignIn/Default.aspx"
            else
              url = helper.test_env
          end
        else
          #do nothing
      end

      browser.goto url
      logger.info "Page loaded: #{browser.url}"
    end
  end

end
