module Stamps
  class StampsDotCom < Browser::StampsModal
    attr_reader :orders, :mail, :navigation_bar

    def initialize(param)
      super
      @navigation_bar = Navigation::NavigationBar.new(param)
      @orders = WebOrders.new(param)
      @mail = WebMail.new(param)
    end

    def load_sign_in_page
      case param.test_env
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if param.web_app == :mail
        when /sc/
          url = "http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if param.web_app == :mail
        when /stg/
          url = "https://print.testing.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://print.testing.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if param.web_app == :mail
        when /rating/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/"
        else
          url = "http://#{param.test_env}/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
      end

      logger.message "-"
      logger.message "URL: #{url}"
      logger.message "-"

      browser.goto(url)
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
end
