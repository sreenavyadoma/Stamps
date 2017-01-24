Then /^On Order Details form, Expand Manual Items Ordered pane$/ do
  logger.step "On Order Details form, Expand Manual Items Ordered pane"
  stamps.orders.order_details.item_grid.expand
end

Then /^On Order Details form, Collapse Manual Items Ordered pane$/ do
  logger.step "On Order Details form, Collapse Manual Items Ordered pane"
  stamps.orders.order_details.item_grid.collapse_item
end

Then /^On Order Details form, Expand Store Items Ordered pane$/ do
  logger.step "On Order Details form, Expand Items Ordered pane"
  stamps.orders.order_details.item_grid.expand
end

Then /^On Order Details form, Collapse Store Items Ordered pane$/ do
  logger.step "On Order Details form, Collapse Items Ordered pane"
  stamps.orders.order_details.item_grid.collapse_store_item
end

Then /^On Order Details form, Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  logger.step "On Order Details form, Add Item #{item_number}, Qty #{qty}, ID #{id} Description #{description}"
  item = stamps.orders.order_details.item_grid.item item_number.to_i
  step "On Order Details form, Blur out"
  item.qty.set qty
  step "On Order Details form, Blur out"
  item.id.set (id.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : id
  step "On Order Details form, Blur out"
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  step "On Order Details form, Blur out"
  step "Save Test Data"
  step "On Order Details form, Blur out"
end

Then /^On Order Details form, Add Item (\d+)$/ do |value|
  logger.step "On Order Details form, Add Item #{value}"
  @details_line_item = stamps.orders.order_details.item_grid.item value.to_i
end

Then /^On Order Details form, set Qty to (\d+)$/ do |value|
  logger.step "On Order Details form, set Qty to #{value}"
  @details_line_item.qty.set value
end

Then /^On Order Details form, set ID to (.*)$/ do |value|
  logger.step "On Order Details form, set ID to #{value}"
  @details_line_item.id.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^On Order Details form, set Description to (.*)$/ do |value|
  logger.step "On Order Details form, set Description to #{value}"
  @details_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^On Order Details form, set Ship-To Country to (.*)$/ do |country|
  logger.step "On Order Details form, set Ship-To Country to #{country}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.country.select country
end

Then /^On Order Details form, set International Ship-To Name to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Name to #{value}"
  test_data[:int_ship_to_name] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.name.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.name.set test_data[:int_ship_to_name]
  end
end

Then /^On Order Details form, set International Ship-To Company to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Company to #{value}"
  test_data[:int_ship_to_company] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.company.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.company.set test_data[:int_ship_to_company]
  end
end

Then /^On Order Details form, set International Ship-To Address 1 to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Address 1 to #{value}"
  test_data[:int_ship_to_address_1] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_1.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.address_1.set test_data[:int_ship_to_address_1]
  end
end

Then /^On Order Details form, set International Ship-To Address 2 to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Address 2 to #{value}"
  test_data[:int_ship_to_address_2] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.address_2.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.address_2.set test_data[:int_ship_to_address_2]
  end
end

Then /^On Order Details form, set International Ship-To City to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To City to #{value}"
  test_data[:int_ship_to_city] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.city.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.city.set test_data[:int_ship_to_city]
  end
end

Then /^On Order Details form, set International Ship-To Province to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Province to #{value}"
  test_data[:int_ship_to_province] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.province.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.province.set test_data[:int_ship_to_province]
  end
end

Then /^On Order Details form, set International Ship-To Postal Code to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Postal Code to #{value}"
  test_data[:int_ship_to_postal_code] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.postal_code.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.postal_code.set test_data[:int_ship_to_postal_code]
  end
end

Then /^On Order Details form, set International Ship-To Phone to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Phone to #{value}"
  test_data[:int_ship_to_phone] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.phone.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.phone.set test_data[:int_ship_to_phone]
  end
end

Then /^On Order Details form, set International Ship-To Email to \"(.*)\"$/ do |value|
  logger.step "On Order Details form, set International Ship-To Email to #{value}"
  test_data[:int_ship_to_email] = ((value.downcase == "random")? ParameterHelper.random_name : value)
  if value.length == 0
    stamps.orders.order_details.ship_to.international.email.send_keys :enter
  else
    stamps.orders.order_details.ship_to.international.email.set test_data[:int_ship_to_email]
  end
end

Then /^On Order Details form, Expand panel$/ do
  logger.step "On Order Details form, Expand panel"
  stamps.orders.order_details.expand
end

Then /^On Order Details form, Delete Item (\d+)$/ do |item_number|
  logger.step "On Order Details form, Delete Item #{item_number}"
  item = stamps.orders.order_details.item_grid.item item_number.to_i
  item.delete.safe_click
end

Then /^On Order Details form, set Weight to (\d+) lb (\d+) oz$/ do |pounds, ounces|
  logger.step "On Order Details form, set Weight to #{pounds} Pounds and #{ounces} Ounces"
  step "On Order Details form, set Pounds to #{pounds}"
  step "On Order Details form, set Ounces to #{ounces}"
end

Then /^On Order Details form, set Pounds to (\d+)$/ do |value|
  logger.step "On Order Details form, set Pounds to \"#{value}\""
  test_data[:lb] = value
  stamps.orders.order_details.weight.lb.set test_data[:lb]
  step "On Order Details form, Blur out"
  step "Save Test Data"
end

Then /^On Order Details form, set Ounces to (\d+)$/ do |value|
  logger.step "On Order Details form, set Ounces to \"#{value}\""
  test_data[:oz] = value
  stamps.orders.order_details.weight.oz.set test_data[:oz]
  step "On Order Details form, Blur out"
  step "Save Test Data"
end

Then /^On Order Details form, Blur out$/ do
  stamps.orders.order_details.blur_out
end

Then /^Save Test Data$/ do
  logger.step "Save Test Data"
  test_data[:service_cost] = stamps.orders.order_details.service.cost
  test_data[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  test_data[:tracking_cost] = stamps.orders.order_details.tracking.cost if stamps.orders.order_details.tracking.present?
  test_data[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
  test_data[:order_id] = stamps.orders.order_details.toolbar.order_id
  test_data[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
end

Then /^On Order Details form, set Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  logger.step "On Order Details form, set Dimensions to Length #{length} Width #{width} Height #{height}"
  stamps.orders.order_details.dimensions.length.set length
  stamps.orders.order_details.dimensions.width.set width
  stamps.orders.order_details.dimensions.height.set height
  step "Save Test Data"
end

Then /^On Order Details form, set Length to (\d*)$/ do |value|
  logger.step "On Order Details form, set Length to \"#{value}\""
  test_data[:length] = value
  stamps.orders.order_details.dimensions.length.present?.should be true
  stamps.orders.order_details.dimensions.length.set value
  step "Save Test Data"
end

Then /^On Order Details form, set Width to (\d*)$/ do |value|
  logger.step "On Order Details form, set Width to \"#{value}\""
  test_data[:width] = value
  stamps.orders.order_details.dimensions.width.present?.should be true
  stamps.orders.order_details.dimensions.width.set value
  step "Save Test Data"
end

Then /^On Order Details form, set Height to (\d*)$/ do |value|
  logger.step "On Order Details form, set Height to \"#{value}\""
  test_data[:height] = value
  stamps.orders.order_details.dimensions.height.present?.should be true
  stamps.orders.order_details.dimensions.height.set value
  step "Save Test Data"
end

Then /^On Order Details form, check Insure-For checkbox$/ do
  logger.step "On Order Details form, check Insure-For checkbox"
  stamps.orders.order_details.insure_for.checkbox.check
end

Then /^On Order Details form, uncheck Insure-For checkbox$/ do
  logger.step "On Order Details form, uncheck Insure-For checkbox"
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^On Order Details form, set Insure-For to \$(.*)$/ do |value|
  test_data[:insure_for] = value
  logger.step "On Order Details form, set Insure-For to #{test_data[:insure_for]}"
  stamps.orders.order_details.insure_for.set_and_agree(test_data[:insure_for])
  20.times do
    break if stamps.orders.order_details.insure_for.cost.to_f > 0
    step "On Order Details form, Blur out"
  end
  test_data[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  logger.step "Insurance Cost: $#{test_data[:insure_for_cost]}"
  step "Save Test Data"
end

Then /^On Order Details form, set Tracking to USPS Tracking$/ do
  step "On Order Details form, set Tracking to \"USPS Tracking\""
end

Then /^On Order Details form, set Tracking to Signature Required$/ do
  step "On Order Details form, set Tracking to \"Signature Required\""
  step "Save Test Data"
end

Then /^On Order Details form, set Tracking to \"([\w ]*)\"$/ do |value|
  logger.step "On Order Details form, set Tracking to #{value}"
  stamps.orders.order_details.tracking.select value
  10.times do
    break if stamps.orders.order_details.tracking.cost.to_f > 0
    step "On Order Details form, Blur out"
  end
  test_data[:tracking_cost] = stamps.orders.order_details.tracking.cost
  logger.step "Tracking Cost: $#{test_data[:tracking_cost]}"
  test_data[:tracking] = stamps.orders.order_details.tracking.text_box.text
  step "Save Test Data"
end

Then /^On Order Details form, Store Tracking info to parameter$/ do
  logger.step "On Order Details form, Store Tracking info to parameter"
  test_data[:tracking] = stamps.orders.order_details.tracking.text_box.text
end

Then /^On Order Details form, set Ship-From to (\w+)$/ do |value|
  logger.step "On Order Details form, set Ship-From to: \n #{value}"
  stamps.orders.order_details.ship_from.select value
  step "On Order Details form, Blur out"
  test_data[:ship_from] = stamps.orders.order_details.ship_from.text_box.text
  step "Save Test Data"
end

Then /^On Order Details form, set Ship-To to address in Zone 1$/ do
  step "On Order Details form, set Ship-To to zone 1"
end

Then /^On Order Details form, set Ship-To to address in Zone 2$/ do
  step "On Order Details form, set Ship-To to zone 2"
end

Then /^On Order Details form, set Ship-To to address in Zone 3$/ do
  step "On Order Details form, set Ship-To to zone 3"
end

Then /^On Order Details form, set Ship-To to address in Zone 4$/ do
  step "On Order Details form, set Ship-To to zone 4"
end

Then /^On Order Details form, set Ship-To to address in Zone 5$/ do
  step "On Order Details form, set Ship-To to zone 5"
end

Then /^On Order Details form, set Ship-To to address in Zone 6$/ do
  step "On Order Details form, set Ship-To to zone 6"
end

Then /^On Order Details form, set Ship-To to address in Zone 7$/ do
  step "On Order Details form, set Ship-To to zone 7"
end

Then /^On Order Details form, set Ship-To to address in Zone 8$/ do
  step "On Order Details form, set Ship-To to zone 8"
end

Then /^On Order Details form, set Ship-To to address in Zone 9$/ do
  step "On Order Details form, set Ship-To to zone 9"
end

Then /^On Order Details form, set Ship-To to address in Zone 1 through 4$/ do
  step "On Order Details form, set Ship-To to zone 1 through 4"
end

Then /^On Order Details form, set Ship-To to address in Zone 5 through 8$/ do
  step "On Order Details form, set Ship-To to zone 5 through 8"
end

Then /^On Order Details form, set Ship-To to Domestic Address$/ do |table|
  address_table = table.hashes.first
  logger.step "On Order Details form, set Ship-To to Domestic Address \n#{address_table}"

  name = (address_table['name'].downcase.include? "random") ? ParameterHelper.random_name : address_table['name']
  company = (address_table['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address_table['company']
  city = (address_table['city'].downcase.include? "random") ? ParameterHelper.random_string : address_table['city']
  street_address = (address_table['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address_table['street_address']

  if address_table['street_address_2'].nil?
    street_address_2 = ""
  else
    street_address_2 = (address_table['street_address_2'].downcase.include? "random") ? ParameterHelper.random_string(2, 7) : address_table['street_address_2']
  end

  #phone = (address_table['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address_table['phone']
  #email = (address_table['email'].downcase.include? "random") ? ParameterHelper.random_email : address_table['email']

  state = (address_table['state'].downcase.include? "random") ? ParameterHelper.random_string : address_table['state']
  zip = (address_table['zip'].downcase.include? "random") ? ParameterHelper.random_string : address_table['zip']
  country = (address_table['country'].size==0)?"United States":address_table['country']

  ship_to = "#{name},#{company},#{street_address},#{street_address_2} ,#{city} #{state} #{zip}"

  test_data[:ship_to] = ship_to
  test_data[:name] = name
  test_data[:company] = company
  test_data[:city] = city
  test_data[:street_address] = street_address
  test_data[:street_address_2] = street_address_2
  test_data[:state] = state
  test_data[:zip] = zip
  test_data[:country] = country

  #test_data[:phone] = phone
  #test_data[:email] = email

  step "On Order Details form, set Ship-To Country to #{test_data[:country]}"
  step "On Order Details form, set Ship-To to Domestic Address #{test_data[:ship_to]}"
end

Then /^On Order Details International form, set address to$/ do |table|
  address_table = table.hashes.first
  logger.step "On Order Details form, set Ship-To to Domestic Address \n#{address_table}"

  country = address_table['country']
  name = (address_table['name'].downcase.include? "random") ? ParameterHelper.random_name : address_table['name']
  company = (address_table['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address_table['company']
  city = (address_table['city'].downcase.include? "random") ? ParameterHelper.random_string : address_table['city']
  phone = (address_table['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address_table['phone']
  email = (address_table['email'].downcase.include? "random") ? ParameterHelper.random_email : address_table['email']

  street_address_1 = (address_table['street_address_1'].downcase.include? "random") ? ParameterHelper.random_string : address_table['street_address_1']
  street_address_2 = (address_table['street_address_2'].downcase.include? "random") ? ParameterHelper.random_suite : address_table['street_address_2']
  province = (address_table['province'].downcase.include? "random") ? ParameterHelper.random_string : address_table['province']
  postal_code = (address_table['postal_code'].downcase.include? "random") ? ParameterHelper.random_alpha_numeric : address_table['postal_code']

  test_data[:country] = country
  test_data[:name] = name
  test_data[:company] = company
  test_data[:street_address_1] = street_address_1
  test_data[:street_address_2] = street_address_2
  test_data[:city] = city
  test_data[:province] = province
  test_data[:postal_code] = postal_code
  test_data[:phone] = phone
  test_data[:email] = email

  step "On Order Details form, set Ship-To Country to #{test_data[:country]}"
  step "On Order Details form, set International Ship-To Name to \"#{test_data[:name]}\""
  step "On Order Details form, set International Ship-To Company to \"#{test_data[:company]}\""
  step "On Order Details form, set International Ship-To Address 1 to \"#{test_data[:street_address_1]}\""
  step "On Order Details form, set International Ship-To Address 2 to \"#{test_data[:street_address_2]}\""
  step "On Order Details form, set International Ship-To City to \"#{test_data[:city]}\""
  step "On Order Details form, set International Ship-To Province to \"#{test_data[:province]}\""
  step "On Order Details form, set International Ship-To Postal Code to \"#{test_data[:postal_code]}\""
  step "On Order Details form, set International Ship-To Phone to \"#{test_data[:phone]}\""
  step "On Order Details form, set International Ship-To Email to \"#{test_data[:email]}\""
end

Then /^On Order Details form, set Ship-To to zone (.*)$/ do |zone|
  address = ""
  case zone.downcase
    when /1 through 4/
      address = ParameterHelper.rand_zone_1_4
    when /5 through 8/
      address = ParameterHelper.rand_zone_5_8
    when /1/
      address = ParameterHelper.rand_zone_1
      test_data[:zone] = 1
    when /2/
      address = ParameterHelper.rand_zone_2
      test_data[:zone] = 2
    when /3/
      address = ParameterHelper.rand_zone_3
      test_data[:zone] = 3
    when /4/
      address = ParameterHelper.rand_zone_4
      test_data[:zone] = 4
    when /5/
      address = ParameterHelper.rand_zone_5
      test_data[:zone] = 5
    when /6/
      address = ParameterHelper.rand_zone_6
      test_data[:zone] = 6
    when /7/
      address = ParameterHelper.rand_zone_7
      test_data[:zone] = 7
    when /8/
      address = ParameterHelper.rand_zone_8
      test_data[:zone] = 8
    when /9/
      address = ParameterHelper.rand_zone_9
      test_data[:zone] = 9
    else
      "Invalid Zone Option".should eql "Zone #{zone} is not a valid zone. Valid options are from zone 1 through 8."
  end

  test_data[:street_address] = address['street_address']
  test_data[:city] = address['city']
  test_data[:state] = address['state']
  test_data[:zip] = address['zip']
  test_data[:name] = address['name']
  test_data[:company] = address['company']

  test_data.each_key { |key_value_array| logger.step("#{key_value_array} : #{test_data[key_value_array]}") }
  logger.step "On Order Details form, set Ship-To to address in Zone #{zone} = \"#{address}\""
  # set Ship-To address
  test_data[:ship_to_domestic] = ParameterHelper.format_address(address)
  stamps.orders.order_details.ship_to.domestic.show_address
  logger.step "Domestic Ship-To Address: #{test_data[:ship_to_domestic]}"
  stamps.orders.order_details.ship_to.domestic.set test_data[:ship_to_domestic]
  step "Save Test Data"
end

Then /^On Order Details form, set Ship-To to Domestic Address (.*)$/ do |address|
  logger.step "On Order Details form, set Ship-To to Domestic Address \"#{address}\""
  test_data[:ship_to_domestic] = ParameterHelper.format_address(address)
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set test_data[:ship_to_domestic]
  step "Save Test Data"
end

Then /^On Order Details form, Hide Ship-To fields$/ do
  logger.step "On Order Details form, Hide Ship-To fields"
  stamps.orders.order_details.ship_to.domestic.less
end

Then /^On Order Details form, Hide International Ship-To fields$/ do
  logger.step "On Order Details form, Hide International Ship-To fields"
  stamps.orders.order_details.ship_to.international.less
end

Then /^On Order Details form, Show Ship-To fields$/ do
  logger.step "On Order Details form, Show Ship-To fields"
  stamps.orders.order_details.ship_to.domestic.show_address
end

Then /^On Order Details form, expect Order ID is truthy$/ do
  logger.step "On Order Details form, expect Order ID is truthy"
  logger.step "Saved Order ID created:  #{test_data[:order_id].to_i>0}"
  test_data[:order_id].to_i.should be > 0
end

Then /^On Order Details form, expect Order ID equals Grid Oder ID in row (\d+)$/ do |row|
  logger.step "On Order Details form, expect Order ID equals Grid Oder ID in row #{row}"
  stamps.orders.order_details.toolbar.order_id.should eql stamps.orders.orders_grid.column.order_id.row(row)
end

Then /^On Order Details form, expect Order ID is the same as saved Order ID$/ do
  logger.step "On Order Details form, expect Order ID is the same as saved Order ID. test_data[:order_id]=#{test_data[:order_id]}"
  stamps.orders.order_details.toolbar.order_id.should eql test_data[:order_id]
end

Then /^On Order Details form, expect Ship-To Name is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Name is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.recipient_name.should eql expectation
end

Then /^On Order Details form, expect Ship-To Company Name is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Company Name is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.company_name.should eql expectation
end

Then /^On Order Details form, expect Ship-To Cleansed Street Address is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Cleansed Street Address is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.street_address.should eql expectation
end

Then /^On Order Details form, expect Ship-To Cleansed City is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Cleansed City is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.city.should eql expectation
end

Then /^On Order Details form, expect Ship-To Cleansed State is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Cleansed State is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.state.should eql expectation
end

Then /^On Order Details form, expect Ship-To Cleansed Zip Plus 4 Code is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Cleansed Zip Plus 4 Code is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.zip_plus_4.should eql expectation
end

Then /^On Order Details form, expect Ship-To Cleansed Zip Code is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Cleansed Zip Code is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.zip_code.should eql expectation
end

Then /^On Order Details form, expect Ship-To Phone is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Phone is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.phone.text.should eql expectation
end

Then /^On Order Details form, expect Ship-To Email is (.*)$/ do |expectation|
  logger.step "On Order Details form, expect Ship-To Email is #{expectation}"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.email.text.should eql expectation
end

Then /^On Order Details form, set Ship-To to ambiguous address$/ do |table|
  ambiguous_address = ParameterHelper.format_address table.hashes.first
  logger.step "On Order Details form, set Ship-To to ambiguous address \n#{ambiguous_address}"
  stamps.orders.order_details.ship_to.domestic.set_ambiguous ambiguous_address
end

Then /^In Exact Address Not Found module, select row (\d+)$/ do |row|
  logger.step "In Exact Address Not Found module, select row #{row}"
  stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.row row
end

Then /^On Order Details form, set Phone to (.*)$/ do |phone|
  test_data[:phone] = (phone.to_s.strip.downcase.include? "random")?(ParameterHelper.random_phone):phone
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    logger.step "Order Details Form Phone to \"#{test_data[:phone]}\""
    stamps.orders.order_details.ship_to.domestic.phone.set test_data[:phone]
  end unless test_data[:phone].length == 0
  step "Save Test Data"
end

Then /^On Order Details form, set Email to (.*)$/ do |email|
  test_data[:email] = (email.to_s.strip.downcase.include? "random")?(ParameterHelper.random_email):email
  stamps.orders.order_details.ship_to.domestic.show_address
  begin
    logger.step "On Order Details form, set Email to \"#{test_data[:email]}\""
    stamps.orders.order_details.ship_to.domestic.email.set test_data[:email]
  end unless test_data[:email].length == 0
  step "Save Test Data"
end

Then /^Increment Order Details Pounds by (\d*)$/ do |value|
  logger.step "Increment Order Details Pounds by \"#{value}\""
  stamps.orders.order_details.weight.lb.increment value
end

Then /^Decrement Order Details Pounds by (\d*)$/ do |value|
  logger.step "Decrement Order Details Pounds by \"#{value}\""
  stamps.orders.order_details.weight.lb.decrement value
  step "Save Test Data"
end

Then /^Increment Order Details Ounces by (\d*)$/ do |value|
  logger.step "Increment Order Details Ounces by \"#{value}\""
  stamps.orders.order_details.weight.oz.increment value
  step "Save Test Data"
end

Then /^Decrement Order Details Ounces by (\d*)$/ do |value|
  logger.step "Decrement Order Details Ounces by \"#{value}\""
  stamps.orders.order_details.weight.oz.decrement value
  step "Save Test Data"
end

Then /^Increment Order Details Length by (\d*)$/ do |value|
  logger.step "Increment Order Details Length by \"#{value}\""
  stamps.orders.order_details.dimensions.length.increment value
  step "Save Test Data"
end

Then /^Decrement Order Details Length by (\d*)$/ do |value|
  logger.step "Decrement Order Details Length by \"#{value}\""
  stamps.orders.order_details.dimensions.length.decrement value
  step "Save Test Data"
end

Then /^Increment Order Details Width by (\d*)$/ do |value|
  logger.step "Increment Order Details Width by \"#{value}\""
  stamps.orders.order_details.dimensions.width.increment value
  step "Save Test Data"
end

Then /^Decrement Order Details Width by (\d*)$/ do |value|
  logger.step "Decrement Order Details Width by \"#{value}\""
  stamps.orders.order_details.dimensions.width.decrement value
  step "Save Test Data"
end

Then /^Increment Order Details Height by (\d*)$/ do |value|
  logger.step "Increment Order Details Height by \"#{value}\""
  stamps.orders.order_details.dimensions.height.increment value
  step "Save Test Data"
end

Then /^Decrement Order Details Height by (\d*)$/ do |value|
  logger.step "Decrement Order Details Height by \"#{value}\""
  stamps.orders.order_details.dimensions.height.decrement value
  step "Save Test Data"
end

Then /^Increment Order Details Insure-For by (\d*)$/ do |value|
  logger.step "Increment Order Details Insure-For by \"#{value}\""
  stamps.orders.order_details.insure_for.increment value
  step "Save Test Data"
end

Then /^Decrement Order Details Insure-For by (\d*)$/ do |value|
  logger.step "Decrement Order Details Insure-For by \"#{value}\""
  stamps.orders.order_details.insure_for.decrement value
  step "Save Test Data"
end

Then /^On Order Details form, set Reference Number to (.*)$/ do |value|
  reference_no = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  logger.step "On Order Details form, set Reference Number to #{reference_no}"
  stamps.orders.order_details.reference_no.set reference_no
  test_data[:reference_no] = reference_no
  step "Save Test Data"
end

Then /^On Order Details form, expect Domestic Ship-To Company is (.*)$/ do |company|
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.text.should include company
end

Then /^On Order Details form, expect Domestic Ship-To Name is (.*)$/ do |name|
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.text.should include name
end

Then /^Verify Order Details Form Total Amount$/ do
  logger.step "Verify Order Details Form Total Amount"
end




