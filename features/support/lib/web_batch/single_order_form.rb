module Batch

  class LineItem < BrowserObject

    private

    def quantity_textbox
      text_field = @browser.text_field :name => "Quantity"
      log "Quantity Textbox #{(browser_helper.present? text_field)?"Exist.":'DOES NOT EXIST!'}"
      text_field
    end

    def sku_textbox
      text_field = @browser.text_field :name => "Sku"
      log "Sku Textbox #{(browser_helper.present? text_field)?"Exist.":'DOES NOT EXIST!'}"
      text_field
    end

    def item_name_textbox
      text_field = @browser.text_field :name => "ItemName"
      log "Item Name Textbox #{(browser_helper.present? text_field)?"Exist.":'DOES NOT EXIST!'}"
      text_field
    end

    def delete_button line_number
      images = @browser.images :css => "img[data-qtip*='Delete Item']"
      delete_image = images[line_number.to_i]
      log "Line item #{line_number} exist?  #{browser_helper.present? delete_image}"
      delete_image
    end

    public

    def present?
      browser_helper.present? quantity_textbox
    end

    def delete_line number

    end

    def quantity qty
      browser_helper.set_text quantity_textbox, qty, "qty"
    end

    def sku id
      browser_helper.set_text sku_textbox, id, "sku"
    end

    def item_name name
      browser_helper.set_text item_name_textbox, name, "item_name"
    end
  end

  class SingleOrderFormBase < BrowserObject

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

    def single_order_form_present?
      browser_helper.present? order_id_label
    end

    def ship_to_dropdown
      #@browser.span :css => 'div[id=shiptoview-addressCollapsed-targetEl]>a>span>span>span:nth-child(2)'
      @browser.link :css => 'div[id=shiptoview-addressCollapsed-targetEl]>a'
    end

    def less_dropdown
      @browser.span :text => 'Less'
    end

    def expand_ship_to
      5.times {
        break if browser_helper.present?  address_textbox
        browser_helper.click ship_to_dropdown, "ship_to_address_field" if browser_helper.present?  ship_to_dropdown
      }
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

    def address_textbox
      @browser.textarea :name => 'FreeFormAddress'
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

    def service_textbox
      @browser.text_field :css => "input[componentid^=servicedroplist]"
    end

    def insurance_cost_label
      @browser.label :css => 'label[class*=insurance_cost]'
    end

    def phone_textbox
      @browser.text_field :name => 'Phone'
    end

    def email_textbox
      @browser.text_field :name => 'Email'
    end

    def ship_from_dropdown
      @browser.div :css => 'div[id^=shipfromdroplist][class*=x-form-arrow-trigger-default]'
    end

    def ship_from_default_selection
      @browser.div :css => 'div[data-recordindex=\'0\']'
    end

    def insured_value_textbox
      @browser.text_field :name => 'InsuranceAmount'
    end

    def pounds_textbox
      @browser.text_field :name => 'WeightLbs'
    end

    def ounces_textbox
      @browser.text_field :name => 'WeightOz'
    end

    def length_textbox
      @browser.text_field :name => 'Length'
    end

    def width_textbox
      @browser.text_field :name => 'Width'
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

    def country_textbox

    end

    def add_item_button
      add_item = @browser.span :text => "Add Item"
      log "Add Item Button #{(browser_helper.present? add_item)?"Exist!":'DOES NOT EXIST!'}"
      add_item
    end

    def customs_edit_form_button
    end


    public
    def initialize browser
      super browser
      @services ||= Hash.new
    end

    def ship_to_country country
      browser_helper.set_text country_textbox, "country"
    end

    def international_address
      InternationalAddress.new @browser
    end

    def add_item *args
      line_item = LineItem.new @browser

      5.times{
        browser_helper.click add_item_button, "add_item"
        break if line_item.present?
      }

      case args.length
        when 0
          line_item
        when 1
          line_item.quantity ""
        else

      end
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
      browser_helper.present? total_label
    end

    def wait_until_present *args
      case args.length
        when 0
          browser_helper.wait_until_present height_textbox
        when 1
          browser_helper.wait_until_present height_textbox, args[0].to_i
        else
          raise "Illegal number of arguments for wait_until_present"
      end
    end

    def edit_details(data = {})
      #self.weight = {}
      log_hash_param data
      self.insured_value = data[:insured_value]
      self.pounds = data[:pounds]
      self.ounces = data[:ounces]
      self.length = data[:length]
      self.width = data[:width]
      self.height = data[:height]
    end

    def weight=(data={})
      log_hash_param data
      self.pounds = data[:pounds]
      self.ounces = data[:ounces]
    end

    def dimensions=(data={})
      log_hash_param data
      self.length = data[:length]
      self.width = data[:width]
      self.height = data[:height]
    end

    def ship_to_address *args
      case args.length
        when 0
          expand_ship_to
          browser_helper.text address_textbox
          less
        when 1
          expand_ship_to
          browser_helper.set_text self.address_textbox, BatchHelper.instance.format_address(args[0]), 'Address'
          if args[0].is_a? Hash
            self.phone = args[0]["phone"]
            self.email = args[0]["email"]
          end
          AddressNotFound.new(@browser)
        else
          raise "Wrong number of arguments for ship_to"
      end
    end

    def email=(email)
      expand_ship_to
      browser_helper.set_text email_textbox, email, 'Email'
      less
    end

    def email
      expand_ship_to
      log email_textbox.attribute_value('value')
      less
    end

    def phone
      expand_ship_to
      phone_textbox.attribute_value('value')
      less
    end

    def phone=(phone)
      expand_ship_to
      browser_helper.set_text phone_textbox, phone, 'Phone'
      less
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_selection selection
      @browser.div :text => selection
    end

    def ship_from selection
      if selection.downcase.eql? "default"
        ship_from_dropdown.when_present.click
        ship_from_default_selection.click
        click_item_label
      else
        @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
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

    def pounds=(pounds)
      browser_helper.set_text pounds_textbox, pounds, 'Pounds'
      click_item_label
    end

    def pounds
      pounds_textbox.attribute_value('value')
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

    def ounces=(ounces)
      browser_helper.set_text ounces_textbox, ounces, 'Ounces'
      click_item_label
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

    def ounces
      ounces_textbox.attribute_value('value')
    end

    def service_default_text
      service_textbox.attribute_value("placeholder")
    end

    def insured_value=(amount)
      browser_helper.set_text insured_value_textbox, amount, 'Insurance'
      click_item_label
    end

    def insured_value
      insured_value_textbox.attribute_value('value')
    end

    def length=(length)
      browser_helper.set_text length_textbox, length, 'Length'
      click_item_label
    end

    def length
      length_textbox.attribute_value('value')
    end

    def width=(width)
      browser_helper.set_text width_textbox, width, 'Width'
      click_item_label
    end

    def width
      width_textbox.attribute_value('value')
    end

    def height=(height)
      browser_helper.set_text height_textbox, height, 'Height'
      click_item_label
    end

    def height
      height_textbox.attribute_value('value')
    end

    def country
      country_textbox.attribute_value('value')
    end

  end #SingleOrderEdit Module
end