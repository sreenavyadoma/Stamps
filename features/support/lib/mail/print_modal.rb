# encoding: utf-8
module Stamps
  module Mail

    class PrintPostageModalObject < Browser::Modal
      def window_x_button
        browser.img css: "img[class*='x-tool-img x-tool-close']"
      end

      def close_window
        ElementHelper.click window_x_button, 'close_window'
      end

      def x_button_present?
        ElementHelper.present? window_x_button
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end
    end

    class ConfirmPrint < Browser::Modal
      class ConfirmPrintCheckbox < Browser::Modal
        def check
          browser.checkbox(name: 'dismissConfirm').set
          browser.checkbox(name: 'dismissConfirm').set
        end

        def uncheck
          browser.checkbox(name: 'dismissConfirm').clear
          browser.checkbox(name: 'dismissConfirm').clear
        end
      end

      def collapse_button
        StampsElement.new browser.a id: "sdc-undefinedwindow-continuebtn"
      end

      def present?
        window_title.present?
      end

      def wait_until_present *args
        window_title.safely_wait_until_present *args
      end

      def window_title
        StampsElement.new browser.span(text: "Confirm Print")
      end

      def dont_prompt_deducting_postage_again
        ConfirmPrintCheckbox.new(param)
      end

      def continue
        sleep(0.35)
        6.times do
          collapse_button.safe_click
          sleep(0.35)
          break unless collapse_button.present?
        end
      end
    end

    class Printer < Browser::Modal
      def drop_down
        StampsElement.new browser.div css: "table[id^=sdc-printpostagewindow-printerdroplist-triggerWrap]>tbody>tr>td>div[class*=x-form-arrow-trigger]"
      end

      def text_box
        browser.text_field id: "sdc-printpostagewindow-printerdroplist-inputEl"
      end

      def select printer
        dd = self.drop_down
        input = self.text_box

        case printer.downcase
          when /fac/
            selection_label = StampsElement.new browser.li text: /fac/
          when /kyocera/
            selection_label = StampsElement.new browser.li text: /Kyocera/
          when /epson/
            selection_label = StampsElement.new browser.li text: /EPSON/
          when /brother/
            selection_label = StampsElement.new browser.li text: /Brother/
          when /officejet/
            selection_label = StampsElement.new browser.li text: /Officejet/
          when /dymo/
            selection_label = StampsElement.new browser.li text: /DYMO/
          when /zdesigner/
            selection_label = StampsElement.new browser.li text: /ZDesigner/


          else
            "Invalid Printer Selection.  #{printer} is not a valid drop-down selection.  To mail using PDF Factory, use factory.  To Print using Kyocera use Kyocera.".should eql ""
        end

        5.times do
          dd.safe_click unless selection_label.present?
          selection_label.safe_click
          break if input.value.include? printer
        end
      end
    end

    class PaperTray < Browser::Modal
      def text_box
        StampsTextbox.new browser.input name: "paperTrays"
      end

      def drop_down
        StampsElement.new(browser.divs(css: "div[class*=x-form-trigger]")[10])
      end

      def select(selection)
        text_box = self.text_box
        drop_down = self.drop_down
        selection_label = StampsElement.new browser.li text: selection

        5.times{
          drop_down.safe_click unless selection_label.present?
          selection_label.safe_click
          break if text_box.text.include? selection
        }

      end
    end

    class PrintPostageModal < PrintPostageModalObject
      def paper_tray
        PaperTray.new(param)
      end

      def printer
        Printer.new(param)
      end

      def confirm_modal
        ConfirmPrint.new(param)
      end

      def print
        button = print_button
        5.times {
          begin
            sleep(0.35)
            button.safe_click
            sleep(0.35)
            button.safe_click
            sleep(0.35)
            printing_error = printing_error_check
            return printing_error if printing_error.length > 1
            break unless button.present?
          rescue
            true
          end
        }


      end

      def print_expecting_rating_error
        #postage
        RatingError.new(param).wait_until_present
      end

      def label_sheet_required_count
        browser.label(css: 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
      end

      def title
        div = browser.div css: "div[id^=printwindow]>div[id^=title]>div[id^=title]"
        logger.info "Title: #{div}"
        element_helper.text div
      end

      def present?
        print_button.present?
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
        incomplete_order_window = StampsElement.new(browser.div text: "Incomplete Order")
        error_window = StampsElement.new(browser.div text: "Error")
        ok_button = StampsElement.new(browser.span text: 'OK')
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

      def print_button
        StampsElement.new browser.span id: 'sdc-printwin-printbtn-btnIconEl'
      end

      def click_print_button
        element_helper.safe_click print_button
      end
    end
  end
end
