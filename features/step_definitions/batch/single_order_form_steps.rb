

And /^Set single-order form Ship-From to (\w+)$/ do |value|
  batch.single_order_form.ship_from value
end

When /^Set single-order form Ship-To address to (.*)$/ do |address|
  log "Set single-order form Ship-To address to \"#{address}\""
  batch.single_order_form.ship_to random_ship_to(address)
end

And /^Set single-order form Ship-To address to$/ do |table|
  param_hash = table.hashes.first

  name = (param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
  company = (param_hash["company"].downcase.include? "random") ? test_helper.random_company_name : param_hash["company"]
  street_address = param_hash["street_address"]
  city = param_hash["city"]
  state = param_hash["state"]
  zip = param_hash["zip"]
  phone_num = param_hash["phone"]
  phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : param_hash["phone"]
  email_addy = param_hash["email"]
  email = (email_addy.downcase.include? "random") ? test_helper.random_email : param_hash["email"]

  param_hash["name"] = name
  param_hash["company"] = company
  param_hash["street_address"] = street_address
  param_hash["city"] = city
  param_hash["state"] = state
  param_hash["zip"] = zip
  param_hash["phone"] = phone
  param_hash["email"] = email

  log "Ship-To Name: #{param_hash["name"]}"
  log "Ship-To Company: #{param_hash["company"]}"
  log "Ship-To Address: #{param_hash["street_address"]}"
  log "Ship-To City: #{param_hash["city"]}"
  log "Ship-To State: #{param_hash["state"]}"
  log "Ship-To Zip: #{param_hash["zip"]}"
  log "Ship-To Phone: #{param_hash["phone"]}"
  log "Ship-To Email: #{param_hash["email"]}"

  @ambiguous_address_module = batch.single_order_form.ship_to param_hash
end

When /^Set single-order form Phone to (.*)$/ do |value|
  begin
    log "Set single-order form Phone to \"#{value}\""
    batch.single_order_form.phone.set log_param "Phone", value
  end unless value.length == 0
end

When /^Set Email to (.*)$/ do |value|
  begin
    log "Set Email to \"#{value}\""
    batch.single_order_form.email.set log_param "Email", value
  end unless value.length == 0
  #end_step step
end

When /^Expect system (.*) Single Order Form$/ do |status|
  log "Confirmed system #{status} Single Order Form"

  actual = batch.single_order_form.single_order_form_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

When /^Hide single-order form Ship-To fields$/ do
  log "Hide single-order form Ship-To fields..."
  batch.single_order_form.hide_ship_to
  log "done."
  #end_step step
end

When /^Set single-order form Pounds to (\d*)$/ do |value|
  begin
    log "Set single-order form Pounds to \"#{value}\""
    batch.single_order_form.lbs.set log_param "Pounds", value
  end unless value.length == 0
end

When /^Set single-order form Ounces to (\d*)$/ do |value|
  begin
    log "Set single-order form Ounces to \"#{value}\""
    batch.single_order_form.oz.set log_param"Ounces", value
  end unless value.length == 0
end

When /^Set single-order form Length to (\d*)$/ do |value|
  begin
    log "Set single-order form Length to \"#{value}\""
    batch.single_order_form.length.set log_param "Length", value
  end unless value.length == 0
end

When /^Set single-order form Width to (\d*)$/ do |value|
  begin
    log "Set single-order form Width to \"#{value}\""
    batch.single_order_form.width.set log_param "Width", value
  end unless value.length == 0
end

When /^Set single-order form Height to (\d*)$/ do |value|
  begin
    log "Set single-order form Height to \"#{value}\""
    batch.single_order_form.height.set log_param "Height", value
  end unless value.length == 0
end

And /^Set single-order form Service to \"(.*)\"$/ do |service|
  batch.single_order_form.service.select service
end

Then /^Set single-order form Tracking to \"([\w ]*)\"$/ do |value|
  begin
    batch.single_order_form.tracking = log_param "Tracking", value
  end unless value.length == 0
end

And /^Set single-order form Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  batch.single_order_form.insured_value.set value
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

Then /^Add Ship-From address$/ do |ship_from|
  batch.single_order_form.manage_shipping_addresses.add ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  @ship_from_address = batch.single_order_form.manage_shipping_addresses.add(randomize_ship_from(address))
  log "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log "Search for \n#{@ship_from_address}.  Address was #{(batch.single_order_form.manage_shipping_addresses.address_located?(@ship_from_address))?'Located':'Not Located'}"
    #features.batch.single_order_form.manage_shipping_addresses.address_located?(@ship_from_address).should be true

  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  begin
    if address.downcase.include? "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      batch.single_order_form.manage_shipping_addresses.delete @ship_from_address
      #features.batch.single_order_form.manage_shipping_addresses.delete (address.downcase.include?"random")?@ship_from_address:address
    elsif address.downcase.include? "all"
      batch.single_order_form.manage_shipping_addresses.delete_all
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  batch.single_order_form.manage_shipping_addresses.delete_row(row).close_window
end

Then /^Delete all Ship-From addresses and fail test if delete fails$/ do
  batch.single_order_form.manage_shipping_addresses.delete_all.should be_deleted
end

Then /^Set single-order form Ship-From to Manage Shipping Addresses$/ do
  batch.single_order_form.manage_shipping_addresses.add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order_form.manage_shipping_addresses.edit_address name, company, city,  new_address.hashes.first
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
  actual = batch.single_order_form.service.cost service
  10.times { |counter|
    log_expectation "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order_form.service.cost service
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

Then /^Expect single-order form Total to be \$(.*)$/ do |expected|
  begin
    10.times { |counter|
      batch.single_order_form.click_form
      sleep 1
      actual = batch.single_order_form.total
      batch.single_order_form.click_form
      log_expectation_eql "#{counter}. Total Cost", expected, actual
      batch.single_order_form.click_form
      sleep 1
      break if actual.eql? expected
    }
    actual = batch.single_order_form.total
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expected|
  batch.multi_order.order_count.should eql expected
end




