Then /^[Oo]n Order Details form, Expand Manual Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n Order Details form, Collapse Manual Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.collapse
end

Then /^[Oo]n Order Details form, Expand Store Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n Order Details form, Collapse Store Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.collapse_store_item
end

Then /^[Oo]n Order Details form, Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  step "set Order Details form Associated Item #{item_number} Qty to #{qty}"
  step "set Order Details form Associated Item #{item_number} ID to #{id}"
  step "set Order Details form Associated Item #{item_number} Description to #{description}"
end

Then /^[Aa]dd Order Details form Associated Item (\d+)$/ do |item_number|
  stamps.orders.order_details.items_ordered.item(item_number.to_i)
end

Then /^[Ss]et Order Details form Associated Item (\d+) Qty to (.*)$/ do |item_number, qty|
  parameter[:details_associated_items][item_number] = Hash.new unless parameter[:details_associated_items].has_key?(item_number)
  parameter[:details_associated_items][item_number][:item_qty] = qty
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.set(parameter[:details_associated_items][item_number][:item_qty] )
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  parameter[:details_associated_items][item_number] = Hash.new unless parameter[:details_associated_items].has_key?(item_number)
  parameter[:details_associated_items][item_number][:item_id] = (str.downcase.include?('random')?(helper.random_alpha_numeric):str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.set(parameter[:details_associated_items][item_number][:item_id])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Associated Item (\d+) Description to (.*)$/ do |item_number, str|
  parameter[:details_associated_items][item_number] = Hash.new unless parameter[:details_associated_items].has_key?(item_number)
  parameter[:details_associated_items][item_number][:item_description] = (str.downcase.include?('random')?(helper.random_alpha_numeric):str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.set(parameter[:details_associated_items][item_number][:item_description])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-To Country to (.*)$/ do |country|
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.country.select country
end

Then /^[Ss]et Order Details form International Ship-To Name to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_name] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.name.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.name.set parameter[:int_ship_to_name]
  end
end

Then /^[Ss]et Order Details form International Ship-To Company to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_company] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.company.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.company.set parameter[:int_ship_to_company]
  end
end

Then /^[Ss]et Order Details form International Ship-To Address 1 to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_address_1] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_1.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.address_1.set parameter[:int_ship_to_address_1]
  end
end

Then /^[Ss]et Order Details form International Ship-To Address 2 to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_address_2] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_2.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.address_2.set parameter[:int_ship_to_address_2]
  end
end

Then /^[Ss]et Order Details form International Ship-To City to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_city] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.city.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.city.set parameter[:int_ship_to_city]
  end
end

Then /^[Ss]et Order Details form International Ship-To Province to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_province] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.province.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.province.set parameter[:int_ship_to_province]
  end
end

Then /^[Ss]et Order Details form International Ship-To Postal Code to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_postal_code] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.postal_code.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.postal_code.set parameter[:int_ship_to_postal_code]
  end
end

Then /^[Ss]et Order Details form International Ship-To Phone to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_phone] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.phone.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.phone.set parameter[:int_ship_to_phone]
  end
end

Then /^[Ss]et Order Details form International Ship-To Email to \"(.*)\"$/ do |value|
  parameter[:int_ship_to_email] = ((value.downcase == 'random')? helper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.email.send_keys(:enter)
  else
    stamps.orders.order_details.ship_to.international.email.set parameter[:int_ship_to_email]
  end
end

Then /^[Oo]n Order Details form, Expand panel$/ do
  stamps.orders.order_details.expand
end

Then /^[Oo]n Order Details form, Delete Item (\d+)$/ do |item_number|
  item = stamps.orders.order_details.items_ordered.item item_number.to_i
  item.delete.click
end

Then /^[Ss]et Order Details form Weight to (\d+) lb (\d+) oz$/ do |pounds, ounces|
  step "set Order Details form Pounds to #{pounds}"
  step "set Order Details form Ounces to #{ounces}"
end

Then /^[Ss]et Order Details form Pounds to (\d+)$/ do |value|
  parameter[:pounds] = value
  stamps.orders.order_details.weight.lb.set parameter[:pounds]
end

Then /^[Ss]et Order Details form Ounces to (\d+)$/ do |value|
  parameter[:ounces] = value
  stamps.orders.order_details.weight.oz.set parameter[:ounces]
end

Then /^[Oo]n Order Details form, blur out(?:| (\d+)(?:| times))$/ do |count|
  ((count.nil?)?1:count.to_i).times {stamps.orders.order_details.blur_out}
end

Then /^[Ss]et Order Details form Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  stamps.orders.order_details.dimensions.length.set length
  stamps.orders.order_details.dimensions.width.set width
  stamps.orders.order_details.dimensions.height.set height
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Length to (\d*)$/ do |value|
  parameter[:length] = value
  expect(stamps.orders.order_details.dimensions.length).to be_present
  stamps.orders.order_details.dimensions.length.set(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Width to (\d*)$/ do |value|
  parameter[:width] = value
  expect(stamps.orders.order_details.dimensions.width).to be_present
  stamps.orders.order_details.dimensions.width.set(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Height to (\d*)$/ do |value|
  parameter[:height] = value
  expect(stamps.orders.order_details.dimensions.height).to be_present
  stamps.orders.order_details.dimensions.height.set(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Oo]n Order Details form, check Insure-For checkbox$/ do
  stamps.orders.order_details.insure_for.checkbox.check
end

Then /^[Oo]n Order Details form, uncheck Insure-For checkbox$/ do
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^[Ss]et Order Details form Insure-For to \$(.*)$/ do |value|
  parameter[:insure_for] = value.to_f.round(2)
  stamps.orders.order_details.insure_for.set_and_agree_to_terms(parameter[:insure_for])
  10.times do
    break if stamps.orders.order_details.insure_for.cost > 0
    step "On Order Details form, blur out"
  end
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Tracking to USPS Tracking$/ do
  step "set Order Details form Tracking to \"USPS Tracking\""
end

Then /^[Ss]et Order Details form Tracking to Signature Required$/ do
  step "set Order Details form Tracking to \"Signature Required\""
end

Then /^[Ss]et Order Details form Tracking to \"([\w ]*)\"$/ do |value|
  stamps.orders.order_details.tracking.select(value)
  10.times do
    break if stamps.orders.order_details.tracking.cost > 0
    step "On Order Details form, blur out"
  end
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-From to (.+)$/ do |value|
  stamps.orders.order_details.ship_from.select(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-To to Domestic Address$/ do |table|
  address_table = table.hashes.first

  parameter[:name] = (address_table['name'].downcase.include?('random')) ? helper.random_name : address_table['name']
  parameter[:company] = (address_table['company'].downcase.include?('random')) ? helper.random_company_name : address_table['company']
  parameter[:street_address] = address_table['street_address']

  if address_table['street_address_2'].nil?
    parameter[:street_address_2] = ""
  else
    parameter[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? helper.random_string(2, 7) : address_table['street_address_2']
  end

  parameter[:city] = (address_table['city'].downcase.include?('random')) ? helper.random_string : address_table['city']
  parameter[:state] = (address_table['state'].downcase.include?('random')) ? helper.random_string : address_table['state']
  parameter[:zip] = (address_table['zip'].downcase.include?('random')) ? helper.random_string : address_table['zip']
  parameter[:country] = (address_table['country'].size==0)?"United States":address_table['country']
  parameter[:ship_to] = "#{parameter[:name]},#{parameter[:company]},#{parameter[:street_address]},#{parameter[:street_address_2]} ,#{parameter[:city]} #{parameter[:state]} #{parameter[:zip]}"

  step "set Order Details form Ship-To Country to #{parameter[:country]}"
  step "set Order Details form Ship-To to Domestic Address #{parameter[:ship_to]}"
end

Then /^[Ss]et Order Details Ship-To International address to$/ do |table|
  address_table = table.hashes.first

  parameter[:country] = address_table['country']
  parameter[:name] = (address_table['name'].downcase.include?('random')) ? helper.random_name : address_table['name']
  parameter[:company] = (address_table['company'].downcase.include?('random')) ? helper.random_company_name : address_table['company']
  parameter[:street_address_1] = (address_table['street_address_1'].downcase.include?('random')) ? helper.random_string : address_table['street_address_1']
  parameter[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? helper.random_suite : address_table['street_address_2']
  parameter[:city] = (address_table['city'].downcase.include?('random')) ? helper.random_string : address_table['city']
  parameter[:state] = (address_table['province'].downcase.include?('random')) ? helper.random_string : address_table['province']
  parameter[:zip] = (address_table['postal_code'].downcase.include?('random'))?helper.random_alpha_numeric : address_table['postal_code']
  parameter[:phone] = (address_table['phone'].downcase.include?('random')) ? helper.random_phone : address_table['phone']
  parameter[:email] = (address_table['email'].downcase.include?('random')) ? helper.random_email : address_table['email']

  step "set Order Details form Ship-To Country to #{parameter[:country]}"
  step "set Order Details form International Ship-To Name to \"#{parameter[:name]}\""
  step "set Order Details form International Ship-To Company to \"#{parameter[:company]}\""
  step "set Order Details form International Ship-To Address 1 to \"#{parameter[:street_address_1]}\""
  step "set Order Details form International Ship-To Address 2 to \"#{parameter[:street_address_2]}\""
  step "set Order Details form International Ship-To City to \"#{parameter[:city]}\""
  step "set Order Details form International Ship-To Province to \"#{parameter[:state]}\""
  step "set Order Details form International Ship-To Postal Code to \"#{parameter[:zip]}\""
  step "set Order Details form International Ship-To Phone to \"#{parameter[:phone]}\""
  step "set Order Details form International Ship-To Email to \"#{parameter[:email]}\""
end

Then /^[Ss]et Order Details form Ship-To to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  address = address_helper_zone(address)

  parameter[:street_address] = address['street_address']
  parameter[:city] = address['city']
  parameter[:state] = address['state']
  parameter[:zip] = address['zip']
  parameter[:name] = address['name']
  parameter[:company] = address['company']
  parameter[:ship_to_domestic] = helper.format_address(address)

  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set(parameter[:ship_to_domestic])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-To to Domestic Address (.*)$/ do |address|
  parameter[:ship_to_domestic] = helper.format_address(address)
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set parameter[:ship_to_domestic]
  step "Save Order Details data"
end

Then /^[Oo]n Order Details form, Hide Ship-To fields$/ do
  stamps.orders.order_details.ship_to.domestic.less
end

Then /^[Oo]n Order Details form, Hide International Ship-To fields$/ do
  stamps.orders.order_details.ship_to.international.less
end

Then /^[Oo]n Order Details form, Show Ship-To fields$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
end

Then /^[Ee]xpect Order Details form Order ID is truthy$/ do
  expect(parameter[:order_id][0].to_i).to be > 0
end

Then /^[Ee]xpect Order Details form Order ID equals Grid Oder ID in row (\d+)$/ do |row|
  expect(stamps.orders.order_details.toolbar.order_id).to eql stamps.orders.orders_grid.column.order_id.row(row)
end

Then /^[Ee]xpect Order Details form Order ID is the same as saved Order ID$/ do
  expect(stamps.orders.order_details.toolbar.order_id).to eql parameter[:order_id][0]
end

Then /^[Ee]xpect Order Details form Ship-To Name is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.recipient_name).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Company Name is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.company_name).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Cleansed Street Address is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.street_address).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Cleansed City is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.city).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Cleansed State is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.state).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Cleansed Zip Plus 4 Code is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.zip_plus_4).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Cleansed Zip Code is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.zip_code).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Phone is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.text).to eql expectation
end

Then /^[Ee]xpect Order Details form Ship-To Email is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.email.text).to eql expectation
end

Then /^[Ss]et Order Details form Ship-To to ambiguous address$/ do |table|
  ambiguous_address = helper.format_address table.hashes.first
  stamps.orders.order_details.ship_to.domestic.set_ambiguous ambiguous_address
end

Then /^[Ii]n Exact Address Not Found module, select row (\d+)$/ do |row|
  stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.row row
end

Then /^[Ss]et Order Details form Phone to (.*)$/ do |phone|
  parameter[:phone] = (phone.to_s.strip.downcase.include?('random'))?(helper.random_phone):phone
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    stamps.orders.order_details.ship_to.domestic.phone.set parameter[:phone]
  end unless parameter[:phone].length == 0
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Email to (.*)$/ do |email|
  parameter[:email] = (email.to_s.strip.downcase.include?('random'))?(helper.random_email):email
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    stamps.orders.order_details.ship_to.domestic.email.set parameter[:email]
  end unless parameter[:email].length == 0
  step "Save Order Details data"
end

Then /^Increment Order Details Pounds by (\d*)$/ do |value|
  stamps.orders.order_details.weight.lb.increment value
end

Then /^Decrement Order Details Pounds by (\d*)$/ do |value|
  stamps.orders.order_details.weight.lb.decrement value
  step "Save Order Details data"
end

Then /^Increment Order Details Ounces by (\d*)$/ do |value|
  stamps.orders.order_details.weight.oz.increment value
  step "Save Order Details data"
end

Then /^Decrement Order Details Ounces by (\d*)$/ do |value|
  stamps.orders.order_details.weight.oz.decrement value
  step "Save Order Details data"
end

Then /^Increment Order Details Length by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.length.increment value
  step "Save Order Details data"
end

Then /^Decrement Order Details Length by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.length.decrement value
  step "Save Order Details data"
end

Then /^Increment Order Details Width by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.width.increment value
  step "Save Order Details data"
end

Then /^Decrement Order Details Width by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.width.decrement value
  step "Save Order Details data"
end

Then /^Increment Order Details Height by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.height.increment value
  step "Save Order Details data"
end

Then /^Decrement Order Details Height by (\d*)$/ do |value|
  stamps.orders.order_details.dimensions.height.decrement value
  step "Save Order Details data"
end

Then /^Increment Order Details Insure-For by (\d*)$/ do |value|
  stamps.orders.order_details.insure_for.increment value
  step "Save Order Details data"
end

Then /^Decrement Order Details Insure-For by (\d*)$/ do |value|
  stamps.orders.order_details.insure_for.decrement value
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Reference Number to (.*)$/ do |value|
  parameter[:reference_no] = (value.downcase.include?('random'))?helper.random_alpha_numeric : value
  stamps.orders.order_details.reference_no.set parameter[:reference_no]
  step "Save Order Details data"
end

Then /^[Ee]xpect Order Details form Domestic Ship-To Company is (.*)$/ do |company|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.text).to include company
end

Then /^[Ee]xpect Order Details form Domestic Ship-To Name is (.*)$/ do |name|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.text).to include name
end



