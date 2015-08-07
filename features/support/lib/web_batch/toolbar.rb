module Batch
  #
  #  Contains Add/Edit buton for orders.
  #
  class Toolbar < BrowserObject
    private
    def add_field
      @browser.span :text => 'Add'
    end

    def print_button
      button1 = @browser.elements(:text => 'Print').first
      button1_present = browser_helper.present? button1
      button2 = @browser.elements(:text => 'Print').last
      button2_present = browser_helper.present? button2
      xbutton = (button1_present)? button1 : (button2_present) ? button2 : nil
      xbutton
    end

    def open_print_window window
      naws_plugin_error = NawsPluginError.new @browser
      error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
      5.times {
        begin
          browser_helper.click print_button, "print"
          sleep(1)
          naws_plugin_error.ok if naws_plugin_error.present?
          error_connecting_to_plugin.ok if error_connecting_to_plugin.present?
          if window.present?
            return window
          end
        rescue
          #ignore
        end
      }
      raise "Unable to open Print Window.  Naws Plugin Error? #{naws_plugin_error.present?} Error Connecting to Plugin? #{error_connecting_to_plugin.present?} "
    end

    public

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
      3.times do
        begin
          browser_helper.click add_field, 'Add'
          begin
            browser_helper.wait_until_present single_order_form.order_id_label
            browser_helper.wait_until_present single_order_form.order_status_label
          rescue
            #ignore
          end
          break if single_order_form.present?
        rescue
          #ignore
        end
      end
      log "New Order ID created:  #{single_order_form.order_id}"
      single_order_form
    end

    def wait_until_present
      begin
        add_field.wait_until_present 15
      rescue
        #ignroe
      end

    end

    def present?
      browser_helper.present? add_field
    end
  end
end