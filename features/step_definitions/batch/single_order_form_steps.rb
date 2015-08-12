
When /^Set Ship-To address to (.*)$/ do |address|
  log "Set Ship-To address to \"#{address}\""
  batch.single_order_form.ship_to randomize_ship_to(address)
end

When /^Change Ship-To Address to (.*)$/ do |value|
  log "Change Ship-To Address to \"#{value}\""
  batch.single_order_form.ship_to log_param "Address", value
end

When /^Set Phone to (.*)$/ do |value|
  begin
    log "Set Phone to \"#{value}\""
    batch.single_order_form.phone = log_param "Phone", value
  end unless value.length == 0
end

When /^Set Email to (.*)$/ do |value|
  begin
    log "Set Email to \"#{value}\""
    batch.single_order_form.email = log_param "Email", value
  end unless value.length == 0
  #end_step step
end

When /^Click Ship To Less button$/ do
  log "Click Ship To Less button..."
  batch.single_order_form.less
  log "done."
  #end_step step
end

When /^Set Pounds to (\d*)$/ do |value|
  begin
    log "Set Pounds to \"#{value}\""
    batch.single_order_form.pounds = log_param "Pounds", value
  end unless value.length == 0
end

When /^Set Ounces to (\d*)$/ do |value|
  begin
    log "Set Ounces to \"#{value}\""
    batch.single_order_form.ounces = log_param"Ounces", value
  end unless value.length == 0
end

When /^Set Length to (\d*)$/ do |value|
  begin
    log "Set Length to \"#{value}\""
    batch.single_order_form.length = log_param "Length", value
  end unless value.length == 0
end

When /^Set Width to (\d*)$/ do |value|
  begin
    log "Set Width to \"#{value}\""
    batch.single_order_form.width = log_param "Width", value
  end unless value.length == 0
end

When /^Set Height to (\d*)$/ do |value|
  begin
    log "Set Height to \"#{value}\""
    batch.single_order_form.height = log_param "Height", value
  end unless value.length == 0
end

And /^Set Service to (.*)$/ do |value|
  batch.single_order_form.service log_param "Service", value
end

Then /^Set Tracking to ([\w ]*)$/ do |value|
  begin
    batch.single_order_form.tracking = log_param "Tracking", value
  end unless value.length == 0
end

And /^Set Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  batch.single_order_form.insured_value = value
end

And /^Set Ship From to (\w+)$/ do |value|
  batch.single_order_form.ship_from_default
end

And /^Set Ship-To address to$/ do |table|
  @ambiguous_address_module = batch.single_order_form.ship_to log_hash_param table.hashes.first
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  @ambiguous_address_module.row = row
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  expect(@ambiguous_address_module.present?).to be true
end

When /^Set order details with$/ do |table|
  log "Set order details with"
  batch.single_order_form.edit_details log_hash_param table.hashes.first
end

Then /^List all grid values for row (.*)$/ do |row|
  log "List all grid values for row  \"#{row}\""
  batch.grid.list_all_fields row
end

Then /^Add new Ship-From address$/ do |ship_from|
  batch.single_order_form.manage_shipping_addresses.add ship_from.hashes.first
end

Then /^Add new (\w+) Ship-From address$/ do |address|
  @ship_from_address = batch.single_order_form.manage_shipping_addresses.add(randomize_ship_from(address))
  log "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log "Search for \n#{@ship_from_address}.  Address was #{(batch.single_order_form.manage_shipping_addresses.address_located?(@ship_from_address))?'Located':'Not Located'}"
    #batch.single_order_form.manage_shipping_addresses.address_located?(@ship_from_address).should be true

  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  begin
    if address.downcase.include? "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      batch.single_order_form.manage_shipping_addresses.delete @ship_from_address
      #batch.single_order_form.manage_shipping_addresses.delete (address.downcase.include?"random")?@ship_from_address:address
    elsif address.downcase.include? "all"
      batch.single_order_form.manage_shipping_addresses.delete_all
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  batch.single_order_form.manage_shipping_addresses.delete_row row
end

Then /^Delete all Ship-From addresses and fail test if delete fails$/ do
  batch.single_order_form.manage_shipping_addresses.delete_all.should be_deleted
end

Then /^Set Ship From to Manage Shipping Addresses$/ do
  batch.single_order_form.manage_shipping_addresses.add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order_form.manage_shipping_addresses.edit_address(name, company, city,  new_address.hashes.first).should be_successful
end
Then /^Expect Order Status to be ([\w ]+)$/ do |expected_value|
  actual_value = batch.single_order_form.order_status
  log "Expect Order Status to be #{expected_value}.  Actual Value:  #{actual_value}.  Test #{(actual_value==expected_value)?'Passed':"Failed"}"
  actual_value.should eql expected_value
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order_form.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order_form.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Service Cost to be greater than \$([0-9.]+)$/ do |expected|
  actual = batch.single_order_form.service_cost
  10.times { |counter|
    log_expectation "#{counter}. Single Order Form Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order_form.service_cost
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect inline Service Cost for ([a-zA-Z -\/]+) to be greater than \$([0-9.]+)$/ do |service, expected|
  actual = batch.single_order_form.service service
  10.times { |counter|
    log_expectation "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order_form.service service
  }
  actual.to_f.should be >= expected.to_f
end
Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  actual = batch.single_order_form.service_cost
  begin
    10.times { |counter|
      log_expectation_eql "#{counter}. Service Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.service_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.single_order_form.tracking_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.tracking_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Verify Single Order Form Total Amount$/ do
  batch.single_order_form.total_amount_calculation.should be_correct
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.single_order_form.insurance_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Insurance Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.insurance_cost
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Service to be (.*)$/ do |expected|
  begin
    actual = batch.single_order_form.service_input_text
    10.times { |counter|
      included = actual.include? expected
      break if included
      actual = batch.single_order_form.service_input_text
    }
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Expect Tracking to be ([\w\s]*)$/ do |expected|
  begin
    actual = batch.single_order_form.tracking
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Selected", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.tracking
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Total to be \$(.*)$/ do |expected|
  begin
    actual = batch.single_order_form.total
    10.times { |counter|
      log_expectation_eql "#{counter}. Total Cost", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.total
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  batch.multi_order.order_count.should eql expected
end




