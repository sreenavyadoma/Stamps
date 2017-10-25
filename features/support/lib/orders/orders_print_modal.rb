# encoding: utf-8
module Stamps
  module Orders
    class OrdersPrintMediaDropList < Browser::StampsModal
      def dropdown
        @dropdown = StampsElement.new( browser.div(css: "div[id^=printmediadroplist][id$=trigger-picker]")) if @dropdown.nil? || !@dropdown.present?
        @dropdown
      end

      def textbox
        @textbox = StampsTextBox.new(browser.text_field(css: "input[name^=printmediadroplist]")) if @textbox.nil? || !@textbox.present?
        @textbox
      end

      def present?
        textbox.present?
      end

      def wait_until_present(*args)
        textbox.wait_until_present(*args)
      end

      def selection_element(media)
        case(media)
          when /Paper/ # Shipping Label: 8 ½" x 11" Paper
            return StampsElement.new(browser.li text: /Paper/)
          when /SDC-1200/ # Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
            return StampsElement.new(browser.li text: /SDC-1200/)
          when /Shipping Label - 5 / # Shipping Label: 5 ½" x 8 ½"
            return StampsElement.new(browser.li text: /Shipping Label - 5 /)
          when /Roll - 418x614/ # Roll 418x614
            return StampsElement.new(browser.li text: /Roll - 4 ⅛/)
          when /Roll - 4 / # Roll - 4" x 6" Shipping Label
            return StampsElement.new(browser.li text: /Roll - 4 /)
          else
            expect("Don't know what to do with #{media}.").to eql "Invalid Print Media Selection."
        end
      end

      def select(media)
        begin
          selection = selection_element(media)
          10.times do
            if media == "Roll - 418x614"
              break if textbox.text.include? "Roll - 4 ⅛"
            else
              break if textbox.text.include? media
            end
            dropdown.click unless selection.present?
            selection.click
          end
        end unless textbox.text.include? media
      end

      def tooltip(media)
        dropdown = self.dropdown
        media_selection = selection media

        10.times do
          begin
            dropdown.click unless media_selection.present?
            if media_selection.present?
              tooltip = media_selection.attribute_value "data-qtip"
              logger.info "Print Media Tooltip for \"#{media}\" is \n#{tooltip}\n"
              if tooltip.include? "<strong>"
                dropdown.click if media_selection.present?
                return tooltip
              end
            end
          rescue
            return ""
          end
        end
      end
    end

    class OrdersPrinter < Browser::StampsModal
      def dropdown
        (@dropdown.nil? || !@dropdown.present?)?@dropdown = StampsElement.new(browser.div(id: "sdc-printpostagewindow-printerdroplist-trigger-picker")):@dropdown
      end

      def textbox
        (@textbox.nil? || !@textbox.present?)?@textbox = StampsTextBox.new(browser.text_field(id: "sdc-printpostagewindow-printerdroplist-inputEl")):@textbox
      end

      def select(selection)
        selection_label = StampsElement.new(browser.li(text: /#{selection}/))
        15.times do
          return textbox.text if textbox.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
          dropdown.click unless selection_label.present?
          selection_label.click
        end
        nil
      end
    end

    class OrdersPaperTray < Browser::StampsModal
      def dropdown
        (@dropdown.nil? || !@dropdown.present?)?@dropdown = StampsElement.new(browser.div(css: "div[id^=printwindow-][id$=-body]>div>div>div[id^=combo]>div>div>div[id*=picker]")):@dropdown
      end

      def textbox
        (@textbox.nil? || !@textbox.present?)?@textbox = StampsTextBox.new(browser.text_field(name: "paperTrays")):@textbox
      end

      def select(selection)
        begin
          selection_label = StampsElement.new(browser.li(text: selection))
          5.times do
            dropdown.click unless selection_label.present?
            selection_label.click
            break if textbox.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
          end
        end unless textbox.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
      end
    end

    class OrdersStartingLabel < Browser::StampsModal
      def left_label
        (@left_label.nil? || !@left_label.present?)?@left_label = StampsElement.new(browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(1)")):@left_label
      end

      def right_label
        (@right_label.nil? || !@right_label.present?)?@right_label = StampsElement.new(browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(2)")):@right_label
      end

      def textbox
        (@textbox.nil? || !@textbox.present?)?@textbox = StampsTextBox.new(browser.text_field(name: "paperTrays")):@textbox
      end

      def select_left_label
        10.times do
          begin
            left_label.click
            break if (left_label.attribute_value "class").include? 'selected'
          rescue
            false
          end
        end
        (left_label.attribute_value "class").include? 'selected'
      end

      def select_right_label
        10.times do
          begin
            right_label.click
            break if (right_label.attribute_value "class").include? 'selected'
          rescue
            false
          end
        end
        (right_label.attribute_value "class").include? 'selected'
      end

      def left_selected?
        label_selected?(left_label)
      end

      def right_selected?
        label_selected?(right_label)
      end

      def label_selected?(div)
        8.times do
          selected = (div.attribute_value 'class').include? 'selected'
          logger.info "Label selected?  #{(selected)? 'Yes':'No'}"
          break if selected
        end
        (div.attribute_value 'class').include? 'selected'
      end

      def default_selected?
        label_selected?(left_label)
      end
    end

    class OrdersPrintOptions < Browser::StampsModal
      def hide_postage_value
        checkbox_field = browser.span id: "sdc-printpostagewindow-hidepostagecheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckBox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end

      def email_tracking
        checkbox_field = browser.span id: "sdc-printpostagewindow-emailtrackingcheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckBox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end

      def print_reference_no
        checkbox_field = browser.span id: "sdc-printpostagewindow-printreferencenumbercheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckBox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end
    end

    class LabelUnavailable < Browser::StampsModal
      def present?
        browser.div(text: "Label Unavailable").present?
      end

      def close
        button = StampsElement.new browser.img(css: "img[class*='x-tool-img x-tool-close']")
        10.times do
          button.click
          break unless button.present?
        end
      end

      def ok
        button = StampsElement.new browser.span(text: "Ok")
        10.times do
          button.click
          break unless button.present?
        end
      end

      def message
        StampsElement.new(browser.divs(css: "div[id^=dialoguemodal][id$=innerCt]").last).text
      end
    end

    class OrdersUspsTerms < Browser::StampsModal
      attr_reader :agree_to_terms, :cancel

      def initialize(param)
        super
        @agree_to_terms = StampsElement.new browser.span text: "I Agree"
        @cancel = StampsElement.new browser.span text: "Cancel"
      end

      def present?
        (StampsElement.new browser.div text: "USPS Terms").present?
      end

      def agree_and_dont_show_again
        dont_show_this_again true
        agree_to_terms.click_while_present
      end

      def dont_show_this_again dont_show
        checkbox_field = (browser.inputs css: "input[id^=checkbox-][id$=-inputEl]").last
        expect("USPS Terms - Don't show this again checkbox is not present").to eql "" unless checkbox_field.present?

        verify_field = browser.div css: "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
        expect("USPS Terms - Don't show this again checkbox is not present").to eql "" unless verify_field.present?

        attribute = "class"
        attrib_value_check = "checked"

        dont_show_checkbox = Stamps::Browser::StampsCheckBox.new checkbox_field, verify_field, attribute, attrib_value_check

        if dont_show
          dont_show_checkbox.check
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        else
          dont_show_checkbox.uncheck
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        end
      end
    end

    #todo-Rob clean up orders date picker
    class OrdersDatePicker < Browser::StampsModal

      def todays_date_div
        browser.div css: "div[title='Today']"
      end

      def date_field(day)
        browser.td(css: "td[aria-label='#{test_helper.now_plus_month_dd day.to_i}']")
      end

      def date(day)
        StampsElement.new(date_field(day)).click
      end

      def present?
        date_picker_button.present?
      end

      def now_month_dd
        picker = StampsElement.new browser.div(css: "div[id^=datefield][id$=trigger-picker]")
        today = StampsElement.new browser.span css: "a[title*=Spacebar]>span>span>span[data-ref=btnInnerEl]"
        10.times {
          picker.click unless today.present?
          today.click
          sleep(0.35)
          return test_helper.now_plus_mon_dd 0 #get ship date text box value and return it in correct format or not...
        }
        expect("Unable to select today's date from date picker object in Print Modal.").to eql ""
      end

      def todays_date
        picker = StampsElement.new browser.div(css: "div[id^=datefield][id$=trigger-picker]")
        today = StampsElement.new StampsElement.new browser.div css: "div[title=Today]"
        10.times {
          picker.click unless today.present?
          today.click
          sleep(0.35)
          return test_helper.now_plus_mon_dd 0
        }
        expect("Unable to select today's date from date picker object in Print Modal.").to eql ""
      end

      def today_button

      end

      def today
        today_plus 0
      end

      def today_plus(day)
        day = day.to_i
        date_picker_header = StampsElement.new browser.div class: "x-datepicker-header"
        picker_button = StampsElement.new browser.div(css: "div[id^=datefield][id$=trigger-picker]")
        ship_date_textbox = StampsTextBox.new browser.text_field(css: "input[id^=datefield][id$=inputEl]")

        ship_date_str = test_helper.now_plus_month_dd day
        ship_date_mmddyy = test_helper.now_plus_mm_dd_yy day
        date_field = StampsElement.new browser.div css: "td[aria-label='#{ship_date_str}']>div"

        10.times{
          picker_button.click unless date_picker_header.present?
          sleep(0.35)

          if date_field.element.present?
            break
          else
            day += 1
            ship_date_str = test_helper.now_plus_month_dd day
            ship_date_mmddyy = test_helper.now_plus_mm_dd_yy day
            date_field = StampsElement.new browser.div css: "td[aria-label='#{ship_date_str}']>div"
          end
        }

        10.times {
          picker_button.click unless date_field.present?
          date_field.click
          sleep(0.35)
          return ship_date_textbox.text if ship_date_textbox.text == ship_date_mmddyy
        }
      end
    end

    class OrdersShipDate < Browser::StampsModal
      def cache
        @cache ||= {}
      end

      def present?
        textbox.present?
      end

      def wait_until_present(*args)
        textbox.wait_until_present(*args)
      end

      def date_picker
        (cache[:date_picker].nil? || !cache[:date_picker].present?)?cache[:date_picker] = OrdersDatePicker.new(param):cache[:date_picker]
      end

      def textbox
        (cache[:textbox].nil? || !cache[:textbox].present?)?cache[:textbox] = StampsTextbox.new(browser.text_field(css: "[id=sdc-printpostagewindow-shipdate-innerCt] input[id^=datefield]")):cache[:textbox]
      end
    end

    #todo-Rob is this needed?
    class OrdersPrintModalFields < Browser::StampsModal

    end

    #todo-Rob is this needed?
    class OrdersPrintModal < Browser::StampsModal

    end

    module OrdersUpperPrintModal
      def present?
        printing_on.present?
      end

      def wait_until_present(*args)
        print_button.wait_until_present(*args)
      end

      def printing_on
        (cache[:printing_on].nil? || !cache[:printing_on].present?)?cache[:printing_on] = OrdersPrintMediaDropList.new(param):cache[:printing_on]
      end

      def printer
        (cache[:printer].nil? || !cache[:printer].present?)?cache[:printer] = OrdersPrinter.new(param):cache[:printer]
      end

      def paper_tray
        (cache[:paper_tray].nil? || !cache[:paper_tray].present?)?cache[:paper_tray] = OrdersPaperTray.new(param):cache[:paper_tray]
      end

      def ship_date
        (cache[:ship_date].nil? || !cache[:ship_date].present?)?cache[:ship_date] = OrdersShipDate.new(param):cache[:ship_date]
      end

      private
      def cache
        @cache ||= {}
      end
    end

    module OrdersPrintModalFooter
      def print_expecting_rating_error
        postage
        RatingError.new(param).wait_until_present
      end

      def print_sample
        begin
          print_sample_button.click
          printing_error_check
        rescue
          #ignroe
        end
        self
      end

      def total_cost
        test_helper.dollar_amount_str(StampsElement.new(browser.label(text: 'Total Cost:').parent.labels.last).text).to_f.round(2)
      end

      def print
        15.times do
          begin
            print_button.click
            sleep(0.25)
            #printing_error = printing_error_check
            #return printing_error if printing_error.length > 1
            return true unless print_button.present?
          rescue
            #ignore
          end
        end
        false
      end

      def print_sample_button
        cache[:print_sample_button] = StampsElement.new(browser.span(id: 'sdc-printwin-printsamplebtn-btnInnerEl')) if cache[:print_sample_button].nil? || !cache[:print_sample_button].present?
        cache[:print_sample_button]
      end

      def print_button
        cache[:print_button] = StampsElement.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl')) if cache[:print_button].nil? || !cache[:print_button].present?
        cache[:print_button]
      end

      private
      def cache
        @cache ||= {}
      end
    end

    module OrdersPrintModalTitle
      def window_title
        @window_title = StampsElement.new(browser.label(css: '[id^=printwindow] [class*=x-title-text-default]')) if@window_title.nil? || !@window_title.present?
        @window_title
      end

      def label_count
        window_title.text.gsub(/[^\d]/, '').to_i
      end

      def x_image
        @x_image = StampsElement.new(browser.img(css: "[id^=printwindow-] [class*=close]")) if @x_image.nil? || !@x_image.present?
        @x_image
      end

      def close
        x_image.click_while_present
      end
    end

    class OrdersPrintModal < Browser::StampsModal
      include OrdersPrintModalTitle
      include OrdersUpperPrintModal
      include OrdersPrintModalFooter

      def starting_label
        @starting_label = OrdersStartingLabel.new(param) if @starting_label.nil? || !@starting_label.present?
        @starting_label
      end

      def print_options
        @print_options = OrdersPrintOptions.new(param) if @print_options.nil? || !@print_options.present?
        @print_options
      end
    end

    class RePrintModal < OrdersPrintModal
      def present?
        browser.div(text: "Reprint Label").present?
      end

      def reprint
        button = StampsElement.new browser.span(id: "sdc-printwin-printbtn-btnInnerEl")
        10.times do
          button.click
          button.click
          break unless present?
        end
      end
    end
  end
end
