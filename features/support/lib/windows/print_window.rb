module Stamps
  module Windows
    class PrintWindow
      include RAutomation

      def present?
        print_window = RAutomation::Window.new(:title => /Print/i)
        logger.info "Print Window Present? #{print_window.present?}"
        logger.info "Print Window Present? #{print_window.present?}"
        begin
          if TestHelper.browser_selection.firefox?
            print_window.activate
            logger.info "print_window.button(:value => \"OK\").exists? #{print_window.button(:value => "OK").exists?}"
            print_window.activate
            print_window.button(:value => "OK").exists?
          elsif TestHelper.browser_selection.chrome?
            logger.info "print_window.button(:value => \"&Print\").exists? #{print_window.button(:value => "&Print").exists?}"
            print_window.activate
            print_window.button(:value => "&Print").exists?
          elsif TestHelper.browser_selection.ie?
            logger.info "return print_window.button(:value => \"&Print\").exists? #{return print_window.button(:value => "&Print").exists?}"
            print_window.activate
            print_window.button(:value => "&Print").exists?
          else
            stop_test "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
          end
        rescue
          false
        end
      end

      def wait_until_present
        5.times do
          break if present?
          sleep 1
        end
      end

      def print
        print_window = RAutomation::Window.new(:title => /Print/i)
        logger.info "Print Window Present? #{print_window.present?}"
        logger.info "Print Window Present? #{print_window.present?}"
        if TestHelper.browser_selection.firefox?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "OK").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present." + e
          end

        elsif TestHelper.browser_selection.chrome?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "&Print").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present." + e
          end

        elsif TestHelper.browser_selection.ie?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "&Print").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present." + e
          end
        else
          stop_test "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
        end
        logger.info "Windows Print Modal: Printing successful."
        sleep 3
      end
    end
  end
end