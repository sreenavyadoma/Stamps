module Stamps
  class StampsCom < Browser::Modal
    attr_reader :orders, :mail, :navigation_bar

    def initialize(param)
      super(param)
      @sign_in_username = param.usr
      @sign_in_password = param.pw
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
        else
          url = "https://#{param.test_env}/webpostage/SignIn/Default.aspx?env=Orders"
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
          expect(browser.url).to include "Orders"
        when :mail
          expect(browser.url.downcase).to include "webpostage"
        else
          # do nothing
      end

      browser.url
    end
  end

  class StampsSignInBase < Browser::Modal
    attr_accessor :sign_in_username, :sign_in_password

    def initialize(param)
      super(param)
      @sign_in_username = param.usr
      @sign_in_password = param.pw
    end

    def user_credentials(*args)
      expect(args.length).to eql 2
      @sign_in_username = args[0]
      @sign_in_password = args[1]
    end
  end
end
