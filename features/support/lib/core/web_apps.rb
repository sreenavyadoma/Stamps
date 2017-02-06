module Stamps
  class StampsCom < Browser::Modal
    attr_reader :orders, :mail, :navigation_bar

    def initialize(param)
      super(param)
      @navigation_bar = Navigation::NavigationBar.new(param)
      @orders = WebOrders.new(param)
      @mail = WebMail.new(param)
    end

    def load_sign_in_page
      case param.test_env.downcase
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
          #url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if param.web_app == :mail
        when /sc/
          url = "http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if param.web_app == :mail
        when /stg/
          url = "https://print.testing.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        when /./
          url = "http://#{param.test_env}.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        else
          url = param.test_env
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

      case param.web_app
        when :orders
          browser.url.should include "Orders"
        when :mail
          browser.url.downcase.should include "webpostage"
        else
          # do nothing
      end

      browser.url
    end
  end

  class StampsWebAppsSignIn < Browser::Modal
    def visit page
      browser.should_not be_nil

      case page
        when :orders
          case param.test_env.downcase
            when /ss/
              url = "http://printss600.qacc.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            when /cc/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            when /sc/
              url = "http://printext.qasc.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            when /staging/
              url = "https://print.testing.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            when /rating/
              url = "http://printext.qacc.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            when /./
              url = "http://#{param.test_env}.stamps.com/webpostage/SignIn/Default.aspx?param.test_env=Orders&"
            else
              url = param.test_env
          end
        when :mail
          case param.test_env.downcase
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
              url = "http://#{param.test_env}.stamps.com/webpostage/SignIn/Default.aspx"
            else
              url = param.test_env
          end
        else
          #do nothing
      end

      browser.goto url
      logger.info "Page loaded: #{browser.url}"
    end
  end

end
