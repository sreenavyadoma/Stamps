module Batch
  class PrintWindowDatePicker < Stamps::BrowserObject
    private
    def today_span
      span = @browser.span :css => "div[id^=datepicker][data-ref='footerEl']>a>span>span>span[class*=inner]"
      log "Today span present? #{browser_helper.present? span}"
      span
    end

    def today_date_div
      div = @browser.div :css => "div[title='Today']"
      log "Today div present? #{browser_helper.present? div}"
      div
    end

    public
    def present?
      browser_helper.present? today_date_div
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