module Batch
  class PrintWindowDatePicker < Stamps::BrowserObject
    private
    def today_span
      span = @browser.span :css => "div[id^=datepicker][data-ref='footerEl']>a>span>span>span[class*=inner]"
      log "Today span present? #{browser_helper.present? span}"
      span
    end

    def todays_date_div
      div = @browser.div :css => "div[title='Today']"
      log "Today div present? #{browser_helper.present? div}"
      div
    end

    def date_td day
      css = "td[aria-label='#{test_helper.date_picker_calendar_date day.to_i}']"
      td = @browser.td :css => css
      present = browser_helper.present? td
      td
    end

    public

    def date day
      date = date_td day
      browser_helper.click date
    end

    def present?
      browser_helper.present? todays_date_div
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