module Print
  class ForgotUsernameModal < Print::Postage::PrintObject
    def window_x_button
      StampsButton.new (@browser.imgs :css => "img[class*='x-tool-close']")[0]
    end

    def close_window
      browser_helper.click window_x_button, 'close_window'
    end

    def x_button_present?
      browser_helper.present? window_x_button
    end

    def wait_until_present
      begin
        window_x_button.wait_until_present
      rescue
        #ignore
      end
    end

    def window_title
      @browser.span :text => "Forgot Username"
    end

    def present?
      browser_helper.present? window_title
    end

    def email
      StampsTextbox.new (@browser.inputs :css => "input[class*='x-form-field x-form-text']").last
    end

    def continue
      button = StampsButton.new (@browser.as :css => "a[class*=app-modal-button-primary]").last
      button.click
      sleep(2)
    end

    def ok
      button = StampsButton.new @browser.span :css => "span[id*=sdc-undefinedwindow-okbtn-btnIconEl]"
      button.click
      sleep(2)

    end

  end

end