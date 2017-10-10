module Stamps
  class StampsDotCom < Browser::StampsModal
    def navigation_bar
      @navigation_bar = Navigation::NavigationBar.new(param) if @navigation_bar.nil? || !@navigation_bar.present?
      @navigation_bar
    end

    def orders
      @orders = WebOrders.new(param) if @orders.nil? || !@orders.present?
      @orders
    end

    def mail
      @mail = WebMail.new(param) if @mail.nil? || !@mail.present?
      @mail
    end

    def load_sign_in_page
      case param.test_env
        when /cc/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
        when /sc/
          url = "http://printext.qasc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage'}/default2.aspx"
        when /stg/
          url = "https://print.testing.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
        when /rating/
          url = "http://printext.qacc.stamps.com/#{(param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
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
