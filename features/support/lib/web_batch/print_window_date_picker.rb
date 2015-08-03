module Batch
  class PrintWindowDatePicker < Stamps::BrowserObject
    private
    def today_span
      @browser.span :css => "div[class=x-datepicker-footer]>a>span>span>span:nth-child(2)"
    end

    public
    def present?
      browser_helper.present? today_span
    end

    def today
      5.times{
        begin
          browser_helper.click today_span, "today"
          break unless browser_helper.present? today_span
        rescue
          #ignroe
        end
      }
    end

  end
end