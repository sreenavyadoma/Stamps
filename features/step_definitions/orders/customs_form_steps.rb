
Then /^Details: Edit Customs Form$/ do
  logger.step "Details: Edit Customs Form"
  web_apps.orders.details.customs.edit_form
end

Then /^Customs: Open Modal$/ do
  step "Details: Edit Customs Form"
end

Then /^Customs: Blur out$/ do
  web_apps.orders.details.customs.edit_form.blur_out
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Package Contents to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_package_contents] = value
  web_apps.orders.details.customs.edit_form.package_contents.select @orders_test_data[:customs_package_contents]
  step "Customs: Save Total"
end

Then /^Customs: Expect Package Contents saved value is the same$/ do
  step "Customs: Expect Package Contents is #{@orders_test_data[:customs_package_contents]}"
end

Then /^Customs: Expect Package Contents is (.+)$/ do |expectation|
  logger.step "Customs: Expect Package Contents is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.package_contents.text_box.text.should eql expectation
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Non-Delivery Options to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_non_delivery_options] = value
  web_apps.orders.details.customs.edit_form.non_delivery_options.select @orders_test_data[:customs_non_delivery_options]
  step "Customs: Save Total"
end

Then /^Customs: Expect Non-Delivery Options saved value is the same$/ do
  step "Customs: Expect Non-Delivery Options is #{@orders_test_data[:customs_non_delivery_options]}"
end

Then /^Customs: Expect Non-Delivery Options is (.+)$/ do |expectation|
  logger.step "Customs: Expect Non-Delivery to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.non_delivery_options.text_box.text.should eql expectation
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Internal Transaction Number to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_internal_transaction_no] = value
  web_apps.orders.details.customs.edit_form.internal_transaction.select @orders_test_data[:customs_internal_transaction_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Internal Transaction Number saved value is the same$/ do
  step "Customs: Expect Internal Transaction Number is #{@orders_test_data[:customs_internal_transaction_no]}"
end

Then /^Customs: Expect Internal Transaction Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Internal Transaction Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs: Set More Info to #{value}"
  @orders_test_data[:customs_more_info] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
  web_apps.orders.details.customs.edit_form.more_info.set @orders_test_data[:customs_more_info]
  step "Customs: Save Total"
end

Then /^Customs: Expect More Info saved value is the same$/ do
  step "Customs: Expect More Info is #{@orders_test_data[:customs_more_info]}"
end

Then /^Customs: Expect More Info is (.+)$/ do |expectation|
  logger.step "Customs: Expect More Info to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.more_info.text.should eql expectation
end

Then /^Customs: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set ITN Number to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_itn_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  web_apps.orders.details.customs.edit_form.itn_number.set @orders_test_data[:customs_certificate_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect ITN Number saved value is the same$/ do
  step "Customs: Expect ITN Number is #{@orders_test_data[:customs_itn_no]}"
end

Then /^Customs: Expect ITN Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect ITN Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.itn_number.text.should eql expectation
end

Then /^Customs: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set License Number to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_license_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  web_apps.orders.details.customs.edit_form.license.set @orders_test_data[:customs_license_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect License Number saved value is the same$/ do
  step "Customs: Expect License Number is #{@orders_test_data[:customs_license_no]}"
end

Then /^Customs: Expect License Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect License Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.license.text.should eql expectation
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Certificate Number to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_certificate_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  web_apps.orders.details.customs.edit_form.certificate.set @orders_test_data[:customs_certificate_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Certificate Number saved value is the same$/ do
  step "Customs: Expect Certificate Number is #{@orders_test_data[:customs_certificate_no]}"
end

Then /^Customs: Expect Certificate Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Certificate Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.certificate.text.should eql expectation
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Invoice Number to #{value}"
  step "Customs: Blur out"
  @orders_test_data[:customs_invoice_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  web_apps.orders.details.customs.edit_form.invoice.set @orders_test_data[:customs_invoice_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Invoice Number saved value is the same$/ do
  step "Customs: Expect Invoice Number is #{@orders_test_data[:customs_invoice_no]}"
end

Then /^Customs: Expect Invoice Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Invoice Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.invoice.text.should eql expectation
end

Then /^Customs: Delete Item (\d+)$/ do |item_number|
  logger.step "Customs: Delete Item #{item_number}"
  step "Customs: Blur out"
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
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.i_agree.check
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is checked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is checked"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.i_agree.checked?.should be true
end

Then /^Customs: Uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.i_agree.uncheck
end

Then /^Customs: Expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  logger.step "Customs: Expect I agree to the USPS Privacy Act Statement is unchecked"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.i_agree.checked?.should be false
end

Then /^Customs: Close Modal$/ do
  logger.step "Closing customs form"
  step "Customs: Blur out"
  step "Customs: Save Total"
  web_apps.orders.details.customs.edit_form.close.should be false
  step "Details: Blur out"
  step "Details: Save Total Ship Cost"
end

Then /^Cancel Customs Form$/ do
  logger.step "Cancel customs form"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.cancel.should be false
  step "Details: Save Total Ship Cost"
end

Then /^Customs Form: Expect USPS Privacy Act Warning is visible$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is visible"
  step "Customs: Blur out"
  15.times do
    break if web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?.should be true
end

Then /^Customs Form: Expect USPS Privacy Act Warning is hidden$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is hidden"
  step "Customs: Blur out"
  10.times do
    break if web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  web_apps.orders.details.customs.edit_form.usps_privacy_act_warning.visible?.should be false
end

Then /^Customs: Expect More Info is hidden$/ do
  logger.step "Customs: Expect More Info is hidden"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.more_info.present?.should be false
end

Then /^Customs: Expect More Info is visible$/ do
  logger.step "Customs: Expect More Info is visible"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.more_info.present?.should be true
end

Then /^Customs: Expect License Number is visible$/ do
  logger.step "Customs: Expect License Number is visible"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.license.present?.should be true
end

Then /^Customs: Expect License Number is hidden$/ do
  logger.step "Customs: Expect License Number is hidden"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.license.present?.should be false
end

Then /^Customs: Expect Certificate Number is hidden$/ do
  logger.step "Customs: Expect Certificate Number is hidden"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.certificate.present?.should be false
end

Then /^Customs: Expect Certificate Number is visible$/ do
  logger.step "Customs: Expect Certificate Number is visible"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.certificate.present?.should be true
end

Then /^Customs: Expect Invoice Number is hidden$/ do
  logger.step "Customs: Expect Invoice Number is hidden"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.invoice.present?.should be false
end

Then /^Customs: Expect Invoice Number is visible$/ do
  logger.step "Customs: Expect Invoice Number is visible"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.invoice.present?.should be true
end

Then /^Customs: Expect ITN Number is hidden$/ do
  logger.step "Customs: Expect ITN Number is hidden"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.itn_number.enabled?.should be false
end

Then /^Customs: Expect ITN Number is visible$/ do
  logger.step "Customs: Expect ITN Number is visible"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.itn_number.enabled?.should be true
end

Then /^Expect Customs Form Internal Transaction # is \"(.+)\"$/ do |expectation|
  logger.step "Expect Customs Form Internal Transaction # is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs: Expect Item Grid count is (.+)$/ do |expectation|
  logger.step "Customs: Expect Item Grid count is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.size.should eql expectation.to_i
end

Then /^Customs: Save Total$/ do
  @orders_test_data[:customs_total_value] = web_apps.orders.details.customs.edit_form.total_value
end

Then /^Customs: Expect Total saved value is the same$/ do
  step "Customs Form: Expect Total Value is #{@orders_test_data[:customs_total_value]}"
end

Then /^Customs Form: Expect Total Value is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Total Value is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.total_value.text.should eql expectation
end

Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "Customs: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  step "Customs: Blur out"
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  @orders_test_data["customs_total_value"]
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  step "Customs: Blur out"
  item.qty.set qty
  step "Customs: Blur out"
  step "Customs: Save Total"
  item.unit_price.set price
  step "Customs: Blur out"
  step "Customs: Save Total"
  item.made_in.select origin_country
  step "Customs: Blur out"
  step "Customs: Save Total"
  item.hs_tariff.set tariff
  step "Customs: Blur out"
  step "Customs: Save Total"
end

Then /^Customs: Add Item (\d+)$/ do |item_number|
  logger.step "Customs: Add Item #{item_number}"
  step "Customs: Blur out"
  @customs_item_grid_line_item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
end

Then /^Customs: Set Item Description to (.*)$/ do |value|
  logger.step "Details: Set Description to #{value}"
  step "Customs: Blur out"
  @customs_item_grid_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  step "Customs: Save Total"
end

Then /^Customs: Set Item Qty to (\d+)$/ do |value|
  logger.step "Details: Set Qty to #{value}"
  step "Customs: Blur out"
  @customs_item_grid_line_item.qty.set value
  step "Customs: Save Total"
end

Then /^Customs: Set Item Unit Price to (.*)$/ do |value|
  logger.step "Details: Set Unit Price to #{value}"
  step "Customs: Blur out"
  @customs_item_grid_line_item.unit_price.set value
  step "Customs: Save Total"
end

Then /^Customs: Set Item Made In Country to (.*)$/ do |value|
  logger.step "Customs: Set Item Made In Country to #{value}"
  step "Customs: Blur out"
  @customs_item_grid_line_item.made_in.select value
  step "Customs: Save Total"
end

Then /^Customs: Set Item Tarriff to (.*)$/ do |value|
  logger.step "Details: Set Tarriff to #{value}"
  step "Customs: Blur out"
  @customs_item_grid_line_item.hs_tariff.set value
  step "Customs: Save Total"
end

Then /^Customs: Expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Description is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).description.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Quantity is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).qty.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Unit Price is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).unit_price.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Origin Country is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).made_in.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Tariff is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i).hs_tariff.text.should eql expectation
end