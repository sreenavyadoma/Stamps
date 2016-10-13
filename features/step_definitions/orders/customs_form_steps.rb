
Then /^Details: Edit Customs Form$/ do
  logger.step "Details: Edit Customs Form"
  web_apps.orders.details.customs.edit_form
end

Then /^Customs: Open Modal$/ do
  step "Details: Edit Customs Form"
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Package Contents to #{value}"
  web_apps.orders.details.customs.edit_form.package_contents.select value
end

Then /^Customs: Expect Package Contents is (.+)$/ do |expectation|
  logger.step "Customs: Expect Package Contents to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.package_contents.text_box.text.should eql expectation
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Non-Delivery Options to #{value}"
  web_apps.orders.details.customs.edit_form.non_delivery_options.select value
end

Then /^Customs: Expect Non-Delivery is (.+)$/ do |expectation|
  logger.step "Customs: Expect Non-Delivery to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.non_delivery_options.text_box.text.should eql expectation
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Internal Transaction Number to #{value}"
  web_apps.orders.details.customs.edit_form.internal_transaction.select (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect Internal Transaction Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Internal Transaction Number to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs: Set More Info to #{value}"
  web_apps.orders.details.customs.edit_form.more_info.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
end

Then /^Customs: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set ITN Number to #{value}"
  web_apps.orders.details.customs.edit_form.itn_number.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect ITN Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect ITN Number to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.itn_number.text.should eql expectation
end

Then /^Customs: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set License Number to #{value}"
  web_apps.orders.details.customs.edit_form.license.set ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
end

Then /^Customs: Expect License Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect License Number to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.license.text.should eql expectation
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Certificate Number to #{value}"
  web_apps.orders.details.customs.edit_form.certificate.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect Certificate Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Certificate Number to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.certificate.text.should eql expectation
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Invoice Number to #{value}"
  web_apps.orders.details.customs.edit_form.invoice.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Expect Invoice Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Invoice Number to  be #{expectation}"
  web_apps.orders.details.customs.edit_form.invoice.text.should eql expectation
end

Then /^Customs: Delete Item (\d+)$/ do |item_number|
  logger.step "Customs: Delete Item #{item_number}"
  count = web_apps.orders.details.customs.edit_form.item_grid.size
  item = web_apps.orders.details.customs.edit_form.item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Customs: Check I agree to the USPS Privacy Act Statement$/ do
  logger.step "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  web_apps.orders.details.customs.edit_form.i_agree.check
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is checked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is checked"
  web_apps.orders.details.customs.edit_form.i_agree.checked?.should be true
end

Then /^Customs: Uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  web_apps.orders.details.customs.edit_form.i_agree.uncheck
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is unchecked"
  web_apps.orders.details.customs.edit_form.i_agree.checked?.should be false
end

Then /^Customs: Close Modal$/ do
  logger.step "Closing customs form"
  web_apps.orders.details.customs.edit_form.close.should be false
  step "Details: Save Total Ship Cost"
end

Then /^Cancel Customs Form$/ do
  logger.step "Cancel customs form"
  web_apps.orders.details.customs.edit_form.cancel.should be false
  step "Details: Save Total Ship Cost"
end

Then /^Customs Form: Expect USPS Privacy Act Warning is visible$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is visible"
  10.times do
    break if web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?.should be true
end

Then /^Customs Form: Expect USPS Privacy Act Warning is hidden$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is hidden"
  10.times do
    break if web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?
    sleep 1
  end
  web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?.should be false
end

Then /^Customs: Expect More Info is hidden$/ do
  logger.step "Customs: Expect More Info is hidden"
  web_apps.orders.details.customs.edit_form.more_info.present?.should be false
end

Then /^Customs: Expect More Info is visible$/ do
  logger.step "Customs: Expect More Info is visible"
  web_apps.orders.details.customs.edit_form.more_info.present?.should be true
end

Then /^Customs: Expect License Number is visible$/ do
  logger.step "Customs: Expect License Number is visible"
  web_apps.orders.details.customs.edit_form.license.present?.should be true
end

Then /^Customs: Expect License Number is hidden$/ do
  logger.step "Customs: Expect License Number is hidden"
  web_apps.orders.details.customs.edit_form.license.present?.should be false
end

Then /^Customs: Expect Certificate Number is hidden$/ do
  logger.step "Customs: Expect Certificate Number is hidden"
  web_apps.orders.details.customs.edit_form.certificate.present?.should be false
end

Then /^Customs: Expect Certificate Number is visible$/ do
  logger.step "Customs: Expect Certificate Number is visible"
  web_apps.orders.details.customs.edit_form.certificate.present?.should be true
end

Then /^Customs: Expect Invoice Number is hidden$/ do
  logger.step "Customs: Expect Invoice Number is hidden"
  web_apps.orders.details.customs.edit_form.invoice.present?.should be false
end

Then /^Customs: Expect Invoice Number is visible$/ do
  logger.step "Customs: Expect Invoice Number is visible"
  web_apps.orders.details.customs.edit_form.invoice.present?.should be true
end

Then /^Customs: Expect ITN Number is hidden$/ do
  logger.step "Customs: Expect ITN Number is hidden"
  web_apps.orders.details.customs.edit_form.itn_number.enabled?.should be false
end

Then /^Customs: Expect ITN Number is visible$/ do
  logger.step "Customs: Expect ITN Number is visible"
  web_apps.orders.details.customs.edit_form.itn_number.enabled?.should be true
end

Then /^Expect Customs Form Internal Transaction # is \"(.+)\"$/ do |expectation|
  logger.step "Expect Customs Form Internal Transaction # is #{expectation}"
  web_apps.orders.details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs: Expect Item Grid count is (.+)$/ do |expectation|
  logger.step "Customs: Expect Item Grid count is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.size.should eql expectation.to_i
end

Then /^Customs Form: Expect Total Value is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Total Value is #{expectation}"
  web_apps.orders.details.customs.edit_form.total_value.text.should eql expectation
end

Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "Customs: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)

  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.made_in.select origin_country
  item.hs_tariff.set tariff
end

Then /^Customs: Add Item (\d+)$/ do |item_number|
  logger.step "Customs: Add Item #{item_number}"
  @customs_item_grid_line_item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
end

Then /^Customs: Set Item Description to (.*)$/ do |value|
  logger.step "Details: Set Description to #{value}"
  @customs_item_grid_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Customs: Set Item Qty to (\d+)$/ do |value|
  logger.step "Details: Set Qty to #{value}"
  @customs_item_grid_line_item.qty.set value
end

Then /^Customs: Set Item Unit Price to (.*)$/ do |value|
  logger.step "Details: Set Unit Price to #{value}"
  @customs_item_grid_line_item.unit_price.set value
end

Then /^Customs: Set Item Made In Country to (.*)$/ do |value|
  logger.step "Customs: Set Item Made In Country to #{value}"
  @customs_item_grid_line_item.made_in.select value
end

Then /^Customs: Set Item Tarriff to (.*)$/ do |value|
  logger.step "Details: Set Tarriff to #{value}"
  @customs_item_grid_line_item.hs_tariff.set value
end

Then /^Customs: Expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Description is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).description.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Quantity is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).qty.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Unit Price is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).unit_price.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Origin Country is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).made_in.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Tariff is #{expectation}"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).hs_tariff.text.should eql expectation
end