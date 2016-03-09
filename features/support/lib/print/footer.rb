module Print
  module Postage
    class Footer < Print::Postage::PrintObject
      def total

      end

      def print_sample

      end

      def print
        open_window Print::Postage::PrintPostageModal.new @browser
      end

      def print_international
        print_button.safe_click
      end

      def print_button
        StampsButton.new @browser.a :css => "a[class*=sdc-printpanel-printpostagebtn]"
      end

      def open_window window
        return window if window.present?
        print = print_button

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
            confirm_window = Print::Postage::ConfirmModal.new @browser
            if confirm_window.present?
              log.info "Confirm Print"
              confirm_window.confirm
            end
            return window if window.present?

            print.click
          rescue
            #ignore
          end
        end



        return window if window.present?
        raise "Unable to open Print Window.  There might be errors in printing or order is not ready for printing.  Check your test."
      end


    end
  end
end
