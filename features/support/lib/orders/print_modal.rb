# encoding: utf-8
module Stamps
  module Orders

    class LabelUnavailable < Browser::Modal
      def present?
        browser_helper.present? browser.div(text: "Label Unavailable")
      end

      def close
        button = BrowserElement.new browser.img(css: "img[class*='x-tool-img x-tool-close']")
        10.times do
          button.safe_click
          break unless button.present?
        end
      end

      def ok
        button = BrowserElement.new browser.span(text: "Ok")
        10.times do
          button.safe_click
          break unless button.present?
        end
      end

      def message
        browser_helper.text (browser.divs(css: "div[id^=dialoguemodal][id$=innerCt]").last)
      end
    end

    class UspsTerms < Browser::Modal
      def present?
        (BrowserElement.new browser.div :text => "USPS Terms").present?
      end

      def agree_and_dont_show_again
        dont_show_this_again true
        i_agree.click_while_present
      end

      def dont_show_this_again dont_show
        chkbox_inputs = browser.inputs :css => "input[id^=checkbox-][id$=-inputEl]"
        checkbox_field = chkbox_inputs.last
        stop_test "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? checkbox_field

        verify_field = browser.div :css => "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
        stop_test "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? verify_field

        attribute = "class"
        attrib_value_check = "checked"

        dont_show_checkbox = Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, attribute, attrib_value_check

        if dont_show
          dont_show_checkbox.check
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        else
          dont_show_checkbox.uncheck
          logger.info "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
        end
      end

      def i_agree
        BrowserElement.new browser.span :text => "I Agree"
      end

      def cancel
        BrowserElement.new browser.span :text => "Cancel"
      end
    end

    class PrintModalObject < Browser::Modal
      def window_x_button
        browser.img :css => "img[class*='x-tool-img x-tool-close']"
      end

      def close_window
        BrowserHelper.click window_x_button, 'close_window'
      end

      def x_button_present?
        BrowserHelper.present? window_x_button
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end
    end

    class PrintModal < PrintModalObject

      class StartingLabel < PrintModalObject
        def label_divs
          browser.divs :css => "div[class*='label-chooser-selectable-box']"
        end

        def left_label_div
          label_divs[0]
        end

        def right_label_div
          label_divs[1]
        end

        def left
          10.times{
            begin
              browser_helper.safe_click left_label_div, "left_label"
              return true if label_selected? left_label_div
            rescue
              #ignore
            end
          }
          false
        end

        def right
          10.times{
          }
          false
        end

        def left_selected?
          label_selected? left_label_div
        end

        def right_selected?
          label_selected? right_label_div
        end

        def label_selected? div
          8.times{
            selected = browser_helper.attribute_value(div, 'class').include? 'selected'
            logger.info "Label selected?  #{(selected)? 'Yes':'No'}"
            break if selected
          }
          browser_helper.attribute_value(div, 'class').include? 'selected'
        end

        def default_selected?
          label_selected? left_label_div
        end
      end

      class PrintingOn < PrintModalObject
        private
        def selection media
          case media
            # Shipping Label: 8 ½" x 11" Paper
            when /Paper/
              return BrowserElement.new (browser.li :text => /Paper/)

            # Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
            when /SDC-1200/
              return BrowserElement.new (browser.li :text => /SDC-1200/)

            # Shipping Label: 5 ½" x 8 ½"
            when /x 8/
              return BrowserElement.new (browser.li :text => /x 8/)

            # Roll - 4 ⅛" x 6 ¼" Shipping Label
            when /x 6 ¼/
              return BrowserElement.new (browser.li :text => /x 6 ¼/)

            # Roll - 4" x 6" Shipping Label
            when /4" x 6"/
              return BrowserElement.new (browser.li :text => /4" x 6"/)
            else
              stop_test "Invalid Media Selection.  Don't know what to do with #{media}."
          end
        end

        public
        def label
          BrowserElement.new browser.span(css: "div[id^=printwindow-][id$=-targetEl]>div>label[id^=printmediadroplist-][id$=-labelEl]>span")
        end

        def text_box
          BrowserTextBox.new browser.text_field :css => "input[name^=printmediadroplist]"
        end

        def drop_down
          BrowserElement.new browser.div :css => "div[id^=printmediadroplist][id$=trigger-picker]"
        end

        def select media
          drop_down = self.drop_down
          text_box = self.text_box
          media_selection = selection media

          10.times do
            input_text = text_box.text
            break if input_text.include? media
            drop_down.safe_click unless media_selection.present?
            media_selection.safe_click
          end
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

      class DatePicker < PrintModalObject

        def todays_date_div
          div = browser.div :css => "div[title='Today']"
          logger.info "Today div present? #{browser_helper.present? div}"
          div
        end

        def date_field day
          css = "td[aria-label='#{ParameterHelper.now_plus_month_dd day.to_i}']"
          td = browser.td :css => css
          present = browser_helper.present? td
          td
        end

        def date day
          date = date_field day
          browser_helper.click date
        end

        def present?
          date_picker_button.present?
        end

        def now_month_dd
          picker = BrowserElement.new browser.div Orders::Orders::Locators::PrintModal.date_picker_button
          today = BrowserElement.new browser.span :css => "a[title*=Spacebar]>span>span>span[data-ref=btnInnerEl]"
          10.times {
            picker.safe_click unless today.present?
            today.safe_click
            sleep 1
            return ParameterHelper.now_plus_mon_dd 0 #get ship date text box value and return it in correct format or not...
          }
          stop_test "Unable to select today's date from date picker object in Print Modal."
        end

        def todays_date
          picker = BrowserElement.new browser.div Orders::Orders::Locators::PrintModal.date_picker_button
          today = BrowserElement.new BrowserElement.new browser.div :css => "div[title=Today]"
          10.times {
            picker.safe_click unless today.present?
            today.safe_click
            sleep 1
            return ParameterHelper.now_plus_mon_dd 0
          }
          stop_test "Unable to select today's date from date picker object in Print Modal."
        end

        def today_button

        end

        def today
          today_plus 0
        end

        def today_plus day
          day = day.to_i
          date_picker_header = BrowserElement.new browser.div :class => "x-datepicker-header"
          picker_button = BrowserElement.new browser.div(Orders::Locators::PrintModal.date_picker_button)
          ship_date_textbox = BrowserTextBox.new browser.text_field(id: "sdc-printpostagewindow-shipdate-inputEl")

          ship_date_str = ParameterHelper.now_plus_month_dd day
          ship_date_mmddyy = ParameterHelper.now_plus_mm_dd_yy day
          date_field = BrowserElement.new browser.div :css => "td[aria-label='#{ship_date_str}']>div"

          10.times{
            picker_button.safe_click unless date_picker_header.present?
            sleep 1

            if date_field.element.present?
              break
            else
              day += 1
              ship_date_str = ParameterHelper.now_plus_month_dd day
              ship_date_mmddyy = ParameterHelper.now_plus_mm_dd_yy day
              date_field = BrowserElement.new browser.div :css => "td[aria-label='#{ship_date_str}']>div"
            end
          }

          10.times {
            picker_button.safe_click unless date_field.present?
            date_field.safe_click
            sleep 1
            return ship_date_textbox.text if ship_date_textbox.text == ship_date_mmddyy
          }
        end
      end

      class Printer < PrintModalObject
        def drop_down
          BrowserElement.new browser.div :id => "sdc-printpostagewindow-printerdroplist-trigger-picker"
        end

        def text_box
          BrowserTextBox.new browser.text_field :id => "sdc-printpostagewindow-printerdroplist-inputEl"
        end

        def select printer
          dd = self.drop_down
          input = self.text_box

          return if input.text.include? printer

          case printer.downcase
            when /factory/
              selection_label = BrowserElement.new browser.li :text => /factory/
            when /kyocera/
              selection_label = BrowserElement.new browser.li :text => /Kyocera/
            when /epson/
              selection_label = BrowserElement.new browser.li :text => /EPSON/
            when /brother/
              selection_label = BrowserElement.new browser.li :text => /Brother/
            when /officejet/
              selection_label = BrowserElement.new browser.li :text => /Officejet/
            when /designer/
              selection_label = BrowserElement.new browser.li :text => /Designer/
            else
              stop_test "Invalid Printer Selection.  #{printer} is not a valid drop-down selection.  To print using PDF Factory, use factory.  To Print using Kyocera use Kyocera."
          end

          8.times do
            return if input.text.include? printer
            dd.safe_click unless selection_label.present?
            selection_label.safe_click
          end
          stop_test "Unable to select Printer #{printer}.  Check and make sure the printer exist in this PC."
        end
      end

      class PaperTray < PrintModalObject
        def text_box
          BrowserTextBox.new browser.text_field :css => "div[id^=form-][id$=-body]>div>div>div[id^=combo]>div>div>div>input"
        end

        def drop_down
          BrowserElement.new browser.div :css => "div[id^=form-][id$=-body]>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]"
        end

        def select selection
          text_box = self.text_box
          drop_down = self.drop_down
          selection_label = BrowserElement.new browser.li :text => selection

          5.times{
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_box.text.include? selection
          }

        end
      end

      class PrintOptions < Browser::Modal
        def hide_postage_value
          checkbox_field = browser.span :id => "sdc-printpostagewindow-hidepostagecheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def email_tracking
          checkbox_field = browser.span :id => "sdc-printpostagewindow-emailtrackingcheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
        end

        def print_reference_no
          checkbox_field = browser.span :id => "sdc-printpostagewindow-printreferencenumbercheckbox-displayEl"
          verify_field = checkbox_field.parent.parent.parent
          attribute = "class"
          verify_field_attrib = "checked"
          BrowserCheckbox.new checkbox_field, verify_field, attribute, verify_field_attrib
        end
      end

      def click
        starting_label_tag = BrowserElement.new browser.span(text: "Starting Label:")
        20.times do
          starting_label_tag.safe_click
        end
      end

      def present?
        print_button.present?
      end

      def starting_label
        StartingLabel.new param
      end

      def paper_tray
        PaperTray.new param
      end

      def printer
        Printer.new param
      end

      def printing_on
        PrintingOn.new param
      end

      def date_picker
        DatePicker.new param
      end

      def ship_date
        BrowserTextBox.new browser.text_field :name => "sdc-printpostagewindow-shipdate-inputEl"
      end

      def email_tracking_details
        checkbox_field = browser.input :id => "sdc-mainpanel-cmcheckbox-inputEl"
        verify_field = browser.table :id => "sdc-mainpanel-cmcheckbox"
        Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
      end

      def print
        button = print_button
        5.times {
          begin
            sleep(1)
            button.safe_click
            sleep 1
            button.safe_click
            sleep(1)
            printing_error = printing_error_check
            return printing_error if printing_error.length > 1
            break unless button.present?
          rescue
            true
          end
        }
        ""
      end

      def print_expecting_rating_error
        postage
        RatingError.new param.wait_until_present
      end

      def labels_ready_to_print
        title[/\d+/]
      end

      def labels_required
        browser.label(:css => 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
      end

      def title
        div = browser.div :css => "div[id^=printwindow]>div[id^=title]>div[id^=title]"
        logger.info "Title: #{div}"
        browser_helper.text div
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
        browser.span :text => 'OK'
      end

      def error_message
        browser.div(:css => 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]').text
      end

      def close
        begin
          x_button.click
        rescue
          #ignore
        end
      end

      def total_cost
        ParameterHelper.remove_dollar_sign(browser_helper.text(total_label, "total"))
      end

      def total_label
        browser.label(:text => 'Total Cost:').parent.labels.last
      end

      def check_naws_plugin_error
        begin
          error_label = browser.div :text => 'Error'
          if browser_helper.present? error_label
            @printing_error = true
            ptags = browser.ps :css => 'div[id^=dialoguemodal]>p'
            logger.info "-- Chrome NAWS Plugin Error --"
            ptags.each {|p_tag|
              if browser_helper.present? p_tag
                p_tag_text = browser_helper.text p_tag
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
        incomplete_order_window = BrowserElement.new(browser.div :text => "Incomplete Order")
        error_window = BrowserElement.new(browser.div :text => "Error")
        ok_button = BrowserElement.new(browser.span :text => 'OK')
        message_label = BrowserElement.new((browser.divs :css => "div[id^=dialoguemodal][class=x-autocontainer-innerCt]").first)

        sleep 2

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
        browser.elements(:css => 'img[class*=x-tool-close]').last
      end

      def printer_label
        browser.label :text => 'Printer:'
      end

      def printer_field
        browser.text_field :name => 'printers'
      end

      def paper_tray_field
        browser.text_field :name => 'paperTrays'
      end

      def print_sample_button
        BrowserElement.new browser.span :text => 'Print: Print Sample'
      end

      def print_button
        BrowserElement.new browser.span :id => 'sdc-printwin-printbtn-btnInnerEl'
      end

      def click_print_button
        browser_helper.click print_button
      end

      def print_options
        PrintOptions.new param
      end
    end

    class RePrintModal < PrintModal
      def present?
        browser_helper.present? browser.div(text: "Reprint Label")
      end

      def reprint
        button = BrowserElement.new browser.span(id: "sdc-printwin-printbtn-btnInnerEl")
        10.times do
          button.safe_click
          button.safe_click
          break unless present?
        end
      end
    end


  end
end
