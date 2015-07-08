module Batch
  #require_relative 'grid'

  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject
    include GridCommon
    private
    def add_field
      @browser.span :text => 'Add'
    end

    def print_button
      @browser.elements(:text => 'Print').first
    end

    public
    def print(*args)
      printer_window = PrintWindow.new(@browser)
      7.times {
        break if printer_window.present?
        begin
          browser_helper.click print_button, "print_button"
          if Stamps.browser.chrome?
            plugin_error = @browser.span :text => 'OK'
            begin
              browser_helper.click plugin_error, "plugin_error_ok" if browser_helper.present? plugin_error
            rescue
              #ignore
            end
          end
        rescue
          #ignore
        end
      }
      printer_window.print_options *args
    end

    def add
      add_field.when_present.click
      3.times do
        Batch.order_id = order_id(1)
        unless Batch.order_id.size == 0
          break
        end
      end
    end

    def wait_until_present
      add_field.wait_until_present
    end

    def present?
      browser_helper.field_present?  add_field
    end
  end

end