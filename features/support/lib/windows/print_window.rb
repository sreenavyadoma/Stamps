module Stamps
  module Windows
    class PrintWindow
      include RAutomation

      attr_reader :browser

      def initialize(browser)
        @browser = browser
      end

      def present?
        print_window = RAutomation::Window.new(:title => /Print/i)
        logger.info "Print Window Present? #{print_window.present?}"
        begin
          if browser == :firefox
            print_window.activate
            print_window.button(:value => "OK").exists?
          elsif browser == :chrome
            print_window.activate
            print_window.button(:value => "&Print").exists?
          elsif browser == :ie
            print_window.activate
            print_window.button(:value => "&Print").exists?
          else
            expect("Invalid browser selection.  #{browser} is not recognized.  User :firefox, :chrome or :ie").to eql ""
          end
        rescue
          false
        end
      end

      def wait_until_present
        5.times do
          break if present?
          sleep(0.35)
        end
      end

      def print
        print_window = RAutomation::Window.new(:title => /Print/i)
        logger.info "Print Window Present? #{print_window.present?}"
        if browser == :firefox
          wait_until_present
          expect("Print Window is not open").to eql "" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "OK").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present.\n#{e.backtrace.join "\n"}"
          end

        elsif browser == :chrome
          wait_until_present
          expect("Print Window is not open").to eql "" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "&Print").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present." + e
          end

        elsif browser == :ie
          wait_until_present
          expect("Print Window is not open").to eql "" unless present?
          print_window.activate
          print_window.activate

          begin
            print_window.button(:value => "&Print").click
          rescue RAutomation::WaitHelper::TimeoutError => e
            logger.error e.backtrace.join "\n"
            raise "Unable to click on OK button in Windows Print dialog. Windows print modal might not have been present." + e
          end
        else
          expect("Invalid browser selection.  #{browser} is not recognized.  User :firefox, :chrome or :ie").to eql ""
        end
        logger.info "Windows click print modal print buttoning successful."
        sleep(3)
      end
    end
  end
end