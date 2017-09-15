module Stamps
  module Mail
    module AdvancedOptions

      class AdvancedOptionsContainer < Browser::StampsModal
        attr_reader :print_media

        def initialize(param)
          super
          @print_media = param.print_media
        end
      end

      class CostCodeComboBox < Browser::StampsModal
        attr_accessor :param, :textbox, :dropdown

        def initialize(param)
          super
          @index = index
          @textbox = browser.text_field(css: "input[id^=costcodesdroplist-][id$=-inputEl]")
          @dropdown = browser.div(css: "div[id^=costcodesdroplist-][id$=costcodesdroplist-1226-trigger-picker]")
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
          dropdown.click
          10.times do
            selection = StampsElement.new(selection(str))
            break if textbox.text.include?(str)
            dropdown.click unless selection.present?
            selection.click
            logger.info "Selected: #{textbox.text} - #{((textbox.text).include? str)?"done": "not selected"}"
          end
          expect(textbox.text).to eql(str)
          textbox.text
        end
      end

      module MailDateTextbox
        def textbox
          @textbox = StampsTextBox.new(browser.text_field(css: "div[id=sdc-mainpanel-shipdatedatefield-targetEl]>div>div>div>div>input")) if @textbox.nil?
          @textbox
        end
      end

      class MailDatePicker < Browser::StampsModal
        include MailDateTextbox
        include ParameterHelper

        attr_reader :trigger_picker
        def initialize(param)
          super
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
            break if textbox.text.include?(date)
          end
          trigger_picker.click if element.present?
          expect(textbox.text).to eql(date)
          date
        end
      end

      class MailDate < Browser::StampsModal
        include MailDateTextbox
        attr_accessor :date_picker

        def initialize(param)
          super
          @date_picker = MailDatePicker.new(param)
        end
      end

    end
  end
end