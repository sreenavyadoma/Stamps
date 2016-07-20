module Stamps
  module Windows
    class PrintWindow
      include RAutomation

      def present?
        print_window = RAutomation::Window.new(:title => /Print/i)
        begin
          if TestHelper.browser.firefox?
            return print_window.button(:value => "OK").exists?
          elsif TestHelper.browser.chrome?
            return print_window.button(:value => "&Print").exists?
          elsif TestHelper.browser.ie?
            return print_window.button(:value => "&Print").exists?
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
        if TestHelper.browser.firefox?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "OK").click
        elsif TestHelper.browser.chrome?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "&Print").click
        elsif TestHelper.browser.ie?
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "&Print").click
        else
          stop_test "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
        end
      end
    end
  end
end