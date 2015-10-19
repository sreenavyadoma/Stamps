module Postage
  class WebPostage < PostageObject
      def visit *args
        if args.length == 1
          ENV['URL'] = args[0]
        end

        url = "https://#{Stamps.url_prefix}.stamps.com/webpostage/"
        @browser.goto url
        log "Page loaded.  #{url}"
        self
      end

    def sign_in *args
      @sign_in ||= Postage::SignInPage.new(@browser).sign_in args
    end
  end
end