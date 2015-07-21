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

    def click_print window
      naws_plugin_issue = NawsPluginError.new(@browser)
    15.times {
      begin
        if window.present?
          return window
        end
        browser_helper.click print_button, "print"
        if naws_plugin_issue.present?
          naws_plugin_issue.print_error_message.okay
        end
        window.wait_until_present
      rescue
        #ignore
      end
    }
    end

    public
    def print_expecting_rating_error
      print_window = PrintWindow.new(@browser)
      click_print print_window
      print_window.print
    end

    def print
      click_print PrintWindow.new(@browser)
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