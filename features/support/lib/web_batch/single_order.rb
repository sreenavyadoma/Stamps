module Batch

  class ViewRestrictions < BatchObject
    def browser_ok_button
      Button.new @browser.span :text => "OK"
    end

    def present?
      browser_ok_button.present?
    end

    def ok
      browser_ok_button.safe_click
    end
  end

  class CustomsFields < BatchObject

    def browser_edit_form_button
      Button.new @browser.span :text => "Edit Form..."
    end

    def edit_form
      @customs_form = CustomsForm.new @browser
      edit_form_button = browser_edit_form_button
      5.times{
        browser_helper.safe_click edit_form_button
        break if @customs_form.present?
      }
      raise "Customs Information Modal is not visible." unless @customs_form.present?
      @customs_form
    end

    def browser_restrictions_button
      Button.new @browser.span :text => "Restrictions..."
    end

    def restrictions
      restrictions_button = browser_restrictions_button
      view_restrictions = ViewRestrictions.new @browser
      5.times{
        restrictions_button.safe_click
        if view_restrictions.present?
          return view_restrictions
        end
      }
      nil
    end

  end

  class SingleOrderFormLineItem < BatchObject
    def remove_field
      @browser.span :css => "span[class*=sdc-icon-remove]"
    end

    public

    def present?
      browser_helper.present? remove_field
    end

    def wait_until_present
      browser_helper.wait_until_present remove_field
    end

    def delete_line *args
      browser_fields = @browser.spans :css => "span[class*=sdc-icon-remove]"
      browser_fields
      browser_field = browser_fields
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def qty *args
      browser_field = Textbox.new @browser.text_field :name => "Quantity"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def id *args
      browser_field = Textbox.new @browser.text_field :name => "Sku"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def description *args
      browser_field = Textbox.new @browser.text_field :name => "ItemName"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end
  end

  class SingleOrderFormBase < BatchObject

    def ship_cost_span
      span = @browser.span :text => "Ship Cost"
      log "Single Order Form is #{(browser_helper.present? span)?'present':'NOT present'}"
      span
    end

    def order_id_label
      @browser.label :css => "div[id^=orderDetailsPanel]>div[id^=singleOrderDetailsForm]>div>div[id^=container]>div>div:nth-child(1)>div>div>div>div>div>label:nth-child(1)"
    end

    def order_id
      5.times{
        begin
          order_id_str = browser_helper.text order_id_label
          break if order_id_str.include? 'Order #'
        rescue
          #ignroe
        end
      }
      begin
        order_id_label.wait_until_present
      rescue
        log "Single Order Form Order ID label was not present"
      end
      #(browser_helper.text order_id_label).split('Order #').last
      order_id_str = browser_helper.text order_id_label
      order_id = order_id_str.split('Order #').last
      order_id
    end

    def order_status_label
      @browser.label :css => "div[id^=orderDetailsPanel]>div[id^=singleOrderDetailsForm]>div>div[id^=container]>div>div>div>div>label"
    end

    def order_status
      browser_helper.text order_status_label, 'order_status'
    end

    def single_order_form_present
      browser_helper.present? order_id_label
    end

    def less
      browser_helper.click less_dropdown, "Less" if browser_helper.present?  less_dropdown
    end

    def item_label
      @browser.label :text => 'Item:'
    end

    def click_item_label
      3.times {
        begin
          item_label.click
        rescue
          #ignore
        end
      }
    end

    def validate_address_link
      @browser.span :text => 'Validate Address'
    end
  end

  #
  #  Single Order Edit Form
  #
  class SingleOrderForm < SingleOrderFormBase

    private

    def address_textbox
      Textbox.new @browser.textarea :name => 'FreeFormAddress'
    end

    def service_textbox
      @browser.text_field :css => "input[componentid^=servicedroplist]"
    end

    def insurance_cost_label
      @browser.label :css => 'label[class*=insurance_cost]'
    end

    def ship_from_dropdown
      @browser.div :css => "div[id^=shipfromdroplist][class*=x-form-arrow-trigger-default]"
    end

    def ship_from_default_selection
      @browser.div :css => 'div[data-recordindex=\'0\']'
    end

    def height_textbox
      @browser.text_field :name => 'Height'
    end

    def country_textbox
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div>input'
    end

    def country_dropdown
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div:nth-child(2)'
    end

    def service_postcard_field
      @browser.td :text => 'Postcard'
    end

    def tracking_dropdown
      @browser.div :css => 'div[id^=trackingdroplist-][id$=-trigger-picker]'[0]
    end

    def tracking_usps_selection
      @browser.td :text => 'USPS Tracking'
    end

    def tracking_textbox
      @browser.text_field :name => 'Tracking'
    end

    def service_cost_label
      #@browser.label(:text => 'Service:').element(:xpath => './following-sibling::*[2]')
      @browser.label(:css => 'label[class*=selected_service_cost]')
    end

    def tracking_cost_label
      @browser.label(:css => 'label[class*=selected_tracking_cost]')
    end

    def total_label
      @browser.label(:text => 'Total').parent.labels.last
    end

    #Auto Suggest Elements

    def auto_suggest_name_array
      @browser.divs :css => 'div[class*=main-title]'
    end

    def auto_suggest_location_array
      @browser.divs :css => 'div[class*=sub-title]'
    end

    public

    def initialize browser
      super browser
      @services ||= Hash.new
    end

    def international
      @international_shipping ||= InternationalShipping.new @browser
    end

    def customs_form
      @customs_form ||= CustomsForm.new @browser
    end

    def customs
      CustomsFields.new @browser
    end

    def ship_to_dd
      domestic = @browser.div :css => "div[id=shiptoview-domestic-innerCt]>div:nth-child(1)>div>div>div:nth-child(1)>div>div>div:nth-child(2)"
      international = @browser.div :css => "div[id=shiptoview-international-innerCt]>div:nth-child(1)>div>div>div:nth-child(1)>div>div>div:nth-child(2)"
      if browser_helper.present? domestic
        dd = domestic
      elsif browser_helper.present? international
        dd = international
      end
      raise "Single Order Form Country drop-down is not present.  Check your CSS locator." unless browser_helper.present? dd
      text_fields = @browser.text_fields :name => "CountryCode"
      domestic_input = text_fields.first
      international_input = text_fields[1]
      if browser_helper.present? domestic_input
        input = domestic_input
      elsif browser_helper.present? international_input
        input = international_input
      end

      raise "Single Order Form Country textbox is not present.  Check your CSS locator." unless browser_helper.present? input
      Dropdown.new @browser, dd, "li", input
    end

    def browser_ship_to_dd_button
      Link.new(@browser.link :css => "div[id=shiptoview-addressCollapsed-targetEl]>a")
    end

    def add_item
      add_item = Link.new(@browser.span :text => "Add Item")
      log "Add Item Button #{(browser_helper.present? add_item)?"Exist!":'DOES NOT EXIST!'}"
      add_item

      line_item = SingleOrderFormLineItem.new @browser
      5.times{
        add_item.safe_click
        line_item.wait_until_present
        break if line_item.present?
      }
      line_item
    end

    def service(selection)
      log_param "Service Selection", selection
      @service_cost = ServiceSelection.new(@browser, selection).select
    end

    def service_inline_cost
      @service_cost
    end

    def service_input_text
      browser_helper.text service_textbox, 'service'
    end

    def tracking=(selection)
      begin
        log_param "Tracking Selection", selection
        TrackingSelection.new(@browser, selection).select
      end unless selection.length == 0
    end

    def tracking
      browser_helper.text tracking_textbox, 'Tracking'
    end

    def service_cost
      10.times{
        begin
          cost = service_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(service_cost_label, 'service'))
    end

    def insurance_cost
      10.times{
        begin
          cost = insurance_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(insurance_cost_label,'insurance'))
    end

    def tracking_cost
      10.times{
        begin
          cost = tracking_cost_label.text
        rescue
          #ignore
        end
        break unless cost.include? "0.00"
      }
      test_helper.remove_dollar_sign(browser_helper.text(tracking_cost_label, 'tracking'))
    end

    def total
      test_helper.remove_dollar_sign(browser_helper.text(total_label, "total"))
    end

    def total_amount_calculation
      total_cost = self.total
      log total_cost
      # @correct = will add service price + insure for + tracking

    end

    def correct?
      @correct
    end

    def present?
      (Label.new @browser.label :text => "Ship From:").present?
    end

    def wait_until_present
      (Label.new @browser.label :text => "Ship From:").wait_until_present
    end

    def edit_details(data = {})
      #self.weight = {}
      log_hash_param data
      self.insured_value.set data[:insured_value]
      self.lbs.set data[:lbs]
      self.oz.set data[:oz]
      self.length.set data[:@length]
      self.width.set data[:width]
      self.height.set data[:height]
    end

    def weight=(data={})
      log_hash_param data
      self.lbs.set data[:lbs]
      self.oz.set data[:oz]
    end

    def email
      click_item_label
      textbox = Textbox.new @browser.text_field :name => 'Email'
      expand_ship_to
      textbox
    end

    def phone
      click_item_label
      textbox = Textbox.new @browser.text_field :name => 'Phone'
      expand_ship_to
      textbox
    end

    def dimensions=(data={})
      log_hash_param data
      self.length.set data[:@length]
      self.width.set data[:width]
      self.height.set data[:height]
    end

    def oz
      click_item_label
      Textbox.new @browser.text_field :name => 'WeightOz'
    end

    def lbs
      click_item_label
      Textbox.new @browser.text_field :name => 'WeightLbs'
    end

    def insured_value
      click_item_label
      Textbox.new @browser.text_field :name => "InsuranceAmount"
    end

    def length
      click_item_label
      Textbox.new @browser.text_field :name => 'Length'
    end

    def width
      click_item_label
      Textbox.new @browser.text_field :name => 'Width'
    end

    def height
      click_item_label
      Textbox.new @browser.text_field :name => 'Height'
    end

    def less_dropdown
      @browser.span :text => 'Less'
    end

    def expand_ship_to
      textbox = Textbox.new @browser.textarea :name => 'FreeFormAddress'
      dd = browser_ship_to_dd_button
      5.times {
        break if textbox.present?
        dd.safe_click
      }
    end

    def ship_to *args
      text_area = Textbox.new @browser.textarea :name => 'FreeFormAddress'
      case args.length
        when 0
          expand_ship_to
          return text_area
        when 1
          expand_ship_to
          text_area.set BatchHelper.instance.format_address(args[0])
          if args[0].is_a? Hash
            self.phone.set args[0]["phone"]
            self.email.set args[0]["email"]
          end
          AddressNotFound.new(@browser)
        else
          raise "Wrong number of arguments for ship_to"
      end
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_selection selection
      @browser.div :text => selection
    end

    def ship_from selection
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
      if selection.downcase.eql? "default"
        ship_from_dropdown.when_present.click
        ship_from_default_selection.click
        click_item_label
      else
        5.times {
          begin
            break if @manage_shipping_adddress.present?
            browser_helper.click ship_from_dropdown, "ship_from_selection.[#{selection}]" unless browser_helper.present?  ship_from_selection(selection)
            browser_helper.click ship_from_selection(selection), selection
          rescue
            #ignore
          end
          click_item_label
        }
        @manage_shipping_adddress
      end
    end

    def manage_shipping_address
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
    end

    def manage_shipping_addresses
      self.ship_from "Manage Shipping Addresses..."
    end

    def pounds_max_value
      pounds_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
    end

    def pounds_qtip_error_displayed?(message) # "The maximum value for this field is 70"
      pounds_qtip_error.include?(message)
    end

    def pounds_qtip_error
      pounds_textbox.attribute_value('data-errorqtip')
    end

    def ounces_qtip_error
      ounces_textbox.attribute_value('data-errorqtip')
    end

    def ounces_max_value
      ounces_qtip_error.scan(/The maximum value for this field is ([^>]*)<\/li><\/ul>/).last.first
    end

    def ounces_qtip_error_displayed?(message) # "The maximum value for this field is 70"
      ounces_qtip_error.include?(message)
    end

    def service_default_text
      service_textbox.attribute_value("placeholder")
    end

    def country
      country_textbox.attribute_value('value')
    end

    def click_auto_suggest_name index
      browser_helper.click auto_suggest_name_array[index.to_i-1]
    end

    def get_address_text
      browser_helper.text address_textbox
    end

    def get_email_text
      browser_helper.text email
    end

    def get_phone_text
      browser_helper.text phone
    end

    def get_auto_suggest_name index
      auto_suggest_name_array[index.to_i-1].text
    end

    def get_auto_suggest_location index
      auto_suggest_location_array[index.to_i-1].text
    end


  end #SingleOrderEdit Module
end