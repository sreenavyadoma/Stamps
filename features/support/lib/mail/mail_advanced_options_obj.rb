module Stamps
  module Mail
    module AdvancedOptions
      class CostCodeComboBox < WebApps::Base
        attr_accessor :param, :textbox, :drop_down

        def initialize(param)
          super
          @index = index
          @textbox = driver.text_field(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
          @drop_down = driver.div(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")
        end

        def select(str)
          drop_down.click
          10.times do
            selection = StampsField.new(
              case selection_type
              when :li
                driver.lis(text: str)[@index]
              when :div
                driver.divs(text: str)[@index]
              else
                raise ArgumentError, "#{str} tag is not implemented."
              end
            )
            break if textbox.text.include?(str)
            drop_down.click unless selection.present?
            selection.click
            log.info "Selected: #{textbox.text} - #{((textbox.text).include? str) ? "done" : "not selected"}"
          end
          expect(textbox.text).to eql(str)
          textbox.text
        end
      end

      module MailDateTextbox
        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
            driver.text_field(css: "[id=sdc-mainpanel-shipdatedatefield-targetEl] input")) : cache[:textbox]
        end
      end

      class MailDatePicker < WebApps::Base
        include MailDateTextbox
        # include ParameterHelper

        def trigger_picker
          (cache[:trigger_picker].nil? || !cache[:trigger_picker].present?) ? cache[:trigger_picker] = StampsField.new(
            driver.div(css: "[id=sdc-mainpanel-shipdatedatefield-targetEl] div[id*=picker]")) : cache[:trigger_picker]
        end

        def mail_dates
          driver.divs(css: "td[aria-label^=#{Date.today.strftime("%B")}],[aria-label^=#{Date.today.next_month.strftime("%B")}]>div[class=x-datepicker-date]")
        end

        def today
          choose_date(driver.span(css: "div[class=x-datepicker-footer]>a>span>span>span[id$=btnInnerEl]"), 0)
        end

        def todays_date_plus(number)
          number = number.to_i
          choose_date(mail_dates[number], number)
        end

        def choose_date(field, day)
          date = TestHelper.valid_ship_date(day)
          field = StampsField.new(field)
          trigger_picker.click
          30.times do
            trigger_picker.click unless field.present?
            sleep(0.05)
            field.click
            break if textbox.text.include?(date)
          end
          trigger_picker.click if field.present?
          expect(textbox.text).to eql(date)
          date
        end
      end

      class MailDate < WebApps::Base
        include MailDateTextbox
        def date_picker
          (cache[:date_picker].nil? || !cache[:date_picker].present?) ? cache[:date_picker] = MailDatePicker.new(param) : cache[:date_picker]
        end
      end
    end
  end
end