module Stamps
  module Mail

    class MailToolbarPrintButton < Browser::StampsBrowserElement
      def present?
        print_button.present?
      end

      def text
        print_button.text
      end

      def type
        param.print_media
      end

      def instance
        expect([:envelopes, :stamps, :labels, :rolls]).to include(param.print_media)
        if @print_button.nil? || !@print_button.present?
          case param.print_media
            when :envelopes
              @print_button = StampsElement.new(browser.span(text: 'Print Envelope'))
            when :stamps
              @print_button = StampsElement.new(browser.span(text: 'Print Stamps'))
            when :labels
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            when :rolls
              @print_button = StampsElement.new(browser.span(text: 'Print Label'))
            else
              # do nothing
          end
        end
        @print_button
      end
    end

    class MailToolbar < Browser::StampsBrowserElement
      attr_reader :total, :mail_print_modal, :confirm_window, :windows_print, :sample_button, :printing_problem, :insufficient_funds, :print_button,
                  :print_label, :print_stamps, :print_envelope

      def initialize(param)
        super(param)
        @total = StampsElement.new browser.label(id: "sdc-printpanel-totalcostlabel")
        @mail_print_modal = PrintModal::MailPrintModal.new(param)
        @confirm_window = PrintModal::PrintModalConfirmPrint.new(param)
        @windows_print = Windows::PrintWindow.new
        @sample_button = StampsElement.new browser.a(css: "a[class*=sdc-printpanel-printsamplebtn]")
        @printing_problem = PrintingProblem.new(param)
        @insufficient_funds = MailInsufficientFunds.new(param)
        @print_button = MailToolbarPrintButton.new(param)

        @print_label = StampsElement.new(browser.span(text: "Print Label"))
        @print_stamps = StampsElement.new(browser.span(text: "Print Stamps"))
        @print_envelope = StampsElement.new(browser.span(text: "Print Envelope"))
      end

      def print
        open_window(mail_print_modal)
      end

      def open_window(window)
        return window if window.present?

        expect(print_button.instance.present?).to be(true)
        10.times do
          begin
            print_button.instance.safe_click
            mail_print_modal.wait_until_present(3)

            expect(insufficient_funds.text).to eql('Insufficient Funds') if insufficient_funds.present?

            if confirm_window.present?
              logger.info "Confirm Print"
              confirm_window.continue
            end
            return window if window.present?
          rescue
            #ignore
          end
        end
        expect(window.present?).to be(true)
      end

      def print_sample
        open_sample_window mail_print_modal
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
        print_button.safe_click
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


    class PrintingProblem < Browser::StampsBrowserElement
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