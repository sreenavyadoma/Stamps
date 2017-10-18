module Stamps
  module Mail
    class MailToolbar < Browser::StampsModal
      attr_reader :total, :mail_print_modal, :install_stamps_connect, :confirm_window, :please_wait, :windows_print, :sample_button,
                  :printing_problem, :insufficient_funds, :print_label, :print_stamps, :print_envelope, :print_quantity_warning

      def initialize(param)
        super
        @install_stamps_connect = PrintModal::InstallStampsConnect.new(param)
        @mail_print_modal = PrintModal::MailPrintModal.new(param)
        @confirm_window = PrintModal::MailConfirmPrint.new(param)
        @please_wait = PrintModal::PleaseWait.new(param)
        @windows_print = Windows::PrintWindow.new(param.browser)
        @sample_button = StampsElement.new browser.a(css: "a[class*=sdc-printpanel-printsamplebtn]")
        @printing_problem = PrintingProblem.new(param)
        @insufficient_funds = MailInsufficientFunds.new(param)
        @print_quantity_warning = PrintQuantityWarning.new(param)
      end

      def total
        (StampsElement.new browser.label(css: "div[id^=toolbar-][id$=-targetEl]>div[class*=ct]>div>div>div>div>div>label")).text.gsub("Total: $", '').to_f.round(2)
      end

      def print_button
        expect([:envelopes, :stamps, :labels, :rolls, :certified_mails]).to include(param.print_media)
        10.times do
          case param.print_media
            when :envelopes
              @print_button = StampsElement.new(browser.span(text: 'Print Envelope'))
            when :stamps
              @print_button = StampsElement.new(browser.span(text: 'Print Stamps'))
            when :labels
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            when :rolls
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            when :certified_mails
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            when :certified_mails_3910_3930
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            when :certified_mails_3810
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            else
              # do nothing
          end
          break if @print_button.present?
        end
        expect(@print_button).to be_present
        @print_button
      end

      def print_sample
        open_sample_window(mail_print_modal)
      end

      def print_postage
        open_window(mail_print_modal)
      end

      def open_window(window)
        return window if window.present?

        expect(print_button).to be_present, "Print button is not present."
        30.times do
          begin
            print_button.click
            window.wait_until_present(3)
            return window if window.present?

            expect(install_stamps_connect.body.text).to eql(install_stamps_connect.window_title.text) if install_stamps_connect.present?

            if please_wait.present?
              logger.message(please_wait.paragraph)
              please_wait.ok
              sleep(0.125)
              print_button.click
            end

            expect(insufficient_funds.text).to eql('Insufficient Funds') if insufficient_funds.present?

            if confirm_window.present?
              confirm_window.do_not_prompt.check
              confirm_window.continue
            end
            return window if window.present?
          rescue
            #ignore
          end
        end
        expect(window).to be_present, "Unable to open Mail Print Modal"
      end

      def open_sample_window window
        return window if window.present?
        print = sample_button

        print.click

        20.times do
          if install_plugin_error.present?
            install_plugin_error.close
            return nil
          end

          begin
            if error_connecting_to_plugin.present?
              5.times{
                error_connecting_to_plugin.ok
                break unless error_connecting_to_plugin.present?
              }
            end

            if naws_plugin_error.present?
              5.times{
                naws_plugin_error.ok

                break unless naws_plugin_error.present?
              }
            end
            return window if window.present?

            print.click
          rescue
            #ignore
          end
        end

        return window if window.present?
        expect("Unable to open Print Window.  There might be errors in printing or order is not ready for printing.  Check your TestHelper.").to eql ""
      end

      def print_international
        print_button.click
        confirm_window.wait_until_present 3
        5.times do
          if confirm_window.present?
            logger.info "Confirm Print"
            confirm_window.dont_prompt_deducting_postage_again
            confirm_window.continue
            confirm_window.continue
          end
          break if windows_print.present?
        end

        raise printing_problem.error_message if printing_problem.present?

        8.times do
          if windows_print.present?
            break
          else
            sleep(0.35)
          end
        end
        sleep(2)
        #raise "Unable to open international mail modal." unless windows_print.present?
        logger.info "LAST CHANCE!!! #{windows_print.present?}"
        windows_print.print
      end
    end


    class PrintingProblem < Browser::StampsModal
      def element
        StampsElement.new((browser.divs css: 'div[id^=dialoguemodal-][id$=-innerCt]').last)
      end

      def present?
        element.present?
      end

      def error_message
        element.text
      end
    end
  end
end