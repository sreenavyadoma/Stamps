
Then /^Details: Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  log.info "Step: Details: Add Item #{item_number}, Qty #{qty}, ID #{id} Description #{description}"
  item = orders.details.item_grid.item item_number.to_i
  item.qty.set qty
  item.id.set (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
  item.description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Then /^Details: Add Item (\d+)$/ do |item_number|
  log.info "Details: Add Item #{item_number}"
  @orders_line_item = orders.details.item_grid.item item_number.to_i
end

Then /^Details: Set Qty to (\d+)$/ do |value|
  log.info "Details: Set Qty to #{value}"
  @orders_line_item.qty.set value
end

Then /^Details: Set ID to (.*)$/ do |value|
  log.info "Details: Set ID to #{value}"
  @orders_line_item.id.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Details: Set Description to (.*)$/ do |value|
  log.info "Details: Set Description to #{value}"
  @orders_line_item.description.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Details: Expect Item Qty Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Item Qty Placeholder to be #{expectation}"
  placeholder = @orders_line_item.qty.text_box.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
end

Then /^Details: Expect Item ID# Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Item ID# Placeholder to be #{expectation}"
  placeholder = @orders_line_item.id.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Item Description Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Item Description Placeholder to be #{expectation}"
  placeholder = @orders_line_item.description.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Item Qty to be (.*)$/ do |expectation|
  log.info "Details: Expect Item Qty to be #{expectation}"
  quantity = @orders_line_item.qty.text_box.text
  log.info "Test #{(quantity == expectation)?"Passed":"Failed"}"
  quantity.should eql expectation
end

Then /^Details: Expect Item ID# to be (.*)$/ do |expectation|
  log.info "Details: Expect Item ID# to be #{expectation}"
  placeholder = @orders_line_item.id.text
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Item Description to be (.*)$/ do |expectation|
  log.info "Details: Expect Item Description to be #{expectation}"
  placeholder = @orders_line_item.description.text
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Address Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Ship-To Address Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.text_area.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Ship-To Phone Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.phone.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Ship-To Email Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.email.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect Service Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Service Placeholder to be #{expectation}"
  placeholder = orders.details.service.text_box.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Name Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.name.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Company Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.company.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Address 1 Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.address_1.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Address 2 Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.address_2.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To City Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.city.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Province Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.province.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Postal Code Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.postal_code.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.phone.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Expect International Ship-To Email Placeholder to be (.*)$/ do |expectation|
  log.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.email.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Details: Collapse Panel$/ do
  log.info "Details: Collapse Panel"
  orders.details.toolbar.menu.collapse_panel
end

Then /^Details: Expect Panel Expanded$/ do
  log.info "Details: Expect Panel Expanded"
  orders.details.present?.should be true
end

Then /^Details: Expand Order Details$/ do
  log.info "Details: Expand Order Details"
  orders.details.open
end

Then /^Details: Delete Item (\d+)$/ do |item_number|
  log.info "Step: Details: Delete Item #{item_number}"
  item = orders.details.item_grid.item item_number.to_i
  item.delete.safe_click
end

Then /^Details: Set Weight to (\d+) lbs (\d+) oz$/ do |pounds, ounces|
  log.info "Step:  Details: Set Weight to #{pounds} Pounds and #{ounces} Ounces"
  orders.details.weight.lbs.set pounds
  orders.details.weight.oz.set ounces
end

Then /^Details: Set Pounds to (\d*)$/ do |value|
  log.info "Step: Details: Set Pounds to \"#{value}\""
  orders.details.weight.lbs.set value
end

Then /^Details: Set Ounces to (.*)$/ do |value|
  log.info "Step: Details: Set Ounces to \"#{value}\""
  orders.details.weight.oz.set value
end

Then /^Details: Set Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  log.info "Details: Set Dimensions to Length #{length} Width #{width} Height #{height}"
  orders.details.dimensions.length.set length
  orders.details.dimensions.width.set width
  orders.details.dimensions.height.set height
end

Then /^Details: Set Length to (\d*)$/ do |value|
  log.info "Step: Details: Set Length to \"#{value}\""
  orders.details.dimensions.length.set value
end

Then /^Details: Set Width to (\d*)$/ do |value|
  log.info "Step: Details: Set Width to \"#{value}\""
  orders.details.dimensions.width.set value
end

Then /^Details: Set Height to (\d*)$/ do |value|
  log.info "Step: Details: Set Height to \"#{value}\""
  orders.details.dimensions.height.set value
end

Then /^Details: Set Service to \"(.*)\"$/ do |service|
  log.info "Step: Details: Set Service to #{service}"
  orders.details.service.select service
end

Then /^Details: Set Ship-From to (\w+)$/ do |value|
  log.info "Step: Details: Set Ship-From to: \n #{value}"
  orders.details.ship_from.select value
end

Then /^Details: Set Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Details: Set Ship-To address to \n#{ship_to}"
  step "Details: Set Ship-To address to #{ship_to}"
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

Then /^Details: Set Ship-To address to (.*)$/ do |address|
  log.info "Step: Details: Set Ship-To address to \"#{address}\""

  case address.downcase
    when /zone 1 through 4/
      address = test_helper.rand_zone_1_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = test_helper.rand_zone_5_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = test_helper.rand_zone_1
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = test_helper.rand_zone_2
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = test_helper.rand_zone_3
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = test_helper.rand_zone_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = test_helper.rand_zone_5
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = test_helper.rand_zone_6
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = test_helper.rand_zone_7
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = test_helper.rand_zone_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Details: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  orders.details.ship_to.address.set formatted_address

  begin
    step "Details: Set Phone to #{address["phone"]}"
    step "Details: Set Email to #{address["email"]}"
  rescue
    #ignore
  end
end

Then /^Details: Set Ship-To to ambiguous address$/ do |table|
  ambiguous_address = OrdersHelper.instance.format_address table.hashes.first
  log.info "Step: Details: Set Ship-To to ambiguous address \n#{ambiguous_address}"
  orders.details.ship_to.address.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  log.info "Step: Select row #{row} from Exact Address Not Found module"
  address_not_found_module = orders.details.ship_to.address.ambiguous.address_not_found
  log.info "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  raise "Ambiguous Address Module is not present.  Unable to set Ambiguous Address Row to #{row}" unless address_not_found_module.present?
  address_not_found_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  log.info "Step: Expect \"Exact Address Not Found\" module to appear"
  address_not_found_module = orders.details.ship_to.address.ambiguous.address_not_found
  log.info "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  address_not_found_module.present?.should be true
end

Then /^Details: Set Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(test_helper.random_phone):phone
  begin
    log.info "Step: Order Details Form Phone to \"#{@order_details_phone}\""
    orders.details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
end

Then /^Details: Set Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(test_helper.random_email):email
  begin
    log.info "Step: Details: Set Email to \"#{@order_details_email}\""
    orders.details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
end


Then /^Expect system status Order Form$/ do |status|
  log.info "Step: Expect system #{status} Order Form"

  actual = orders.details.present?
  actual.should eql false
end

Then /^Expect system displays Order Form$/ do |status|
  log.info "Step: Expect system #{status} Order Form"

  actual = orders.details.present?
  actual.should eql true
end

Then /^Details: Hide Ship-To fields$/ do
  log.info "Step: Details: Hide Ship-To fields"
  orders.details.ship_to.hide
  log.info "done."
end

Then /^Increment Order Details Pounds by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Pounds by \"#{value}\""
  orders.details.weight.lbs.increment value
end

Then /^Decrement Order Details Pounds by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Pounds by \"#{value}\""
  orders.details.weight.lbs.decrement value
end

Then /^Increment Order Details Ounces by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Ounces by \"#{value}\""
  orders.details.weight.oz.increment value
end

Then /^Decrement Order Details Ounces by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Ounces by \"#{value}\""
  orders.details.weight.oz.decrement value
end

Then /^Increment Order Details Length by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Length by \"#{value}\""
  orders.details.dimensions.length.increment value
end

Then /^Decrement Order Details Length by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Length by \"#{value}\""
  orders.details.dimensions.length.decrement value
end

Then /^Increment Order Details Width by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Width by \"#{value}\""
  orders.details.dimensions.width.increment value
end

Then /^Decrement Order Details Width by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Width by \"#{value}\""
  orders.details.dimensions.width.decrement value
end

Then /^Increment Order Details Height by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Height by \"#{value}\""
  orders.details.dimensions.height.increment value
end

Then /^Decrement Order Details Height by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Height by \"#{value}\""
  orders.details.dimensions.height.decrement value
end

Then /^Increment Order Details Insure For by (\d*)$/ do |value|
  log.info "Step: Increment Order Details Insure For by \"#{value}\""
  orders.details.insure_for.increment value
end

Then /^Decrement Order Details Insure For by (\d*)$/ do |value|
  log.info "Step: Decrement Order Details Insure For by \"#{value}\""
  orders.details.insure_for.decrement value
end

Then /^Details: Set Tracking to \"([\w ]*)\"$/ do |value|
  log.info "Step: Details: Set Tracking to #{value}"
  orders.details.tracking.select value
end

Then /^Details: Set Reference Number to (.*)$/ do |value|
  @param_details_reference_no = (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  log.info "Details: Set Reference Number to #{@param_details_reference_no}"
  orders.details.reference_no.set @param_details_reference_no
end

Then /^Details: Expect Reference Number to be (.*)$/ do |value|
  @param_details_reference_no = (value.downcase.include? "random") ? @param_details_reference_no : value

  log.info "Details: Expect Reference Number to be #{@param_details_reference_no}"

  actual_value = orders.details.reference_no.text

  log.info "Test #{(actual_value==@param_details_reference_no)?"Passed":"Failed"}"
  actual_value.should eql @param_details_reference_no
end


Then /^Details: Expect Service \"(.*)\" to be disabled/ do |service|
  log.info "Details: Expect Service \"#{service}\" to be disabled"
  selection_disabled = orders.details.service.disabled? service
  log.info "Test #{(selection_disabled)?"Passed":"Failed"}"
  selection_disabled.should be true
end

Then /^Details: Expect Service \"(.*)\" to be enabled/ do |service|
  log.info "Details: Expect Service \"#{service}\" to be enabled"
  selection_enabled = orders.details.service.enabled? service
  log.info "Test #{(selection_enabled)?"Passed":"Failed"}"
  selection_enabled.should be true
end

Then /^Details: Set Insure For checkbox to checked$/ do
  log.info "Details: Set Insure For checkbox to checked"
  orders.details.insure_for.checkbox.check
end

Then /^Details: Set Insure For checkbox to unchecked$/ do
  log.info "Details: Set Insure For checkbox to unchecked"
  orders.details.insure_for.checkbox.uncheck
  orders.details.insure_for.checkbox.uncheck
end

Then /^Details: Set Insure For to \$([\d*\.?\d*]*)$/ do |value|
  log.info "Step: Details: Set Insure For to #{value}"
  orders.details.insure_for.set value
end

Then /^Add Ship-From address$/ do |ship_from|
  log.info "Step: Add Ship-From address #{ship_from}"
  orders.details.ship_from.select("Manage Shipping Addresses...").add ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  ship_from = (address.include?'random ship from zone 1 through 4')?(test_helper.rand_ship_from_zone_1_4):address
  log.info "Step:  Add Ship-From address #{(address.include?'random')?ship_from:(address)}"
  @ship_from_address = orders.details.ship_from.select("Manage Shipping Addresses...").add ship_from
  log.info "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  log.info "Step: Expect #{address} Ship-From address was added"
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log.info "Search for \n#{@ship_from_address}.  Address was #{(orders.details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  log.info "Step: Delete #{address} Ship-From address"
  begin
    if address.downcase == "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      orders.details.ship_from.select("Manage Shipping Addresses...").delete @ship_from_address
    elsif address.downcase == "all"
      orders.details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
    else
      raise "Test parameter exception.  #{address} is not a valid parameter for this test."
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  log.info "Step: Delete Ship-From Row #{row} from Manage Shipping Addresses Modal"
  orders.details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Details: Set Ship-From to Manage Shipping Addresses$/ do
  log.info "Step: Details: Set Ship-From to Manage Shipping Addresses"
  orders.details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  log.info "Step: Edit Ship-From address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  orders.details.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Step: Expect Pounds tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.details.pounds_max_value
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Step: Expect Ounces tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.details.ounces_max_value
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Details: Expect Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  log.info "Step: Details: Expect Service Cost inline price for #{service} to be greater than #{expected}"
  actual = orders.details.service.cost service
  10.times { |counter|
    #log_expectation_eql "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = orders.details.service.cost service
  }
  log.info "Test #{(actual.to_f > expected.to_f)?"Passed":"Failed"}"
  actual.to_f.should be >= expected.to_f
end

Then /^Details: Expect Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  log.info "Step: Details: Expect Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = orders.details.service.tooltip service
  tooltips.each { |tooltip|
    log.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
end

Then /^Details: Expect Service Cost to be \$(.*)$/ do |expected|
  log.info "Step: Details: Expect Service Cost to be $#{expected}"
  actual = orders.details.service.cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Details: Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Step: Details: Expect Tracking Cost to be #{expected}"
  actual = orders.details.tracking.cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Verify Order Details Form Total Amount$/ do
  log.info "Step: Verify Order Details Form Total Amount"
end

Then /^Details: Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Step: Details: Expect Insurance Cost to be #{expected}"
  actual = orders.details.insure_for.cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Details: Expect Service to be \"(.*)\"$/ do |expected|
  log.info "Step: Details: Expect Service to be #{expected}"
  begin
    10.times do
      actual = orders.details.service.text_box.text
      break if actual.include? expected
    end
    actual = orders.details.service.text_box.text
    log.info "Test #{(actual.include? expected)?"Passed":"Failed"}"
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Details: Expect Tracking to be \"([\w\s]*)\"$/ do |expected|
  log.info "Step: Details: Expect Tracking to be #{expected}"
  begin
    text_box = orders.details.tracking.text_box
    10.times do
      sleep 2
      actual = text_box.text
      break if actual.include? expected
    end
    actual = orders.details.tracking.text_box.text
    log.info "Test #{(actual == expected)?"Passed":"Failed"}"
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Details: Expect Total to be \$(.*)$/ do |expected|
  log.info "Step: Details: Expect Total to be $#{expected}"
  begin
    10.times do
      orders.details.click_form
      sleep 1
      actual = orders.details.total
      orders.details.click_form
      sleep 1
      break if actual.eql? expected
    end
    actual = orders.details.total
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  log.info "Step: Expect #{expected} orders selected"
  orders.multi_orders.order_count.should eql expected
end




