module Windows
  class PrintWindow
    def present?
      print_window = RAutomation::Window.new(:title => /Print/i)
      begin
        if Test.browser.firefox?
          return print_window.button(:value => "OK").exists?
        elsif Test.browser.chrome?
          return print_window.button(:value => "&Print").exists?
        elsif Test.browser.ie?
          return print_window.button(:value => "&Print").exists?
        else
          raise "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
        end
      rescue
        false
      end
    end

    def wait_until_present
      3.times do
        break if present?
        sleep 1
      end
    end

    def print
      print_window = RAutomation::Window.new(:title => /Print/i)
      if Test.browser.firefox?
        wait_until_present
        raise "Print Window is not open" unless present?
        print_window.activate
        print_window.button(:value => "OK").click
      elsif Test.browser.chrome?
        wait_until_present
        raise "Print Window is not open" unless present?
        print_window.activate
        print_window.button(:value => "&Print").click
      elsif Test.browser.ie?
        wait_until_present
        raise "Print Window is not open" unless present?
        print_window.activate
        print_window.button(:value => "&Print").click
      else
        raise "Invalid browser selection.  #{@browser_type} is not recognized.  User :firefox, :chrome or :ie"
      end
    end
  end
end