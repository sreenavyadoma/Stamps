module Batch

  #
  # Navigation bar containing Sign-in, etc
  #
  class NavBar < BatchObject
    def login_div
      div = @browser.div :id => "loginDiv"
      begin
        div.wait_until_present 30
      rescue
        #ignore
      end
      log.info "Signout #{(div.present?)? 'Successful': 'Failed'}"
      div
    end

    def balance_label
      @browser.span :id => 'postageBalanceAmt'
    end

    def buy_more_link
      @browser.a(:id => 'buyMorePostageLnk')
    end

    def username
      Label.new @browser.span Locators::NavBar.username
    end

    def orders
      Link.new @browser.link :css => "a[rel=WebBatch]"
    end

    def select_buy_more
      @browser.window.move_to 0, 0
      @browser.window.resize_to 1500, 850
      @browser.window.move_to 800, 500

      balance_label.focus
      browser_helper.click balance_label, "Balance"
      balance_label.hover
      buy_more_link.focus
      buy_more_link.wait_until_present(10)
      log.info "Clicking Buy More link"
      browser_helper.click buy_more_link, "BuyMoreLink"

      @browser.window.move_to 0, 0

    end

    def buy_more
      BuyPostage.new(@browser)
    end

    def wait_until_balance_updated old_balance
      balance_field = Label.new balance_label
      10.times{
        break unless balance_field.text.include? old_balance.to_s
        sleep(1)
      }
      self
    end

    def balance
      balance_field = Label.new balance_label
      10.times{
        amount = balance_field.text
        amount_stripped_dollar = amount.gsub("$","")
        amount_stripped_all = amount_stripped_dollar.gsub(",","")
        return amount_stripped_all if amount_stripped_all.length > 0
      }
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
      log.info "#{ENV["SIGNED_IN_USER"]}#{(signed_in_username.present?)?" - sign-out failed":" was signed out.  Goodbye."}"
    end

    def username
      username.field.when_present.text
    end

    def wait_until_present *args
      case args.length
        when 0
          username.wait_until_present
        when 1
          username.wait_until_present args[0].to_i
        else
          raise "Wrong number of arguments."
      end
    end

    def present?
      username.present?
    end

  end
end