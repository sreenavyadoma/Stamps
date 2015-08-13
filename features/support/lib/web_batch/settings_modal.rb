module Batch

  class SettingsModal < BrowserObject
    private

    def save_button
      @browser.span(:text => 'Save')
    end

    def unavailable_services_checkbox
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(2)>div>div>div>div>div>div>div>input"
    end

    def print_confirm_dialog_checkbox
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(6)>div>div>div>div>div>div>div>input"
    end

    def save_contacts_checkbox
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(8)>div>div>div>div>div>div>div>input"
    end

    def shipment_email_checkbox
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(12)>div>div>div>div>div>div>div>input"
    end

    def shipment_delivery_checkbox
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(13)>div>div>div>div>div>div>div>input"
    end

    def logoff_time_combo
      @browser.div :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div:nth-child(2)"
    end

    def postdate_time_combo
      @browser.div :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div:nth-child(2)"
    end

    def balance_notification_combo
      @browser.div :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div:nth-child(2)"
    end

    def logoff_time
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(3)>div>div>div>div>div>div>div>div:nth-child(1)>input"
    end

    def postdate_time
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(4)>div>div>div>div>div>div>div>div:nth-child(1)>input"
    end

    def balance_notification_amount
      @browser.input :css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(5)>div>div>div>div>div>div>div>div:nth-child(1)>input"
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
      logoff_time.value
    end

    def get_postdate_time
      postdate_time.value
    end

    def get_balance_notification_amt
      balance_notification_amount.value
    end

    def check_unavail_services
      check_settings(2,unavailable_services_checkbox)
      self
    end

    def check_print_confirm_dialog
      check_settings(6,print_confirm_dialog_checkbox)
      self
    end

    def check_save_contacts
      check_settings(8,save_contacts_checkbox)
      self
    end

    def check_shipment_email
      check_settings(12,shipment_email_checkbox)
      self
    end

    def check_shipment_delivery
      check_settings(13,shipment_delivery_checkbox)
      self
    end


    def uncheck_unavail_services
      uncheck_settings(2,unavailable_services_checkbox)
      self
    end

    def uncheck_print_confirm_dialog
      uncheck_settings(6,print_confirm_dialog_checkbox)
      self
    end

    def uncheck_save_contacts
      uncheck_settings(8,save_contacts_checkbox)
      self
    end

    def uncheck_shipment_email
      uncheck_settings(12,shipment_email_checkbox)
      self
    end

    def uncheck_shipment_delivery
      uncheck_settings(13,shipment_delivery_checkbox)
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
      @browser.div(:css => "body>div[id^=userprefswindow]>div:nth-child(2)>div>div>div>div>div:nth-child(#{box_row})>div>div>div>div>div").attribute_value("class").include? 'x-form-cb-checked'

    end

  end

end