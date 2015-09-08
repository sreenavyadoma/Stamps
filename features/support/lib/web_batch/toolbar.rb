module Batch
  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject

    def browser_settings_button
      ClickableField.new @browser.span :css => 'span[class*=sdc-btn-settings]'
    end

    def browser_print_button
      button1 = @browser.elements(:text => 'Print').first
      button1_present = browser_helper.present? button1
      button2 = @browser.elements(:text => 'Print').last
      button2_present = browser_helper.present? button2
      xbutton = (button1_present)? button1 : (button2_present) ? button2 : nil
      xbutton
    end

    def open_print_window window
      order_grid = Grid.new @browser
      checked_rows_hash = order_grid.checked_rows
      browser_helper.click browser_print_button, "print"
      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      install_plugin_error = ErrorInstallPlugin.new @browser

      10.times {

        if install_plugin_error.present?
          order_grid.check_rows checked_rows_hash
          install_plugin_error.close
          return nil
        end

        begin
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              order_grid.check_rows checked_rows_hash
              break unless error_connecting_to_plugin.present?
            }
          end

          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              order_grid.check_rows checked_rows_hash
              break unless naws_plugin_error.present?
            }
          end

          return window if window.present?
          order_grid.check_rows checked_rows_hash
          browser_helper.click browser_print_button, "print"
        rescue
          #ignore
        end
      }
    end

    def browser_add_button
      field = ClickableField.new @browser.span :text => 'Add'
      log "Toolbar Add button is #{(field.present?)?'present':'NOT present'}"
      field
    end

    def add
      single_order_form = SingleOrderForm.new @browser
      20.times do |count|
        begin
          browser_helper.click browser_add_button, 'Add'
          log "#{count} Single Order Form present?  #{single_order_form.present?}"
          sleep 1
          return single_order_form if single_order_form.present?
        rescue
          #ignore
        end
      end
      raise "Unable to I Add a new orders!"
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

    def wait_until_present
      begin
        browser_add_button.wait_until_present 15
      rescue
        #ignroe
      end

    end

    def present?
      browser_helper.present? browser_add_button
    end

    def settings_modal
      SettingsModal.new(@browser)
    end

    def open_settings
      sleep 1
      browser_settings_button.click
    end
  end
end