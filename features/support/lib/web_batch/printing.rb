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

  class PrintWindow < PrintWindowBase
    def initialize browser, *args
      super browser
      print_options *args
    end

    def left_label_div
      @browser.div :css => "div[class*=singleLabelChooser-container]:nth-child(1)"
    end

    def right_label_div
      @browser.div :css => "div[class*=singleLabelChooser-container]:nth-child(2)"
    end

    def ship_date_input
      @browser.text_field :name => 'sdc-printpostagewindow-shipdate-inputEl'
    end

    def date_picker_div
      @browser.div :id => "sdc-printpostagewindow-shipdate-trigger-picker"
    end

    public

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

    def left_label
      10.times{
        browser_helper.click left_label_div, "left_label"
        return true if label_selected? left_label_div
      }
      false
    end

    def right_label
      10.times{
        browser_helper.click right_label_div, "right_label"
        return true if label_selected? right_label_div
      }
      false
    end

    def left_label_selected?
      label_selected? left_label_div
    end

    def right_label_selected?
      label_selected? right_label_div
    end

    def label_selected? div
      8.times{
        selected = browser_helper.attribute_value(div, 'class').include? 'selected'
        log "Label selected?  #{(selected)? 'Yes':'No'}"
        break if selected
      }
      browser_helper.attribute_value(div, 'class').include? 'singleLabelChooser-selected'
    end

    def default_label_selected?
      label_selected? left_label_div
    end

    def print
      5.times {
        begin
          sleep(1)
          browser_helper.click print_button
          printing_error = printing_error_check
          return printing_error unless browser_helper.present? print_button
        rescue
          true
        end
      }
      true
    end

    def print_expecting_rating_error
      print
      RatingError.new(@browser).wait_until_present
    end

    def labels_ready_to_print
      title[/\d+/]
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

    def check_unauthenticated_error
      @printing_error = false
      begin
        error_label = @browser.p :text => "Error code: [4522293]"
        if browser_helper.present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Postage Rating Error (Error code: [4522293]) --"
          ptags.each {|p_tag|
            if browser_helper.present? p_tag
              p_tag_text = browser_helper.text p_tag
              log "\n#{p_tag_text}"
            end
          }
          log "-- Postage Rating Error (Error code: [4522293]) --"
          if error_ok_button.present?
            @printing_error = true
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

    def check_account_status_error
      @printing_error = false
      begin
        error_label = @browser.p :text => "Error code: [4522357]"
        if browser_helper.present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Account Status Error (Error code: [4522357]) --"
          ptags.each {|p_tag|
            if browser_helper.present? p_tag
              p_tag_text = browser_helper.text p_tag
              log "\n#{p_tag_text}"
            end
          }
          log "-- Account Status Error (Error code: [4522357]) --"
          if error_ok_button.present?
            @printing_error = true
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

    def check_rating_error
      @printing_error = false
      begin
        error_label = @browser.p :text => "Error code: [5177601]"
        if browser_helper.present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Rating Error code: [5177601] --"

          ptags.each {|p_tag|
            if browser_helper.present? p_tag
              p_tag_text = browser_helper.text p_tag
              log "\n#{p_tag_text}"
            end
          }
          log "-- Rating Error code: [5177601] --"
          if error_ok_button.present?
            @printing_error = true
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

    def check_error_ok_button
      @printing_error = false
      if browser_helper.present? error_ok_button
        @printing_error = true
        log "Error Window OK button detected"
        @printing_error
      end
      @printing_error
    end

    def printing_error_check
      #check_naws_plugin_error if Stamps.browser.chrome?
      unauthenticated_error = check_unauthenticated_error
      account_status_error = check_account_status_error
      error_ok_button = check_error_ok_button
      log "Printing Error Encountered:  #{unauthenticated_error || account_status_error || error_ok_button}"
      unauthenticated_error || account_status_error || error_ok_button
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
      #@browser.elements(:text => 'Print').first
      span = @browser.span(:id => 'sdc-printwin-printbtn-btnInnerEl')
      exist = span.present?
      log "Print button present? #{exist}"
      span
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