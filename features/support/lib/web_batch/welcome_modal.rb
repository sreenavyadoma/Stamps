module Batch
  class WelcomeModal < BrowserObject
    private
    def okay_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.field_present? okay_button
    end

    def wait_until_present
      begin
        okay_button.wait_until_present
      rescue
        #ignore
      end
    end

    def OK
      5.times{
        browser_helper.click okay_button, 'OK'
        break unless browser_helper.field_present? okay_button
      }
    end
  end
end