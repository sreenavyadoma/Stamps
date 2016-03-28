module Windows
  class OpenFile
    def present?
      begin
        if Test.browser.firefox?
          exist = RAutomation::Window.new(:title => /File Upload/i).exists?
          return exist
        elsif Test.browser.chrome?
          exist = RAutomation::Window.new(:title => /&Open/i).exists?#
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
      if Test.browser.firefox?
        print_window = RAutomation::Window.new(:title => /File Upload/i)
        wait_until_present
        stop_test "Print Window is not open" unless present?
        print_window.activate

        print_window.text_field(:class => "Edit", :index => 0).set filename

        print_window.button(:value => "&Open").click
=begin
        if print_window.button(:value => "OK").exists?
          print_window.button(:value => "OK").click
          stop_test "Invalid Filename: #{filename}}.  Check your test"
        end
=end
      elsif Test.browser.chrome?
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