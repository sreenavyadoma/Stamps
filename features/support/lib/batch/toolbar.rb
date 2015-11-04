module Batch
  class OrderGridPagingToolbar < BatchObject
    def present?

    end

    def page_count
      #field=@browser.text_field :css => "input[name^=combobox]"
      #text_box = Textbox.new field
      #log text_box.present?
      #text_box
      divs = @browser.divs :css => "div[id^=tbtext]"
      div = divs.last
      present = browser_helper.present? div
      log "Page count: #{browser_helper.text div}" # of X
      div
    end

    def page_number
      field = @browser.text_field :css => "div[id^=sdc-batch-grid-pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
      text_box = Textbox.new field
      log text_box.present?
      text_box
    end

    def first_page
      field = @browser.span :css => "span[class*=x-tbar-page-first]"
      label = Label.new field
      log label.present?
      label
    end

    def first_page_disabled
      field = @browser.a  :css => "div[id^=sdc-batch-grid-pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def previous_page
      field = @browser.span :css => "span[class*=x-tbar-page-prev]"
      label = Label.new field
      log label.present?
      label
    end

    def previous_page_disabled
      field = @browser.a  :css => "div[id^=sdc-batch-grid-pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def next_page
      field = @browser.span :css => "span[class*=x-tbar-page-next]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page
      field = @browser.span :css => "span[class*=x-tbar-page-last]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page_disabled
      field = @browser.a  :css => "div[id^=sdc-batch-grid-pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.present?
      label
    end

    def total_number_of_pages
      fields = @browser.divs :css => "div[id^=tbtext-]"
      field=fields.last
      label = Label.new field
      log label.present?
      label
      #of 6
      number_str=label.text
      number = number_str.scan /\d+/
      number.last.to_s
    end

    def per_page_dd
      #browser, drop_down_button, selection_field_type, drop_down_input
      buttons = @browser.divs :css => "div[id^=sdc-batch-grid-pagingtoolbar-combo][id$=trigger-picker]"
      drop_down_button = buttons.first
      drop_down_input = @browser.text_field :css => "input[name^=sdc-batch-grid-pagingtoolbar-combo]"
      Dropdown.new @browser, drop_down_button, :li, drop_down_input
    end

  end

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
      checked_rows_cache = order_grid.cache_checked_rows

      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      install_plugin_error = ErrorInstallPlugin.new @browser

      5.times {

        if install_plugin_error.present?
          order_grid.check_rows checked_rows_cache
          install_plugin_error.close
          return nil
        end

        begin
          if error_connecting_to_plugin.present?
            5.times{
              error_connecting_to_plugin.ok
              order_grid.check_rows checked_rows_cache
              break unless error_connecting_to_plugin.present?
            }
          end

          if naws_plugin_error.present?
            5.times{
              naws_plugin_error.ok
              order_grid.check_rows checked_rows_cache
              break unless naws_plugin_error.present?
            }
          end

          return window if window.present?
          order_grid.check_rows checked_rows_cache
          browser_helper.click browser_print_button, "print"
        rescue
          #ignore
        end
      }
    end

    def browser_add_button
      #field =
      #log "Toolbar Add button is #{(browser_helper.present? field)?'present':'NOT present'}"
      Button.new (@browser.spans :text => 'Add').first
    end

    def add
      single_order_form = SingleOrderForm.new @browser
      order_grid = Grid.new @browser
      add_button = Button.new (@browser.spans :text => 'Add').first

      old_grid_row_1_id = order_grid.order_id 1
      log "Grid 1 order ID #{old_grid_row_1_id}"
      20.times do |count|
        begin
          add_button.safe_click
          5.times{
            sleep 1
            #log "#{count} single-order form present?  #{single_order_form.present?}"
            break if single_order_form.present?
          }
          new_id = old_grid_row_1_id != order_grid.order_id(1) && order_grid.order_id(1) == single_order_form.order_id
          log "Old Grid 1 ID: #{old_grid_row_1_id}, New Grid 1 ID: #{order_grid.order_id(1)}, Order Details Order ID:  #{order_grid.order_id(1)} - Add #{(new_id)?"successful":"failed"}"
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
      @print_window ||= PrintWindow.new @browser
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