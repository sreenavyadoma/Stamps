
Given /^Set Ship-To country to (.*)$/ do |country|
  batch.single_order_form.ship_to_country country
end

Given /^Expect Single Order Form ([\w -]+) field is hidden$/ do |field_name|
  batch.single_order_form.international_address
end

Given /^Expect Single Order Form International Address fields are visible$/ do
  #browser_helper

end

Given /^Expect International Ship-To ([\w ]+) Field Attributes are correct$/ do |field_name|

end

Given /^Set International Ship-To ([\w ]+) to ([\w ]+)$/ do |field_name, value|

end

Given /^Add Item (\d+). Quantity (\d+), ID ([\w ]+), Description ([\w ]+)$/ do |item_number, qty, id, description|

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