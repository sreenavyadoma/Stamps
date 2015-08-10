module Batch
  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject
    private

    def print_button
      button1 = @browser.elements(:text => 'Print').first
      button1_present = browser_helper.present? button1
      button2 = @browser.elements(:text => 'Print').last
      button2_present = browser_helper.present? button2
      xbutton = (button1_present)? button1 : (button2_present) ? button2 : nil
      xbutton
    end

    def open_print_window window
      checked_orders = checked_rows
      browser_helper.click print_button, "print"
      order_grid = Grid.new @browser
      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      30.times {
        begin
          sleep(1)
          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              break unless naws_plugin_error.present?
              order_grid.check_orders checked_orders
            }
          end
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              break unless error_connecting_to_plugin.present?
              check_orders checked_orders
            }
          end
          check_rows checked_orders

          return window if window.present?

          browser_helper.click print_button, "print"
        rescue
          #ignore
        end
      }
      nil
    end

    public
    def add_button
      span = @browser.span :text => 'Add'
      log "Toolbar Add button is #{(browser_helper.present? span)?'present':'NOT present'}"
      span
    end

    def print_expecting_error *args
      error_window = OrderErrors.new(@browser)
      open_print_window error_window
      case args.length
        when 0
          error_window
        when 1
          error_window.error_message.include? error_message
        else
          raise "Illegal number of arguments."
      end
    end

    def print_invalid_address
      open_print_window InvalidAddressError.new(@browser)
    end

    def print
      open_print_window PrintWindow.new @browser
    end

    def add
      single_order_form = SingleOrderForm.new @browser
      20.times do |count|
        begin
          browser_helper.click add_button, 'Add'
          log "#{count} Single Order Form present?  #{single_order_form.present?}"
          sleep 1
          return single_order_form if single_order_form.present?
        rescue
          #ignore
        end
      end
      raise "Unable to add new orders!"
    end

    def wait_until_present
      begin
        add_button.wait_until_present 15
      rescue
        #ignroe
      end

    end

    def present?
      browser_helper.present? add_button
    end
  end
end