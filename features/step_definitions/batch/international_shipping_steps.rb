
Then /^Set Ship-To country to (.*)$/ do |country|
  @single_order_form = batch.single_order_form
  @international_shipping = @single_order_form.ship_to_country country
end

# random, random, 234 Laurier Avenue West, Suite 100, Ottawa, Ontario, K1A, 0G9, random, random
Given /^Set Ship-To Recipient to International Address$/ do |table|
  param_hash = table.hashes.first

  name = (param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
  company = (param_hash["company"].downcase.include? "random") ? test_helper.random_company_name : param_hash["company"]
  street_address_1 = param_hash["street_address_1"]
  street_address_2 = (param_hash["street_address_2"].downcase.include? "random") ? test_helper.random_suite : param_hash["street_address_2"]
  province = param_hash["province"]
  postal_code = param_hash["postal_code"]
  country = param_hash["country"]
  phone = (param_hash["phone"].downcase.include? "random") ? test_helper.random_phone : param_hash["phone"]
  email = (param_hash["email"].downcase.include? "random") ? test_helper.random_email : param_hash["email"]

  log "International Ship-To Name: #{name}"
  log "International Ship-To Company: #{company}"
  log "International Ship-To Address 1: #{street_address_1}"
  log "International Ship-To Address 2: #{street_address_2}"
  log "International Ship-To Province: #{province}"
  log "International Ship-To Postal Code: #{postal_code}"
  log "International Ship-To Country: #{country}"
  log "International Ship-To Phone: #{phone}"
  log "International Ship-To Email: #{email}"

  step "Set Ship-To country to #{country}"
  step "Set International Ship-To Name to #{name}"
  step "Set International Ship-To Company to #{company}"
  step "Set International Ship-To Address 1 to #{street_address_1}"
  step "Set International Ship-To Address 2 to #{street_address_2}"
  step "Set International Ship-To Province to #{province}"
  step "Set International Ship-To Postal Code to #{postal_code}"
  step "Set International Ship-To Country to #{country}"
  step "Set International Ship-To Phone to #{phone}"
  step "Set International Ship-To Email to #{email}"
end

Then /^Set International Ship-To ([\w \d]+) to (.*)/ do |ship_to_field, value |
  if @international_shipping.nil?
    raise "Illegal State Exception.  @international_shipping is nil.  Set Ship-To Country first before populating international address fields"
  end

  case ship_to_field.downcase
    when "name"
      @international_shipping.name=(value.downcase == "random")? test_helper.random_name : value
    when "company"
      @international_shipping.company=(value.downcase == "random")? test_helper.random_company_name : value
    when "address 1"
      @international_shipping.address_1=value
    when "address 2"
      @international_shipping.address_2=(value.downcase == "random")? test_helper.random_suite : value
    when "province"
      @international_shipping.province=value
    when "postal code"
      @international_shipping.postal_code=value
    when "phone"
      @international_shipping.phone=(value.downcase == "random")? test_helper.random_phone : value
    when "email"
      @international_shipping.email=(value.downcase == "random")? test_helper.random_email : value
    else
      raise "Illegal Argument Exception.  #{ship_to_field} is not a valid Ship-To field"
  end
end

Given /^Open Customs Form$/ do
  @single_order_form.edit_customs_form
end

Given /^Expect Single Order Form ([\w -]+) field is hidden$/ do |field_name|
end

Given /^Expect Single Order Form International Address fields are visible$/ do
  #browser_helper

end

Given /^Expect International Ship-To ([\w ]+) Field Attributes are correct$/ do |field_name|

end


Given /^Add Item (\d+). Quantity (\d+), ID ([\w ]+), Description ([\w ]+)$/ do |item_number, qty, id, description|
  batch.single_order_form.add_item
end

Given /^Expect Customs Form Checkbox \"(.+)\" is visible$/ do |checkbox|

end

Given /^Expect Customs Form Add Item tooltip to be "(.+)"$/ do |tooltip|

end

Given /^Expect Customs Form (.+) to be (.+)$/ do |field, value|

end

Given /^Set Customs Form (.+) to (.+)$/ do |field, value|

end

Given /^Increment Customs Form Weight\((\w+)\) by (\d+)$/ do |field, value|

end

Given /^Decrement Customs Form Weight\((\w+)\) by (\d+)$/ do |field, value|

end

Given /^Add Customs Form Item (\d+) to Description=(\w+), Qty (\d+), Unit Price (\d+), Weight\(lbs\) (\d+), Weight\(oz\) (\d+) Origin ([\w ]+), Tariff (\d+)$/ do |item_number, description, qty, price, lbs, oz, origin, tariff|

end

Given /^Delete Customs Form Item (\d+)$/ do |item_number|

end

Given /^Close Customs Information Modal$/ do

end

Given /^Expect Customs Information Modal to be present$/ do

end

Given /^Check Customs Form \"(.+)\"$/ do |contract| #I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions

end

Given /^Expect Customs Form field (.+) behavior is correct$/ do |field|

end

Given /^yyy$/ do

end