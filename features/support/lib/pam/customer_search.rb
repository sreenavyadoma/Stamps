module Pam
  class CustomerSearch < Browser::Modal
    def present?
      browser_helper.present? browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
    end

    def wait_until_present
      browser_helper.wait_until_present browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
    end

    def username
      BrowserTextBox.new browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=uname]")
    end

    def first_name
      BrowserTextBox.new browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
    end

    def last_name
      BrowserTextBox.new browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
    end

    def phone
      BrowserTextBox.new browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=phone]")
    end

    def email
      BrowserTextBox.new browser.text_field(:css => "form[name=searchForm]>table>tbody>tr>td>input[name=email]")
    end

    def user_5_2_or_lower
      browser.radio(css: "input[name=v6usr][value='0']").set
      browser.radio(css: "input[name=v6usr][value='0']").set
      browser.radio(css: "input[name=v6usr][value='0']").set
    end

    def search
      button = Stamps::Browser::BrowserElement.new browser.input(:css => "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
      customer_profile = CustomerProfile.new param
      customer_profile_not__found = CustomerProfileNotFound.new param
      15.times do
        button.send_keys :enter
        button.safe_click
        sleep 1
        return customer_profile if customer_profile.present?
        if customer_profile_not__found.present?
          logger.info "PAM:  #{customer_profile_not__found.message}"
          browser.back
        end
      end

      customer_profile if customer_profile.present?
      customer_profile_not__found if customer_profile_not__found.present?
    end
  end
end