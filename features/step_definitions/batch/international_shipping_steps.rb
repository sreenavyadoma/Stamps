
Then /^Set Ship-To country to (.*)$/ do |country|
  @single_order_form = batch.single_order_form
  @single_order_form.ship_to_dd.select country
  @international_ship_to = @single_order_form.international
end

# random, random, 234 Laurier Avenue West, Suite 100, Ottawa, Ontario, K1A, 0G9, random, random
Given /^Set Ship-To to international address$/ do |table|
  param_hash = table.hashes.first

  name = (param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
  company = (param_hash["company"].downcase.include? "random") ? test_helper.random_company_name : param_hash["company"]
  street_address_1 = (param_hash["street_address_1"].downcase.include? "random") ? test_helper.random_string : param_hash["street_address_1"]
  street_address_2 = (param_hash["street_address_2"].downcase.include? "random") ? test_helper.random_suite : param_hash["street_address_2"]
  city = param_hash["city"]
  province = (param_hash["province"].downcase.include? "random") ? test_helper.random_string : param_hash["province"]
  postal_code = (param_hash["postal_code"].downcase.include? "random") ? test_helper.random_alpha_numeric : param_hash["postal_code"]
  country = param_hash["country"]
  phone_num = param_hash["phone"]
  phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : param_hash["phone"]
  email_addy = param_hash["email"]
  email = (email_addy.downcase.include? "random") ? test_helper.random_email : param_hash["email"]

  log "International Ship-To Name: #{name}"
  log "International Ship-To Company: #{company}"
  log "International Ship-To Address 1: #{street_address_1}"
  log "International Ship-To Address 2: #{street_address_2}"
  log "International Ship-To City: #{city}"
  log "International Ship-To Province: #{province}"
  log "International Ship-To Postal Code: #{postal_code}"
  log "International Ship-To Phone: #{phone}"
  log "International Ship-To Email: #{email}"

  step "Set Ship-To country to #{country}"
  step "Set International Ship-To Name to #{name}"
  step "Set International Ship-To Company to #{company}"
  step "Set International Ship-To Address 1 to #{street_address_1}"
  step "Set International Ship-To Address 2 to #{street_address_2}"
  step "Set International Ship-To City to #{city}"
  step "Set International Ship-To Province to #{province}"
  step "Set International Ship-To Postal Code to #{postal_code}"
  step "Set International Ship-To Phone to #{phone}"
  step "Set International Ship-To Email to #{email}"
end

Then /^Set International Ship-To ([\w \d]+) to (.*)/ do |ship_to_field, value |
  if @international_ship_to.nil?
    raise "Illegal State Exception.  @international_shipping is nil.  Set Ship-To Country first before populating international address fields"
  end

  case ship_to_field.downcase
    when "name"
      @international_ship_to.name.set ((value.downcase == "random")? test_helper.random_name : value)
    when "company"
      @international_ship_to.company.set ((value.downcase == "random")? test_helper.random_company_name : value)
    when "address 1"
      @international_ship_to.address_1.set value
    when "address 2"
      @international_ship_to.address_2.set ((value.downcase == "random")? test_helper.random_suite : value)
    when "city"
      @international_ship_to.city.set value
    when "province"
      @international_ship_to.province.set value
    when "postal code"
      @international_ship_to.postal_code.set value
    when "phone"
      @international_ship_to.phone.set ((value.downcase == "random")? test_helper.random_phone : value)
    when "email"
      @international_ship_to.email.set ((value.downcase == "random")? test_helper.random_email : value)
    else
      raise "Illegal Argument Exception.  #{ship_to_field} is not a valid Ship-To field"
  end
end

Given /^Expect Single Order Form International Address fields are visible$/ do
  @international_ship_to.name.present?.should be true
  @international_ship_to.company.present?.should be true
  @international_ship_to.address_1.present?.should be true
  @international_ship_to.address_2.present?.should be true
  @international_ship_to.city.present?.should be true
  @international_ship_to.province.present?.should be true
  @international_ship_to.postal_code.present?.should be true
  @international_ship_to.phone.present?.should be true
  @international_ship_to.email.present?.should be true
end

Then /^Expect Single Order Form Domestic Ship-To fields are hidden$/ do
  @single_order_form.ship_to.present?.should be false
  @single_order_form.email.present?.should be false
  @single_order_form.phone.present?.should be false
end

Then /^Expect Single Order Form Customs (.+) button is (.+)/ do |button, expectation|
  case button.downcase
    when "restrictions"
      case expectation.downcase
        when "visible"
          @single_order_form.customs.browser_restrictions_button.present?.should be true
          @single_order_form.customs.restrictions.ok
        when "hidden"
          @single_order_form.customs.browser_restrictions_button.present?.should be false
        else
          raise "Illegal argument exception"
      end
    when "edit form"
      case expectation.downcase
        when "visible"
          @single_order_form.customs.browser_edit_form_button.present?.should be true
        when "hidden"
          @single_order_form.customs.browser_edit_form_button.present?.should be false
        when "enabled"
          @single_order_form.customs.browser_edit_form_button.present?.should be true
        when "disabled"
          @single_order_form.customs.browser_edit_form_button.present?.should be false
        else
          raise "Illegal argument exception"
      end
    else
      raise "Illegal argument exception"
  end
end

Given /^Open Customs Form$/ do
  @customs_form = @single_order_form.customs.edit_form
end

Given /^Set Customs Form (.+) = (.+)$/ do |field, value|
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  case field.downcase
    #Package Contents
    when "package contents"
      @customs_form.package_contents_dd.select value
      contents = @customs_form.pacakge_contents.text
      contents.should include value
      #Non-Delivery Options
    when "non-delivery options"
      @customs_form.non_delivery_options_dd.select value
      #Internal Transaction #
    when "internal transaction #"
      @customs_form.internal_transaction_dd.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
      sleep 1
      #More Info
    when "more info"
      @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
      #ITN#
    when "itn#"
      @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
    when "license#"
      @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
    when "certificate#"
      @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
    when "invoice#"
      @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
    else
      raise "Illegal Argument Exception.  Field #{field} is not on the Customs Information Modal"

  end
end

Given /^Add Customs Form Item (\d+); Description=(\w+), Qty (\d+), Unit Price (\d+), Weight\(lbs\) (\d+), Weight\(oz\) (\d+) Origin ([\w ]+), Tariff (\d+)$/ do |item_number, description, qty, price, lbs, oz, origin, tariff|
  item = @customs_form.item
  item.description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.lbs.set lbs
  item.oz.set oz
  item.origin_dd.select origin
  item.hs_tariff.set tariff
end

Given /^Set Customs Form I agree to (\w+)$/ do |agree_str|
  agree = agree_str.downcase == "true"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.i_agree agree
end

Given /^Add Item with Quantity (\d+), ID ([\w ]+), Description ([\w ]+)$/ do |qty, id, description|
  line_item = batch.single_order_form.add_item
  line_item.qty qty
  line_item.id (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
  line_item.description (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Given /^Expect Single Order Form ([\w -]+) field is hidden$/ do |field_name|
end

Given /^Expect International Ship-To ([\w ]+) Field Attributes are correct$/ do |field_name|

end

Given /^Expect Customs Form Checkbox \"(.+)\" is visible$/ do |checkbox|

end

Given /^Expect Customs Form Add Item tooltip to be "(.+)"$/ do |tooltip|

end

Given /^Expect Customs Form (.+) to be (.+)$/ do |field, value|
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  case field.downcase
    when "itn#"
      @customs_form_textbox = @customs_form.itn_number
    when "more info"
      @customs_form_textbox = @customs_form.more_info
    when "license#"
      @customs_form_textbox = @customs_form.license
    when "certificate#"
      @customs_form_textbox = @customs_form.certificate
    when "invoice#"
      @customs_form_textbox = @customs_form.invoice
    when "internal transaction #"
      text = @customs_form.internal_transaction_dd.text_box.text
      log "Internal Transaction # is #{text}.  Test #{(text.include? "Required")?'Passed':'Failed'}"
      text.should include "Required"
    else
      raise "Illegal Argument Exception.  #{field} is not a valid field. - Expect Customs Form #{field} to be #{value}"
  end

  case value.downcase
    when "hidden"
      @customs_form_textbox.present?.should be false
    when "visible"
      @customs_form_textbox.present?.should be true
    when "enabled"
      @customs_form_textbox.second_disabled?.should be false
    when "disabled"
      @customs_form_textbox.second_disabled?.should be true
    else
      #do nothing.
  end
end

Given /^Increment Customs Form Weight\((\w+)\) by (\d+)$/ do |field, value|

end

Given /^Decrement Customs Form Weight\((\w+)\) by (\d+)$/ do |field, value|

end

Given /^Delete Customs Form Item (\d+)$/ do |item_number|

end

Given /^Close Customs Information Modal$/ do
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.cancel
end

Given /^Expect Customs Information Modal to be present$/ do

end

Given /^Expect Customs Form field (.+) behavior is correct$/ do |field|

end