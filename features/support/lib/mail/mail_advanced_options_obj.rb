module Stamps
  module Mail
    module AdvancedOptions

      class AdvancedOptionsContainer < Browser::StampsModal
        attr_reader :print_media

        def initialize(param)
          super(param)
          @print_media = param.print_media
        end
      end

      class CostCodeComboBox < Browser::StampsModal
        attr_accessor :param, :text_box, :drop_down

        def initialize(param)
          super(param)
          @index = index
          @text_box = browser.text_field(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
          @drop_down = browser.div(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")
        end

        def selection(str)
          expect([:li, :div]).to include(@selection_type)
          case selection_type
            when :li
              browser.lis(text: str)[@index]
            when :div
              browser.divs(text: str)[@index]
            else
              # do nothing
          end
        end

        def select(str)
          logger.info "Select #{str}"
          drop_down.click
          10.times do
            selection = StampsElement.new(selection(str))
            break if text_box.text.include?(str)
            drop_down.click unless selection.present?
            selection.click
            logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
          end
          expect(text_box.text).to eql(str)
          text_box.text
        end
      end

      module MailDateTextbox
        def text_box
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id=sdc-mainpanel-shipdatedatefield-targetEl]>div>div>div>div>input")) if @text_box.nil?
          @text_box
        end
      end

      class MailDatePicker < Browser::StampsModal
        include MailDateTextbox

        attr_reader :trigger_picker
        def initialize(param)
          super(param)
          @trigger_picker = StampsElement.new(browser.div(css: "div[id=sdc-mainpanel-shipdatedatefield-targetEl]>div>div>div>div[id*=picker]"))
        end

        def mail_dates
          browser.divs(css: "td[aria-label^=#{Date.today.strftime("%B")}],[aria-label^=#{Date.today.next_month.strftime("%B")}]>div[class=x-datepicker-date]")
        end

        def today
          choose_date(browser.span(css: "div[class=x-datepicker-footer]>a>span>span>span[id$=btnInnerEl]"), 0)
        end

        def todays_date_plus(number)
          number = number.to_i
          choose_date(mail_dates[number], number)
        end

        def choose_date(element, day)
          date = valid_ship_date(day)
          element = StampsElement.new(element)
          trigger_picker.click
          30.times do
            trigger_picker.click unless element.present?
            sleep(0.05)
            element.click
            break if text_box.text.include?(date)
          end
          trigger_picker.click
          sleep(0.8)
          trigger_picker.click
          expect(text_box.text).to eql(date)
          date
        end
      end

      class MailDate < Browser::StampsModal
        include MailDateTextbox
        attr_accessor :date_picker

        def initialize(param)
          super(param)
          @date_picker = MailDatePicker.new(param)
        end
      end

    end
  end
end