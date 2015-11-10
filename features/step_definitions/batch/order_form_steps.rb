And /^Set Order Form Ship-From to (\w+)$/ do |value|
  log "Test: Set Order Form Ship-From to #{value}"
  batch.order_details.ship_from.select value
end

And /^Set Order Form Ship-To address to$/ do |table|
  ship_to = BatchHelper.instance.address_hash_to_str table.hashes.first
  log "Test: Set Order Form Ship-To address to \n#{ship_to}"
  step "Set Order Form Ship-To address to #{ship_to}"
end

When /^Set Order Form Ship-To address to (.*)$/ do |address|
  log "Set Order Form Ship-To address to \"#{address}\""

  if address.downcase.include? "random"
    random_ship_to_address = test_helper.random_ship_to
    formatted_address = BatchHelper.instance.format_address(random_ship_to_address)
    step "Set Order Form Phone to #{random_ship_to_address["phone"]}"
    step "Set Order Form Email to #{random_ship_to_address["email"]}"
  else
    formatted_address = BatchHelper.instance.format_address address
  end

  log "Set Order Form Ship-To address to \"#{formatted_address}\""

  batch.order_details.ship_to.domestic.set formatted_address
end

And /^Set Order Form Ship-To to ambiguous address$/ do |table|
  ambiguous_address = BatchHelper.instance.format_address table.hashes.first
  log "Step:  Set Order Form Ship-To to ambiguous address \n#{ambiguous_address}"
  @ambiguous_address_module = batch.order_details.ship_to.ambiguous.set ambiguous_address
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  log "Start:  Select row #{row} from Exact Address Not Found module"
  @ambiguous_address_module.row row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  expect(@ambiguous_address_module.present?).to be true
end

When /^Set Order Form Phone to (.*)$/ do |phone|
  begin
    log "Set Order Form Phone to \"#{phone}\""
    batch.order_details.ship_to.domestic.phone.set phone
  end unless phone.length == 0
end

When /^Set Order Form Email to (.*)$/ do |email|
  begin
    log "Set Order Form Email to \"#{email}\""
    batch.order_details.ship_to.domestic.email.set email
  end unless email.length == 0
  #end_step step
end

When /^Expect system (.*) Order Form$/ do |status|
  log "Confirmed system #{status} Order Form"

  actual = batch.order_details.single_order_form_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

When /^Hide Order Form Ship-To fields$/ do
  log "Hide Order Form Ship-To fields..."
  batch.order_details.ship_to.hide
  log "done."
  #end_step step
end

When /^Set Order Form Pounds to (\d*)$/ do |value|
  begin
    log "Set Order Form Pounds to \"#{value}\""
    batch.order_details.lbs.set log_param "Pounds", value
  end unless value.length == 0
end

When /^Set Order Form Ounces to (\d*)$/ do |value|
  begin
    log "Set Order Form Ounces to \"#{value}\""
    batch.order_details.oz.set log_param"Ounces", value
  end unless value.length == 0
end

When /^Set Order Form Length to (\d*)$/ do |value|
  begin
    log "Set Order Form Length to \"#{value}\""
    batch.order_details.length.set log_param "Length", value
  end unless value.length == 0
end

When /^Set Order Form Width to (\d*)$/ do |value|
  begin
    log "Set Order Form Width to \"#{value}\""
    batch.order_details.width.set log_param "Width", value
  end unless value.length == 0
end

When /^Set Order Form Height to (\d*)$/ do |value|
  begin
    log "Set Order Form Height to \"#{value}\""
    batch.order_details.height.set log_param "Height", value
  end unless value.length == 0
end

And /^Set Order Form Service to \"(.*)\"$/ do |service|
  batch.order_details.service.select service
end

Then /^Set Order Form Tracking to \"([\w ]*)\"$/ do |value|
  begin
    batch.order_details.tracking.select value
  end unless value.length == 0

  actual_tooltip = batch.order_details.tracking.tooltip value
  log actual_tooltip
  cost = batch.order_details.tracking.cost value
  log cost
end

And /^Set Order Form Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  batch.order_details.insured_value.set value
end

When /^Set order details with$/ do |table|
  log "Set order details with"
  batch.order_details.edit_details log_hash_param table.hashes.first
end

Then /^Add Ship-From address$/ do |ship_from|
  #batch.order_details.manage_shipping_addresses.add ship_from.hashes.first
  batch.order_details.ship_from.select("Manage Shipping Addresses...").add ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  ship_from = (address.include?'random')?(test_helper.random_ship_from):address
  log "Start:  Add Ship-From address #{(address.include?'random')?ship_from:address}"
  @ship_from_address = batch.order_details.ship_from.select("Manage Shipping Addresses...").add ship_from
  log "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log "Search for \n#{@ship_from_address}.  Address was #{(batch.order_details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  begin
    if address.downcase == "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      batch.order_details.ship_from.select("Manage Shipping Addresses...").delete @ship_from_address
    elsif address.downcase == "all"
      batch.order_details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
    else
      raise "Test parameter exception.  #{address} is not a valid parameter for this test."
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  batch.order_details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Set Order Form Ship-From to Manage Shipping Addresses$/ do
  batch.order_details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.order_details.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
end
Then /^Expect Order Status to be ([\w ]+)$/ do |expected_value|
  actual_value = batch.order_details.order_status
  log "Expect Order Status to be #{expected_value}.  Actual Value:  #{actual_value}.  Test #{(actual_value==expected_value)?'Passed':"Failed"}"
  actual_value.should eql expected_value
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.order_details.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.order_details.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Order Form Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  actual = batch.order_details.service.cost service
  10.times { |counter|
    log_expectation "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.order_details.service.cost service
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect Order Form Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split ","
  actual_tooltip = batch.order_details.service.tooltip service
  tooltips.each { |tooltip|
    log "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  actual = batch.order_details.service_cost
  begin
    10.times { |counter|
      log_expectation_eql "#{counter}. Service Cost", expected, actual
      break if actual.eql? expected
      actual = batch.order_details.service_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.order_details.tracking_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Cost", expected, actual
      break if actual.eql? expected
      actual = batch.order_details.tracking_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Verify Order Form Total Amount$/ do
  batch.order_details.total_amount_calculation.should be_correct
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.order_details.insurance_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Insurance Cost", expected, actual
      break if actual.eql? expected
      actual = batch.order_details.insurance_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order Form Service to be \"(.*)\"$/ do |expected|
  begin
    actual = batch.order_details.service.text
    10.times { |counter|
      included = actual.include? expected
      break if included
      actual = batch.order_details.service.text
    }
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Expect Order Form Tracking to be \"([\w\s]*)\"$/ do |expected|
  begin
    actual = batch.order_details.tracking.text
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Selected", expected, actual
      break if actual.eql? expected
      actual = batch.order_details.tracking.text
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order Form Total to be \$(.*)$/ do |expected|
  begin
    10.times { |counter|
      batch.order_details.click_form
      sleep 1
      actual = batch.order_details.total
      batch.order_details.click_form
      log_expectation_eql "#{counter}. Total Cost", expected, actual
      batch.order_details.click_form
      sleep 1
      break if actual.eql? expected
    }
    actual = batch.order_details.total
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  batch.multi_order.order_count.should eql expected
end




