Then /^Set Order Details Ship-To Country to (.*)$/ do |country|
  log.info "Step: Set Order Details Ship-To Country to #{country}"
  @international_ship_to = orders.details.ship_to.country.select country
end

Then /^Expect Order Details Ship-To Country is (.*)$/ do |country|
  log.info "Step: Expect Order Details Ship-To Country is #{country}"
  order_details_country = orders.details.ship_to.country.text_box.text
  log.info "Test #{(order_details_country.include? country)?"Passed":"Failed"}"
  order_details_country.should eql country
end

# random, random, 234 Laurier Avenue West, Suite 100, Ottawa, Ontario, K1A, 0G9, random, random
Then /^Set Ship-To to international address$/ do |table|
  log.info "Step: Set Ship-To to international address..."
  param_hash = table.hashes.first

  name = (param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
  company = (param_hash["company"].downcase.include? "random") ? test_helper.random_company_name : param_hash["company"]
  street_address_1 = (param_hash["street_address_1"].downcase.include? "random") ? test_helper.random_string : param_hash["street_address_1"]
  street_address_2 = (param_hash["street_address_2"].downcase.include? "random") ? test_helper.random_suite : param_hash["street_address_2"]
  city = (param_hash["city"].downcase.include? "random") ? test_helper.random_string : param_hash["city"]
  province = (param_hash["province"].downcase.include? "random") ? test_helper.random_string : param_hash["province"]
  postal_code = (param_hash["postal_code"].downcase.include? "random") ? test_helper.random_alpha_numeric : param_hash["postal_code"]
  country = param_hash["country"]
  phone_num = param_hash["phone"]
  phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : param_hash["phone"]
  email_addy = param_hash["email"]
  email = (email_addy.downcase.include? "random") ? test_helper.random_email : param_hash["email"]

  log.info "International Ship-To Name: #{name}"
  log.info "International Ship-To Company: #{company}"
  log.info "International Ship-To Address 1: #{street_address_1}"
  log.info "International Ship-To Address 2: #{street_address_2}"
  log.info "International Ship-To City: #{city}"
  log.info "International Ship-To Province: #{province}"
  log.info "International Ship-To Postal Code: #{postal_code}"
  log.info "International Ship-To Phone: #{phone}"
  log.info "International Ship-To Email: #{email}"

  step "Set Order Details Ship-To Country to #{country}"
  step "Set International Ship-To Name to \"#{name}\""
  step "Set International Ship-To Company to \"#{company}\""
  step "Set International Ship-To Address 1 to \"#{street_address_1}\""
  step "Set International Ship-To Address 2 to \"#{street_address_2}\""
  step "Set International Ship-To City to \"#{city}\""
  step "Set International Ship-To Province to \"#{province}\""
  step "Set International Ship-To Postal Code to \"#{postal_code}\""
  step "Set International Ship-To Phone to \"#{phone}\""
  step "Set International Ship-To Email to \"#{email}\""
end

Then /^Expect International Ship-To name field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To name field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.name.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To company field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To company field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.company.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Address 1 field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To Address 1 field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.address_1.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Address 2 field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To address 2 field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.address_2.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Province field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To province field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.province.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Postal Code field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To postal code field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.postal_code.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Phone field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To phone field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.phone.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Email field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To Email field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.email.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To Country field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To Country field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.country.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Expect International Ship-To City field displays (.*)/ do |value|
  log.info "Step: Expect International Ship-To City field displays #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.city.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end


Then /^Set International Ship-To Name to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Name to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.name.send_keys :enter
  else
    @international_ship_to.name.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Company to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Company to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.company.send_keys :enter
  else
    @international_ship_to.company.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Address 1 to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Address 1 to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_1.send_keys :enter
  else
    @international_ship_to.address_1.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Address 2 to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Address 2 to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_2.send_keys :enter
  else
    @international_ship_to.address_2.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To City to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To City to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.city.send_keys :enter
  else
    @international_ship_to.city.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Province to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Province to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.province.send_keys :enter
  else
    @international_ship_to.province.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Set International Ship-To Postal Code to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Postal Code to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.postal_code.send_keys :enter
  else
    @international_ship_to.postal_code.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Phone to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Phone to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.phone.send_keys :enter
  else
    @international_ship_to.phone.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Set International Ship-To Email to \"(.*)\"$/ do |value|
  log.info "Step: Set International Ship-To Email to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.email.send_keys :enter
  else
    @international_ship_to.email.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Expect Order Details International Address fields are visible$/ do
  log.info "Step: Expect Order Details International Address fields are visible"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
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

Then /^Expect Order Details Domestic Ship-To fields are hidden$/ do
  log.info "Step: Expect Order Details Domestic Ship-To fields are hidden"
  @single_order_form = orders.details
  @single_order_form.ship_to.present?.should be false
  @single_order_form.email.present?.should be false
  @single_order_form.phone.present?.should be false
end

Then /^Expect Order Details Customs Restrictions button is visible/ do
  log.info "Step: Expect Order Details Customs Restrictions button is visible"
  @single_order_form = orders.details
  @single_order_form.customs.browser_restrictions_button.present?.should be true
  @single_order_form.customs.restrictions.ok
end

Then /^Expect Order Details Customs Restrictions button is hidden/ do
  log.info "Step: Expect Order Details Customs Restrictions button is hidden"
  @single_order_form = orders.details
  @single_order_form.customs.browser_restrictions_button.present?.should be false
end

Then /^Expect Order Details Customs Edit Form button is visible/ do
  log.info "Step: Expect Order Details Customs Edit Form button is visible"
  @single_order_form = orders.details
  @single_order_form.customs.browser_edit_form_button.present?.should be true
end

Then /^Expect Order Details Customs Edit Form button is hidden/ do
  log.info "Step: Expect Order Details Customs Edit Form button is hidden"
  @single_order_form = orders.details
  @single_order_form.customs.browser_edit_form_button.present?.should be false
end

Then /^Expect Order Details Customs Edit Form button is enabled/ do
  log.info "Step: Expect Order Details Customs Edit Form button is enabled"
  @single_order_form = orders.details
  @single_order_form.customs.browser_edit_form_button.present?.should be true
end

Then /^Expect Order Details Customs Edit Form button is disabled/ do
  log.info "Step: Expect Order Details Customs Edit Form button is disabled"
  @single_order_form = orders.details
  @single_order_form.customs.browser_edit_form_button.present?.should be false
end

Then /^Open customs form$/ do
  log.info "Step: Open customs form"
  @customs_form = @single_order_form.customs.edit_form
end

Then /^Set customs form Package Contents to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Package Contents to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.package_contents.select value
  #contents = @customs_form.package_contents.text_box.text
  #log.info "Test #{(contents.include? value)?"Passed":"Failed"}"
  #contents.should include value
end

Then /^Set customs form Non-Delivery Options to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Non-Delivery Options to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.non_delivery_options.select value
end

Then /^Set customs form Internal Transaction Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Internal Transaction Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.internal_transaction.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  sleep 1
end

Then /^Set customs form More Info to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form More Info to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Set customs form ITN# to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form ITN# to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Set customs form License# to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form License# to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Set customs form Certificate Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Certificate Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Set customs form Invoice Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Invoice Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Add or Edit Customs Form Item (\d+); Description=(\w+), Qty (\d+), Unit Price ([\d.]+), Weight\(lbs\) (\d+), Weight\(oz\) (\d+) Origin ([\w ]+), Tariff (\d+)$/ do |item_number, description, qty, price, lbs, oz, origin_country, tariff|
  log.info "Step: Add or Edit Customs Form Item #{item_number}; Description=#{description}, Qty #{qty}, Unit Price #{price}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"
  @customs_item_grid = @customs_form.item_grid
  item = @customs_item_grid.item item_number.to_i
  item.item_description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.lbs.set lbs
  item.oz.set oz
  sleep 2
  item.origin_country.select origin_country
  item.hs_tariff.set tariff
end

Then /^Delete Customs Form Item (\d+)$/ do |item_number|
  log.info "Step: Delete Customs Form Item #{item_number}"
  count = @customs_item_grid.line_item_count
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Set customs form I agree to (\w+)$/ do |agree_str|
  log.info "Step: Set customs form I agree to #{agree_str}"
  agree = agree_str.downcase == "true"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  sleep 1
  @customs_form.i_agree agree
end

Then /^Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions$/ do
  log.info "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @single_order_form.customs_form.i_agree true
end

Then /^Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibitions$/ do
  log.info "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @single_order_form.customs_form.i_agree false
end

Then /^Expect Customs Form More Info to be hidden$/ do
  log.info "Step: Expect Customs Form More Info to be hidden"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be false
end

Then /^Expect Customs Form More Info to be visible$/ do
  log.info "Step: Expect Customs Form More Info to be visible"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be true
end

Then /^Expect Customs Form License# to be visible$/ do
  log.info "Step: Expect Customs Form License# to be visible"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be true
end

Then /^Expect Customs Form License# to be hidden$/ do |value|
  log.info "Step: Expect Customs Form License# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be false
end

Then /^Expect Customs Form Certificate# to be hidden$/ do
  log.info "Step: Expect Customs Form Certificate# to be hidden"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be false
end

Then /^Expect Customs Form Certificate# to be visible$/ do
  log.info "Step: Expect Customs Form Certificate# to be visible"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be true
end

Then /^Expect Customs Form Invoice# to be hidden$/ do
  log.info "Step: Expect Customs Form Invoice# to be hidden"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be false
end

Then /^Expect Customs Form Invoice# to be visible$/ do
  log.info "Step: Expect Customs Form Invoice# to be visible"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be true
end

Then /^Expect Customs Form ITN# to be hidden$/ do
  log.info "Step: Expect Customs Form ITN# to be hidden"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.itn_number.present?.should be false
end

Then /^Expect Customs Form ITN# to be visible$/ do |value|
  log.info "Step: Expect Customs Form ITN# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.itn_number.present?.should be true
end

Then /^Expect Customs Form Internal Transaction # to be \"(.+)\"$/ do |value|
  log.info "Step: Expect Customs Form Internal Transaction # to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  sleep 1
  text = @customs_form.internal_transaction.text_box.text
  text = @customs_form.internal_transaction.text_box.text
  log.info "Internal Transaction # is #{text}.  Test #{(text.include? "Required")?'Passed':'Failed'}"
  text.should eql value
end

Then /^Expect Customs Form Item Grid count to be (.+)$/ do |value|
  log.info "Step: Expect Customs Form Item Grid count to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.item_grid.line_item_count.should eql value.to_i
end

Then /^Expect Customs Form Total Value to be (.+)$/ do |value|
  log.info "Step: Expect Customs Form Total Value to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_value
  log.info "Custom Info Actual Total Value: #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Then /^Expect Customs Form Total Pounds to be (.+)$/ do |value|
  log.info "Step: Expect Customs Form Total Pounds to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight_lbs
  log.info "Custom Info Actual Total Weight(lbs): #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Then /^Expect Customs Form Total Ounces to be (.+)$/ do |value|
  log.info "Step: Expect Customs Form Total Ounces to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight_oz
  log.info "Custom Info Actual Total Weight(Oz): #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Then /^Expect Customs Form Total Weight Data Error to be (.+)$/ do |value|
  log.info "Step: Expect Customs Form Total Weight Data Error to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight.data_error
  log.info "Total Weight Data Error - #{(browser_value.include? value)?'Passed':'Failed'}.  Expectation:  #{value}, Actual Result:  #{browser_value}"
  browser_value.should include value
end

Then /^Close customs form$/ do
  log.info "Step: Closing customs form"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.close
  log.info "Customs form #{(@customs_form.present?)?'closed':'is still open.'}"
end

Then /^Cancel Customs Form$/ do
  log.info "Step: Cancel customs form"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.cancel
end