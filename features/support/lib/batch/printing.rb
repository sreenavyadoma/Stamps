module Batch

  class PrintWindowBase < BatchObject
    def window_x_button
      @browser.img :css => "img[class*='x-tool-img x-tool-close']"
    end

    def close_window
      BrowserHelper.instance.click window_x_button, 'close_window'
    end

    def x_button_present?
      BrowserHelper.instance.present? window_x_button
    end

    def wait_until_present
      begin
        window_x_button.wait_until_present
      rescue
        #ignore
      end
    end
  end

  class PrintWindowDatePicker < BatchObject
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

  class UspsTerms < BatchObject
    def present?
      (Label.new @browser.div :text => "USPS Terms").present?
    end

    def agree_and_dont_show_again
      dont_show_this_again true
      i_agree.click_while_present
    end

    def dont_show_this_again dont_show
      chkbox_inputs = @browser.inputs :css => "input[id^=checkbox-][id$=-inputEl]"
      checkbox_field = chkbox_inputs.last
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? checkbox_field

      verify_field = @browser.div :css => "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? verify_field

      attribute = "class"
      attrib_value_check = "checked"

      dont_show_checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, attribute, attrib_value_check

      if dont_show
        dont_show_checkbox.check
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      else
        dont_show_checkbox.uncheck
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      end
    end

    def i_agree
      Button.new @browser.span :text => "I Agree"
    end

    def cancel
      Button.new @browser.span :text => "Cancel"
    end
  end

  class StartingLabel < BatchObject
    def label_divs
      @browser.divs :css => "div[class*='label-chooser-selectable-box']"
    end

    def left_label_div
      label_divs[1]
    end

    def right_label_div
      label_divs[2]
    end

    def left
      10.times{
        browser_helper.click left_label_div, "left_label"
        return true if label_selected? left_label_div
      }
      false
    end

    def right
      10.times{
        browser_helper.click right_label_div, "right_label"
        return true if label_selected? right_label_div
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
        log "Label selected?  #{(selected)? 'Yes':'No'}"
        break if selected
      }
      browser_helper.attribute_value(div, 'class').include? 'selected'
    end

    def default_selected?
      label_selected? left_label_div
    end
  end

  class PrintingOn < BatchObject
    def select selection
      drop_down = Button.new @browser.div :css => "div[id^=printmediadroplist][id$=trigger-picker]"
      text_box = Textbox.new @browser.text_field :css => "input[name^=printmediadroplist]"
      selection_field = Label.new @browser.li :text => selection

      10.times{
        drop_down.safe_click unless selection_field.present?
        selection_field.safe_click
        input_text = text_box.text
        break if input_text.include? selection
      }
    end
  end

  class PrintWindow < PrintWindowBase
    def initialize browser, *args
      super browser
      print_options *args
    end

    def starting_label
      StartingLabel.new @browser
    end

    def printer
      drop_down = @browser.div :id => "div#sdc-printpostagewindow-printerdroplist-trigger-picker"
      input = @browser.text_field :id => "sdc-printpostagewindow-printerdroplist-inputEl"
      Dropdown.new @browser, drop_down, :li, input
    end

    def printing_on
      PrintingOn.new @browser
    end

    def ship_date_input
      @browser.text_field :name => 'sdc-printpostagewindow-shipdate-inputEl'
    end

    def date_picker_div
      @browser.div :id => "sdc-printpostagewindow-shipdate-trigger-picker"
    end

    def pick_date day
      date_picker = PrintWindowDatePicker.new(@browser)
      5.times{
        if date_picker.present?
          break
        else
          browser_helper.click date_picker_div
        end
      }
      date_picker.date day
    end

    def ship_date
      browser_helper.text ship_date_input
    end

    def ship_date=date
      5.times{
        begin
          browser_helper.set ship_date_input, date
          sleep(1)
          text = browser_helper.text ship_date_input
          done = text.include? date
          break if done
        rescue
          #ignroe
        end
      }
    end

    def print
      button = print_button
      8.times {
        begin
          sleep(1)
          button.safe_click
          sleep 1
          button.safe_click
          sleep(1)
          printing_error = printing_error_check
          return printing_error if printing_error.length > 1
        rescue
          true
        end
      }
      true
    end

    def print_expecting_rating_error
      print_modal
      RatingError.new(@browser).wait_until_present
    end

    def labels_ready_to_print
      title[/\d+/]
    end

    def labels_required
      @browser.label(:css => 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
    end

    def title
      div = @browser.div :css => "div[id^=printwindow]>div[id^=title]>div[id^=title]"
      log "Title: #{div}"
      browser_helper.text div
    end

    def print_options(*args)
      case args.size
        when 0
          return self
        when 1
          self.printer = args[0]
          return self
        when 2
          self.printer = args[0]
          self.paper_trail = args[1]
          return self
        else
          raise "Invalid printer arguments."
      end
    end

    def printer=(printer)
      printer_field.when_present.set printer
      printer_label.click
      printer_label.click
      self
    end

    def paper_trail=(tray)
      paper_tray_field.when_present.set tray
      printer_label.click
      printer_label.click
      self
    end

    def print_sample
      begin
        print_sample_button.when_present.click
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

    def present?
      browser_helper.present? print_button
    end

    def error_ok_button
      @browser.span :text => 'OK'
    end

    def error_message
      @browser.div(:css => 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]').text
    end

    def close
      begin
        x_button.click
      rescue
        #ignore
      end
    end

    def total_cost
      test_helper.remove_dollar_sign(browser_helper.text(total_label, "total"))
    end

    def total_label
      @browser.label(:text => 'Total Cost:').parent.labels.last
    end

    def check_naws_plugin_error
      begin
        error_label = @browser.div :text => 'Error'
        if browser_helper.present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Chrome NAWS Plugin Error --"
          ptags.each {|p_tag|
            if browser_helper.present? p_tag
              p_tag_text = browser_helper.text p_tag
              log "\n#{p_tag_text}"
            end
          }
          log "-- Chrome NAWS Plugin Error --"
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
      incomplete_order_window = Label.new(@browser.div :text => "Incomplete Order")
      error_window = Label.new(@browser.div :text => "Error")
      ok_button = Button.new(@browser.span :text => 'OK')
      message_label = Label.new((@browser.divs :css => "div[id^=dialoguemodal][class=x-autocontainer-innerCt]").first)

      sleep 2

      if error_window.present? || incomplete_order_window.present?
        window_text = error_window.text
        err_msg = message_label.text
        @printing_error = "#{window_text} \n #{(err_msg)}"
        log "Printing Error: \n#{@printing_error}"
      end

      if ok_button.present?
        log "Error Window OK button"
        ok_button.safe_click
        ok_button.safe_click
        ok_button.safe_click
      end
      @printing_error
    end

    def x_button
      @browser.elements(:css => 'img[class*=x-tool-close]').last
    end

    def printer_label
      @browser.label :text => 'Printer:'
    end

    def printer_field
      @browser.text_field :name => 'printers'
    end

    def paper_tray_field
      @browser.text_field :name => 'paperTrays'
    end

    def print_sample_button
      @browser.span :text => 'Print Sample'
    end

    def print_button
      Button.new @browser.span :id => 'sdc-printwin-printbtn-btnInnerEl'
    end

    def click_print_button
      browser_helper.click print_button
    end
  end

end

=begin

  class UspsTerms < BatchObject
    def present?
      (Label.new @browser.div :text => "USPS Terms").present?
    end

    def dont_show_this_again dont_show

      chkbox_inputs = @browser.inputs :css => "input[id^=checkbox-][id$=-inputEl]"
      checkbox_field = chkbox_inputs.last
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? checkbox_field

      verify_field = @browser.div :css => "div[class='x-field x-form-item x-form-item-default x-form-type-checkbox x-box-item x-field-default x-vbox-form-item x-form-item-no-label']"
      raise "USPS Terms - Don't show this again checkbox is not present" unless browser_helper.present? verify_field

      attribute = "class"
      attrib_value_check = "checked"

      dont_show_checkbox = Stamps::Browser::Checkbox.new checkbox_field, verify_field, attribute, attrib_value_check

      if dont_show
        dont_show_checkbox.check
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      else
        dont_show_checkbox.uncheck
        log "USPS Terms - Don't show this again input field is #{dont_show_checkbox.checked?}"
      end

    end

    def i_agree
      Button.new @browser.span :text => "I Agree"
    end

    def cancel
      Button.new @browser.span :text => "Cancel"
    end
  end

=end