module Stamps
  module Windows
    class OpenFile
      def present?
        begin
          if TestHelper.browser.firefox?
            exist = RAutomation::Window.new(:title => /File Upload/i).exists?
            return exist
          elsif TestHelper.browser.chrome?
            exist = RAutomation::Window.new(:title => /&Open/i).exists?
            return exist
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

      def file_name filename
        if Browser.firefox?
          print_window = RAutomation::Window.new(:title => /File Upload/i)
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate

          print_window.text_field(class: "Edit", :index => 0).set filename

          print_window.button(:value => "&Open").click

          #todo fix TestHelper.browser
        elsif TestHelper.browser.chrome?
          print_window = RAutomation::Window.new(:title => /&Open/i)
          wait_until_present
          stop_test "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "&Open").click
        else
          stop_test "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
        end
      end
    end
  end
end