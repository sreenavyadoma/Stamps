module Pam
  class ACHCreditConfirmation < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.td(:text => "ACH Credit Confirmation")
    end

    def ok
      profile = CustomerProfile.new @browser
      link = Stamps::Browser::Link.new @browser.a(:css => "a[href^=Profile]")
      5.times do
        link.safe_click
        return profile if profile.present?
      end
    end

  end

  class ACHPurchaseVerification < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? (@browser.input :name => "YES")
    end

    def yes
      confirmation = ACHCreditConfirmation.new @browser
      button = Stamps::Browser::Input.new @browser.input(:name => "YES")
      5.times do
        button.send_keys :enter
        button.safe_click
        return confirmation if confirmation.present?
      end
    end

    def no
      button = Button.new @browser.input(:name => "NO")
      button.click_while_present
    end
  end

  class ACHCredit < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.text_field(:name => "AmountFraction")
    end

    def dollar_amount
      Textbox.new @browser.text_field(:name => "Amount")
    end

    def cents_amount
      Textbox.new @browser.text_field(:name => "AmountFraction")
    end

    def comments
      Textbox.new @browser.text_field(:name => "comments")
    end

    def submit
      purchase_verification = ACHPurchaseVerification.new @browser
      button = Button.new @browser.input(:value => "Submit")
      5.times do
        button.send_keys :enter
        button.safe_click
        return purchase_verification if purchase_verification.present?
      end
    end

  end
end