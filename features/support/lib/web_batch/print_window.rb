module Batch
  module PrintWindowBase
    def window_x_button
      img = @browser.img :css => "img[class*='x-tool-img x-tool-close']"
      present = img.present?
      img
    end

    def close_window
      BrowserHelper.instance.click window_x_button, 'close_window'
    end

    def x_button_present?
      BrowserHelper.instance.field_present? window_x_button
    end

    def wait_until_present
      begin
        window_x_button.wait_until_present
      rescue
        #ignore
      end
    end
  end

  class PrintWindow < Stamps::BrowserObject
    include Batch::PrintWindowBase
    def initialize(browser, *args)
      super(browser)
      print_options *args
    end

    public

    def print
      5.times {
        begin
          browser_helper.click print_button
          printing_error_check
          break unless browser_helper.field_present? print_button
        rescue
          #ignore
        end
      }
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
      browser_helper.field_present? print_button
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

    private

    def total_label
      @browser.label(:text => 'Total Cost:').parent.labels.last
    end

    def check_naws_plugin_error
      begin
        error_label = @browser.div :text => 'Error'
        if browser_helper.field_present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Chrome NAWS Plugin Error --"
          ptags.each {|p_tag|
            if browser_helper.field_present? p_tag
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
      begin
        error_label = @browser.p :text => "Error code: [4522293]"
        if browser_helper.field_present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Postage Rating Error (Error code: [4522293]) --"
          ptags.each {|p_tag|
            if browser_helper.field_present? p_tag
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
      begin
        error_label = @browser.p :text => "Error code: [4522357]"
        if browser_helper.field_present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Account Status Error (Error code: [4522357]) --"
          ptags.each {|p_tag|
            if browser_helper.field_present? p_tag
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
      begin
        error_label = @browser.p :text => "Error code: [5177601]"
        if browser_helper.field_present? error_label
          @printing_error = true
          ptags = @browser.ps :css => 'div[id^=dialoguemodal]>p'
          log "-- Rating Error code: [5177601] --"

          ptags.each {|p_tag|
            if browser_helper.field_present? p_tag
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

    def printing_error_check
      @printing_error = false
      check_naws_plugin_error if Stamps.browser.chrome?
      check_unauthenticated_error
      check_account_status_error
      log "Printing Error Encountered:  #{@printing_error}"
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
      #@browser.elements(:text => 'Print').first
      span = @browser.span(:id => 'sdc-printwin-printbtn-btnInnerEl')
      exist = span.present?
      log "Print button present? #{exist}"
      span
    end
  end

end