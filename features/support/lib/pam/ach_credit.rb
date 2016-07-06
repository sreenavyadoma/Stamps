module Pam
  class ACHCreditConfirmation < Browser::Modal
    def present?
      browser.td(text: "ACH Credit Confirmation").present?
    end

    def ok
      profile = CustomerProfile.new param
      link = Stamps::Browser::BrowserElement.new browser.a(css: "a[href^=Profile]")
      5.times do
        link.safe_click
        return profile if profile.present?
      end
    end

  end

  class ACHPurchaseVerification < Browser::Modal
    def present?
      (browser.input name: "YES").present?
    end

    def yes
      confirmation = ACHCreditConfirmation.new param
      button = Stamps::Browser::BrowserElement.new browser.input(name: "YES")
      5.times do
        button.send_keys :enter
        button.safe_click
        return confirmation if confirmation.present?
      end
    end

    def no
      button = BrowserElement.new browser.input(name: "NO")
      button.click_while_present
    end
  end

  class ACHCredit < Browser::Modal
    def present?
      browser.text_field(name: "AmountFraction").present?
    end

    def dollar_amount
      BrowserTextBox.new browser.text_field(name: "Amount")
    end

    def cents_amount
      BrowserTextBox.new browser.text_field(name: "AmountFraction")
    end

    def comments
      BrowserTextBox.new browser.text_field(name: "comments")
    end

    def submit
      purchase_verification = ACHPurchaseVerification.new param
      button = BrowserElement.new browser.input(:value => "Submit")
      5.times do
        button.send_keys :enter
        button.safe_click
        return purchase_verification if purchase_verification.present?
      end
    end

  end
end