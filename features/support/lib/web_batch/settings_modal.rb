module Batch

  class SettingsModal < BatchObject
    private

    def checkbox_status_array
      @browser.divs :css => 'div[class*=x-form-type-checkbox]'
    end

    def checkbox_array
      @browser.inputs :css => 'input[id^=checkbox]'
    end

    def drop_down_arrow_array
      @browser.divs :css => 'div[id*=trigger-picker]'
    end

    def selection_array
      @browser.inputs :css => 'input[id*=combobox][class*=x-form-text-default]'
    end

    def save_button
      @browser.span(:text => 'Save')
    end

    def unavailable_services_checkbox
      checkbox_array[1]
    end

    def print_confirm_dialog_checkbox
      checkbox_array[2]
    end

    def save_contacts_checkbox
      checkbox_array[3]
    end

    def shipment_email_checkbox
      checkbox_array[4]
    end

    def shipment_delivery_checkbox
      checkbox_array[5]
    end

    def logoff_time_combo
      drop_down_arrow_array[4]
    end

    def postdate_time_combo
      drop_down_arrow_array[5]
    end

    def balance_notification_combo
      drop_down_arrow_array[6]
    end

    def logoff_time
      selection_array[1]
    end

    def postdate_time
      selection_array[2]
    end

    def balance_notification_amount
      selection_array[3]
    end

    #PUBLIC
    public

    def save_changes
      browser_helper.click save_button
    end

    def select_logoff_time(duration)
      browser_helper.click logoff_time_combo
      browser_helper.click @browser.li :text => duration
    end

    def select_postdate_time(time)
      browser_helper.click postdate_time_combo
      browser_helper.click @browser.li :text => time
    end

    def select_balance_notification(amount)
      browser_helper.click balance_notification_combo
      browser_helper.click @browser.li :text => amount
    end

    def get_logoff_time
      logoff_time.text
    end

    def get_postdate_time
      postdate_time.text
    end

    def get_balance_notification_amt
      balance_notification_amount.text
    end

    def check_unavail_services
      check_settings(1,unavailable_services_checkbox)
      self
    end

    def check_print_confirm_dialog
      check_settings(2,print_confirm_dialog_checkbox)
      self
    end

    def check_save_contacts
      check_settings(3,save_contacts_checkbox)
      self
    end

    def check_shipment_email
      check_settings(4,shipment_email_checkbox)
      self
    end

    def check_shipment_delivery
      check_settings(5,shipment_delivery_checkbox)
      self
    end


    def uncheck_unavail_services
      uncheck_settings(1,unavailable_services_checkbox)
      self
    end

    def uncheck_print_confirm_dialog
      uncheck_settings(2,print_confirm_dialog_checkbox)
      self
    end

    def uncheck_save_contacts
      uncheck_settings(3,save_contacts_checkbox)
      self
    end

    def uncheck_shipment_email
      uncheck_settings(4,shipment_email_checkbox)
      self
    end

    def uncheck_shipment_delivery
      uncheck_settings(5,shipment_delivery_checkbox)
      self
    end

    def check_settings(number,checkbox)

      5.times do
        if box_checked?(number)
          break
        else
          browser_helper.click checkbox
        end
      end
    end

    def get_checkbox_status(number)
      if box_checked?(number)
        true
      else
        false
      end
    end

    def uncheck_settings(number,checkbox)

      5.times do
        if box_checked?(number)
          browser_helper.click checkbox
        else
          break
        end
      end
    end

    def box_checked?(box_row)

      checkbox_status_array[box_row].attribute_value("class").include? 'x-form-cb-checked'

      #@browser.div(:css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(#{box_row})>div>div>div>div>div").attribute_value("class").include? 'x-form-cb-checked'

    end

  end

end