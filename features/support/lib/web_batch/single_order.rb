module Batch

  module SingleOrderCommon
    def browser_helper
      BrowserHelper.instance
    end

    def ship_to_dropdown
      #@browser.span :css => 'div[id=shiptoview-addressCollapsed-targetEl]>a>span>span>span:nth-child(2)'
      @browser.link :css => 'div[id=shiptoview-addressCollapsed-targetEl]>a'
    end

    def less_dropdown
      @browser.span :text => 'Less'
    end

    def expand_ship_to
      10.times {
        break if browser_helper.field_present?  address_textbox
        browser_helper.click ship_to_dropdown, "ship_to_address_field" if browser_helper.field_present?  ship_to_dropdown
      }
    end

    def less
      browser_helper.click less_dropdown, "Less" if browser_helper.field_present?  less_dropdown
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
  class SingleOrder < BatchPage
    include GridCommon
    include SingleOrderCommon

    public
    def initialize(browser)
      super(browser)
      @services ||= Hash.new
    end

    def service(selection)
      log_param "Service Selection", selection
      ServiceSelection.new(@browser, selection).select
    end

    def tracking=(selection)
      begin
        log_param "Tracking Selection", selection
        #ServiceSelection.new(@browser, selection).select
      end unless selection.length == 0
    end

    def tracking
      browser_helper.text tracking_textbox, 'Tracking'
    end

    def service_cost
      test_helper.remove_dollar_sign(browser_helper.text(service_cost_label, 'service'))
    end

    def insurance_cost
      test_helper.remove_dollar_sign(browser_helper.text(insurance_cost_label,'insurance'))
    end

    def tracking_cost
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
      browser_helper.field_present?  height_textbox
    end

    def wait_until_present(timeout)
      height_textbox.wait_until_present(timeout)
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

    def recipient=(data={})
      log_hash_param data
      self.address = data
      self.phone = data[:phone]
      self.email = data[:email]
      less
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

    def address=(address)
      expand_ship_to
      browser_helper.set_text address_textbox, batch_helper.formatAddress(address), 'Address'
      less
    end

    def partial_address
      AddressNotFound.new(@browser)
    end

    def address
      expand_ship_to
      address_textbox.attribute_value('value')
      less
    end

    def edit_address(address)
      self.address=address
    end

    def manage_ship_from_address_field
      @browser.div :text => 'Manage Shipping Addresses...'
    end

    def ship_from_default
      ship_from_dropdown.when_present.click
      ship_from_default_selection.click
      click_item_label
    end

    def ship_from_selection(selection)
      @browser.div :text => selection
    end

    def ship_from(selection)
      @manage_shipping_adddress = ManageShippingAddresses.new(@browser)
      5.times {
        begin
          browser_helper.click ship_from_dropdown, "ship_from_selection.[#{selection}]" unless browser_helper.field_present?  ship_from_selection(selection)
          browser_helper.click ship_from_selection(selection), selection
          break if @manage_shipping_adddress.window_present?
        rescue
          #ignore
        end
        click_item_label
      }
      @manage_shipping_adddress
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
      service_field.attribute_value("placeholder")
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

    private

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

    def order_id_label
      txt = "Order ##{WebBatchHelper.order_id}"
      @browser.label :text => txt
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

  end #SingleOrderEdit Module
end