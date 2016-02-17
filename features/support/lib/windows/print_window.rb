module Windows
  class PrintWindow
    def initialize browser
      @browser_type = browser
    end

    def present?
      print_window = RAutomation::Window.new(:title => /Print/i)
      begin
        case @browser_type
          when :firefox
            print_window.button(:value => "OK").exists?
          when :chrome
            print_window.button(:value => "&Print").exists?
          when :ie
            print_window.button(:value => "&Print").exists?
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
      case @browser_type
        when :firefox
          wait_until_present
          raise "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "OK").click
        when :chrome
          wait_until_present
          raise "Print Window is not open" unless present?
          print_window.activate
          print_window.button(:value => "&Print").click
        when :ie
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