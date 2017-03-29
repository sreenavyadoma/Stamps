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
            begin
              break if (text_box.text).include?(str)
              drop_down.click unless selection(browser.lis(text: str)).present?
              element_helper.click(selection(str))
              logger.info "Selected: #{text_box.text} - #{((text_box.text).include? str)?"done": "not selected"}"
            rescue
              #ignore
            end
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
        def initialize(param)
          super(param)
          @trigger_picker = StampsElement.new(browser.div(css: "div[id=sdc-mainpanel-shipdatedatefield-targetEl]>div>div>div>div[id*=picker]"))
        end

        def choose_date(element, day)
          date = valid_ship_date(day)
          @trigger_picker.click
          20.times do
            @trigger_picker.click unless element.present?
            element_helper.click(element)
            break if text_box.text.include?(date)
          end
          expect(text_box.text).to eql(date)
        end

        def mail_dates
          browser.divs(css: "td[aria-label^=#{Date.today.strftime("%B")}],[aria-label^=#{Date.today.next_month.strftime("%B")}]>div[class=x-datepicker-date]")
        end

        def today
          choose_date(browser.span(css: "div[class=x-datepicker-footer]>a>span>span>span[id$=btnInnerEl]"), 0)
        end

        def todays_date
          choose_date(mail_dates[0], 0)
        end

        def todays_date_plus_1
          choose_date(mail_dates[1], 1)
        end

        def todays_date_plus_2
          choose_date(mail_dates[2], 2)
        end

        def todays_date_plus_3
          choose_date(mail_dates[3], 3)
        end

        def todays_date_plus_4
          choose_date(mail_dates[4], 4)
        end

        def todays_date_plus_5
          choose_date(mail_dates[5], 5)
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