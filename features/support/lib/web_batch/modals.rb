module Batch
  class WelcomeModal < BatchObject
    private
    def okay_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.present? okay_button
    end

    def wait_until_present
      begin
        okay_button.wait_until_present
      rescue
        #ignore
      end
    end

    def ok
      5.times{
        browser_helper.click okay_button, 'OK'
        break unless browser_helper.present? okay_button
      }
    end
  end

  class UspsTerms < BatchObject
    def present?
      (Label.new @browser.div :text => "USPS Terms").present?
    end

    def dont_show_this_again dont_show

      chkbox_inputs = @browser.inputs :css => "input[id^=checkbox-][id$=-inputEl]"
      checkbox_field = chkbox_inputs.last
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? checkbox_field

      verify_field = @browser.div :css => "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? verify_field

      attribute = "class"
      attrib_value_check = "checked"

      dont_show_checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, attribute, attrib_value_check

      if dont_show
        dont_show_checkbox.check
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      else
        dont_show_checkbox.uncheck
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      end

    end

    def i_agree
      Button.new @browser.span :text => "I Agree"
    end

    def cancel
      Button.new @browser.span :text => "Cancel"
    end
  end

end