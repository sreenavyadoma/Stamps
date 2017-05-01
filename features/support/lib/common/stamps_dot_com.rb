module Stamps
  class StampsCom < Browser::StampsModal
    attr_reader :orders, :mail, :navigation_bar

    def initialize(param)
      super
      @navigation_bar = Navigation::NavigationBar.new(param)
      @orders = WebOrders.new(param)
      @mail = WebMail.new(param)
    end

    def load_sign_in_page
      case modal_param.test_env.downcase
        when /ss/
          url = "http://printss600.qacc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/"
        when /cc/
          url = "http://printext.qacc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://printext.qacc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if modal_param.web_app == :mail
        when /sc/
          url = "http://printext.qasc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://printext.qasc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if modal_param.web_app == :mail
        when /stg/
          url = "https://print.testing.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/"
          url = "http://print.testing.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/default2.aspx" if modal_param.web_app == :mail
        when /rating/
          url = "http://printext.qacc.stamps.com/#{(modal_param.web_app==:orders)?'orders':'webpostage'}/"
        else
          url = "http://#{modal_param.test_env}/#{(modal_param.web_app==:orders)?'orders':'webpostage/default2.aspx'}"
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

      case modal_param.web_app
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

  class StampsSignInBase < Browser::StampsModal
    attr_accessor :signed_in_user

    def initialize(param)
      super
      @signed_in_user = StampsElement.new(browser.span(id: "userNameText"))
    end

    def user_credentials(credentials)
      expect(credentials).to be(:default).or be(Hash)
      case credentials
        when :default
          @usr = modal_param.usr
          @pw = modal_param.pw
        when Hash
          @usr = credentials[:username]
          @pw = credentials[:password]
        else
          # do nothing
      end
    end

    def usr
      user_credentials(:default) if @usr.nil?
      @usr
    end

    def pw
      user_credentials(:default) if @pw.nil?
      @pw
    end
  end
end
