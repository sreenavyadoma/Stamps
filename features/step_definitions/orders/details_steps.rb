Then /^Details: Expand Manual Items Ordered pane$/ do
  logger.step "Details: Expand Manual Items Ordered pane"
  web_apps.orders.details.item_grid.expand
end

Then /^Details: Collapse Manual Items Ordered pane$/ do
  logger.step "Details: Collapse Manual Items Ordered pane"
  web_apps.orders.details.item_grid.collapse_item
end

Then /^Details: Expand Store Items Ordered pane$/ do
  logger.step "Details: Expand Items Ordered pane"
  web_apps.orders.details.item_grid.expand
end

Then /^Details: Collapse Store Items Ordered pane$/ do
  logger.step "Details: Collapse Items Ordered pane"
  web_apps.orders.details.item_grid.collapse_store_item
end

Then /^Details: Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  logger.step "Details: Add Item #{item_number}, Qty #{qty}, ID #{id} Description #{description}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  item.qty.set qty
  item.id.set (id.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : id
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  step "Details: Save Total Ship Cost"
end

Then /^Details: Add Item (\d+)$/ do |item_number|
  logger.step "Details: Add Item #{item_number}"
  @details_line_item = web_apps.orders.details.item_grid.item item_number.to_i
  #web_apps.orders.details.item_grid.size.should eql item_number
end

Then /^Details: Set Qty to (\d+)$/ do |value|
  logger.step "Details: Set Qty to #{value}"
  @details_line_item.qty.set value
end

Then /^Details: Set ID to (.*)$/ do |value|
  logger.step "Details: Set ID to #{value}"
  @details_line_item.id.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Details: Set Description to (.*)$/ do |value|
  logger.step "Details: Set Description to #{value}"
  @details_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Details: Set Ship-To Country to (.*)$/ do |country|
  logger.step "Details: Set Ship-To Country to #{country}"
  @international_ship_to = web_apps.orders.details.ship_to.country.select country
end

Then /^Details: Set International Ship-To Name to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Name to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.name.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.name.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Company to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Company to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.company.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.company.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Address 1 to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Address 1 to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.address_1.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.address_1.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Address 2 to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Address 2 to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.address_2.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.address_2.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To City to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To City to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.city.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.city.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Province to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Province to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.province.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.province.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Postal Code to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Postal Code to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.postal_code.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.postal_code.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Phone to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Phone to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.phone.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.phone.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Email to \"(.*)\"$/ do |value|
  logger.step "Details: Set International Ship-To Email to #{value}"
  if value.length == 0
    web_apps.orders.details.ship_to.international.email.send_keys :enter
  else
    web_apps.orders.details.ship_to.international.email.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Expand panel$/ do
  logger.step "Details: Expand panel"
  web_apps.orders.details.expand
end

Then /^Details: Delete Item (\d+)$/ do |item_number|
  logger.step "Details: Delete Item #{item_number}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  item.delete.safe_click
end

Then /^Details: Set Weight to (\d+) lbs (\d+) oz$/ do |pounds, ounces|
  logger.step "Details: Set Weight to #{pounds} Pounds and #{ounces} Ounces"
  step "Details: Set Pounds to #{pounds}"
  step "Details: Set Ounces to #{ounces}"
end

Then /^Details: Set Pounds to (.*)$/ do |value|
  logger.step "Details: Set Pounds to \"#{value}\""
  @details_form_data[:lbs] = value
  web_apps.orders.details.weight.lbs.set value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Ounces to (.*)$/ do |value|
  logger.step "Details: Set Ounces to \"#{value}\""
  @details_form_data[:oz] = value
  web_apps.orders.details.weight.oz.set value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Blur out$/ do
  web_apps.orders.details.blur_out
end

Then /^Details: Save Total Ship Cost$/ do
  @details_form_data[:total_ship_cost] = web_apps.orders.details.footer.total_ship_cost
end

Then /^Details: Set Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  logger.step "Details: Set Dimensions to Length #{length} Width #{width} Height #{height}"
  web_apps.orders.details.dimensions.length.set length
  web_apps.orders.details.dimensions.width.set width
  web_apps.orders.details.dimensions.height.set height
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Length to (\d*)$/ do |value|
  logger.step "Details: Set Length to \"#{value}\""
  @details_form_data[:length] = value
  web_apps.orders.details.dimensions.length.set value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Width to (\d*)$/ do |value|
  logger.step "Details: Set Width to \"#{value}\""
  @details_form_data[:width] = value
  web_apps.orders.details.dimensions.width.set value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Height to (\d*)$/ do |value|
  logger.step "Details: Set Height to \"#{value}\""
  @details_form_data[:height] = value
  web_apps.orders.details.dimensions.height.set value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Check Insure-For checkbox$/ do
  logger.step "Details: Check Insure-For checkbox"
  web_apps.orders.details.insure_for.checkbox.check
end

Then /^Details: Uncheck Insure-For checkbox$/ do
  logger.step "Details: Uncheck Insure-For checkbox"
  web_apps.orders.details.insure_for.checkbox.uncheck
end

Then /^Details: Set Insure-For to \$(.*)$/ do |value|
  logger.step "Details: Set Insure-For to #{value}"
  @details_form_data[:insure_for] = value
  web_apps.orders.details.insure_for.set value
  10.times do
    break if web_apps.orders.details.insure_for.cost.to_f > 0
  end
  @details_form_data[:insure_for_cost] = web_apps.orders.details.insure_for.cost
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Tracking to USPS Tracking$/ do
  step "Details: Set Tracking to \"USPS Tracking\""
end

Then /^Details: Set Tracking to Signature Required$/ do
  step "Details: Set Tracking to \"Signature Required\""
end

Then /^Details: Set Tracking to \"([\w ]*)\"$/ do |value|
  logger.step "Details: Set Tracking to #{value}"
  @details_form_data[:tracking] = value
  web_apps.orders.details.tracking.select value
  10.times do
    break if web_apps.orders.details.tracking.cost.to_f > 0
  end
  @details_form_data[:tracking_cost] = web_apps.orders.details.tracking.cost
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Ship-From to (\w+)$/ do |value|
  logger.step "Details: Set Ship-From to: \n #{value}"
  web_apps.orders.details.ship_from.select value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Ship-To to Random Address in Zone 1$/ do
  step "Details: Set Ship-To address to zone 1"
end

Then /^Details: Set Ship-To to Random Address in Zone 2$/ do
  step "Details: Set Ship-To address to zone 2"
end

Then /^Details: Set Ship-To to Random Address in Zone 3$/ do
  step "Details: Set Ship-To address to zone 3"
end

Then /^Details: Set Ship-To to Random Address in Zone 4$/ do
  step "Details: Set Ship-To address to zone 4"
end

Then /^Details: Set Ship-To to Random Address in Zone 5$/ do
  step "Details: Set Ship-To address to zone 5"
end

Then /^Details: Set Ship-To to Random Address in Zone 6$/ do
  step "Details: Set Ship-To address to zone 6"
end

Then /^Details: Set Ship-To to Random Address in Zone 7$/ do
  step "Details: Set Ship-To address to zone 7"
end

Then /^Details: Set Ship-To to Random Address in Zone 8$/ do
  step "Details: Set Ship-To address to zone 8"
end

Then /^Details: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Details: Set Ship-To address to zone 1 through 4"
end

Then /^Details: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Details: Set Ship-To address to zone 5 through 8"
end

Then /^Details: Set Ship-To domestic address to$/ do |table|
  address_table = table.hashes.first
  logger.step "Details: Set Ship-To domestic address to \n#{address_table}"

  name = (address_table['name'].downcase.include? "random") ? ParameterHelper.random_name : address_table['name']
  company = (address_table['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address_table['company']
  city = (address_table['city'].downcase.include? "random") ? ParameterHelper.random_string : address_table['city']
  phone = (address_table['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address_table['phone']
  email = (address_table['email'].downcase.include? "random") ? ParameterHelper.random_email : address_table['email']
  street_address = (address_table['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address_table['street_address']
  street_address_2 = (address_table['street_address_2'].downcase.include? "random") ? ParameterHelper.random_string(2, 7) : address_table['street_address_2']
  state = (address_table['state'].downcase.include? "random") ? ParameterHelper.random_string : address_table['state']
  zip = (address_table['zip'].downcase.include? "random") ? ParameterHelper.random_string : address_table['zip']
  country = (address_table['country'].size==0)?"United States":address_table['country']

  ship_to = "#{name},#{company},#{street_address},#{street_address_2} ,#{city} #{state} #{zip}"

  @details_form_data[:ship_to] = ship_to
  @details_form_data[:name] = name
  @details_form_data[:company] = company
  @details_form_data[:city] = city
  @details_form_data[:phone] = phone
  @details_form_data[:email] = email
  @details_form_data[:street_address] = street_address
  @details_form_data[:street_address_2] = street_address_2
  @details_form_data[:state] = state
  @details_form_data[:zip] = zip
  @details_form_data[:country] = country

  step "Details: Set Ship-To Country to #{@details_form_data[:country]}"
  step "Details: Set Ship-To address to #{@details_form_data[:ship_to]}"
  step "Details: Set Phone to #{@details_form_data[:phone]}"
  step "Details: Set Email to #{@details_form_data[:email]}"
end

Then /^Details: Set Ship-To Less details$/ do
  web_apps.orders.details.ship_to.address.less.safe_click
end

Then /^Details: Hide Ship-To fields$/ do
  logger.step "Details: Hide Ship-To fields"
  web_apps.orders.details.ship_to.hide_address_details
end

Then /^Details: Set Ship-To address to$/ do |table|
  address_table = table.hashes.first
  logger.step "Details: Set Ship-To address to \n#{address_table}"

  ship_to_country = address_table['country']
  logger.step "Ship-To Country:  #{ship_to_country}"
  ship_to_name = (address_table['name'].downcase.include? "random") ? ParameterHelper.random_name : address_table['name']
  ship_to_company = (address_table['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address_table['company']
  ship_to_city = (address_table['city'].downcase.include? "random") ? ParameterHelper.random_string : address_table['city']
  ship_to_phone = (address_table['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address_table['phone']
  ship_to_email = (address_table['email'].downcase.include? "random") ? ParameterHelper.random_email : address_table['email']

  if ship_to_country.downcase.include? "united states"
    ship_to_street_address = (address_table['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address_table['street_address']
    ship_to_state = (address_table['state'].downcase.include? "random") ? ParameterHelper.random_string : address_table['state']
    ship_to_zip = (address_table['zip'].downcase.include? "random") ? ParameterHelper.random_string : address_table['zip']

    ship_to_address = "#{ship_to_name},#{ship_to_company},#{ship_to_street_address},#{ship_to_city} #{ship_to_state} #{ship_to_zip}"
    step "Details: Set Ship-To address to #{ship_to_address}"
    step "Details: Set Phone to #{ship_to_phone}"
    step "Details: Set Email to #{ship_to_email}"


    @details_form_data[:name] = ship_to_name
    @details_form_data[:company] = ship_to_company
    @details_form_data[:city] = ship_to_city
    @details_form_data[:email] = ship_to_email
    @details_form_data[:street_address] = ship_to_street_address
    @details_form_data[:street_address_2] = ship_to_street_address_2
    @details_form_data[:state] = ship_to_state
    @details_form_data[:zip] = ship_to_zip
    @details_form_data[:country] = ship_to_country

  else
    ship_to_street_address_1 = (address_table['street_address_1'].downcase.include? "random") ? ParameterHelper.random_string : address_table['street_address_1']
    ship_to_street_address_2 = (address_table['street_address_2'].downcase.include? "random") ? ParameterHelper.random_suite : address_table['street_address_2']
    ship_to_province = (address_table['province'].downcase.include? "random") ? ParameterHelper.random_string : address_table['province']
    ship_to_postal_code = (address_table['postal_code'].downcase.include? "random") ? ParameterHelper.random_alpha_numeric : address_table['postal_code']

    logger.step "Ship-To Name: #{ship_to_name}"
    logger.step "Ship-To Company: #{ship_to_company}"
    logger.step "Ship-To Address 1: #{ship_to_street_address_1}"
    logger.step "Ship-To Address 2: #{ship_to_street_address_2}"
    logger.step "Ship-To City: #{ship_to_city}"
    logger.step "Ship-To Province: #{ship_to_province}"
    logger.step "Ship-To Postal Code: #{ship_to_postal_code}"
    logger.step "Ship-To Phone: #{ship_to_phone}"
    logger.step "Ship-To Email: #{ship_to_email}"

    step "Details: Set Ship-To Country to #{ship_to_country}"
    step "Details: Set International Ship-To Name to \"#{ship_to_name}\""
    step "Details: Set International Ship-To Company to \"#{ship_to_company}\""
    step "Details: Set International Ship-To Address 1 to \"#{ship_to_street_address_1}\""
    step "Details: Set International Ship-To Address 2 to \"#{ship_to_street_address_2}\""
    step "Details: Set International Ship-To City to \"#{ship_to_city}\""
    step "Details: Set International Ship-To Province to \"#{ship_to_province}\""
    step "Details: Set International Ship-To Postal Code to \"#{ship_to_postal_code}\""
    step "Details: Set International Ship-To Phone to \"#{ship_to_phone}\""
    step "Details: Set International Ship-To Email to \"#{ship_to_email}\""
  end
end

Then /^Details: Set Ship-To address to (.*)$/ do |address|
  logger.step "Details: Set Ship-To address to \"#{address}\""

  case address.downcase
    when /zone 1 through 4/
      address = ParameterHelper.rand_zone_1_4
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = ParameterHelper.rand_zone_5_8
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = ParameterHelper.rand_zone_1
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = ParameterHelper.rand_zone_2
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = ParameterHelper.rand_zone_3
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = ParameterHelper.rand_zone_4
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = ParameterHelper.rand_zone_5
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = ParameterHelper.rand_zone_6
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = ParameterHelper.rand_zone_7
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = ParameterHelper.rand_zone_8
      formatted_address = ParameterHelper.format_address address
      logger.step "Details: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = ParameterHelper.format_address address
  end

  web_apps.orders.details.ship_to.address.set formatted_address
  step "Details: Save Total Ship Cost"
end

Then /^Details: Expect Ship-To Name to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Name to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.recipient_name
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Company Name to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Company Name to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.company_name
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Street Address to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Street Address to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.street_address
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To City to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To City to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.city
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To State to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To State to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.state
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Zip Plus 4 Code to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Zip Plus 4 Code to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.zip_plus_4
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Zip Code to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Zip Code to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.text_area.zip_code
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Phone to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Phone to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.phone.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Email to be (.*)$/ do |expectation|
  logger.step "Details: Expect Ship-To Email to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.address.email.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Set Ship-To to ambiguous address$/ do |table|
  ambiguous_address = ParameterHelper.format_address table.hashes.first
  logger.step "Details: Set Ship-To to ambiguous address \n#{ambiguous_address}"
  web_apps.orders.details.ship_to.address.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  logger.step "Select row #{row} from Exact Address Not Found module"
  address_not_found_module = web_apps.orders.details.ship_to.address.ambiguous.address_not_found
  logger.step "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  raise "Ambiguous Address Module is not present.  Unable to set Ambiguous Address Row to #{row}" unless address_not_found_module.present?
  address_not_found_module.row row
end

Then /^Details: Set Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(ParameterHelper.random_phone):phone
  begin
    logger.step "Order Details Form Phone to \"#{@order_details_phone}\""
    web_apps.orders.details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(ParameterHelper.random_email):email
  begin
    logger.step "Details: Set Email to \"#{@order_details_email}\""
    web_apps.orders.details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Pounds by (\d*)$/ do |value|
  logger.step "Increment Order Details Pounds by \"#{value}\""
  web_apps.orders.details.weight.lbs.increment value
end

Then /^Decrement Order Details Pounds by (\d*)$/ do |value|
  logger.step "Decrement Order Details Pounds by \"#{value}\""
  web_apps.orders.details.weight.lbs.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Ounces by (\d*)$/ do |value|
  logger.step "Increment Order Details Ounces by \"#{value}\""
  web_apps.orders.details.weight.oz.increment value
  step "Details: Save Total Ship Cost"
end

Then /^Decrement Order Details Ounces by (\d*)$/ do |value|
  logger.step "Decrement Order Details Ounces by \"#{value}\""
  web_apps.orders.details.weight.oz.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Length by (\d*)$/ do |value|
  logger.step "Increment Order Details Length by \"#{value}\""
  web_apps.orders.details.dimensions.length.increment value
  step "Details: Save Total Ship Cost"
end

Then /^Decrement Order Details Length by (\d*)$/ do |value|
  logger.step "Decrement Order Details Length by \"#{value}\""
  web_apps.orders.details.dimensions.length.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Width by (\d*)$/ do |value|
  logger.step "Increment Order Details Width by \"#{value}\""
  web_apps.orders.details.dimensions.width.increment value
  step "Details: Save Total Ship Cost"
end

Then /^Decrement Order Details Width by (\d*)$/ do |value|
  logger.step "Decrement Order Details Width by \"#{value}\""
  web_apps.orders.details.dimensions.width.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Height by (\d*)$/ do |value|
  logger.step "Increment Order Details Height by \"#{value}\""
  web_apps.orders.details.dimensions.height.increment value
  step "Details: Save Total Ship Cost"
end

Then /^Decrement Order Details Height by (\d*)$/ do |value|
  logger.step "Decrement Order Details Height by \"#{value}\""
  web_apps.orders.details.dimensions.height.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Increment Order Details Insure-For by (\d*)$/ do |value|
  logger.step "Increment Order Details Insure-For by \"#{value}\""
  web_apps.orders.details.insure_for.increment value
  step "Details: Save Total Ship Cost"
end

Then /^Decrement Order Details Insure-For by (\d*)$/ do |value|
  logger.step "Decrement Order Details Insure-For by \"#{value}\""
  web_apps.orders.details.insure_for.decrement value
  step "Details: Save Total Ship Cost"
end

Then /^Details: Set Reference Number to (.*)$/ do |value|
  reference_no = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  logger.step "Details: Set Reference Number to #{reference_no}"
  web_apps.orders.details.reference_no.set reference_no
  @details_form_data[:reference_no] = reference_no
  step "Details: Save Total Ship Cost"
end

Then /^Add Ship-From address$/ do |ship_from|
  logger.step "Add Ship-From address #{ship_from}"
  add_form = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add.shipping_address ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  ship_from = (address.include?'random ship from zone 1 through 4')?(ParameterHelper.rand_ship_from_zone_1_4):address
  logger.step "Add Ship-From address #{(address.include?'random')?ship_from:(address)}"
  @ship_from_address = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add ship_from
  logger.step "Random address added: #{@ship_from_address}"
end

Then /^Details: Delete Ship-From address (\w+)$/ do |address|
  logger.step "Details: Delete Ship-From address #{address}"
  # not implemented
end

Then /^Details: Delete all Ship-From address$/ do
  logger.step "Details: Delete all Ship-From address"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  logger.step "Delete Ship-From Row #{row} from Manage Shipping Addresses Modal"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Details: Set Ship-From to Manage Shipping Addresses$/ do
  logger.step "Details: Set Ship-From to Manage Shipping Addresses"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  logger.step "Edit Ship-From address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  ship_address_modal = web_apps.orders.details.ship_from.select "Manage Shipping Addresses..."
  ship_address_modal.edit_address name, company, city,  new_address.hashes.first
end

Then /^Verify Order Details Form Total Amount$/ do
  logger.step "Verify Order Details Form Total Amount"
end




