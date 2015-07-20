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

    def print
      printer_window = PrintWindow.new(@browser)
      #return if print window is already present
      if printer_window.present?
        return printer_window
      end

      order_errors_window = PrintWindowOrderErrors.new(@browser)
      #return if order errors windows is already present
      if order_errors_window.present?
        return order_errors_window
      end

      naws_plugin_issue = NawsPluginError.new(@browser)
      5.times {
        break if printer_window.x_button_present?
        begin
          browser_helper.click print_button, "print"
          if naws_plugin_issue.present?
            naws_plugin_issue.print_error_message.okay
          end
        rescue
          #ignore
        end
      }
      if printer_window.present?
        printer_window
      else order_errors_window.present?
        order_errors_window
      end
    end

    def add
      add_field.when_present.click
      3.times do
        @order_id = order_id(1)
        break unless @order_id.size == 0
      end
      @order_id
    end

    def wait_until_present
      add_field.wait_until_present
    end

    def present?
      browser_helper.field_present?  add_field
    end
  end
end