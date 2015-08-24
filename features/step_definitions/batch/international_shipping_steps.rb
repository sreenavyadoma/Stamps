
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
  step "Set International Ship-To #{"Name"} to #{name}"
end

Then /^Set Ship-To country to (.*)$/ do |country|
  @international_shipping = batch.single_order_form.ship_to_country country
end

Then /^Set International Ship-To ([\w \d]+) to (.*)/ do |ship_to_field, value |

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

Given /^Open Customs Form$/ do

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