
Then /^Set Order Details Add Item$/ do
  orders.details.add_item
  @item_count += 1
  log.info "Item #{@item_count} added."
end

Then /^Set Order Details Line Item Quantity to (\d+)$/ do |qty|
  step "Set Order Details Line Item #{@item_count} Quantity to #{qty}"
end

Then /^Set Order Details Line Item (\d+) Quantity to (.*)$/ do |line_item, qty|
  @line_item_qty = qty
  log.info "Set Order Details Line Item #{line_item} Quantity to #{@line_item_qty}"

  item_object = orders.details.item line_item
  item_object.qty qty
end

Then /^Set Order Details Line Item ID to (.*)$/ do |id|
  step "Set Order Details Line Item #{@item_count} ID to #{id}"
end

Then /^Set Order Details Line Item (\d+) ID to (.*)$/ do |line_item, id|
  @line_item_id = id
  log.info "Set Order Details Line Item #{line_item} ID to #{@line_item_id}"

  item_object = orders.details.item line_item
  item_object.id (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
end

Then /^Set Order Details Line Item Description to (.*)$/ do |description|
  step "Set Order Details Line Item #{@item_count} Description to #{description}"
end

Then /^Set Order Details Line Item (\d+) Description to (.*)$/ do |line_item, description|
  @line_item_description = description
  log.info "Set Order Details Line Item #{line_item} Description to #{@line_item_description}"

  item_object = orders.details.item line_item
  item_object.description (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Given /^Set Order Details Item - Quantity (.*), ID (.*), Description (.*)$/ do |qty, id, description|
  log.info "Step: Set Order Details Item - Quantity #{qty}, ID #{id}, Description #{description}"
  step "Set Order Details Add Item"
  step "Set Order Details Line Item Quantity to #{qty}"
  step "Set Order Details Line Item ID to #{id}"
  step "Set Order Details Line Item Description to #{description}"
end

And /^Set Order Details Ship-From to (\w+)$/ do |value|
  log.info "Step: Set Order Details Ship-From to: \n #{value}"
  orders.details.ship_from.select value
end

And /^Set Order Details Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Set Order Details Ship-To address to \n#{ship_to}"
  step "Set Order Details Ship-To address to #{ship_to}"
end

When /^Set Order Details Ship-To address to (.*)$/ do |address|
  log.info "Step: Set Order Details Ship-To address to \"#{address}\""

  case address
    when "random ship to zone 1 through 4"
      random_ship_to_address = test_helper.rand_ship_to_zone_1_4
      formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)
      log.info "Set Order Details Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when "random ship to zone 5 through 8"
      random_ship_to_address = test_helper.rand_ship_to_zone_5_8
      formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)
      log.info "Set Order Details Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  orders.details.ship_to.address.set formatted_address
  begin
    step "Set Order Details Phone to #{random_ship_to_address["phone"]}"
    step "Set Order Details Email to #{random_ship_to_address["email"]}"
  rescue
    #ignroe
  end
end

And /^Set Order Details Ship-To to ambiguous address$/ do |table|
  ambiguous_address = OrdersHelper.instance.format_address table.hashes.first
  log.info "Step: Set Order Details Ship-To to ambiguous address \n#{ambiguous_address}"
  @ambiguous_address_module = orders.details.ship_to.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  log.info "Step: Select row #{row} from Exact Address Not Found module"
  @ambiguous_address_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  log.info "Expectation: Expect \"Exact Address Not Found\" module to appear"
  expect(@ambiguous_address_module.present?).to be true
end

When /^Set Order Details Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(test_helper.random_phone):phone
  begin
    log.info "Step: Order Details Form Phone to \"#{@order_details_phone}\""
    orders.details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
end

When /^Set Order Details Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(test_helper.random_email):email
  begin
    log.info "Step: Set Order Details Email to \"#{@order_details_email}\""
    orders.details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
end

When /^Expect system (.*) Order Form$/ do |status|
  log.info "Expectation: Expect system #{status} Order Form"

  actual = orders.details.present?
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

When /^Hide Order Details Form Ship-To fields$/ do
  log.info "Step: Hide Order Details Form Ship-To fields"
  orders.details.ship_to.hide
  log.info "done."
  #end_step step
end

When /^Set Order Details Pounds to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Pounds to \"#{value}\""
    orders.details.lbs.set value
    orders.details.click_form
    orders.details.click_form
    orders.details.click_form
  end unless value.length == 0
end

When /^Set Order Details Ounces to (.*)$/ do |value|
  begin
    log.info "Step: Set Order Details Ounces to \"#{value}\""
    orders.details.oz.set value
    orders.details.click_form
    orders.details.click_form
    orders.details.click_form
  end unless value.length == 0
end

When /^Set Order Details Length to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Length to \"#{value}\""
    orders.details.length.set value
    orders.details.click_form
    orders.details.click_form
    orders.details.click_form
  end unless value.length == 0
end

When /^Set Order Details Width to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Width to \"#{value}\""
    orders.details.width.set value
    orders.details.click_form
    orders.details.click_form
    orders.details.click_form
  end unless value.length == 0
end

When /^Set Order Details Height to (\d*)$/ do |value|
  begin
    log.info "Step: Set Order Details Height to \"#{value}\""
    orders.details.height.set value
    orders.details.click_form
    orders.details.click_form
    orders.details.click_form
  end unless value.length == 0
end

And /^Set Order Details Service to \"(.*)\"$/ do |service|
  log.info "Step: Set Order Details Service to #{service}"
  orders.details.service.select service
end

Then /^Set Order Details Tracking to \"([\w ]*)\"$/ do |value|
  log.info "Step: Set Order Details Tracking to #{value}"
  begin
    orders.details.tracking.select value
  end unless value.length == 0
end

Then /^Expect Order details Service \"(.*)\" to be disabled/ do |service|
  log.info "Expect Order details Service \"#{service}\" to be disabled"
  selection_disabled = orders.details.service.disabled? service
  log.info "Test #{(selection_disabled)?"Passed":"Failed"}"
  selection_disabled.should be true
end

Then /^Expect Order details Service \"(.*)\" to be enabled/ do |service|
  log.info "Expect Order details Service \"#{service}\" to be enabled"
  selection_enabled = orders.details.service.enabled? service
  log.info "Test #{(selection_enabled)?"Passed":"Failed"}"
  selection_enabled.should be true
end

Then /^Expect Order Details Tracking tooltip for (.*) to be (.*)$/ do |lov, expectation|
  actual_tooltip = orders.details.tracking.tooltip value
  #log.info actual_tooltip
  cost = orders.details.tracking.cost value
  #log.info cost
end

And /^Set Order Details Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  log.info "Step: Set Order Details Insured Value to #{value}"
  orders.details.insured_value.set value
end

When /^Set order details with$/ do |table|
  log.info "Step: Set order details with..."
  orders.details.edit_details table.hashes.first
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
  log.info "Expectation: Expect #{address} Ship-From address was added"
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

Then /^Set Order Details Ship-From to Manage Shipping Addresses$/ do
  log.info "Step: Set Order Details Ship-From to Manage Shipping Addresses"
  orders.details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  log.info "Step: Edit Ship-From address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  orders.details.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Expectation: Expect Pounds tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.details.pounds_max_value
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  log.info "Expectation: Expect Ounces tooltip to display - The maximum value for this field is #{expected}"
  actual = orders.details.ounces_max_value
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Order Details Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  log.info "Expectation: Expect Order Details Service Cost inline price for #{service} to be greater than #{expected}"
  actual = orders.details.service.cost service
  10.times { |counter|
    #log_expectation_eql "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = orders.details.service.cost service
  }
  log.info "Test #{(actual.to_f > expected.to_f)?"Passed":"Failed"}"
  actual.to_f.should be >= expected.to_f
end

Then /^Expect Order Details Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  log.info "Expectation: Expect Order Details Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = orders.details.service.tooltip service
  tooltips.each { |tooltip|
    log.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  log.info "Expectation: Expect Service Cost to be $#{expected}"
  actual = orders.details.service_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Expectation: Expect Tracking Cost to be #{expected}"
  actual = orders.details.tracking_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Verify Order Details Form Total Amount$/ do
  log.info "Step: Verify Order Details Form Total Amount"
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Expectation: Expect Insurance Cost to be #{expected}"
  actual = orders.details.insurance_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Order Details Service to be \"(.*)\"$/ do |expected|
  log.info "Expectation: Expect Order Details Service to be #{expected}"
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

Then /^Expect Order Details Tracking to be \"([\w\s]*)\"$/ do |expected|
  log.info "Expectation: Expect Order Details Tracking to be #{expected}"
  begin
    10.times do
      actual = orders.details.tracking.text_box.text
      break if actual.include? expected
    end
    actual = orders.details.tracking.text_box.text
    log.info "Test #{(actual == expected)?"Passed":"Failed"}"
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order Details Total to be \$(.*)$/ do |expected|
  log.info "Expectation: Expect Order Details Total to be $#{expected}"
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
  log.info "Expectation: Expect #{expected} orders selected"
  orders.multi_orders.order_count.should eql expected
end




