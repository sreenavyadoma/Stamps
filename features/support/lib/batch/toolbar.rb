module Batch

  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BatchObject

    def browser_settings_button
      Button.new (@browser.span :css => "span[class*=sdc-icon-settings]")
    end

    def browser_print_button
      button1 = @browser.elements(:text => 'Print').first
      button1_present = browser_helper.present? button1
      button2 = @browser.elements(:text => 'Print').last
      button2_present = browser_helper.present? button2
      xbutton = (button1_present)? button1 : (button2_present) ? button2 : nil
      xbutton
    end

    def click_print_button
      browser_helper.click browser_print_button
    end

    def usps_intl_terms
      USPSTermsModal.new @browser
    end

    def open_window window
      return window if window.present?

      browser_helper.click browser_print_button, "print"

      usps_terms = USPSTermsModal.new @browser

      if usps_terms.is_usps_terms_modal_present
        usps_terms.check_dont_show_again_checkbox
        usps_terms.click_i_agree_button
      end

      order_grid = Grid.new @browser
      checked_rows_cache = order_grid.checkbox.checked_rows

      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      install_plugin_error = ErrorInstallPlugin.new @browser

      5.times {

        if install_plugin_error.present?
          order_grid.checkbox.check_all checked_rows_cache
          install_plugin_error.close
          return nil
        end

        begin
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              order_grid.checkbox.check_all checked_rows_cache
              break unless error_connecting_to_plugin.present?
            }
          end

          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              order_grid.checkbox.check_all checked_rows_cache
              break unless naws_plugin_error.present?
            }
          end

          return window if window.present?
          order_grid.checkbox.check_all checked_rows_cache
          browser_helper.click browser_print_button, "print"
        rescue
          #ignore
        end
      }
    end

    def browser_add_button
      Button.new (@browser.spans :text => 'Add').first
    end

    def add
      single_order_form = OrderDetails.new @browser
      grid = Grid.new @browser
      add_button = Button.new (@browser.spans :text => 'Add').first

      old_grid_row_1_id = grid.order_id.row 1
      log.info "Row 1 Order ID #{old_grid_row_1_id}"
      20.times do |count|
        begin
          add_button.safe_click
          5.times{
            sleep 1
            log.info "#{count} Order Details form  #{(single_order_form.present?)?'not present':'is present'}"
            break if single_order_form.present?
            break if single_order_form.present?
            break if single_order_form.present?
          }
          new_id = old_grid_row_1_id != grid.order_id.row(1) && grid.order_id.row(1) == single_order_form.order_id
          log.info "Add #{(new_id)?"successful!":"failed!"}  -  Old Grid 1 ID: #{old_grid_row_1_id}, New Grid 1 ID: #{grid.order_id.row(1)}, Order Details Order ID:  #{grid.order_id.row(1)}"
          return single_order_form if new_id
        rescue
          #ignore
        end
      end
      raise "Unable to I Add a new orders!" unless single_order_form.present?
    end

    def print_expecting_error *args
      error_window = OrderErrors.new(@browser)
      open_window error_window
      case args.length
        when 0
          error_window
        when 1
          error_window.error_message.include? error_message
        else
          raise "Illegal number of arguments."
      end
    end

    def is_print_button_present
      print_button.present?
    end

    def is_browser_print_button_present
      browser_helper.present? browser_print_button
    end

    def print_invalid_address
      open_window InvalidAddressError.new(@browser)
    end

    def print_modal
      @print_window ||= PrintModal.new @browser
      open_window @print_window
    end

    def wait_until_present
      begin
        browser_add_button.wait_until_present 15
      rescue
        #ignroe
      end

    end

    def present?
      browser_add_button.present?
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