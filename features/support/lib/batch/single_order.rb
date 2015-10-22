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
      links = @browser.links :css => "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>a"
      Link.new links.first
    end

    def edit_form
      @customs_form = CustomsForm.new @browser
      edit_form_button = browser_edit_form_button
      20.times{
        edit_form_button.safe_click
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

  class OrderDetails < BatchObject
    def click_form
      item_label = Label.new @browser.label :text => 'Item:'
      10.times {
        begin
          item_label.safe_click
        rescue
          #ignore
        end
      }
    end
  end

  class Tracking < OrderDetails

    private

    def textbox
      Textbox.new @browser.text_field :name => 'Tracking'
    end

    def drop_down
      Button.new @browser.div :css => "div[id^=trackingdroplist-][id$=-trigger-picker]"
    end

    public

    def text
      textbox.text
    end

    def select selection
      box = textbox
      button = drop_down
      selection_label = Label.new @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.safe_click
          click_form
          break if box.text.include? selection
        rescue
          #ignore
        end
      }
      selection_label
    end

    def cost selection
      button = drop_down
      selection_label = @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            selection_cost = selection_label.parent.tds[1].text
            log "#{selection_cost}"
            return selection_cost
          end
        rescue
          #ignore
        end
      }
    end

    def data_qtip selection
      button = drop_down
      selection_label = @browser.td :text => selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            qtip = selection_label.parent.parent.parent.parent.attribute_value "data-qtip"
            log "#{qtip}"
            return qtip
          end
        rescue
          #ignore
        end
      }
    end

  end

  class Service < OrderDetails

    private

    def textbox
      Textbox.new @browser.text_field :css => "input[name^=servicedroplist]"
    end

    def drop_down
      Button.new @browser.div :css => "div[id^=servicedroplist][id$=trigger-picker][class*=arrow-trigger-default]"
    end

    def field selection
      @browser.tr :css => "tr[data-qtip*='#{selection}']"
    end

    def selection_field selection
      field(selection).tds[1]
    end

    def selection_cost_field selection
      field(selection).tds[2]
    end

    public

    def text
      textbox.text
    end

    def select selection
      box = textbox
      button = drop_down
      button.safe_click
      button.safe_click
      button.safe_click
      selection_label = Label.new(selection_field(selection))
      5.times {
        begin
          button.safe_click unless selection_label.present?
          selection_label.safe_click
          click_form
          break if box.text.include? selection
        rescue
          #ignore
        end
      }
      selection_label
    end

    def cost selection
      button = drop_down
      button.safe_click
      button.safe_click
      button.safe_click
      cost_label = Label.new(selection_cost_field(selection))
      10.times {
        begin
          if cost_label.present?
            selection_cost = test_helper.remove_dollar_sign cost_label.text
            log "#{selection_cost}"
            return selection_cost
          else
            button.safe_click
          end
        rescue
          #ignore
        end
      }
    end

    def data_qtip selection
      button = drop_down
      selection_label = Label.new field selection
      5.times {
        begin
          button.safe_click unless selection_label.present?
          if selection_label.present?
            qtip = selection_label.attribute_value "data-qtip"
            log "#{qtip}"
            return qtip
          end
        rescue
          #ignore
        end
      }
    end

  end


  #
  #  Single Order Edit Form
  #
  class SingleOrderForm < OrderDetails

    def service
      Service.new @browser
    end

    def tracking
      Tracking.new @browser
    end

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

    def height_textbox
      @browser.text_field :name => 'Height'
    end

    def country_textbox
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div>input'
    end

    def country_dropdown
      @browser.div :css => 'div[data-ref=triggerWrap][id^=combobox-][id$=-triggerWrap]>div:nth-child(2)'
    end

    def tracking_dropdown
      @browser.div :css => 'div[id^=trackingdroplist-][id$=-trigger-picker]'[0]
    end

    def tracking_usps_selection
      @browser.td :text => 'USPS Tracking'
    end

    def textbox
      @browser.text_field :name => 'Tracking'
    end

    def service_cost_label
      #@browser.label(:text => 'Service:').element(:xpath => './following-sibling::*[2]')
      @browser.label(:css => 'label[class*=selected_service_cost]')
    end

    def tracking_cost_label
      @browser.label(:css => 'label[class*=selected_tracking_cost]')
    end

    #Auto Suggest Elements

    def auto_suggest_name_array
      @browser.divs :css => 'div[class*=main-title]'
    end

    def auto_suggest_location_array
      @browser.divs :css => 'div[class*=sub-title]'
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

    def ship_to_country
      dd_divs = @browser.divs :css => "div[id^=combo-][id$=-trigger-picker]"
      domestic_drop_down_btn = dd_divs.first
      international_drop_down_btn = dd_divs.last

      if browser_helper.present? domestic_drop_down_btn
        dd = domestic_drop_down_btn
      elsif browser_helper.present? international_drop_down_btn
        dd = international_drop_down_btn
      end

      raise "Single Order Form Country drop-down is not present.  Check your CSS locator." unless browser_helper.present? dd
      text_fields = @browser.text_fields :name => "CountryCode"
      domestic_input = text_fields.first
      international_input = text_fields.last
      if browser_helper.present? domestic_input
        input = domestic_input
      elsif browser_helper.present? international_input
        input = international_input
      end

      raise "Single Order Form Country textbox is not present.  Check your CSS locator." unless browser_helper.present? input
      Dropdown.new @browser, dd, :li, input
    end

    def add_item
      add_item = Link.new @browser.span :text => "Add Item"
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

    def service_inline_cost
      @service_cost
    end

    def service_input_text
      browser_helper.text service_textbox, 'service'
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
      total_label = Label.new @browser.labels(:css => "label[class*='total_cost']").first
      test_helper.remove_dollar_sign total_label.text
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
      click_form
      textbox = Textbox.new @browser.text_field :name => 'Email'
      expand_ship_to
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[0]
      textbox.data_error_field data_error_field, "data-errorqtip"
      textbox
    end

    def phone
      click_form
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
      click_form
      Textbox.new @browser.text_field :name => 'WeightOz'
    end

    def lbs
      click_form
      Textbox.new @browser.text_field :name => 'WeightLbs'
    end

    def insured_value
      click_form
      Textbox.new @browser.text_field :name => "InsuranceAmount"
    end

    def length
      click_form
      Textbox.new @browser.text_field :name => 'Length'
    end

    def width
      click_form
      Textbox.new @browser.text_field :name => 'Width'
    end

    def height
      click_form
      Textbox.new @browser.text_field :name => 'Height'
    end

    def less_link
      spans = @browser.spans :text => "Less"
      less_button0 = Button.new spans[0]
      less_button1 = Button.new spans[1]

      if less_button0.present?
        return less_button0
      end

      if less_button1.present?
        less_button1
      end
    end

    def hide_ship_to
      self.click_form
      less_link.click_while_present
    end

    def expand_ship_to
      ship_to_dd = Link.new @browser.link :css => "div[id=shiptoview-addressCollapsed-targetEl]>a"

      5.times {
        ship_to_dd.safe_click
        break unless ship_to_dd.present?
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
      ship_from_default_selection = Label.new @browser.div :css => "div[data-recordindex='0']"
      ship_from_dropdown = Button.new @browser.div :css => "div[id^=shipfromdroplist][id$=trigger-picker]"
      ship_from_textbox = Textbox.new @browser.text_field :css => "input[name^=shipfromdroplist]"
      if selection.downcase.eql? "default"
        5.times{
          ship_from_dropdown.safe_click
          ship_from_default_selection.safe_click
          break if ship_from_textbox.text.length > 2
        }
        click_form
      else
        5.times {
          begin
            break if @manage_shipping_adddress.present?
            browser_helper.click ship_from_dropdown, "ship_from_selection.[#{selection}]" unless browser_helper.present?  ship_from_selection(selection)
            browser_helper.click ship_from_selection(selection), selection
          rescue
            #ignore
          end
          click_form
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
    def ship_cost_span
      span = @browser.span :text => "Ship Cost"
      log "Single Order Form is #{(browser_helper.present? span)?'present':'NOT present'}"
      span
    end

    def order_id
      order_id_label = Label.new @browser.label :css => "div[id^=orderDetailsPanel]>div[id^=singleOrderDetailsForm]>div>div[id^=container]>div>div:nth-child(1)>div>div>div>div>div>label:nth-child(1)"
      5.times{
        begin
          order_id_str = order_id_label.text
          break if order_id_str.include? 'Order #'
        rescue
          #ignroe
        end
      }

      return "Empty Grid" unless order_id_label.present?

      begin
        order_id_label.wait_until_present
      rescue
        log "Single Order Form Order ID label was not present"
      end
      #(browser_helper.text order_id_label).split('Order #').last
      order_id_str = order_id_label.text
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

    def validate_address_link
      @browser.span :text => 'Validate Address'
    end


  end #SingleOrderEdit Module
end