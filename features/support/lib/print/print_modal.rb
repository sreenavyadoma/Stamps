# encoding: utf-8
module Print
  module Postage

  class PrintPostageModalObject < Print::Postage::PrintObject
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

  class Printer < Print::Postage::PrintObject
    def drop_down
      StampsButton.new @browser.div :css => "table[id^=sdc-printpostagewindow-printerdroplist-triggerWrap]>tbody>tr>td>div[class*=x-form-arrow-trigger]"
    end

    def text_box
      @browser.input :id => "sdc-printpostagewindow-printerdroplist-inputEl"
    end

    def select printer
      dd = self.drop_down
      input = self.text_box

      case printer.downcase
        when /fac/
          selection_label = Label.new @browser.li :text => /fac/
        when /kyocera/
          selection_label = Label.new @browser.li :text => /Kyocera/
        when /epson/
          selection_label = Label.new @browser.li :text => /EPSON/
        when /brother/
          selection_label = Label.new @browser.li :text => /Brother/
        when /officejet/
          selection_label = Label.new @browser.li :text => /Officejet/
        else
          raise "Invalid Printer Selection.  #{printer} is not a valid drop-down selection.  To print using PDF Factory, use factory.  To Print using Kyocera use Kyocera."
      end

      5.times do
        dd.safe_click unless selection_label.present?
        selection_label.safe_click
        return if input.text.include? printer
      end
    end
  end

  class PaperTray < Print::Postage::PrintObject
    def text_box
      Textbox.new @browser.text_field :css => "input[[id*=combobox]"
    end

    def drop_down
      StampsButton.new (@browser.divs :css => "div[class*=x-form-trigger]")[10]
    end

    def select selection
      text_box = self.text_box
      drop_down = self.drop_down
      selection_label = Label.new @browser.li :text => selection

      5.times{
        drop_down.safe_click unless selection_label.present?
        selection_label.safe_click
        break if text_box.text.include? selection
      }

    end
  end

  class PrintPostageModal < PrintPostageModalObject
    def initialize browser
      super browser
    end

    def paper_tray
      Print::Postage::PaperTray.new @browser
    end

    def printer
      Print::Postage::Printer.new @browser
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

    end

    def print_expecting_rating_error
      postage
      RatingError.new(@browser).wait_until_present
    end

    def labels_required
      @browser.label(:css => 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
    end

    def title
      div = @browser.div :css => "div[id^=printwindow]>div[id^=title]>div[id^=title]"
      log.info "Title: #{div}"
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
          log.info "-- Chrome NAWS Plugin Error --"
          ptags.each {|p_tag|
            if browser_helper.present? p_tag
              p_tag_text = browser_helper.text p_tag
              log.info "\n#{p_tag_text}"
            end
          }
          log.info "-- Chrome NAWS Plugin Error --"
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
      ok_button = StampsButton.new(@browser.span :text => 'OK')
      message_label = Label.new((@browser.divs :css => "div[id^=dialoguemodal][class=x-autocontainer-innerCt]").first)

      sleep 2

      if error_window.present? || incomplete_order_window.present?
        window_text = error_window.text
        err_msg = message_label.text
        @printing_error = "#{window_text} \n #{(err_msg)}"
        log.info "Printing Error: \n#{@printing_error}"
      end

      if ok_button.present?
        log.info "Error Window OK button"
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
      StampsButton.new @browser.span :text => 'Print Modal: Print Sample'
    end

    def print_button
      StampsButton.new @browser.span :id => 'sdc-printwin-printbtn-btnInnerEl'
    end

    def click_print_button
      browser_helper.click print_button
    end
  end
end
end
