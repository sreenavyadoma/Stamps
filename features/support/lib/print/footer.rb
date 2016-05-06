module Print
  module Postage
    class Footer < Print::Postage::PrintObject
      def total
        StampsLabel.new @browser.label :id => "sdc-printpanel-totalcostlabel"
      end

      def print_sample
        open_sample_window Print::Postage::PrintPostageModal.new @browser
      end

      def print
        open_window Print::Postage::PrintPostageModal.new @browser
      end

      def print_international
        print_button.safe_click
        confirm_window = Print::Postage::ConfirmPrint.new @browser
        print_modal = Windows::PrintWindow.new

        5.times do
          sleep 1
          if confirm_window.present?
            log.info "Confirm Print"
            confirm_window.dont_prompt_deducting_postage_again
            confirm_window.continue
            confirm_window.continue
          end
          break if print_modal.present?
        end

        8.times do
          if print_modal.present?
            break
          else
            sleep 1
          end
        end
        raise "Unable to open international print modal." unless print_modal.present?
        print_modal.print
      end

      def print_button
        StampsButton.new @browser.a :css => "a[class*=sdc-printpanel-printpostagebtn]"
      end

      def sample_button
        StampsButton.new @browser.a :css => "a[class*=sdc-printpanel-printsamplebtn]"
      end


      def open_window window
        return window if window.present?
        print = print_button

        naws_plugin_error = NawsPluginError.new @browser
        error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
        install_plugin_error = ErrorInstallPlugin.new @browser
        confirm_window = Print::Postage::ConfirmPrint.new @browser

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
              log.info "Confirm Print"
              confirm_window.continue
            end
            return window if window.present?
          rescue
            #ignore
          end
        end



        return window if window.present?
        stop_test "Unable to open Print Window.  There might be errors in printing or order is not ready for printing.  Check your test."
      end

      def open_sample_window window
        return window if window.present?
        print = sample_button

        print.click

        naws_plugin_error = NawsPluginError.new @browser
        error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
        install_plugin_error = ErrorInstallPlugin.new @browser

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
        stop_test "Unable to open Print Window.  There might be errors in printing or order is not ready for printing.  Check your test."
      end


    end


  end
end
