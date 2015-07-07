module Batch
  class PrintWindow < Stamps::BrowserObject
    def initialize(browser, *args)
      super(browser)
      print_options *args
    end

    public
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
      self
    end

    def open_printer_window

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

    def print
      begin
        print_button.when_present.click
        print_result
      rescue StandardError => print_error
        log print_error.message
        @print_status = false
      end
      self
    end

    def print_expecting_error
      print_button.when_present.click
      print_result
      self
    end

    def print_sample
      begin
        print_sample_button.when_present.click #todo sometimes print says connecting to plugin
        print_result
      rescue StandardError => print_error
        log print_error.message
        @print_status = false
      end
      self
    end

    def print_sample_expecting_error
      print_sample_button.when_present.click
      print_result
      self
    end

    def printed?
      @print_status
    end

    def present?
      print_button.present?
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

    def print_result
      sleep(3)
      if error_ok_button.present?
        error_message = self.error_message
        log "!!!  PRINT ERROR !!!"
        log error_message
        log "!!!  PRINT ERROR !!!"
        5.times {
          error_ok_button.click
          break unless error_ok_button.present?
        }
        close
        @print_status = false
        raise PrintingError.new("Printing Error: #{error_message}")
      end
      @print_status = true
      close
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