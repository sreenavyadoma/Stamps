module Batch
  class OrderErrors < OrderErrorsBase
    private
    def continue_button
      @browser.span :text => "Continue"
    end

    def cancel_button
      @browser.span :text => "Cancel"
    end
    public
    def continue
      5.times{
        begin
          browser_helper.click continue_button, "OK"
          break unless browser_helper.present? continue_button
        rescue
          #ignore
        end
      }
      PrintWindow.new(@browser)
    end

  end
end