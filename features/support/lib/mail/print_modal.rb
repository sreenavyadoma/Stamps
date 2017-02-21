# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class PrintPostageModalObject < Browser::StampsHtmlField
        def window_x_button
          StampsElement.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))
        end

        def close_window
          #ElementHelper.click window_x_button, 'close_window'
        end

        def x_button_present?
          #ElementHelper.present? window_x_button
        end

        def wait_until_present(*args)
          begin
            window_x_button.wait_until_present(args)
          rescue
            #ignore
          end
        end
      end

      class MailPrintModal < PrintPostageModalObject
        attr_accessor :paper_tray, :printer, :print_button, :reprint_link

        def initialize(param)
          super(param)
          @printer = Printer.new(param)
          @paper_tray = PaperTray.new(param)
          @print_button = StampsElement.new(browser.span(id: 'sdc-printwin-printbtn-btnInnerEl'))
          @reprint_link = StampsElement.new(browser.a(text: 'Reprint'))
        end

        def present?
          print_button.present?
        end

        def print
          print_button.click_while_present
          reprint_link.wait_until_present(5)
          expect(reprint_link.text).to eql('Reprint')
        end

        def print_expecting_rating_error
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
        def error_ok_button
          browser.span(text: 'OK')
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
      end

      class Printer < Browser::StampsHtmlField
        attr_reader :text_box, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(name: "printers"))
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
            drop_down.safe_click unless selection.present?
            selection.safe_click
            break if text_box.text.include?(printer)
          end
          expect(text_box.text).to include(printer)
        end
      end

      class PaperTray < Browser::StampsHtmlField
        def text_box
          StampsTextbox.new browser.input name: "paperTrays"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-trigger]")[10])
        end

        def select(selection)
          selection_label = StampsElement.new(browser.li(text: selection))
          5.times do
            drop_down.safe_click unless selection_label.present?
            selection_label.safe_click
            break if text_box.text.include?(selection)
          end
        end
      end
    end
  end
end

