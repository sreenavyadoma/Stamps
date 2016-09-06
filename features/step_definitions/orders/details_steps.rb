Then /^Details: Expand Manual Items Ordered pane$/ do
  logger.info "Details: Expand Manual Items Ordered pane"
  web_apps.orders.details.item_grid.expand
end

Then /^Details: Collapse Manual Items Ordered pane$/ do
  logger.info "Details: Collapse Manual Items Ordered pane"
  web_apps.orders.details.item_grid.collapse_item
end

Then /^Details: Expand Store Items Ordered pane$/ do
  logger.info "Details: Expand Items Ordered pane"
  web_apps.orders.details.item_grid.expand
end

Then /^Details: Collapse Store Items Ordered pane$/ do
  logger.info "Details: Collapse Items Ordered pane"
  web_apps.orders.details.item_grid.collapse_store_item
end

Then /^Details: Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  logger.info "Details: Add Item #{item_number}, Qty #{qty}, ID #{id} Description #{description}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  item.qty.set qty
  item.id.set (id.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : id
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
end

Then /^Details: Add Item (\d+)$/ do |item_number|
  logger.info "Details: Add Item #{item_number}"
  @details_line_item = web_apps.orders.details.item_grid.item item_number.to_i
end

Then /^Details: Set Qty to (\d+)$/ do |value|
  logger.info "Details: Set Qty to #{value}"
  @details_line_item.qty.set value
end

Then /^Details: Set ID to (.*)$/ do |value|
  logger.info "Details: Set ID to #{value}"
  @details_line_item.id.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Details: Set Description to (.*)$/ do |value|
  logger.info "Details: Set Description to #{value}"
  @details_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Details: Expect Item (\d+) Qty to be (\d+)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} Qty to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  quantity = item.qty.text_box.text
  logger.info "Test #{(quantity == expectation)?"Passed":"Failed"}"
  quantity.should eql expectation
end

Then /^Details: Expect Item (\d+) ID to be (.*)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} ID to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.id.text
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Description to be (.*)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} ID to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.description.text
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Qty Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item Qty Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.qty.text_box.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
end

Then /^Details: Expect Item (\d+) ID Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item ID# Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.id.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Description Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item Description Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.description.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Address Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Address Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.text_area.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Phone Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.phone.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Email Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.email.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Service Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.service.text_box.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end




Then /^Details: Set Ship-To Country to (.*)$/ do |country|
  logger.info "Details: Set Ship-To Country to #{country}"
  @international_ship_to = web_apps.orders.details.ship_to.country.select country
end

Then /^Details: Set International Ship-To Name to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Name to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.name.send_keys :enter
  else
    @international_ship_to.name.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Company to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Company to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.company.send_keys :enter
  else
    @international_ship_to.company.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Address 1 to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Address 1 to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_1.send_keys :enter
  else
    @international_ship_to.address_1.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Address 2 to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Address 2 to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_2.send_keys :enter
  else
    @international_ship_to.address_2.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To City to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To City to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.city.send_keys :enter
  else
    @international_ship_to.city.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Province to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Province to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.province.send_keys :enter
  else
    @international_ship_to.province.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Postal Code to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Postal Code to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.postal_code.send_keys :enter
  else
    @international_ship_to.postal_code.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Phone to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Phone to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.phone.send_keys :enter
  else
    @international_ship_to.phone.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Email to \"(.*)\"$/ do |value|
  logger.info "Details: Set International Ship-To Email to #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.email.send_keys :enter
  else
    @international_ship_to.email.set ((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Details: Expect International Ship-To Name to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Name to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.name.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Company to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Company to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.company.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Address 1 to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Address 1 to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.address_1.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Address 2 to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To address 2 to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.address_2.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Province to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To province to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.province.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Postal Code to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To postal code to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.postal_code.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Phone to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To phone to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.phone.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Email to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Email to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.email.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect Ship-To Country to be (.*)/ do |value|
  logger.info "Details: Expect Ship-To Country to be #{value}"
  actual_value = web_apps.orders.details.ship_to.country.text_box.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To City to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To City to be #{value}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.city.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Address fields are visible$/ do
  logger.info "Details: Expect International Address fields are visible"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
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

Then /^Details: Expect Domestic Ship-To fields are hidden$/ do
  logger.info "Details: Expect Domestic Ship-To fields are hidden"
  order_details = web_apps.orders.details
  order_details.ship_to.address.text_area.present?.should be false
end

Then /^Details: Expect Customs Restrictions button is visible/ do
  logger.info "Details: Expect Customs Restrictions button is visible"
  order_details = web_apps.orders.details
  order_details.customs.browser_restrictions_button.present?.should be true
  order_details.customs.restrictions.ok
end

Then /^Details: Expect Customs Restrictions button is hidden/ do
  logger.info "Details: Expect Customs Restrictions button is hidden"
  order_details = web_apps.orders.details
  order_details.customs.browser_restrictions_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is visible/ do
  logger.info "Details: Expect Customs Edit Form button is visible"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is hidden/ do
  logger.info "Details: Expect Customs Edit Form button is hidden"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is enabled/ do
  logger.info "Details: Expect Customs Edit Form button is enabled"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is disabled/ do
  logger.info "Details: Expect Customs Edit Form button is disabled"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect International Ship-To Name Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.name.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Company Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.company.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Address 1 Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.address_1.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Address 2 Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.address_2.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To City Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.city.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Province Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.province.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Postal Code Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.postal_code.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.phone.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Email Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = web_apps.orders.details.ship_to.international if @international_ship_to.nil?
  actual_value = @international_ship_to.email.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Collapse Panel$/ do
  logger.info "Details: Collapse Panel"
  web_apps.orders.details.toolbar.menu.collapse
end

Then /^Details: Expect Panel Expanded$/ do
  logger.info "Details: Expect Panel Expanded"
  web_apps.orders.details.present?.should be true
end

Then /^Details: Expand panel$/ do
  logger.info "Details: Expand panel"
  web_apps.orders.details.expand
end

Then /^Details: Delete Item (\d+)$/ do |item_number|
  logger.info "Details: Delete Item #{item_number}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  item.delete.safe_click
end

Then /^Details: Set Weight to (\d+) lbs (\d+) oz$/ do |pounds, ounces|
  logger.info "Details: Set Weight to #{pounds} Pounds and #{ounces} Ounces"
  web_apps.orders.details.weight.lbs.set pounds
  web_apps.orders.details.weight.oz.set ounces
end

Then /^Details: Set Pounds to (.*)$/ do |value|
  logger.info "Details: Set Pounds to \"#{value}\""
  web_apps.orders.details.weight.lbs.set value
end

Then /^Details: Blur out of details form$/ do
  web_apps.orders.details.blur_out
  web_apps.orders.details.blur_out
  web_apps.orders.details.blur_out
end

Then /^Details: Set Ounces to (.*)$/ do |value|
  logger.info "Details: Set Ounces to \"#{value}\""
  web_apps.orders.details.weight.oz.set value
end

Then /^Details: Set Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  logger.info "Details: Set Dimensions to Length #{length} Width #{width} Height #{height}"
  web_apps.orders.details.dimensions.length.set length
  web_apps.orders.details.dimensions.width.set width
  web_apps.orders.details.dimensions.height.set height
end

Then /^Details: Set Length to (\d*)$/ do |value|
  logger.info "Details: Set Length to \"#{value}\""
  web_apps.orders.details.dimensions.length.set value
end

Then /^Details: Set Width to (\d*)$/ do |value|
  logger.info "Details: Set Width to \"#{value}\""
  web_apps.orders.details.dimensions.width.set value
end

Then /^Details: Set Height to (\d*)$/ do |value|
  logger.info "Details: Set Height to \"#{value}\""
  web_apps.orders.details.dimensions.height.set value
end

Then /^Details: Set Ship-From to (\w+)$/ do |value|
  logger.info "Details: Set Ship-From to: \n #{value}"
  web_apps.orders.details.ship_from.select value
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

Then /^Details: Set Ship-To address to$/ do |table|
  address = table.hashes.first
  logger.info "Details: Set Ship-To address to \n#{address}"

  @ship_to_country = address['country']
  logger.info "Ship-To Country:  #{@ship_to_country}"
  @ship_to_name = (address['name'].downcase.include? "random") ? ParameterHelper.random_name : address['name']
  @ship_to_company = (address['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address['company']
  @ship_to_city = (address['city'].downcase.include? "random") ? ParameterHelper.random_string : address['city']
  @ship_to_phone = (address['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address['phone']
  @ship_to_email = (address['email'].downcase.include? "random") ? ParameterHelper.random_email : address['email']

  if @ship_to_country.downcase.include? "united states"
    @ship_to_street_address = (address['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address']
    @ship_to_state = (address['state'].downcase.include? "random") ? ParameterHelper.random_string : address['state']
    @ship_to_zip = (address['zip'].downcase.include? "random") ? ParameterHelper.random_string : address['zip']

    ship_to_address = "#{@ship_to_name},#{@ship_to_company},#{@ship_to_street_address},#{@ship_to_city} #{@ship_to_state} #{@ship_to_zip}"
    step "Details: Set Ship-To address to #{ship_to_address}"
    step "Details: Set Phone to #{@ship_to_phone}"
    step "Details: Set Email to #{@ship_to_email}"
  else
    @ship_to_street_address_1 = (address['street_address_1'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address_1']
    @ship_to_street_address_2 = (address['street_address_2'].downcase.include? "random") ? ParameterHelper.random_suite : address['street_address_2']
    @ship_to_province = (address['province'].downcase.include? "random") ? ParameterHelper.random_string : address['province']
    @ship_to_postal_code = (address['postal_code'].downcase.include? "random") ? ParameterHelper.random_alpha_numeric : address['postal_code']

    logger.info "Ship-To Name: #{@ship_to_name}"
    logger.info "Ship-To Company: #{@ship_to_company}"
    logger.info "Ship-To Address 1: #{@ship_to_street_address_1}"
    logger.info "Ship-To Address 2: #{@ship_to_street_address_2}"
    logger.info "Ship-To City: #{@ship_to_city}"
    logger.info "Ship-To Province: #{@ship_to_province}"
    logger.info "Ship-To Postal Code: #{@ship_to_postal_code}"
    logger.info "Ship-To Phone: #{@ship_to_phone}"
    logger.info "Ship-To Email: #{@ship_to_email}"

    step "Details: Set Ship-To Country to #{@ship_to_country}"
    step "Details: Set International Ship-To Name to \"#{@ship_to_name}\""
    step "Details: Set International Ship-To Company to \"#{@ship_to_company}\""
    step "Details: Set International Ship-To Address 1 to \"#{@ship_to_street_address_1}\""
    step "Details: Set International Ship-To Address 2 to \"#{@ship_to_street_address_2}\""
    step "Details: Set International Ship-To City to \"#{@ship_to_city}\""
    step "Details: Set International Ship-To Province to \"#{@ship_to_province}\""
    step "Details: Set International Ship-To Postal Code to \"#{@ship_to_postal_code}\""
    step "Details: Set International Ship-To Phone to \"#{@ship_to_phone}\""
    step "Details: Set International Ship-To Email to \"#{@ship_to_email}\""
  end
end

Then /^Details: Set Ship-To address to (.*)$/ do |address|
  logger.info "Details: Set Ship-To address to \"#{address}\""

  case address.downcase
    when /zone 1 through 4/
      address = ParameterHelper.rand_zone_1_4
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = ParameterHelper.rand_zone_5_8
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = ParameterHelper.rand_zone_1
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = ParameterHelper.rand_zone_2
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = ParameterHelper.rand_zone_3
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = ParameterHelper.rand_zone_4
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = ParameterHelper.rand_zone_5
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = ParameterHelper.rand_zone_6
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = ParameterHelper.rand_zone_7
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = ParameterHelper.rand_zone_8
      formatted_address = ParameterHelper.format_address address
      logger.info "Details: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = ParameterHelper.format_address address
  end

  web_apps.orders.details.ship_to.address.set formatted_address

  begin
    step "Details: Set Phone to #{address['phone']}"
    step "Details: Set Email to #{address['email']}"
  rescue
    #ignore
  end
end

Then /^Details: Set Ship-To to ambiguous address$/ do |table|
  ambiguous_address = ParameterHelper.format_address table.hashes.first
  logger.info "Details: Set Ship-To to ambiguous address \n#{ambiguous_address}"
  web_apps.orders.details.ship_to.address.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  logger.info "Select row #{row} from Exact Address Not Found module"
  address_not_found_module = web_apps.orders.details.ship_to.address.ambiguous.address_not_found
  logger.info "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  raise "Ambiguous Address Module is not present.  Unable to set Ambiguous Address Row to #{row}" unless address_not_found_module.present?
  address_not_found_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  logger.info "Expect \"Exact Address Not Found\" module to appear"
  address_not_found = web_apps.orders.details.ship_to.address.ambiguous.address_not_found
  logger.info "Test #{(address_not_found.present?)?"Passed":"Failed"}"
  address_not_found.window_title.text.should eql "Exact Address Not Found"
end

Then /^Details: Set Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(ParameterHelper.random_phone):phone
  begin
    logger.info "Order Details Form Phone to \"#{@order_details_phone}\""
    web_apps.orders.details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
end

Then /^Details: Set Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(ParameterHelper.random_email):email
  begin
    logger.info "Details: Set Email to \"#{@order_details_email}\""
    web_apps.orders.details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
end


Then /^Expect system status Order Form$/ do |status|
  logger.info "Expect system #{status} Order Form"

  actual_value = web_apps.orders.details.present?
  actual_value.should eql false
end

Then /^Expect system displays Order Form$/ do |status|
  logger.info "Expect system #{status} Order Form"

  actual_value = web_apps.orders.details.present?
  actual_value.should eql true
end

Then /^Details: Hide Ship-To fields$/ do
  logger.info "Details: Hide Ship-To fields"
  web_apps.orders.details.ship_to.hide
  logger.info "done."
end

Then /^Increment Order Details Pounds by (\d*)$/ do |value|
  logger.info "Increment Order Details Pounds by \"#{value}\""
  web_apps.orders.details.weight.lbs.increment value
end

Then /^Decrement Order Details Pounds by (\d*)$/ do |value|
  logger.info "Decrement Order Details Pounds by \"#{value}\""
  web_apps.orders.details.weight.lbs.decrement value
end

Then /^Increment Order Details Ounces by (\d*)$/ do |value|
  logger.info "Increment Order Details Ounces by \"#{value}\""
  web_apps.orders.details.weight.oz.increment value
end

Then /^Decrement Order Details Ounces by (\d*)$/ do |value|
  logger.info "Decrement Order Details Ounces by \"#{value}\""
  web_apps.orders.details.weight.oz.decrement value
end

Then /^Increment Order Details Length by (\d*)$/ do |value|
  logger.info "Increment Order Details Length by \"#{value}\""
  web_apps.orders.details.dimensions.length.increment value
end

Then /^Decrement Order Details Length by (\d*)$/ do |value|
  logger.info "Decrement Order Details Length by \"#{value}\""
  web_apps.orders.details.dimensions.length.decrement value
end

Then /^Increment Order Details Width by (\d*)$/ do |value|
  logger.info "Increment Order Details Width by \"#{value}\""
  web_apps.orders.details.dimensions.width.increment value
end

Then /^Decrement Order Details Width by (\d*)$/ do |value|
  logger.info "Decrement Order Details Width by \"#{value}\""
  web_apps.orders.details.dimensions.width.decrement value
end

Then /^Increment Order Details Height by (\d*)$/ do |value|
  logger.info "Increment Order Details Height by \"#{value}\""
  web_apps.orders.details.dimensions.height.increment value
end

Then /^Decrement Order Details Height by (\d*)$/ do |value|
  logger.info "Decrement Order Details Height by \"#{value}\""
  web_apps.orders.details.dimensions.height.decrement value
end

Then /^Increment Order Details Insure-For by (\d*)$/ do |value|
  logger.info "Increment Order Details Insure-For by \"#{value}\""
  web_apps.orders.details.insure_for.increment value
end

Then /^Decrement Order Details Insure-For by (\d*)$/ do |value|
  logger.info "Decrement Order Details Insure-For by \"#{value}\""
  web_apps.orders.details.insure_for.decrement value
end

Then /^Details: Set Tracking to \"([\w ]*)\"$/ do |value|
  logger.info "Details: Set Tracking to #{value}"
  web_apps.orders.details.tracking.select value
end

Then /^Details: Set Reference Number to (.*)$/ do |value|
  @param_details_reference_no = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  logger.info "Details: Set Reference Number to #{@param_details_reference_no}"
  web_apps.orders.details.reference_no.set @param_details_reference_no
end

Then /^Details: Expect Reference Number to be (.*)$/ do |expectation|
  @param_details_reference_no = (expectation.downcase.include? "random") ? @param_details_reference_no : expectation
  logger.info "Details: Expect Reference Number to be #{@param_details_reference_no}"
  actual_value = web_apps.orders.details.reference_no.text
  logger.info "Test #{(actual_value==@param_details_reference_no)?"Passed":"Failed"}"
  actual_value.should eql @param_details_reference_no
end

Then /^Details: Expect Insure-For to be \$(.*)$/ do |expectation|
  logger.info "Details: Set Insure-For to #{expectation}"
  5.times do
    actual_value = web_apps.orders.details.insure_for.text_box.text
    if actual_value==expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Insure-For Cost to be \$(.*)$/ do |expectation|
  logger.info "Details: Expect Insure-For Cost to be #{expectation}"
  5.times do
    actual_value = web_apps.orders.details.insure_for.cost
    if actual_value==expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.cost
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Insure-For Cost to be greater than \$(.*)$/ do |expectation|
  logger.info "Details: Expect Insure-For Cost to be greater than #{expectation}"
  expectation = expectation.to_f
  15.times do
    actual_value = web_apps.orders.details.insure_for.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Service \"(.*)\" to be disabled/ do |service|
  logger.info "Details: Expect Service \"#{service}\" to be disabled"
  actual_value = web_apps.orders.details.service.disabled? service
  logger.info "Test #{(actual_value)?"Passed":"Failed"}"
  actual_value.should be true
end

Then /^Details: Expect Service \"(.*)\" to be enabled/ do |expectation|
  logger.info "Details: Expect Service \"#{expectation}\" to be enabled"
  actual_value = web_apps.orders.details.service.enabled? expectation
  logger.info "Test #{(actual_value)?"Passed":"Failed"}"
  actual_value.should be true
end

Then /^Details: Check Insure-For checkbox$/ do
  logger.info "Details: Check Insure-For checkbox"
  web_apps.orders.details.insure_for.checkbox.check
end

Then /^Details: Uncheck Insure-For checkbox$/ do
  logger.info "Details: Uncheck Insure-For checkbox"
  web_apps.orders.details.insure_for.checkbox.uncheck
end

Then /^Details: Set Insure-For to \$(.*)$/ do |value|
  logger.info "Details: Set Insure-For to #{value}"
  web_apps.orders.details.insure_for.set value
  web_apps.orders.details.insure_for.set value
  20.times do
    web_apps.orders.details.blur_out
    break if web_apps.orders.details.insure_for.cost > 0
  end
end

Then /^Add Ship-From address$/ do |ship_from|
  logger.info "Add Ship-From address #{ship_from}"
  add_form = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add.shipping_address ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  ship_from = (address.include?'random ship from zone 1 through 4')?(ParameterHelper.rand_ship_from_zone_1_4):address
  logger.info "Add Ship-From address #{(address.include?'random')?ship_from:(address)}"
  @ship_from_address = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add ship_from
  logger.info "Random address added: #{@ship_from_address}"
end

Then /^Details: Expect Ship-From selection has (.*)$/ do |address|
  logger.info "Expect #{address} Ship-From address was added"
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    logger.info "Search for \n#{@ship_from_address}.  Address was #{(web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Details: Delete Ship-From address (\w+)$/ do |address|
  logger.info "Details: Delete Ship-From address #{address}"
  # not implemented
end

Then /^Details: Delete all Ship-From address$/ do
  logger.info "Details: Delete all Ship-From address"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  logger.info "Delete Ship-From Row #{row} from Manage Shipping Addresses Modal"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Details: Set Ship-From to Manage Shipping Addresses$/ do
  logger.info "Details: Set Ship-From to Manage Shipping Addresses"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  logger.info "Edit Ship-From address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.info "Expect Pounds tooltip to display - The maximum value for this field is #{expectation}"
  actual_value = web_apps.orders.details.pounds_max_value
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.info "Expect Ounces tooltip to display - The maximum value for this field is #{expectation}"
  actual_value = web_apps.orders.details.ounces_max_value
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expectation|
  logger.info "Details: Expect Service Cost inline price for #{service} to be greater than #{expectation}"
  actual_value = web_apps.orders.details.service.cost service
  10.times {
    break if actual_value.to_f >= expectation.to_f
    actual_value = web_apps.orders.details.service.cost service
  }
  logger.info "Test #{(actual_value.to_f > expectation.to_f)?"Passed":"Failed"}"
  actual_value.to_f.should be >= expectation.to_f
end

Then /^Details: Expect Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  logger.info "Details: Expect Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = web_apps.orders.details.service.tooltip service
  tooltips.each do |tooltip|
    logger.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  end
end

Then /^Details: Expect Service Cost to be \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Service Cost to be $#{expectation}"
  actual_value = web_apps.orders.details.service.cost
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Cost to be greater than \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Service Cost to be greater than $#{expectation}"
  expectation = expectation.to_f
  10.times do
    actual_value = web_apps.orders.details.service.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.service.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Tracking Cost to be \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Tracking Cost to be #{expectation}"
  10.times do
    actual_value = web_apps.orders.details.tracking.cost
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.tracking.cost
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Tracking Cost to be greater than \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Tracking Cost to be #{expectation}"
  expectation = expectation.to_f
  10.times do
    actual_value = web_apps.orders.details.tracking.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.tracking.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Pounds to be (.*)$/ do |expectation|
  logger.info "Details: Expect Pounds to be #{expectation}"
  text_box = web_apps.orders.details.weight.lbs.text_box
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ounces to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ounces to be  #{expectation}"
  text_box = web_apps.orders.details.weight.oz.text_box
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Length to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Length to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.length.text_box
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Width to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Width to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.width.text_box
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Height to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Height to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.height.text_box
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Verify Order Details Form Total Amount$/ do
  logger.info "Verify Order Details Form Total Amount"
end

Then /^Details: Expect Tracking to be \"([\w\s]*)\"$/ do |expectation|
  logger.info "Details: Expect Tracking to be #{expectation}"
  begin
    text_box = web_apps.orders.details.tracking.text_box
    10.times do
      sleep 2
      actual_value = text_box.text
      break if actual_value.include? expectation
    end
    sleep 2
    actual_value = text_box.text
    logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
    actual_value.should eql expectation
  end unless expectation.length == 0
end

Then /^Details: Expect Total to be \$(.*)$/ do |expectation|
  logger.info "Details: Expect Total to be $#{expectation}"
  begin
    10.times do
      web_apps.orders.details.blur_out
      sleep 1
      actual_value = web_apps.orders.details.total.cost
      web_apps.orders.details.blur_out
      sleep 1
      break if actual_value.eql? expectation
    end
    actual_value = web_apps.orders.details.total.cost
    actual_value.should eql expectation
  end unless expectation.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expectation|
  logger.info "Expect #{expectation} orders selected"
  web_apps.orders.multi_web_apps.orders.order_count.should eql expectation
end
And /^Details: Expect Ship-From Textbox to be enabled$/ do
  logger.info "Details: Expect Ship-From Textbox to be enabled"
  enabled = web_apps.orders.details.ship_from.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-From drop-down be enabled$/ do
  logger.info "Details: Expect Ship-From drop-down be enabled"
  enabled = web_apps.orders.details.ship_from.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To Textbox to be enabled$/ do
  logger.info "Details: Expect Ship-To Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.text_area.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To drop-down to be enabled$/ do
  logger.info "Details: Expect Ship-To drop-down to be enabled"
  enabled = web_apps.orders.details.ship_to.country.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To text area to be enabled$/ do
  logger.info "Details: Expect Ship-To text area to be enabled"
  enabled = web_apps.orders.details.ship_to.address.text_area.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Phone Textbox to be enabled$/ do
  logger.info "Details: Expect Phone Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.phone.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Email Textbox to be enabled$/ do
  logger.info "Details: Expect Email Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.email.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Pounds Textbox to be enabled$/ do
  logger.info "Details: Expect Pounds Textbox to be enabled"
  enabled = web_apps.orders.details.weight.lbs.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ounces Textbox to be enabled$/ do
  logger.info "Details: Expect Ounces Textbox to be enabled"
  enabled = web_apps.orders.details.weight.oz.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Service Textbox to be enabled$/ do
  logger.info "Details: Expect Service Textbox to be enabled"
  enabled = web_apps.orders.details.service.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Service drop-down to be enabled$/ do
  logger.info "Details: Expect Service drop-down to be enabled"
  enabled = web_apps.orders.details.service.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Insure-For Textbox to be enabled$/ do
  logger.info "Details: Expect Insure-For Textbox to be enabled"
  enabled = web_apps.orders.details.insure_for.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Insure-For Textbox to be disabled$/ do
  logger.info "Details: Expect Insure-For Textbox to be enabled"
  enabled = web_apps.orders.details.insure_for.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="disabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Expect Order Detials Form Tracking Textbox to be enabled$/ do
  logger.info "Expect Order Detials Form Tracking Textbox to be enabled"
  enabled = web_apps.orders.details.tracking.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Tracking drop-down to be enabled$/ do
  logger.info "Details: Expect Tracking drop-down to be enabled"
  enabled = web_apps.orders.details.tracking.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end




