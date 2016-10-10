
Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "Customs: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  @customs_item_grid = @customs_form.item_grid
  item = @customs_item_grid.item item_number.to_i

  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.origin.select origin_country
  item.hs_tariff.set tariff
end

Then /^Customs: Add Item (\d+)$/ do |item_number|
  logger.step "Customs: Add Item #{item_number}"
  @customs_item_grid = @customs_form.item_grid
  @customs_form_line_item = @customs_item_grid.item item_number.to_i
end

Then /^Customs: Set Item Description to (.*)$/ do |value|
  logger.step "Details: Set Description to #{value}"
  @customs_form_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Set Item Qty to (\d+)$/ do |value|
  logger.step "Details: Set Qty to #{value}"
  @customs_form_line_item.qty.set value
end

Then /^Customs: Set Item Unit Price to (.*)$/ do |value|
  logger.step "Details: Set Unit Price to #{value}"
  @customs_form_line_item.unit_price.set value
end

Then /^Customs: Set Item Pounds to (.*)$/ do |value|
  logger.step "Details: Set Pounds to #{value}"
  @customs_form_line_item.lbs.set value
end

Then /^Customs: Set Item Ounces to (.*)$/ do |value|
  logger.step "Details: Set Ounces to #{value}"
  @customs_form_line_item.oz.set value
end

Then /^Customs: Set Item Origin Country to (.*)$/ do |value|
  logger.step "Details: Set Origin Country to #{value}"
  @customs_form_line_item.origin.select value
end

Then /^Customs: Set Item Tarriff to (.*)$/ do |value|
  logger.step "Details: Set Tarriff to #{value}"
  @customs_form_line_item.hs_tariff.set value
end

Then /^Customs: Expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Description is #{expectation}"
  @customs_item_grid.should be_truthy
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.description.text
  logger.step "Item #{item_number} Description Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Quantity is #{expectation}"
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.qty.text_box.text
  logger.step "Item #{item_number} Quantity Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Unit Price is #{expectation}"
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.unit_price.text_box.text
  logger.step "Item #{item_number} Unit Price Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Origin Country is #{expectation}"
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.origin.text_box.text
  logger.step "Item #{item_number} Origin Country Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Tarriff is #{expectation}"
  item = @customs_item_grid.item item_number.to_i
  actual_value = item.hs_tariff.text
  logger.step "Item #{item_number} HS Tarriff Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Edit Customs Form$/ do
  logger.step "Details: Edit Customs Form"
  @customs_form = @order_details.customs.edit_form
  expectation = "Customs Information Form is present"
  expectation = "Customs Information Form is NOT present" unless @customs_form.present?
  expectation.should eql "Customs Information Form is present"
end


Then /^Customs: Open Modal$/ do
  step "Details: Edit Customs Form"
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Package Contents to #{value}"
  @customs_form.should be_truthy
  @customs_form.package_contents.select value
end

Then /^Customs: Expect Package Contents is (.+)$/ do |expectation|
  logger.step "Customs: Expect Package Contents to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.package_contents.text_box.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Non-Delivery Options to #{value}"
  @customs_form.should be_truthy
  @customs_form.non_delivery_options.select value
end

Then /^Customs: Expect Non-Delivery is (.+)$/ do |expectation|
  logger.step "Customs: Expect Non-Delivery to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.non_delivery_options.text_box.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Internal Transaction Number to #{value}"
  @customs_form.should be_truthy
  @customs_form.internal_transaction.select (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  sleep 1
end

Then /^Customs: Expect Internal Transaction Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Internal Transaction Number to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.internal_transaction.text_box.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs: Set More Info to #{value}"
  @customs_form.should be_truthy
  @customs_form.more_info.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
end

Then /^Customs: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set ITN Number to #{value}"
  @customs_form.itn_number.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect ITN Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect ITN Number to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.itn_number.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set License Number to #{value}"
  @customs_form.should be_truthy
  @customs_form.license.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect License Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect License Number to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.license.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Certificate Number to #{value}"
  @customs_form.should be_truthy
  @customs_form.certificate.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect Certificate Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Certificate Number to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.certificate.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Invoice Number to #{value}"
  @customs_form.should be_truthy
  @customs_form.invoice.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect Invoice Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Invoice Number to  be #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.invoice.text
  logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Delete Item (\d+)$/ do |item_number|
  logger.step "Customs: Delete Item #{item_number}"
  @customs_form.should be_truthy
  count = @customs_item_grid.size
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Customs: Check I agree to the USPS Privacy Act Statement$/ do
  logger.step "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @customs_form.should be_truthy
  @customs_form.i_agree.check
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is checked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is checked"
  @customs_form.should be_truthy
  @customs_form.i_agree.checked?.should be true
end

Then /^Customs: Uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @customs_form.should be_truthy
  @customs_form.i_agree.uncheck
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is unchecked"
  @customs_form.should be_truthy
  @customs_form.i_agree.checked?.should be false
end

Then /^Customs: Close Modal$/ do
  logger.step "Closing customs form"
  @customs_form.should be_truthy
  @customs_form.close
  logger.step "Customs form #{(@customs_form.present?)?'closed':'is still open.'}"
end

Then /^Cancel Customs Form$/ do
  logger.step "Cancel customs form"
  @customs_form.should be_truthy
  @customs_form.cancel
end

Then /^Customs Form: Expect USPS Privacy Act Warning is visible$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is visible"
  @customs_form.should be_truthy
  10.times do
    break if @customs_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  usps_privacy_act_warning = @customs_form.usps_privacy_act_warning.visible?
  logger.step "Test #{(usps_privacy_act_warning)?"Passed":"Failed"}"
  usps_privacy_act_warning.should be true
end

Then /^Customs Form: Expect USPS Privacy Act Warning is hidden$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is hidden"
  @customs_form.should be_truthy
  10.times do
    break if @customs_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  usps_privacy_act_warning = @customs_form.usps_privacy_act_warning.visible?
  logger.step "Test #{(usps_privacy_act_warning)?"Failed":"Passed"}"
  usps_privacy_act_warning.should be false
end

Then /^Customs: Expect More Info is hidden$/ do
  logger.step "Customs: Expect More Info is hidden"
  @customs_form.should be_truthy
  @customs_form.more_info.present?.should be false
end

Then /^Customs: Expect More Info is visible$/ do
  logger.step "Customs: Expect More Info is visible"
  @customs_form.should be_truthy
  @customs_form.more_info.present?.should be true
end

Then /^Customs: Expect License Number is visible$/ do
  logger.step "Customs: Expect License Number is visible"
  @customs_form.should be_truthy
  @customs_form.license.present?.should be true
end

Then /^Customs: Expect License Number is hidden$/ do
  logger.step "Customs: Expect License Number is hidden"
  @customs_form.should be_truthy
  @customs_form.license.present?.should be false
end

Then /^Customs: Expect Certificate Number is hidden$/ do
  logger.step "Customs: Expect Certificate Number is hidden"
  @customs_form.should be_truthy
  @customs_form.certificate.present?.should be false
end

Then /^Customs: Expect Certificate Number is visible$/ do
  logger.step "Customs: Expect Certificate Number is visible"
  @customs_form.should be_truthy
  @customs_form.certificate.present?.should be true
end

Then /^Customs: Expect Invoice Number is hidden$/ do
  logger.step "Customs: Expect Invoice Number is hidden"
  @customs_form.should be_truthy
  @customs_form.invoice.present?.should be false
end

Then /^Customs: Expect Invoice Number is visible$/ do
  logger.step "Customs: Expect Invoice Number is visible"
  @customs_form.should be_truthy
  @customs_form.invoice.present?.should be true
end

Then /^Customs: Expect ITN Number is hidden$/ do
  logger.step "Customs: Expect ITN Number is hidden"
  @customs_form.should be_truthy
  @customs_form.itn_number.enabled?.should be false
end

Then /^Customs: Expect ITN Number is visible$/ do
  logger.step "Customs: Expect ITN Number is visible"
  @customs_form.should be_truthy
  @customs_form.itn_number.enabled?.should be true
end

Then /^Expect Customs Form Internal Transaction # is \"(.+)\"$/ do |expectation|
  logger.step "Expect Customs Form Internal Transaction # is #{expectation}"
  @customs_form.should be_truthy
  text = @customs_form.internal_transaction.text_box.text
  logger.step "Internal Transaction # is #{text}.  Test #{(text.include? "Required")?'Passed':'Failed'}"
  text.should eql expectation
end

Then /^Customs: Expect Item Grid count is (.+)$/ do |expectation|
  logger.step "Customs: Expect Item Grid count is #{expectation}"
  @customs_form.should be_truthy
  @customs_form.item_grid.size.should eql expectation.to_i
end

Then /^Customs Form: Expect Total Value is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Total Value is #{expectation}"
  @customs_form.should be_truthy
  actual_value = @customs_form.total_value.text
  logger.step "Custom Info Actual Total Value: #{actual_value}.  Expected:  #{expectation}.  Test #{(actual_value == expectation)?'Passed':'Failed'}"
  actual_value.should eql expectation
end
