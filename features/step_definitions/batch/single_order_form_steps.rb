And /^Set single-order form Ship-From to (\w+)$/ do |value|
  batch.single_order_form.ship_from.select value
end

When /^Set single-order form Ship-To address to (.*)$/ do |address|
  log "Set single-order form Ship-To address to \"#{address}\""
  formatted_address = BatchHelper.instance.format_address(random_ship_to(address))

  log "Set single-order form Ship-To address to \"#{formatted_address}\""
  ship_to = batch.single_order_form.ship_to
  ship_to.address formatted_address
  ship_to.phone test_helper.random_phone
  ship_to.email test_helper.random_email
  ship_to.hide
end

And /^Set single-order form Ship-To to ambiguous address$/ do |table|
  step "Set single-order form Ship-To address to #{table}"
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

  log "Ship-To Name: #{name}"
  log "Ship-To Company: #{company}"
  log "Ship-To Address: #{street_address}"
  log "Ship-To City: #{city}"
  log "Ship-To State: #{state}"
  log "Ship-To Zip: #{zip}"
  log "Ship-To Phone: #{phone}"
  log "Ship-To Email: #{email}"

  formatted_address = BatchHelper.instance.format_address("#{name}, #{company}, #{street_address}, #{city}, #{state}, #{zip}")
  ship_to = batch.single_order_form.ship_to
  ship_to.address formatted_address
  ship_to.phone phone
  ship_to.email email
  ship_to.hide
end

When /^Set single-order form Phone to (.*)$/ do |phone|
  begin
    log "Set single-order form Phone to \"#{phone}\""
    batch.single_order_form.ship_to.phone phone
  end unless phone.length == 0
end

When /^Set Email to (.*)$/ do |email|
  begin
    log "Set Email to \"#{email}\""
    batch.single_order_form.ship_to.email email
  end unless email.length == 0
  #end_step step
end

When /^Expect system (.*) single-order form$/ do |status|
  log "Confirmed system #{status} single-order form"

  actual = batch.single_order_form.single_order_form_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

When /^Hide single-order form Ship-To fields$/ do
  log "Hide single-order form Ship-To fields..."
  batch.single_order_form.ship_to.hide
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
    batch.single_order_form.tracking.select value
  end unless value.length == 0

  actual_tooltip = batch.single_order_form.tracking.tooltip value
  log actual_tooltip
  cost = batch.single_order_form.tracking.cost value
  log cost
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
  #batch.single_order_form.manage_shipping_addresses.add ship_from.hashes.first
  batch.single_order_form.ship_from.select("Manage Shipping Addresses...").add ship_from.hashes.first
end

Then /^Add Ship-From address (\w+)$/ do |address|
  @ship_from_address = batch.single_order_form.ship_from.select("Manage Shipping Addresses...").add(randomize_ship_from(address))
  log "Random address added: #{@ship_from_address}"
end

Then /^Expect (\w+) Ship-From address was added$/ do |address|
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    log "Search for \n#{@ship_from_address}.  Address was #{(batch.single_order_form.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Delete (\w+) Ship-From address$/ do |address|
  begin
    if address.downcase == "random"
      raise "Illegal State Exception:  @ship_from_address is nil" if @ship_from_address.nil?
      batch.single_order_form.ship_from.select("Manage Shipping Addresses...").delete @ship_from_address
    elsif address.downcase == "all"
      batch.single_order_form.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
    else
      raise "Test parameter exception.  #{address} is not a valid parameter for this test."
    end
  rescue
    #This is a housekeeping task and should never fail.
  end
end

Then /^Delete Ship-From Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  batch.single_order_form.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Set single-order form Ship-From to Manage Shipping Addresses$/ do
  batch.single_order_form.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order_form.ship_from.select("Manage Shipping Addresses...").edit_address name, company, city,  new_address.hashes.first
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

Then /^Expect single-order form Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expected|
  actual = batch.single_order_form.service.cost service
  10.times { |counter|
    log_expectation "#{counter}. #{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
    break if actual.to_f >= expected.to_f
    actual = batch.single_order_form.service.cost service
  }
  actual.to_f.should be >= expected.to_f
end

Then /^Expect single-order form Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split ","
  actual_tooltip = batch.single_order_form.service.tooltip service
  tooltips.each { |tooltip|
    log "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  }
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

Then /^Verify single-order form Total Amount$/ do
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

Then /^Expect single-order form Service to be \"(.*)\"$/ do |expected|
  begin
    actual = batch.single_order_form.service.text
    10.times { |counter|
      included = actual.include? expected
      break if included
      actual = batch.single_order_form.service.text
    }
    expect(actual.include? expected).to be true
  end unless expected.length == 0
end

Then /^Expect single-order form Tracking to be \"([\w\s]*)\"$/ do |expected|
  begin
    actual = batch.single_order_form.tracking.text
    10.times { |counter|
      log_expectation_eql "#{counter}. Tracking Selected", expected, actual
      break if actual.eql? expected
      actual = batch.single_order_form.tracking.text
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




