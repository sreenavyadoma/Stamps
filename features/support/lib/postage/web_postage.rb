module Postage
  class WebPostage < PostageObject
      def visit *args
        if args.length == 1
          ENV['URL'] = args[0]
        end

        url = "https://#{Stamps.url_prefix}.stamps.com/webbatch/"
        @browser.goto url
        log "Page loaded.  #{url}"
        self
      end

    def sign_in *args
      @sign_in ||= SignInPage.new(@browser).sign_in args
    end
  end
end