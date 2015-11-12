module Batch

  #
  # Navigation bar containing Sign-in, etc
  #
  class Navigation < BatchObject
    private

    def login_div
      div = @browser.div :id => "loginDiv"
      begin
        div.wait_until_present 30
      rescue
        #ignore
      end
      log.info "Signout #{(div.present?)? 'Successful': 'Failed'}" if Stamps::Test.verbose
      div
    end

    def balance_label
      @browser.span(:id => 'postageBalanceAmt')
    end


    def buy_more_link
      @browser.a(:id => 'buyMorePostageLnk')
    end

    def username_field
      @browser.span :id => 'userNameText'
    end

    def orders_link

    end

    public

    def orders
      Link.new @browser.link :css => "a[rel=WebBatch]"
    end

    def select_buy_more

      @browser.window.move_to 0, 0
      @browser.window.resize_to 1500, 850
      @browser.window.move_to 3000, 500

      balance_label.focus
      browser_helper.click balance_label, "Balance"
      balance_label.hover
      buy_more_link.focus
      buy_more_link.wait_until_present(10)
      log.info "Clicking Buy More link" if Stamps::Test.verbose
      browser_helper.click buy_more_link, "BuyMoreLink"


      #balance_label.wait_while_present
      @browser.window.move_to 0, 0

    end

    def buy_more
      BuyPostage.new(@browser)
    end

    def wait_until_balance_updated old_balance
      10.times{
        break unless balance_str.include? old_balance.to_s
        sleep(1)
      }
      self
    end

    def balance_str
      balance = "0"
      begin
        balance = browser_helper.text balance_label, 'balance'
      rescue
        #ignore
      end
      test_helper.strip(test_helper.strip(balance, "$", ""), ",", "")
    end

    def balance
      browser_helper.wait_until_present balance_label
      5.times{
        amount = balance_str.to_f
        return amount if amount > 0
      }

    end

    def is_signed_in?
      Label.new(@browser.span :id => 'userNameText').present?
    end

    def sign_out
      sign_out_link = Link.new @browser.link :id => "signOutLink"
      signed_in_username = Label.new @browser.span :id => 'userNameText'
      20.times {
        begin
          signed_in_username.safe_click unless sign_out_link.present?
          sign_out_link.safe_click
          sign_out_link.safe_click
          signed_in_username.safe_click unless sign_out_link.present?
          sign_out_link.safe_click
          sign_out_link.safe_click
          sleep 2
          break unless signed_in_username.present?
        rescue
          #ignore
        end
      }
      log.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?)?" - sign-out failed":" was signed out.  Goodbye."}" if Stamps::Test.verbose
    end

    def username
      username_field.when_present.text
    end

    def wait_until_present *args
      case args.length
        when 0
          username_field.wait_until_present
        when 1
          username_field.wait_until_present args[0].to_i
      end
    end

    def present?
      browser_helper.present?  username_field
    end

  end
end