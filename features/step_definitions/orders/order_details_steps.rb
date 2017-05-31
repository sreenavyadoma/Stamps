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
  test_param[:details_associated_items][item_number] = Hash.new unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_qty] = qty
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.set(test_param[:details_associated_items][item_number][:item_qty] )
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  test_param[:details_associated_items][item_number] = Hash.new unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_id] = (str.downcase.include?('random')?(helper.random_alpha_numeric):str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.set(test_param[:details_associated_items][item_number][:item_id])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Associated Item (\d+) Description to (.*)$/ do |item_number, str|
  test_param[:details_associated_items][item_number] = Hash.new unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_description] = (str.downcase.include?('random')?(helper.random_alpha_numeric):str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.set(test_param[:details_associated_items][item_number][:item_description])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-To Country to (.*)$/ do |country|
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.country.select country
end

Then /^[Ss]et Order Details form International Ship-To Name to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_name] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.name.click
  else
    stamps.orders.order_details.ship_to.international.name.set test_param[:int_ship_to_name]
  end
end

Then /^[Ss]et Order Details form International Ship-To Company to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_company] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.company.click
  else
    stamps.orders.order_details.ship_to.international.company.set test_param[:int_ship_to_company]
  end
end

Then /^[Ss]et Order Details form International Ship-To Address 1 to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_address_1] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_1.click
  else
    stamps.orders.order_details.ship_to.international.address_1.set test_param[:int_ship_to_address_1]
  end
end

Then /^[Ss]et Order Details form International Ship-To Address 2 to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_address_2] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_2.click
  else
    stamps.orders.order_details.ship_to.international.address_2.set test_param[:int_ship_to_address_2]
  end
end

Then /^[Ss]et Order Details form International Ship-To City to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_city] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.city.click
  else
    stamps.orders.order_details.ship_to.international.city.set test_param[:int_ship_to_city]
  end
end

Then /^[Ss]et Order Details form International Ship-To Province to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_province] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.province.click
  else
    stamps.orders.order_details.ship_to.international.province.set test_param[:int_ship_to_province]
  end
end

Then /^[Ss]et Order Details form International Ship-To Postal Code to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_postal_code] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.postal_code.click
  else
    stamps.orders.order_details.ship_to.international.postal_code.set test_param[:int_ship_to_postal_code]
  end
end

Then /^[Ss]et Order Details form International Ship-To Phone to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_phone] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.phone.click
  else
    stamps.orders.order_details.ship_to.international.phone.set test_param[:int_ship_to_phone]
  end
end

Then /^[Ss]et Order Details form International Ship-To Email to \"(.*)\"$/ do |value|
  test_param[:int_ship_to_email] = ((value.downcase == 'random')? helper.random_full_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.email.click
  else
    stamps.orders.order_details.ship_to.international.email.set test_param[:int_ship_to_email]
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
  test_param[:pounds] = value
  stamps.orders.order_details.weight.lb.set(test_param[:pounds])
  step "On Order Details form, blur out"
end

Then /^[Ss]et Order Details form Ounces to (\d+)$/ do |value|
  test_param[:ounces] = value
  stamps.orders.order_details.weight.oz.set test_param[:ounces]
  step "On Order Details form, blur out"
end

Then /^[Oo]n Order Details form, blur out(?:| (\d+)(?:| times))$/ do |count|
  ((count.nil?)?1:count.to_i).times {stamps.orders.order_details.blur_out}
end

Then /^[Ss]et Order Details form Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  step "set Order Details form Length to #{length}"
  step "set Order Details form Width to #{width}"
  step "set Order Details form Height to #{height}"
end

Then /^[Ss]et Order Details form Length to (\d*)$/ do |value|
  test_param[:length] = value
  expect(stamps.orders.order_details.dimensions.length.present?).to be(true), "Order Details form Length is not present"
  stamps.orders.order_details.dimensions.length.set(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Width to (\d*)$/ do |value|
  test_param[:width] = value
  expect(stamps.orders.order_details.dimensions.width.present?).to be(true), "Order Details form Width is not present"
  stamps.orders.order_details.dimensions.width.set(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Height to (\d*)$/ do |value|
  test_param[:height] = value
  expect(stamps.orders.order_details.dimensions.height.present?).to be(true), "Order Details form Height is not present"
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

Then /^[Ss]et Order Details form Insure-For to \$(.*)$/ do |str|
  stamps.orders.order_details.insure_for.set_and_agree_to_terms(test_param[:insure_for] = str.to_f.round(2))
  10.times do
    break if stamps.orders.order_details.insure_for.cost > 0
    step "On Order Details form, blur out 3"
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

  test_param[:full_name] = (address_table['full_name'].downcase.include?('random')) ? helper.random_full_name : address_table['full_name']
  test_param[:company] = (address_table['company'].downcase.include?('random')) ? helper.random_company_name : address_table['company']
  test_param[:street_address] = address_table['street_address']

  if address_table['street_address_2'].nil?
    test_param[:street_address_2] = ""
  else
    test_param[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? helper.random_alpha_numeric(2, 7) : address_table['street_address_2']
  end

  test_param[:city] = (address_table['city'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['city']
  test_param[:state] = (address_table['state'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['state']
  test_param[:zip] = (address_table['zip'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['zip']
  test_param[:country] = (address_table['country'].size==0)?"United States":address_table['country']
  test_param[:ship_to] = "#{test_param[:full_name]},#{test_param[:company]},#{test_param[:street_address]},#{test_param[:street_address_2]} ,#{test_param[:city]} #{test_param[:state]} #{test_param[:zip]}"

  step "set Order Details form Ship-To Country to #{test_param[:country]}"
  step "set Order Details form Ship-To to Domestic Address #{test_param[:ship_to]}"
end

Then /^[Ss]et Order Details Ship-To Country to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})["group" + group].values
  test_param[:country] = country_list[rand(country_list.size)]
  config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details form Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Order Details Ship-To Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})["group" + group].values
  test_param[:country] = country_list[rand(country_list.size)]
  config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details form Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Order Details Ship-To International address to$/ do |table|
  address_table = table.hashes.first

  test_param[:country] = address_table['country']
  test_param[:full_name] = (address_table['full_name'].downcase.include?('random')) ? helper.random_full_name : address_table['full_name']
  test_param[:company] = (address_table['company'].downcase.include?('random')) ? helper.random_company_name : address_table['company']
  test_param[:street_address_1] = (address_table['street_address_1'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['street_address_1']
  test_param[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? helper.random_suite : address_table['street_address_2']
  test_param[:city] = (address_table['city'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['city']
  test_param[:state] = (address_table['province'].downcase.include?('random')) ? helper.random_alpha_numeric : address_table['province']
  test_param[:zip] = (address_table['postal_code'].downcase.include?('random'))?helper.random_alpha_numeric : address_table['postal_code']
  test_param[:phone] = (address_table['phone'].downcase.include?('random')) ? helper.random_phone_number : address_table['phone']
  test_param[:email] = (address_table['email'].downcase.include?('random')) ? helper.random_email : address_table['email']

  step "set Order Details form Ship-To Country to #{test_param[:country]}"
  step "set Order Details form International Ship-To Name to \"#{test_param[:full_name]}\""
  step "set Order Details form International Ship-To Company to \"#{test_param[:company]}\""
  step "set Order Details form International Ship-To Address 1 to \"#{test_param[:street_address_1]}\""
  step "set Order Details form International Ship-To Address 2 to \"#{test_param[:street_address_2]}\""
  step "set Order Details form International Ship-To City to \"#{test_param[:city]}\""
  step "set Order Details form International Ship-To Province to \"#{test_param[:state]}\""
  step "set Order Details form International Ship-To Postal Code to \"#{test_param[:zip]}\""
  step "set Order Details form International Ship-To Phone to \"#{test_param[:phone]}\""
  step "set Order Details form International Ship-To Email to \"#{test_param[:email]}\""
end

Then /^[Ss]et Order Details form Ship-To to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  address = helper.address_helper_zone(address)
  test_param[:street_address] = address['street_address']
  test_param[:city] = address['city']
  test_param[:state] = address['state']
  test_param[:zip] = address['zip']
  test_param[:full_name] = address['full_name']
  test_param[:company] = address['company']
  test_param[:ship_to_domestic] = helper.format_address(address)

  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set(test_param[:ship_to_domestic])
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Ship-To to Domestic Address (.*)$/ do |address|
  test_param[:ship_to_domestic] = helper.format_address(address)
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set test_param[:ship_to_domestic]
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
  expect(test_param[:order_id][0].to_i).to be > 0
end

Then /^[Ee]xpect Order Details form Order ID equals Grid Oder ID in row (\d+)$/ do |row|
  expect(stamps.orders.order_details.toolbar.order_id).to eql stamps.orders.orders_grid.column.order_id.row(row)
end

Then /^[Ee]xpect Order Details form Order ID is the same as saved Order ID$/ do
  expect(stamps.orders.order_details.toolbar.order_id).to eql test_param[:order_id][0]
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
  test_param[:phone] = (phone.to_s.strip.downcase.include?('random'))?(helper.random_phone_number):phone
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    stamps.orders.order_details.ship_to.domestic.phone.set test_param[:phone]
  end unless test_param[:phone].length == 0
  step "Save Order Details data"
end

Then /^[Ss]et Order Details form Email to (.*)$/ do |email|
  test_param[:email] = (email.to_s.strip.downcase.include?('random'))?(helper.random_email):email
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    stamps.orders.order_details.ship_to.domestic.email.set test_param[:email]
  end unless test_param[:email].length == 0
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
  test_param[:reference_no] = (value.downcase.include?('random'))?helper.random_alpha_numeric : value
  stamps.orders.order_details.reference_no.set test_param[:reference_no]
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

#validating
Then /^(?:E|e)xpect Order Details form Ship From is (.*)$/ do |expectation|
  expect(stamps.orders.multi_order.ship_from_multi.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Domestic service is (.*)$/ do |expectation|
  expect(stamps.orders.multi_order.domestic_service.text_box.text).to eql expectation
end

