module Stamps
  module Mail
    class PrintingProblem < Browser::Modal
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

    class MailFooter < Browser::Modal
      attr_reader :total, :print_postage_modal, :confirm_window, :windows_print, :print_button, :sample_button, :printing_problem

      def initialize(param)
        super(param)
        @total = StampsElement.new browser.label(id: "sdc-printpanel-totalcostlabel")
        @print_postage_modal = PrintPostageModal.new(param)
        @confirm_window = ConfirmPrint.new(param)
        @windows_print = Windows::PrintWindow.new
        @print_button = StampsElement.new browser.a(css: "a[class*=sdc-printpanel-printpostagebtn]")
        @sample_button = StampsElement.new browser.a(css: "a[class*=sdc-printpanel-printsamplebtn]")
        @printing_problem = PrintingProblem.new(param)
      end

      def print_sample
        open_sample_window print_postage_modal
      end

      def print
        open_window(print_postage_modal)
      end

      def open_window(window)
        return window if window.present?
        print = print_button

        naws_plugin_error = NawsPluginError.new(param)
        error_connecting_to_plugin = ErrorConnectingToPlugin.new(param)
        install_plugin_error = ErrorInstallPlugin.new(param)
        confirm_window = ConfirmPrint.new(param)

        20.times do
          print.click

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

            if confirm_window.present?
              logger.info "Confirm Print"
              confirm_window.continue
            end
            return window if window.present?
          rescue
            #ignore
          end
        end



        return window if window.present?
        expect("Unable to open Print Window.  There might be errors in printing or order is not ready for printing.  Check your TestHelper.").to eql ""
      end

      def open_sample_window window
        return window if window.present?
        print = sample_button

        print.click

        naws_plugin_error = NawsPluginError.new(param)
        error_connecting_to_plugin = ErrorConnectingToPlugin.new(param)
        install_plugin_error = ErrorInstallPlugin.new(param)

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
  end
end