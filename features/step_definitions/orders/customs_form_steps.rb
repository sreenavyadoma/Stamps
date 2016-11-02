
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

Then /^Customs: Set Package Contents to Merchandise$/ do
  step "Customs: Set Package Contents to \"Merchandise\""
end

Then /^Customs: Set Package Contents to Humanitarian Donation$/ do
  step "Customs: Set Package Contents to \"Humanitarian Donation\""
end

Then /^Customs: Set Package Contents to Returned Goods$/ do
  step "Customs: Set Package Contents to \"Returned Goods\""
end

Then /^Customs: Set Package Contents to Gift$/ do
  step "Customs: Set Package Contents to \"Gift\""
end

Then /^Customs: Set Package Contents to Document$/ do
  step "Customs: Set Package Contents to \"Document\""
end

Then /^Customs: Set Package Contents to Commercial Sample$/ do
  step "Customs: Set Package Contents to \"Commercial Sample\""
end

Then /^Customs: Set Package Contents to Other$/ do
  step "Customs: Set Package Contents to \"Other\""
end

Then /^Customs: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Package Contents to #{value}"
  step "Customs: Blur out"
  test_data[:customs_package_contents] = value
  web_apps.orders.details.customs.edit_form.package_contents.select test_data[:customs_package_contents]
  step "Customs: Save Total"
end

Then /^Customs: Expect Package Contents saved value is the same$/ do
  step "Customs: Expect Package Contents is #{test_data[:customs_package_contents]}"
end

Then /^Customs: Expect Package Contents is Merchandise$/ do
  step "Customs: Expect Package Contents is \"Merchandise\""
end

Then /^Customs: Expect Package Contents is Humanitarian Donation$/ do
  step "Customs: Expect Package Contents is \"Humanitarian Donation\""
end

Then /^Customs: Expect Package Contents is Returned Goods$/ do
  step "Customs: Expect Package Contents is \"Returned Goods\""
end

Then /^Customs: Expect Package Contents is$/ do
  step "Customs: Expect Package Contents is \"Gift\""
end

Then /^Customs: Expect Package Contents is Document$/ do
  step "Customs: Expect Package Contents is \"Document\""
end

Then /^Customs: Expect Package Contents is Commercial Sample$/ do
  step "Customs: Expect Package Contents is \"Commercial Sample\""
end

Then /^Customs: Expect Package Contents is Other$/ do
  step "Customs: Expect Package Contents is \"Other\""
end

Then /^Customs: Expect Package Contents is \"(.+)\"$/ do |expectation|
  logger.step "Customs: Expect Package Contents is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.package_contents.text_box.text.should eql expectation
end

Then /^Customs: Set Non-Delivery Options to Treat as abandoned$/ do
  step "Customs: Set Non-Delivery Options to \"Treat as abandoned\""
end

Then /^Customs: Set Non-Delivery Options to Return to sender$/ do
  step "Customs: Set Non-Delivery Options to \"Return to sender\""
end

Then /^Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Non-Delivery Options to #{value}"
  step "Customs: Blur out"
  test_data[:customs_non_delivery_options] = value
  web_apps.orders.details.customs.edit_form.non_delivery_options.select test_data[:customs_non_delivery_options]
  step "Customs: Save Total"
end

Then /^Customs: Expect Non-Delivery Options saved value is the same$/ do
  step "Customs: Expect Non-Delivery Options is #{test_data[:customs_non_delivery_options]}"
end

Then /^Customs: Expect Non-Delivery Options is Treat as abandoned$/ do
  step "Customs: Expect Non-Delivery Options is \"Treat as abandoned\""
end

Then /^Customs: Expect Non-Delivery Options is Return to sender$/ do
  step "Customs: Expect Non-Delivery Options is \"Return to sender\""
end

Then /^Customs: Expect Non-Delivery Options is \"(.+)\"$/ do |expectation|
  logger.step "Customs: Expect Non-Delivery to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.non_delivery_options.text_box.text.should eql expectation
end

Then /^Customs: Set Internal Transaction Number to Not required$/ do
  step "Customs: Set Internal Transaction Number to \"Not required\""
end

Then /^Customs: Set Internal Transaction Number to Required$/ do
  step "Customs: Set Internal Transaction Number to \"Required\""
end

Then /^Customs: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Internal Transaction Number to #{value}"
  step "Customs: Blur out"
  test_data[:customs_internal_transaction_no] = value
  web_apps.orders.details.customs.edit_form.internal_transaction.select test_data[:customs_internal_transaction_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Internal Transaction Number saved value is the same$/ do
  step "Customs: Expect Internal Transaction Number is #{test_data[:customs_internal_transaction_no]}"
end

Then /^Customs: Expect Internal Transaction Number is Not required$/ do
  step "Customs: Expect Internal Transaction Number is \"Not required\""
end

Then /^Customs: Expect Internal Transaction Number is Required$/ do
  step "Customs: Expect Internal Transaction Number is \"Required\""
end

Then /^Customs: Expect Internal Transaction Number is \"(.+)\"$/ do |expectation|
  logger.step "Customs: Expect Internal Transaction Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs: Set More Info to #{value}"
  test_data[:customs_more_info] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
  web_apps.orders.details.customs.edit_form.more_info.set test_data[:customs_more_info]
  step "Customs: Save Total"
end

Then /^Customs: Expect More Info saved value is the same$/ do
  step "Customs: Expect More Info is #{test_data[:customs_more_info]}"
end

Then /^Customs: Expect More Info is (.+)$/ do |expectation|
  logger.step "Customs: Expect More Info to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.more_info.text.should eql expectation
end

Then /^Customs: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set ITN Number to #{value}"
  step "Customs: Blur out"
  test_data[:customs_itn_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  web_apps.orders.details.customs.edit_form.itn_number.set test_data[:customs_itn_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect ITN Number saved value is the same$/ do
  step "Customs: Expect ITN Number is #{test_data[:customs_itn_no]}"
end

Then /^Customs: Expect ITN Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect ITN Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.itn_number.text.should eql expectation
end

Then /^Customs: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set License Number to #{value}"
  step "Customs: Blur out"
  test_data[:customs_license_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  web_apps.orders.details.customs.edit_form.license.set test_data[:customs_license_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect License Number saved value is the same$/ do
  step "Customs: Expect License Number is #{test_data[:customs_license_no]}"
end

Then /^Customs: Expect License Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect License Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.license.text.should eql expectation
end

Then /^Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Certificate Number to #{value}"
  step "Customs: Blur out"
  test_data[:customs_certificate_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  web_apps.orders.details.customs.edit_form.certificate.set test_data[:customs_certificate_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Certificate Number saved value is the same$/ do
  step "Customs: Expect Certificate Number is #{test_data[:customs_certificate_no]}"
end

Then /^Customs: Expect Certificate Number is (.+)$/ do |expectation|
  logger.step "Customs: Expect Certificate Number to  be #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.certificate.text.should eql expectation
end

Then /^Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Invoice Number to #{value}"
  step "Customs: Blur out"
  test_data[:customs_invoice_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  web_apps.orders.details.customs.edit_form.invoice.set test_data[:customs_invoice_no]
  step "Customs: Save Total"
end

Then /^Customs: Expect Invoice Number saved value is the same$/ do
  step "Customs: Expect Invoice Number is #{test_data[:customs_invoice_no]}"
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

Then /^Expect Customs Form Internal Transaction Number is Required$/ do
  step "Expect Customs Form Internal Transaction is \"Required\""
end

Then /^Expect Customs Form Internal Transaction Number is Not required$/ do
  step "Expect Customs Form Internal Transaction is \"Not required\""
end

Then /^Expect Customs Form Internal Transaction Number is \"(.+)\"$/ do |expectation|
  logger.step "Expect Customs Form Internal Transaction Number is #{expectation}"
  step "Customs: Blur out"
  text_box = web_apps.orders.details.customs.edit_form.internal_transaction.text_box
  10.times do
    break if text_box.text == expectation
  end
  text_box.text.should eql expectation
end

Then /^Customs: Expect Item Grid count is (.+)$/ do |expectation|
  logger.step "Customs: Expect Item Grid count is #{expectation}"
  step "Customs: Blur out"
  web_apps.orders.details.customs.edit_form.item_grid.size.should eql expectation.to_i
end

Then /^Customs: Save Total$/ do
  test_data[:customs_total_value] = web_apps.orders.details.customs.edit_form.total_value
end

Then /^Customs: Expect Total saved value is the same$/ do
  step "Customs Form: Expect Total Value is #{test_data[:customs_total_value]}"
end

Then /^Customs Form: Expect Total Value is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Total Value is #{expectation}"
  step "Customs: Blur out"
  expectation = expectation.to_f
  total_value = web_apps.orders.details.customs.edit_form.total_value
  10.times do
    break if total_value.to_f == expectation
  end
  total_value.to_f.should eql expectation
end

Then /^Customs: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "Customs: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  step "Customs: Blur out"
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  test_data["customs_total_value"]
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
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.description.text == expectation
  end
  item.description.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Quantity is #{expectation}"
  step "Customs: Blur out"
  expectation = expectation.to_i
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.qty.text_box.text.to_i == expectation
  end
  item.qty.text_box.text.to_i.should eql expectation
end

Then /^Customs: Expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Unit Price is #{expectation}"
  step "Customs: Blur out"
  expectation = expectation.to_f
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.unit_price.text_box.text.to_f == expectation
  end
  item.unit_price.text_box.text.to_f.should eql expectation
end

Then /^Customs: Expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Origin Country is #{expectation}"
  step "Customs: Blur out"
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.made_in.text_box.text == expectation
  end
  item.made_in.text_box.text.should eql expectation
end

Then /^Customs: Expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "Customs: Expect Item #{item_number} Tariff is #{expectation}"
  step "Customs: Blur out"
  expectation = expectation.to_f
  item = web_apps.orders.details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.hs_tariff.text.to_f == expectation
  end
  item.hs_tariff.text.to_f.should eql expectation
end