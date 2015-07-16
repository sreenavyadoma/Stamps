module Batch

  #
  # Navigation bar containing Sign-in, etc
  #
  class NavigationBar < BrowserObject
    private

    def balance_label
      @browser.span(:id => 'postageBalanceAmt')
    end

    def username_field
      @browser.span(:id => 'userNameText')
    end

    def sign_out_link
      @browser.link :id => "signOutLink"
    end

    public
    def buy_more
      BuyPostage.new(@browser)
    end

    def balance
      balance = balance_label.text
      log balance
      new_balance = test_helper.strip(test_helper.strip(balance, "$", ""), ",", "")
      log new_balance
      balance_f = new_balance.to_f
      log balance_f
      balance_f
    end

    def sign_out
      @browser.window.move_to 0, 0
      @browser.window.resize_to 1500, 850
      @browser.window.move_to 1550, 500
      5.times { #todo must hover over signout link
        begin
          username_field.hover
          browser_helper.click username_field, "userNameText" unless sign_out_link.present?
          sleep(1)
          sign_out_link.hover
          browser_helper.click sign_out_link, "signOutLink"
          username_field.wait_while_present
          break browser_helper.field_present?  sign_in_button
        rescue
          #ignore
        end
      }
      @browser.window.move_to 0, 0
    end

    def username
      username_field.when_present.text
    end

    def wait_until_present(timeout)
      username_field.wait_until_present(timeout)
    end

    def present?
      browser_helper.field_present?  username_field
    end

  end
end