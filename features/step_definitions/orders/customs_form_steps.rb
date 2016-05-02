

Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Lbs (\d+), Oz (\d+) Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, lbs, oz, origin_country, tariff|
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

Then /^Customs: Expect Item (\d+) Description to be (.*)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Description to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.description.text
  log.info "Item #{item_number} Description Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end


Then /^Customs: Expect Item (\d+) Quantity to be (\d+)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Quantity to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.qty.text_box.text
  log.info "Item #{item_number} Quantity Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Unit Price to be (.*)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Unit Price to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.unit_price.text_box.text
  log.info "Item #{item_number} Unit Price Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Pounds to be (\d+)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Pounds to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.lbs.text_box.text
  log.info "Item #{item_number} Pounds Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Ounces to be (\d+)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Ounces to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.oz.text_box.text
  log.info "Item #{item_number} Ounces Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Origin Country to be (.*)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Origin Country to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.origin.text_box.text
  log.info "Item #{item_number} Origin Country Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Expect Item (\d+) Tariff to be (.*)$/ do |item_number, expectation|
  log.info "Customs: Expect Item #{item_number} Tarriff to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_item_grid = @customs_form.item_grid if @customs_item_grid.nil?
  item = @customs_item_grid.item item_number.to_i

  actual_value = item.hs_tariff.text
  log.info "Item #{item_number} HS Tarriff Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Edit Customs Form$/ do
  log.info "Step: Details: Edit Customs Form"
  @customs_form = @order_details.customs.edit_form
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Package Contents to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.package_contents.select value
end

Then /^Customs: Expect Package Contents to be (.+)$/ do |expectation|
  log.info "Customs: Expect Package Contents to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.package_contents.text_box.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Non-Delivery Options to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.non_delivery_options.select value
end

Then /^Customs: Expect Non-Delivery to be (.+)$/ do |expectation|
  log.info "Customs: Expect Non-Delivery to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.non_delivery_options.text_box.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Internal Transaction Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.internal_transaction.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  sleep 1
end

Then /^Customs: Expect Internal Transaction Number to be (.+)$/ do |expectation|
  log.info "Customs: Expect Internal Transaction Number to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.internal_transaction.text_box.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set More Info to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Set ITN Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set ITN Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Expect ITN Number to be (.+)$/ do |expectation|
  log.info "Customs: Expect ITN Number to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.itn_number.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set License Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set License Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Expect License Number to be (.+)$/ do |expectation|
  log.info "Customs: Expect License Number to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.license.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Certificate Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Expect Certificate Number to be (.+)$/ do |expectation|
  log.info "Customs: Expect Certificate Number to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.certificate.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  log.info "Step: Customs: Set Invoice Number to #{value}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Then /^Customs: Expect Invoice Number to be (.+)$/ do |expectation|
  log.info "Customs: Expect Invoice Number to  be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?

  actual_value = @customs_form.invoice.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
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

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is checked$/ do
  log.info "Customs: Expect I agree to the USPS Privacy Act Statement is checked"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?
  expectation = "checked"
  i_agree = @order_details.customs_form.i_agree.checked?
  if i_agree
    actual_value = "checked"
  else
    actual_value = "unchecked"
  end
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Customs: Uncheck I agree to the USPS Privacy Act Statement$/ do
  log.info "Step: Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @order_details.customs_form.i_agree.uncheck
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  log.info "Customs: Expect I agree to the USPS Privacy Act Statement is unchecked"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  step "Details: Edit Customs Form" unless @customs_form.present?
  expectation = "unchecked"
  i_agree = @order_details.customs_form.i_agree.checked?
  if i_agree
    actual_value = "checked"
  else
    actual_value = "unchecked"
  end
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
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

Then /^Customs: Close Form$/ do
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

Then /^Customs: Expect More Info to be hidden$/ do
  log.info "Step: Customs: Expect More Info to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be false
end

Then /^Customs: Expect More Info to be visible$/ do
  log.info "Step: Customs: Expect More Info to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.more_info.present?.should be true
end

Then /^Customs: Expect License Number to be visible$/ do
  log.info "Step: Customs: Expect License Number to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be true
end

Then /^Customs: Expect License Number to be hidden$/ do
  log.info "Step: Customs: Expect License Number to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.license.present?.should be false
end

Then /^Customs: Expect Certificate Number to be hidden$/ do
  log.info "Step: Customs: Expect Certificate Number to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be false
end

Then /^Customs: Expect Certificate Number to be visible$/ do
  log.info "Step: Customs: Expect Certificate Number to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.certificate.present?.should be true
end

Then /^Customs: Expect Invoice Number to be hidden$/ do
  log.info "Step: Customs: Expect Invoice Number to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be false
end

Then /^Customs: Expect Invoice Number to be visible$/ do
  log.info "Step: Customs: Expect Invoice Number to be visible"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.invoice.present?.should be true
end

Then /^Customs: Expect ITN Number to be hidden$/ do
  log.info "Step: Customs: Expect ITN Number to be hidden"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  @customs_form.itn_number.enabled?.should be false
end

Then /^Customs: Expect ITN Number to be visible$/ do
  log.info "Step: Customs: Expect ITN Number to be visible"
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