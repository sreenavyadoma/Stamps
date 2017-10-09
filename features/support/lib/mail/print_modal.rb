# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class InstallStampsConnect < Browser::StampsModal
        def window_title
          StampsElement.new(browser.divs(text: 'Install Stamps.com Connect').first)
        end

        def present?
          window_title.present?
        end

        def body
          StampsElement.new(browser.div(css: "[class*=x-window-default-closable] [id^=dialoguemodal-][class=x-autocontainer-innerCt]"))
        end

        def install_stamps_connect

        end
      end

      class MailPrinterComboBox < Browser::StampsModal
        def dropdown
          @dropdown = StampsElement.new(browser.div(css: "[id^=printwindow-] [class*=x-form-arrow-trigger-default]")) if @dropdown.nil? || !@dropdown.present?
          @dropdown
        end

        def textbox
          @textbox = StampsTextBox.new(browser.text_field(name: "printers")) if @textbox.nil? || !@textbox.present?
          @textbox
        end

        def present?
          textbox.present?
        end

        # returns selected printer or nil if printer is not on list of values
        def select_printer(printer)
          begin
            return textbox.text if textbox.text.include?(printer)
            selection = StampsElement.new(browser.li(text: /#{(printer.include?('\\'))? printer.gsub!(/.+\\/, '') : printer}/))
            10.times do
              dropdown.click unless selection.present?
              selection.click
              sleep(0.15)
              return textbox.text if textbox.text.include?(printer)
            end
          end unless textbox.text.include?(printer)

        end
      end

      class MailPaperTrayComboBox < Browser::StampsModal
        attr_accessor :dropdown, :textbox

        def initialize(param)
          super
          @textbox = StampsTextBox.new(browser.input(name: "paperTrays"))
          @dropdown = StampsElement.new(browser.div(css: "div[class*='x-vbox-form-item']>div>div>div[id$=-trigger-picker]"))
        end

        def select(str)
          selection_label = StampsElement.new(browser.li(text: str))
          10.times do
            dropdown.click unless selection_label.present?
            selection_label.click
            sleep(0.15)
            break if textbox.text.include?(str)
          end
        end
      end

      class MailPrintModal < Browser::StampsModal
        attr_accessor :paper_tray, :mail_printer, :print_button, :reprint_link

        def initialize(param)
          super
          @mail_printer = MailPrinterComboBox.new(param)
          @paper_tray = MailPaperTrayComboBox.new(param)
          @print_button = StampsElement.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl'))
          @reprint_link = StampsElement.new(browser.a(text: 'Reprint'))
        end

        def window_title
          StampsElement.new(browser.div(text: "Print"))
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def print
          wait_until_present(8)
          expect(present?).to be(true), "Print button on Mail Print Modal is not present."
          5.times do
            print_button.click
            sleep(0.75)
            break unless print_button.present?
          end
          print_button.wait_while_present(8)
          expect(print_button.present?).to be(false), "Unable to click Print button on Mail Print Modal."
        end

        def print_expecting_rating_error
          RatingError.new(param).wait_until_present
        end

        def label_sheet_required_count
          browser.label(css: 'label[class*=label-sheets-requred]').text.gsub(/[^\d]/, '')
        end

        def title
          StampsElement.new(browser.div(css: "div[id^=printwindow]>div[id^=title]>div[id^=title]")).text
        end

        def error_ok_button
          browser.span(text: 'OK')
        end

        def error_message
          StampsElement.new(browser.div(css: 'div[class=x-autocontainer-outerCt][id^=dialoguemodal]>div[id^=dialoguemodal]')).text
        end

        def close
          begin
            x_button.click
          rescue
            #ignore
          end
        end

        def total_cost
          test_helper.dollar_amount_str(StampsElement.new(browser.label(text: 'Total Cost:').parent.labels.last)).to_f.round(2)
        end

        def check_naws_plugin_error
          begin
            error_label = browser.div text: 'Error'
            if error_label.present?
              @printing_error = true
              ptags = browser.ps css: 'div[id^=dialoguemodal]>p'
              logger.info "-- Chrome NAWS Plugin Error --"
              ptags.each {|p_tag| logger.error "#{StampsElement.new(p_tag).text}" if p_tag.present? }
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
            ok_button.click
            ok_button.click
            ok_button.click
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
      end
    end
  end
end

