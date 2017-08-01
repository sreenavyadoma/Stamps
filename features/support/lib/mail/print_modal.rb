# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class MailPrinterComboBox < Browser::StampsModal
        attr_reader :text_box, :drop_down

        def initialize(param)
          super
          @text_box = StampsTextBox.new(browser.text_field(name: "printers"))
          @drop_down = StampsElement.new(browser.div(css: "div[id$=-body]>div[id^=printwindow-][id$=-innerCt]>div[id^=printwindow-][id$=-targetEl]>div>div>div>div>div>div>div[class*=x-form-arrow-trigger-default]"))
        end

        def select(printer)
          case printer.downcase
            when /fac/
              selection = StampsElement.new(browser.li(text: 'factory'))
            when /kyocera/
              selection = StampsElement.new(browser.li(text: /Kyocera/))
            when /epson/
              selection = StampsElement.new(browser.li(text: /EPSON/))
            when /brother/
              selection = StampsElement.new(browser.li(text: /Brother/))
            when /officejet/
              selection = StampsElement.new(browser.li(text: /Officejet/))
            when /dymo/
              selection = StampsElement.new(browser.li(text: /DYMO/))
            when /zdesigner/
              selection = StampsElement.new(browser.li(text: /ZDesigner/))
            else
              expect("Invalid Printer Selection.  #{printer} is not a valid drop-down selection.  To mail using PDF Factory, use factory.  To Print using Kyocera use Kyocera.").to eql ""
          end

          10.times do
            drop_down.click unless selection.present?
            selection.click
            sleep(0.15)
            break if text_box.text.include?(printer)
          end
          expect(text_box.text).to include(printer)
        end
      end

      class MailPaperTrayComboBox < Browser::StampsModal
        attr_accessor :drop_down, :text_box

        def initialize(param)
          super
          @text_box = StampsTextBox.new(browser.input(name: "paperTrays"))
          @drop_down = StampsElement.new(browser.div(css: "div[class*='x-vbox-form-item']>div>div>div[id$=-trigger-picker]"))
        end

        def select(str)
          selection_label = StampsElement.new(browser.li(text: str))
          10.times do
            drop_down.click unless selection_label.present?
            selection_label.click
            sleep(0.15)
            break if text_box.text.include?(str)
          end
        end
      end

      class MailPrintModal < Browser::StampsModal
        attr_accessor :paper_tray, :printer, :print_button, :reprint_link, :window_title

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(text: "Print"))
          @printer = MailPrinterComboBox.new(param)
          @paper_tray = MailPaperTrayComboBox.new(param)
          @print_button = StampsElement.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl'))
          @reprint_link = StampsElement.new(browser.a(text: 'Reprint'))
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def print
          print_button.click_while_present
          reprint_link.wait_until_present(10)
          expect(reprint_link.text).to eql('Reprint')
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
          test_helper.remove_dollar_sign(StampsElement.new(browser.label(text: 'Total Cost:').parent.labels.last)).to_f.round(2)
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

