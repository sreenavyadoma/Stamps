module Batch
  #require_relative 'grid'

  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject
    include GridBase
    private
    def add_field
      @browser.span :text => 'Add'
    end

    def print_button
      button1 = @browser.elements(:text => 'Print').first
      button1_present = browser_helper.field_present? button1
      button2 = @browser.elements(:text => 'Print').last
      button2_present = browser_helper.field_present? button2
      xbutton = (button1_present)? button1 : (button2_present) ? button2 : nil
      xbutton
    end

    def open_print_window window
      browser_helper.click print_button, "print"
      naws_plugin_issue = NawsPluginError.new(@browser)
      15.times {
        begin
          window.wait_until_present
          if window.present?
            return window
          end
          if naws_plugin_issue.present?
            naws_plugin_issue.print_error_message.okay
          end
        rescue
          #ignore
        end
      }
      window
    end

    public

    def print_expecting_errors
      open_print_window OrderErrors.new(@browser)
    end

    def print_expecting_invalid_address
      open_print_window InvalidAddressError.new(@browser)
    end

    def print_expecting_indicium_error
      open_print_window IndiciumError.new(@browser)
    end

    def print_window
      open_print_window PrintWindow.new(@browser)
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