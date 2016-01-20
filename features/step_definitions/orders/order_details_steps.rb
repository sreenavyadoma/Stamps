Then /^Order Details - Add Item (\d+) - Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  log.info "Step: Order Details - Add Item #{item_number} - Qty #{qty}, ID #{id} Description #{description}"
  item = orders.details.item_grid.item item_number.to_i
  item.qty.set qty
  item.id.set (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
  item.description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Then /^Delete Order Details Item (\d+)$/ do |item_number|
  log.info "Step: Delete Order Details Item #{item_number}"
  item = orders.details.item_grid.item item_number.to_i
  item.delete.safe_click
end

Then /^Order Details - Set Weight to (\d+) lbs (\d+) oz$/ do |pounds, ounces|
  log.info "Step:  Order Details - Set Weight to #{pounds} Pounds and #{ounces} Ounces"
  orders.details.weight.lbs.set pounds
  orders.details.weight.oz.set ounces
end

Then /^Order Details - Set Pounds to (\d*)$/ do |value|
  log.info "Step: Order Details - Set Pounds to \"#{value}\""
  orders.details.weight.lbs.set value
end

Then /^Order Details - Set Ounces to (.*)$/ do |value|
  log.info "Step: Order Details - Set Ounces to \"#{value}\""
  orders.details.weight.oz.set value
end

Then /^Order Details - Set Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  log.info "Order Details - Set Dimensions to Length #{length} Width #{width} Height #{height}"
  orders.details.dimensions.length.set length
  orders.details.dimensions.width.set width
  orders.details.dimensions.height.set height
end

Then /^Order Details - Set Length to (\d*)$/ do |value|
  log.info "Step: Order Details - Set Length to \"#{value}\""
  orders.details.dimensions.length.set value
end

Then /^Order Details - Set Width to (\d*)$/ do |value|
  log.info "Step: Order Details - Set Width to \"#{value}\""
  orders.details.dimensions.width.set value
end

Then /^Order Details - Set Height to (\d*)$/ do |value|
  log.info "Step: Order Details - Set Height to \"#{value}\""
  orders.details.dimensions.height.set value
end

Then /^Order Details - Set Service to \"(.*)\"$/ do |service|
  log.info "Step: Order Details - Set Service to #{service}"
  orders.details.service.select service
end

Then /^Order Details - Set Ship-From to (\w+)$/ do |value|
  log.info "Step: Order Details - Set Ship-From to: \n #{value}"
  orders.details.ship_from.select value
end

Then /^Order Details - Set Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Order Details - Set Ship-To address to \n#{ship_to}"
  step "Order Details - Set Ship-To address to #{ship_to}"
end

Then /^Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Order Details - Set Ship-To address to zone 1 through 4"
end

Then /^Order Details - Order Details - Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Order Details - Set Ship-To address to zone 5 through 8"
end

Then /^Order Details - Set Ship-To address to (.*)$/ do |address|
  log.info "Step: Order Details - Set Ship-To address to \"#{address}\""

  case address
    when /zone 1/
      random_ship_to_address = test_helper.rand_ship_to_zone_1_4
      formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)
      log.info "Order Details - Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5/
      random_ship_to_address = test_helper.rand_ship_to_zone_5_8
      formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)
      log.info "Order Details - Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  orders.details.ship_to.address.set formatted_address

  begin
    step "Order Details - Set Phone to #{random_ship_to_address["phone"]}"
    step "Order Details - Set Email to #{random_ship_to_address["email"]}"
  rescue
    #ignore
  end
end

Then /^Order Details - Order Details - Set Ship-To to ambiguous address$/ do |table|
  ambiguous_address = OrdersHelper.instance.format_address table.hashes.first
  log.info "Step: Order Details - Order Details - Set Ship-To to ambiguous address \n#{ambiguous_address}"
  orders.details.ship_to.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  log.info "Step: Select row #{row} from Exact Address Not Found module"
  address_not_found_module = orders.details.ship_to.ambiguous.address_not_found
  log.info "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  raise "Ambiguous Address Module is not present.  Unable to set Ambiguous Address Row to #{row}" unless address_not_found_module.present?
  address_not_found_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  log.info "Step: Expect \"Exact Address Not Found\" module to appear"
  address_not_found_module = orders.details.ship_to.ambiguous.address_not_found
  log.info "Test #{(address_not_found_module.present?)?"Passed":"Failed"}"
  address_not_found_module.present?.should be true
end

Then /^Order Details - Set Phone to (.*)$/ do |phone|
  @order_details_phone = (phone.to_s.strip.downcase.include? "random")?(test_helper.random_phone):phone
  begin
    log.info "Step: Order Details Form Phone to \"#{@order_details_phone}\""
    orders.details.ship_to.address.phone.set @order_details_phone
  end unless @order_details_phone.length == 0
end

Then /^Order Details - Set Email to (.*)$/ do |email|
  @order_details_email = (email.to_s.strip.downcase.include? "random")?(test_helper.random_email):email
  begin
    log.info "Step: Order Details - Set Email to \"#{@order_details_email}\""
    orders.details.ship_to.address.email.set @order_details_email
  end unless @order_details_email.length == 0
end

Then /^Expect system (.*) Order Form$/ do |status|
  log.info "Step: Expect system #{status} Order Form"

  actual = orders.details.present?
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

Then /^Hide Order Details Form Ship-To fields$/ do
  log.info "Step: Hide Order Details Form Ship-To fields"
  orders.details.ship_to.hide
  log.info "done."
  #end_step step
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

Then /^Order Details - Set Tracking to \"([\w ]*)\"$/ do |value|
  log.info "Step: Order Details - Set Tracking to #{value}"
  orders.details.tracking.select value
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
#todo-rob
Then /^Expect Order Details Tracking tooltip for (.*) to be (.*)$/ do |lov, expectation|
  actual_tooltip = orders.details.tracking.tooltip value
  #log.info actual_tooltip
  cost = orders.details.tracking.cost value
  #log.info cost
end

Then /^Order Details - Set Insure For to \$([\d*\.?\d*]*)$/ do |value|
  log.info "Step: Order Details - Set Insure For to #{value}"
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

Then /^Order Details - Set Ship-From to Manage Shipping Addresses$/ do
  log.info "Step: Order Details - Set Ship-From to Manage Shipping Addresses"
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

Then /^Expect Order Details Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  log.info "Step: Expect Order Details Service Cost inline price for #{service} to be greater than #{expected}"
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
  log.info "Step: Expect Order Details Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = orders.details.service.tooltip service
  tooltips.each { |tooltip|
    log.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  log.info "Step: Expect Service Cost to be $#{expected}"
  actual = orders.details.service_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Step: Expect Tracking Cost to be #{expected}"
  actual = orders.details.tracking_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Verify Order Details Form Total Amount$/ do
  log.info "Step: Verify Order Details Form Total Amount"
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  log.info "Step: Expect Insurance Cost to be #{expected}"
  actual = orders.details.insurance_cost
  log.info "Test #{(actual == expected)?"Passed":"Failed"}"
  actual.should eql expected
end

Then /^Expect Order Details Service to be \"(.*)\"$/ do |expected|
  log.info "Step: Expect Order Details Service to be #{expected}"
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
  log.info "Step: Expect Order Details Tracking to be #{expected}"
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
  log.info "Step: Expect Order Details Total to be $#{expected}"
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




