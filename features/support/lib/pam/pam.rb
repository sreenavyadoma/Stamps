module Pam
  class PaymentAdministratorManager < Stamps::Browser::BrowserObject
    def visit *args
      if args.length == 1
        case args[0]
          when :qa
            ENV['URL'] = "qa"
          else
            raise "#{args[0]} is not a valid Registration URL prefix selection.  Check your test!"
        end
      end

      case ENV['URL']
        when /qa/
          url = "http://qa-clientsite:82/pam/"
        else
          raise "#{ENV['URL']} is not a valid Registration URL prefix selection.  Check your test!"
      end

      @browser.goto url
      #self..wait_until_present
      log.info "Page loaded. #{url}"
      self
    end

    def present?
      browser_helper.present? @browser.h5(:text => "Customer Search")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.h5(:text => "Customer Search")
    end

    def customer_search
      #link = Link.new @browser.h5(:text => "Customer Search")
      search = CustomerSearch.new @browser
      5.times do
        @browser.goto "http://qa-clientsite:82/pam/AccountSearch.asp"
        sleep 1
        search.wait_until_present
        return search if search.present?
      end
    end
  end
end