# encoding: utf-8
module Stamps
  module Orders
    class PrintingOn < Browser::StampsBrowserElement
      attr_reader :drop_down, :text_box

      def initialize(param)
        super(param)
        @drop_down = StampsElement.new browser.div css: "div[id^=printmediadroplist][id$=trigger-picker]"
        @text_box = StampsTextbox.new browser.text_field css: "input[name^=printmediadroplist]"
      end

      def selection media
        case media
          # Shipping Label: 8 ½" x 11" Paper
          when /Paper/
            return StampsElement.new(browser.li text: /Paper/)

          # Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
          when /SDC-1200/
            return StampsElement.new(browser.li text: /SDC-1200/)

          # Shipping Label: 5 ½" x 8 ½"
          when /Shipping Label - 5 /
            return StampsElement.new(browser.li text: /Shipping Label - 5 /)

          # Roll - 4 ⅛" x 6 ¼" Shipping Label
          when /Roll - 4/
            return StampsElement.new(browser.li text: /Roll - 4/)

          # Roll - 4" x 6" Shipping Label
          when /Roll - 4 /
            return StampsElement.new(browser.li text: /Roll - 4 /)
          else
            expect("Don't know what to do with #{media}.").to eql "Invalid Print Media Selection."
        end
      end

      def label
        StampsElement.new browser.span(css: "div[id^=printwindow-][id$=-targetEl]>div>label[id^=printmediadroplist-][id$=-labelEl]>span")
      end

      def select media
        begin
          lov_item = selection(media)
          10.times do
            break if text_box.text.include? media
            drop_down.safe_click unless lov_item.present?
            lov_item.safe_click
          end
        end unless text_box.text.include? media
      end

      def tooltip media
        drop_down = self.drop_down
        media_selection = selection media

        10.times do
          begin
            drop_down.safe_click unless media_selection.present?
            if media_selection.present?
              tooltip = media_selection.attribute_value "data-qtip"
              logger.info "Print Media Tooltip for \"#{media}\" is \n#{tooltip}\n"
              if tooltip.include? "<strong>"
                drop_down.safe_click if media_selection.present?
                return tooltip
              end
            end
          rescue
            return ""
          end
        end
      end
    end

    class Printer < Browser::StampsBrowserElement
      attr_reader :drop_down, :text_box

      def initialize(param)
        super(param)
        @drop_down = StampsElement.new browser.div id: "sdc-printpostagewindow-printerdroplist-trigger-picker"
        @text_box = StampsTextbox.new browser.text_field id: "sdc-printpostagewindow-printerdroplist-inputEl"
      end

      def select(selection)
        begin
          selection_label = StampsElement.new browser.li(text: selection)

          15.times do
            return text_box.text  if text_box.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
          end
          expect("Unable to select Printer #{selection}.  Check and make sure the printer exist in this PC.").to eql ""
        end unless text_box.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
      end
    end

    class PaperTray < Browser::StampsBrowserElement
      attr_reader :drop_down, :text_box

      def initialize(param)
        super(param)
        @drop_down = StampsElement.new browser.div(css: "div[id^=printwindow-][id$=-body]>div>div>div[id^=combo]>div>div>div[id*=picker]")
        @text_box = StampsTextbox.new browser.text_field(name: "paperTrays")
      end

      def select(selection)
        begin
          selection_label = StampsElement.new browser.li(text: selection)
          5.times{
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_box.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
          }
        end unless text_box.text.include? selection[0..((selection.size>5)?selection.size-4:selection.size)]
      end
    end

    class StartingLabel < Browser::StampsBrowserElement
      attr_reader :left_label, :right_label

      def initialize(param)
        super(param)
        @left_label = StampsElement.new browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(1)")
        @right_label = StampsElement.new browser.div(css: "div[class*=label-chooser-container-border]:nth-child(2)>div>div>div:nth-child(2)")
      end

      def left
        10.times{
          begin
            left_label.safe_click
            break if (left_label.attribute_value "class").include? 'selected'
          rescue
            false
          end
        }
        (left_label.attribute_value "class").include? 'selected'
      end

      def right
        10.times{
          begin
            right_label.safe_click
            break if (right_label.attribute_value "class").include? 'selected'
          rescue
            false
          end
        }
        (right_label.attribute_value "class").include? 'selected'
      end

      def left_selected?
        label_selected? left_label
      end

      def right_selected?
        label_selected? right_label
      end

      def label_selected? div
        8.times{
          selected = (div.attribute_value 'class').include? 'selected'
          logger.info "Label selected?  #{(selected)? 'Yes':'No'}"
          break if selected
        }
        (div.attribute_value 'class').include? 'selected'
      end

      def default_selected?
        label_selected? left_label
      end
    end

    class PrintOptions < Browser::StampsBrowserElement
      def hide_postage_value
        checkbox_field = browser.span id: "sdc-printpostagewindow-hidepostagecheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end

      def email_tracking
        checkbox_field = browser.span id: "sdc-printpostagewindow-emailtrackingcheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end

      def print_reference_no
        checkbox_field = browser.span id: "sdc-printpostagewindow-printreferencenumbercheckbox-displayEl"
        verify_field = checkbox_field.parent.parent.parent
        attribute = "class"
        verify_field_attrib = "checked"
        StampsCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
      end
    end

    class LabelUnavailable < Browser::StampsBrowserElement
      def present?
        browser.div(text: "Label Unavailable").present?
      end

      def close
        button = StampsElement.new browser.img(css: "img[class*='x-tool-img x-tool-close']")
        10.times do
          button.safe_click
          break unless button.present?
        end
      end

      def ok
        button = StampsElement.new browser.span(text: "Ok")
        10.times do
          button.safe_click
          break unless button.present?
        end
      end

      def message
        element_helper.text (browser.divs(css: "div[id^=dialoguemodal][id$=innerCt]").last)
      end
    end

    class UspsTerms < Browser::StampsBrowserElement
      attr_reader :i_agree, :cancel

      def initialize(param)
        super(param)
        @i_agree = StampsElement.new browser.span text: "I Agree"
        @cancel = StampsElement.new browser.span text: "Cancel"
      end

      def present?
        (StampsElement.new browser.div text: "USPS Terms").present?
      end

      def agree_and_dont_show_again
        dont_show_this_again true
        i_agree.click_while_present
      end

      def dont_show_this_again dont_show
        checkbox_field = (browser.inputs css: "input[id^=checkbox-][id$=-inputEl]").last
        expect("USPS Terms - Don't show this again checkbox is not present").to eql "" unless checkbox_field.present?

        verify_field = browser.div css: "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
        expect("USPS Terms - Don't show this again checkbox is not present").to eql "" unless verify_field.present?

        attribute = "class"
        attrib_value_check = "checked"

        dont_show_checkbox = Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, attribute, attrib_value_check

        if dont_show
          dont_show_checkbox.check
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        else
          dont_show_checkbox.uncheck
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        end
      end
    end

    class DatePicker < Browser::StampsBrowserElement

      def todays_date_div
        browser.div css: "div[title='Today']"
      end

      def date_field day
        browser.td css: "td[aria-label='#{ParameterHelper.now_plus_month_dd day.to_i}']"
      end

      def date day
        date = date_field day
        element_helper.safe_click date
      end

      def present?
        date_picker_button.present?
      end

      def now_month_dd
        picker = StampsElement.new browser.div(css: "div[id^=datefield][id$=trigger-picker]")
        today = StampsElement.new browser.span css: "a[title*=Spacebar]>span>span>span[data-ref=btnInnerEl]"
        10.times {
          picker.safe_click unless today.present?
          today.safe_click
          sleep(0.35)
          return ParameterHelper.now_plus_mon_dd 0 #get ship date text box value and return it in correct format or not...
        }
        expect("Unable to select today's date from date picker object in Print Modal.").to eql ""
      end

      def todays_date
        picker = StampsElement.new browser.div(css: "div[id^=datefield][id$=trigger-picker]")
        today = StampsElement.new StampsElement.new browser.div css: "div[title=Today]"
        10.times {
          picker.safe_click unless today.present?
          today.safe_click
          sleep(0.35)
          return ParameterHelper.now_plus_mon_dd 0
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
        ship_date_textbox = StampsTextbox.new browser.text_field(css: "input[id^=datefield][id$=inputEl]")

        ship_date_str = ParameterHelper.now_plus_month_dd day
        ship_date_mmddyy = ParameterHelper.now_plus_mm_dd_yy day
        date_field = StampsElement.new browser.div css: "td[aria-label='#{ship_date_str}']>div"

        10.times{
          picker_button.safe_click unless date_picker_header.present?
          sleep(0.35)

          if date_field.element.present?
            break
          else
            day += 1
            ship_date_str = ParameterHelper.now_plus_month_dd day
            ship_date_mmddyy = ParameterHelper.now_plus_mm_dd_yy day
            date_field = StampsElement.new browser.div css: "td[aria-label='#{ship_date_str}']>div"
          end
        }

        10.times {
          picker_button.safe_click unless date_field.present?
          date_field.safe_click
          sleep(0.35)
          return ship_date_textbox.text if ship_date_textbox.text == ship_date_mmddyy
        }
      end
    end

    class ShipDate < Browser::StampsBrowserElement
      attr_reader :text_box, :date_picker, :text_box_cc

      def initialize(param)
        super(param)
        @text_box = StampsTextbox.new browser.text_field(css: "input[id^=datefield-][id$=-inputEl]")
        @text_box_cc = StampsTextbox.new browser.text_field(id: "sdc-printpostagewindow-shipdate-inputEl")
        @date_picker = DatePicker.new(param)
      end

      def text
        sleep(0.35)
        5.times do
          return text_box.text if text_box.present?
          return text_box_cc.text if text_box_cc.present?
        end
      end
    end



    class OrdersPrintModal < Browser::StampsBrowserElement

      attr_reader :starting_label, :paper_tray, :date_picker, :printing_on, :ship_date, :print_options, :window_x_button,
                  :print_sample_button, :printer, :email_tracking_details, :print_envelope_btn, :print_button

      def initialize(param)
        super(param)
        @printing_on = PrintingOn.new(param)
        @printer = Printer.new(param)
        @paper_tray = PaperTray.new(param)
        @ship_date = ShipDate.new(param)
        @starting_label = StartingLabel.new(param)
        @print_options = PrintOptions.new(param)

        @print_button = StampsElement.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl'))
        @print_sample_button = StampsElement.new(browser.span(id: 'sdc-printwin-printsamplebtn-btnInnerEl'))
        @print_envelope_btn = StampsElement.new(browser.span(text: 'Print Envelope'))
      end


      def close_window
        window_x_button.click_while_present
      end

      def click
        starting_label_tag = StampsElement.new(browser.span(text: "Starting Label:"))
        20.times do
          starting_label_tag.safe_click
        end
      end

      def present?
        print_button.present?
      end

      def wait_until_present(*args)
        print_button.safely_wait_until_present *args
      end

      def print
        15.times do
          begin
            print_button.safe_click
            sleep(0.35)
            print_button.safe_click
            sleep(0.35)
            printing_error = printing_error_check
            return printing_error if printing_error.length > 1
            break unless print_button.present?
          rescue
            true
          end
        end
        ""
      end

      def print_expecting_rating_error
        postage
        RatingError.new(param).wait_until_present
      end

      def labels_ready_to_print
        title[/\d+/]
      end

      def label_sheet_required_count
        browser.label(css: 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
      end

      def title
        div = browser.div css: "div[id^=printwindow]>div[id^=title]>div[id^=title]"
        logger.info "Title: #{div}"
        element_helper.text div
      end

      def print_sample
        begin
          print_sample_button.safe_click
          printing_error_check
        rescue
          #ignroe
        end
        self
      end

      def print_sample_expecting_error
        print_sample_button.when_present.click
        printing_error_check
        self
      end

      def error_ok_button
        browser.span text: 'OK'
      end

      def error_message
        browser.div(css: 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]').text
      end

      def close
        begin
          x_button.click
        rescue
          #ignore
        end
      end

      def total_cost
        ParameterHelper.remove_dollar_sign(element_helper.text(total_label, "total")).to_f.round(2)
      end

      def total_label
        browser.label(text: 'Total Cost:').parent.labels.last
      end

      def check_naws_plugin_error
        begin
          error_label = browser.div text: 'Error'
          if error_label.present?
            @printing_error = true
            ptags = browser.ps css: 'div[id^=dialoguemodal]>p'
            logger.info "-- Chrome NAWS Plugin Error --"
            ptags.each {|p_tag|
              if p_tag.present?
                p_tag_text = element_helper.text p_tag
                logger.info "\n#{p_tag_text}"
              end
            }
            logger.info "-- Chrome NAWS Plugin Error --"
            if error_ok_button.present?
              error_message = self.error_message
              5.times {
                error_ok_button.click
                break unless error_ok_button.present?
              }
              close
            end
            close
          end
        rescue
          #ignore
        end
        @printing_error
      end

      def printing_error_check
        @printing_error = ""
        incomplete_order_window = StampsElement.new browser.div text: "Incomplete Order"
        error_window = StampsElement.new browser.div text: "Error"
        ok_button = StampsElement.new browser.span text: 'OK'
        message_label = StampsElement.new((browser.divs css: "div[id^=dialoguemodal][class=x-autocontainer-innerCt]").first)

        sleep(2)

        if error_window.present? || incomplete_order_window.present?
          window_text = error_window.text
          err_msg = message_label.text
          @printing_error = "#{window_text} \n #{(err_msg)}"
          logger.info "Printing Error: \n#{@printing_error}"
        end

        if ok_button.present?
          logger.info "Error Window OK button"
          ok_button.safe_click
          ok_button.safe_click
          ok_button.safe_click
        end
        @printing_error
      end

      def x_button
        browser.elements(css: 'img[class*=x-tool-close]').last
      end

      def printer_label
        browser.label text: 'Printer:'
      end

      def printer_field
        browser.text_field name: 'printers'
      end

      def paper_tray_field
        browser.text_field name: 'paperTrays'
      end

      def click_print_button
        element_helper.safe_click print_button
      end

    end

    class RePrintModal < OrdersPrintModal
      def present?
        browser.div(text: "Reprint Label").present?
      end

      def reprint
        button = StampsElement.new browser.span(id: "sdc-printwin-printbtn-btnInnerEl")
        10.times do
          button.safe_click
          button.safe_click
          break unless present?
        end
      end
    end
  end
end
