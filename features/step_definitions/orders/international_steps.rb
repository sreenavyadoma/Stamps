

Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price ([\d.]+), Lbs (\d+), Oz (\d+) Origin ([\w ]+), Tariff (\d+)$/ do |item_number, description, qty, price, lbs, oz, origin_country, tariff|
  log.info "Step: Customs: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid
  item = @customs_item_grid.item item_number.to_i

  item.description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.lbs.set lbs
  item.oz.set oz
  item.origin.select origin_country
  item.hs_tariff.set tariff
end

Then /^Customs: Expect Item Count is (\d+), Description is (.*), Qty is (\d+), Price is (.*), Lbs is (\d+), Oz is (\d+) Origin Country is ([\w ]+) and Tariff is (.*)$/ do |item_number, description, qty, price, lbs, oz, origin_country, tariff|
  log.info "Step: Customs: Expect Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid
  item = @customs_item_grid.item item_number.to_i

  begin
    actual_value = item.description.text
    log.info "Item #{item_number} Description Test #{(actual_value==description)?"Passed":"Failed"}"
    actual_value.should eql description
  end unless description.downcase == "ignore"

  begin
    actual_value = item.qty.text_box.text
    log.info "Item #{item_number} Quantity Test #{(actual_value==qty)?"Passed":"Failed"}"
    actual_value.should eql qty
  end unless qty.downcase == "ignore"

  begin
    actual_value = item.unit_price.text_box.text
    log.info "Item #{item_number} Unit Price Test #{(actual_value==price)?"Passed":"Failed"}"
    actual_value.should eql price
  end unless price.downcase == "ignore"

  begin
    actual_value = item.lbs.text_box.text
    log.info "Item #{item_number} Weight (lbs) Test #{(actual_value==lbs)?"Passed":"Failed"}"
    actual_value.should eql lbs
  end unless lbs.downcase == "ignore"

  item.oz.set oz

  begin
    actual_value = item.oz.text_box.text
    log.info "Item #{item_number} Weight (oz) Test #{(actual_value==oz)?"Passed":"Failed"}"
    actual_value.should eql oz
  end unless oz.downcase == "ignore"

  begin
    actual_value = item.origin.text_box.text
    log.info "Item #{item_number} Origin Country (oz) Test #{(actual_value==origin_country)?"Passed":"Failed"}"
    actual_value.should eql origin_country
  end unless origin_country.downcase == "ignore"

  begin
    actual_value = item.hs_tariff.text
    log.info "Item #{item_number} HS Tarriff Test #{(actual_value==tariff)?"Passed":"Failed"}"
    actual_value.should eql tariff
  end unless tariff.downcase == "ignore"

end

Then /^Customs: Add Item (\d+)$/ do |item_number|
  log.info "Customs: Add Item #{item_number}"

  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid
  @customs_form_line_item = @customs_item_grid.item item_number.to_i
end

Then /^Customs: Set Item Description to (.*)$/ do |value|
  log.info "Details: Set Description to #{value}"
  @customs_form_line_item.description.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set Item Qty to (\d+)$/ do |value|
  log.info "Details: Set Qty to #{value}"
  @customs_form_line_item.qty.set value
end

Then /^Customs: Set Item Unit Price to (.*)$/ do |value|
  log.info "Details: Set Unit Price to #{value}"
  @customs_form_line_item.unit_price.set value
end

Then /^Customs: Set Item Pounds to (.*)$/ do |value|
  log.info "Details: Set Pounds to #{value}"
  @customs_form_line_item.lbs.set value
end

Then /^Customs: Set Item Ounces to (.*)$/ do |value|
  log.info "Details: Set Ounces to #{value}"
  @customs_form_line_item.oz.set value
end

Then /^Customs: Set Item Origin Country to (.*)$/ do |value|
  log.info "Details: Set Origin Country to #{value}"
  @customs_form_line_item.origin.select value
end

Then /^Customs: Set Item Tarriff to (.*)$/ do |value|
  log.info "Details: Set Tarriff to #{value}"
  @customs_form_line_item.hs_tariff.set value
end































Then /^Details: Set Ship-To Country to (.*)$/ do |country|
  log.info "Step: Details: Set Ship-To Country to #{country}"
  @international_ship_to = orders.details.ship_to.country.select country
end

Then /^Details: Set International Ship-To Name to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Name to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.name.send_keys :enter
  else
    @international_ship_to.name.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Company to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Company to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.company.send_keys :enter
  else
    @international_ship_to.company.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Address 1 to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Address 1 to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_1.send_keys :enter
  else
    @international_ship_to.address_1.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Address 2 to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Address 2 to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_2.send_keys :enter
  else
    @international_ship_to.address_2.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To City to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To City to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.city.send_keys :enter
  else
    @international_ship_to.city.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Province to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Province to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.province.send_keys :enter
  else
    @international_ship_to.province.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Details: Set International Ship-To Postal Code to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Postal Code to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.postal_code.send_keys :enter
  else
    @international_ship_to.postal_code.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Phone to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Phone to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.phone.send_keys :enter
  else
    @international_ship_to.phone.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end


Then /^Details: Set International Ship-To Email to \"(.*)\"$/ do |value|
  log.info "Step: Details: Set International Ship-To Email to #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.email.send_keys :enter
  else
    @international_ship_to.email.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Details: Expect Ship-To Country to be (.*)$/ do |country|
  log.info "Step: Details: Expect Ship-To Country to be #{country}"
  order_details_country = orders.details.ship_to.country.text_box.text
  log.info "Test #{(order_details_country.include? country)?"Passed":"Failed"}"
  order_details_country.should eql country
end

=begin
Then /^Details: Set Ship-To address to$/ do |table|
  log.info "Step: Details: Set Ship-To address to..."
  param_hash = table.hashes.first

  name = (param_hash['name'].downcase.include? "random") ? test_helper.random_name : param_hash['name']
  company = (param_hash['company'].downcase.include? "random") ? test_helper.random_company_name : param_hash['company']
  street_address_1 = (param_hash['street_address_1'].downcase.include? "random") ? test_helper.random_string : param_hash['street_address_1']
  street_address_2 = (param_hash['street_address_2'].downcase.include? "random") ? test_helper.random_suite : param_hash['street_address_2']
  city = (param_hash['city'].downcase.include? "random") ? test_helper.random_string : param_hash['city']
  province = (param_hash['province'].downcase.include? "random") ? test_helper.random_string : param_hash['province']
  postal_code = (param_hash['postal_code'].downcase.include? "random") ? test_helper.random_alpha_numeric : param_hash['postal_code']
  country = param_hash['country']
  phone_num = param_hash['phone']
  phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : param_hash['phone']
  email_addy = param_hash['email']
  email = (email_addy.downcase.include? "random") ? test_helper.random_email : param_hash['email']

  log.info "International Ship-To Name: #{name}"
  log.info "International Ship-To Company: #{company}"
  log.info "International Ship-To Address 1: #{street_address_1}"
  log.info "International Ship-To Address 2: #{street_address_2}"
  log.info "International Ship-To City: #{city}"
  log.info "International Ship-To Province: #{province}"
  log.info "International Ship-To Postal Code: #{postal_code}"
  log.info "International Ship-To Phone: #{phone}"
  log.info "International Ship-To Email: #{email}"

  step "Details: Set Ship-To Country to #{country}"
  step "Details: Set International Ship-To Name to \"#{name}\""
  step "Details: Set International Ship-To Company to \"#{company}\""
  step "Details: Set International Ship-To Address 1 to \"#{street_address_1}\""
  step "Details: Set International Ship-To Address 2 to \"#{street_address_2}\""
  step "Details: Set International Ship-To City to \"#{city}\""
  step "Details: Set International Ship-To Province to \"#{province}\""
  step "Details: Set International Ship-To Postal Code to \"#{postal_code}\""
  step "Details: Set International Ship-To Phone to \"#{phone}\""
  step "Details: Set International Ship-To Email to \"#{email}\""
end
=end

Then /^Open Customs Form$/ do
  log.info "Step: Open Customs Form"
  @customs_form = @order_details.customs.edit_form
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Package Contents to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.package_contents.select value
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Non-Delivery Options to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.non_delivery_options.select value
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Internal Transaction Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.internal_transaction.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  sleep 1
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set More Info to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set ITN# to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set ITN# to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set License# to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set License# to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Certificate Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Invoice Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Open Customs Form" unless @customs_form.present?

  @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Delete Item (\d+)$/ do |item_number|
  log.info "Step: Customs: Delete Item #{item_number}"
  count = @customs_item_grid.size
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Customs: Check I agree to the USPS Privacy Act Statement$/ do
  log.info "Step: Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @order_details.customs_form.i_agree.check
end

Then /^Customs: Uncheck  I agree to the USPS Privacy Act Statement$/ do
  log.info "Step: Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @order_details.customs_form.i_agree.uncheck
end

Then /^Sleep (\d+)$/ do |seconds|
  step "Wait in seconds #{seconds}"
end

Then /^Pause for 1 second$/ do
  step "Pause for 1 seconds"
end

Then /^Pause for (\d+) seconds$/ do |seconds|
  step "Wait in seconds #{seconds}"
end

Then /^Wait in seconds (\d+)$/ do |seconds|
  sleep seconds.to_i
end

Then /^Close Customs Form$/ do
  log.info "Step: Closing customs form"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.close
  log.info "Customs form #{(@customs_form.present?)?'closed':'is still open.'}"
end

Then /^Cancel Customs Form$/ do
  log.info "Step: Cancel customs form"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.cancel
end

Then /^Details: Expect International Ship-To Name to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To Name to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.name.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Company to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To Company to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.company.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Address 1 to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To Address 1 to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.address_1.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Address 2 to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To address 2 to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.address_2.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Province to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To province to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.province.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Postal Code to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To postal code to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.postal_code.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Phone to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To phone to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.phone.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Email to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To Email to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.email.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To Country to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To Country to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.country.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Ship-To City to be (.*)/ do |value|
  log.info "Step: Details: Expect International Ship-To City to be #{value}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  actual = @international_ship_to.city.text
  log.info "Test #{(actual == value)?"Passed":"Failed"}"
  actual.should eql value
end

Then /^Details: Expect International Address fields are visible$/ do
  log.info "Step: Details: Expect International Address fields are visible"
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

Then /^Details: Expect Domestic Ship-To fields are hidden$/ do
  log.info "Step: Details: Expect Domestic Ship-To fields are hidden"
  order_details = orders.details
  order_details.ship_to.address.text_area.present?.should be false
end

Then /^Details: Expect Customs Restrictions button is visible/ do
  log.info "Step: Details: Expect Customs Restrictions button is visible"
  order_details = orders.details
  order_details.customs.browser_restrictions_button.present?.should be true
  order_details.customs.restrictions.ok
end

Then /^Details: Expect Customs Restrictions button is hidden/ do
  log.info "Step: Details: Expect Customs Restrictions button is hidden"
  order_details = orders.details
  order_details.customs.browser_restrictions_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is visible/ do
  log.info "Step: Details: Expect Customs Edit Form button is visible"
  order_details = orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is hidden/ do
  log.info "Step: Details: Expect Customs Edit Form button is hidden"
  order_details = orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is enabled/ do
  log.info "Step: Details: Expect Customs Edit Form button is enabled"
  order_details = orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is disabled/ do
  log.info "Step: Details: Expect Customs Edit Form button is disabled"
  order_details = orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Expect Customs Form USPS Privacy Act Warning to be visible$/ do
  log.info "Step: Expect Customs Form USPS Privacy Act Warning to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  10.times do
    break if @customs_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  usps_privacy_act_warning = @customs_form.usps_privacy_act_warning.visible?
  log.info "Test #{(usps_privacy_act_warning)?"Passed":"Failed"}"
  usps_privacy_act_warning.should be true
end

Then /^Expect Customs Form USPS Privacy Act Warning to be hidden/ do
  log.info "Step: Expect Customs Form USPS Privacy Act Warning to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  10.times do
    break if @customs_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  usps_privacy_act_warning = @customs_form.usps_privacy_act_warning.visible?
  log.info "Test #{(usps_privacy_act_warning)?"Failed":"Passed"}"
  usps_privacy_act_warning.should be false
end

Then /^Expect Customs Form More Info to be hidden$/ do
  log.info "Step: Expect Customs Form More Info to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be false
end

Then /^Expect Customs Form More Info to be visible$/ do
  log.info "Step: Expect Customs Form More Info to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be true
end

Then /^Expect Customs Form License# to be visible$/ do
  log.info "Step: Expect Customs Form License# to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be true
end

Then /^Expect Customs Form License# to be hidden$/ do
  log.info "Step: Expect Customs Form License# to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be false
end

Then /^Expect Customs Form Certificate# to be hidden$/ do
  log.info "Step: Expect Customs Form Certificate# to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be false
end

Then /^Expect Customs Form Certificate# to be visible$/ do
  log.info "Step: Expect Customs Form Certificate# to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be true
end

Then /^Expect Customs Form Invoice# to be hidden$/ do
  log.info "Step: Expect Customs Form Invoice# to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be false
end

Then /^Expect Customs Form Invoice# to be visible$/ do
  log.info "Step: Expect Customs Form Invoice# to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be true
end

Then /^Expect Customs Form ITN# to be hidden$/ do
  log.info "Step: Expect Customs Form ITN# to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.itn_number.enabled?.should be false
end

Then /^Expect Customs Form ITN# to be visible$/ do
  log.info "Step: Expect Customs Form ITN# to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.itn_number.enabled?.should be true
end

Then /^Expect Customs Form Internal Transaction # to be \"(.+)\"$/ do |expectation|
  log.info "Step: Expect Customs Form Internal Transaction # to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  sleep 1
  text = @customs_form.internal_transaction.text_box.text
  text = @customs_form.internal_transaction.text_box.text
  log.info "Internal Transaction # is #{text}.  Test #{(text.include? "Required")?'Passed':'Failed'}"
  text.should eql expectation
end

Then /^Customs: Expect Item Grid count to be (.+)$/ do |expectation|
  log.info "Step: Customs: Expect Item Grid count to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.item_grid.size.should eql expectation.to_i
end

Then /^Expect Customs Form Total Value to be (.+)$/ do |expectation|
  log.info "Step: Expect Customs Form Total Value to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  sleep 2
  browser_value = @customs_form.total_value
  log.info "Custom Info Actual Total Value: #{browser_value}.  Expected:  #{expectation}.  Test #{(browser_value == expectation)?'Passed':'Failed'}"
  browser_value.should eql expectation
end

Then /^Expect Customs Form Total Pounds to be (.+)$/ do |expectation|
  log.info "Step: Expect Customs Form Total Pounds to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  item = @customs_item_grid.item 1
  20.times do
    sleep 1
    actual_value = @customs_form.total_weight_lbs
    log.info "Custom Info Actual Total Lbs: #{actual_value}.  Expected:  #{expectation}"
    break if actual_value == expectation
  end
  actual_value = @customs_form.total_weight_lbs
  log.info "Test #{(actual_value == expectation)?'Passed':'Failed'}"
  actual_value.should eql expectation
end

Then /^Expect Customs Form Total Ounces to be (.+)$/ do |expectation|
  log.info "Step: Expect Customs Form Total Ounces to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  item = @customs_item_grid.item 1
  20.times do
    sleep 1
    actual_value = @customs_form.total_weight_oz
    log.info "Custom Info Actual Total Weight(Oz): #{actual_value}.  Expected:  #{expectation}"
    break if actual_value == expectation
  end
  actual_value = @customs_form.total_weight_oz
  log.info "Test #{(actual_value == expectation)?'Passed':'Failed'}"
  actual_value.should eql expectation
end

Then /^Expect Customs Form Tooltip Error for Total Weight to be (.+)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Total Weight to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.total_weight.data_error
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Expect Customs Form Tooltip Error for Item Description to be (.*)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Item Description to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).description.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Expect Customs Form Tooltip Error for Qty to be (.*)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Qty to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).qty.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Expect Customs Form Tooltip Error for Unit Price to be (.*)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Unit Price to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).unit_price.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Expect Customs Form Tooltip Error for Pounds to be (.*)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Pounds to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).lbs.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Expect Customs Form Tooltip Error for Ounces to be (.*)$/ do |expectation|
  log.info "Step: Expect Customs Form Tooltip Error for Ounces to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).oz.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end