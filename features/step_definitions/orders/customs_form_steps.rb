
Then /^Order Details: Edit Customs Form$/ do
  logger.step "Order Details: Edit Customs Form"
  stamps.orders.order_details.customs.edit_form
end

Then /^Customs Form: Open Modal$/ do
  step "Order Details: Edit Customs Form"
end

Then /^Customs Form: Blur out$/ do
  stamps.orders.order_details.customs.edit_form.blur_out
end

Then /^Customs Form: Set Package Contents to Merchandise$/ do
  step "Customs Form: Set Package Contents to \"Merchandise\""
end

Then /^Customs Form: Set Package Contents to Humanitarian Donation$/ do
  step "Customs Form: Set Package Contents to \"Humanitarian Donation\""
end

Then /^Customs Form: Set Package Contents to Returned Goods$/ do
  step "Customs Form: Set Package Contents to \"Returned Goods\""
end

Then /^Customs Form: Set Package Contents to Gift$/ do
  step "Customs Form: Set Package Contents to \"Gift\""
end

Then /^Customs Form: Set Package Contents to Document$/ do
  step "Customs Form: Set Package Contents to \"Document\""
end

Then /^Customs Form: Set Package Contents to Commercial Sample$/ do
  step "Customs Form: Set Package Contents to \"Commercial Sample\""
end

Then /^Customs Form: Set Package Contents to Other$/ do
  step "Customs Form: Set Package Contents to \"Other\""
end

Then /^Customs Form: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set Package Contents to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_package_contents] = value
  stamps.orders.order_details.customs.edit_form.package_contents.select test_data[:customs_package_contents]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Package Contents saved value is the same$/ do
  step "Customs Form: Expect Package Contents is #{test_data[:customs_package_contents]}"
end

Then /^Customs Form: Expect Package Contents is Merchandise$/ do
  step "Customs Form: Expect Package Contents is \"Merchandise\""
end

Then /^Customs Form: Expect Package Contents is Humanitarian Donation$/ do
  step "Customs Form: Expect Package Contents is \"Humanitarian Donation\""
end

Then /^Customs Form: Expect Package Contents is Returned Goods$/ do
  step "Customs Form: Expect Package Contents is \"Returned Goods\""
end

Then /^Customs Form: Expect Package Contents is$/ do
  step "Customs Form: Expect Package Contents is \"Gift\""
end

Then /^Customs Form: Expect Package Contents is Document$/ do
  step "Customs Form: Expect Package Contents is \"Document\""
end

Then /^Customs Form: Expect Package Contents is Commercial Sample$/ do
  step "Customs Form: Expect Package Contents is \"Commercial Sample\""
end

Then /^Customs Form: Expect Package Contents is Other$/ do
  step "Customs Form: Expect Package Contents is \"Other\""
end

Then /^Customs Form: Expect Package Contents is \"(.+)\"$/ do |expectation|
  logger.step "Customs Form: Expect Package Contents is #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.package_contents.text_box.text.should eql expectation
end

Then /^Customs Form: Set Non-Delivery Options to Treat as abandoned$/ do
  step "Customs Form: Set Non-Delivery Options to \"Treat as abandoned\""
end

Then /^Customs Form: Set Non-Delivery Options to Return to sender$/ do
  step "Customs Form: Set Non-Delivery Options to \"Return to sender\""
end

Then /^Customs Form: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set Non-Delivery Options to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_non_delivery_options] = value
  stamps.orders.order_details.customs.edit_form.non_delivery_options.select test_data[:customs_non_delivery_options]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Non-Delivery Options saved value is the same$/ do
  step "Customs Form: Expect Non-Delivery Options is #{test_data[:customs_non_delivery_options]}"
end

Then /^Customs Form: Expect Non-Delivery Options is Treat as abandoned$/ do
  step "Customs Form: Expect Non-Delivery Options is \"Treat as abandoned\""
end

Then /^Customs Form: Expect Non-Delivery Options is Return to sender$/ do
  step "Customs Form: Expect Non-Delivery Options is \"Return to sender\""
end

Then /^Customs Form: Expect Non-Delivery Options is \"(.+)\"$/ do |expectation|
  logger.step "Customs Form: Expect Non-Delivery to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.non_delivery_options.text_box.text.should eql expectation
end

Then /^Customs Form: Set Internal Transaction Number to Not required$/ do
  step "Customs Form: Set Internal Transaction Number to \"Not required\""
end

Then /^Customs Form: Set Internal Transaction Number to Required$/ do
  step "Customs Form: Set Internal Transaction Number to \"Required\""
end

Then /^Customs Form: Set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set Internal Transaction Number to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_internal_transaction_no] = value
  stamps.orders.order_details.customs.edit_form.internal_transaction.select test_data[:customs_internal_transaction_no]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Internal Transaction Number saved value is the same$/ do
  step "Customs Form: Expect Internal Transaction Number is #{test_data[:customs_internal_transaction_no]}"
end

Then /^Customs Form: Expect Internal Transaction Number is Not required$/ do
  step "Customs Form: Expect Internal Transaction Number is \"Not required\""
end

Then /^Customs Form: Expect Internal Transaction Number is Required$/ do
  step "Customs Form: Expect Internal Transaction Number is \"Required\""
end

Then /^Customs Form: Expect Internal Transaction Number is \"(.+)\"$/ do |expectation|
  logger.step "Customs Form: Expect Internal Transaction Number to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^Customs Form: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set More Info to #{value}"
  test_data[:customs_more_info] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
  stamps.orders.order_details.customs.edit_form.more_info.set test_data[:customs_more_info]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect More Info saved value is the same$/ do
  step "Customs Form: Expect More Info is #{test_data[:customs_more_info]}"
end

Then /^Customs Form: Expect More Info is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect More Info to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.text.should eql expectation
end

Then /^Customs Form: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set ITN Number to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_itn_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.itn_number.set test_data[:customs_itn_no]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect ITN Number saved value is the same$/ do
  step "Customs Form: Expect ITN Number is #{test_data[:customs_itn_no]}"
end

Then /^Customs Form: Expect ITN Number is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect ITN Number to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.itn_number.text.should eql expectation
end

Then /^Customs Form: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set License Number to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_license_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.license.set test_data[:customs_license_no]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect License Number saved value is the same$/ do
  step "Customs Form: Expect License Number is #{test_data[:customs_license_no]}"
end

Then /^Customs Form: Expect License Number is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect License Number to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.license.text.should eql expectation
end

Then /^Customs Form: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set Certificate Number to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_certificate_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.certificate.set test_data[:customs_certificate_no]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Certificate Number saved value is the same$/ do
  step "Customs Form: Expect Certificate Number is #{test_data[:customs_certificate_no]}"
end

Then /^Customs Form: Expect Certificate Number is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Certificate Number to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.text.should eql expectation
end

Then /^Customs Form: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs Form: Set Invoice Number to #{value}"
  step "Customs Form: Blur out"
  test_data[:customs_invoice_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.invoice.set test_data[:customs_invoice_no]
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Invoice Number saved value is the same$/ do
  step "Customs Form: Expect Invoice Number is #{test_data[:customs_invoice_no]}"
end

Then /^Customs Form: Expect Invoice Number is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Invoice Number to  be #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.text.should eql expectation
end

Then /^Customs Form: Delete Item (\d+)$/ do |item_number|
  logger.step "Customs Form: Delete Item #{item_number}"
  step "Customs Form: Blur out"
  count = stamps.orders.order_details.customs.edit_form.item_grid.size
  item = stamps.orders.order_details.customs.edit_form.item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Customs Form: Check I agree to the USPS Privacy Act Statement$/ do
  logger.step "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.check
end

Then /^Customs Form: Expect I agree to the USPS Privacy Act Statement is checked$/ do
  logger.step "Customs Form: Expect I agree to the USPS Privacy Act Statement is checked"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.checked?.should be true
end

Then /^Customs Form: Uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.uncheck
end

Then /^Customs Form: Expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  logger.step "Customs Form: Expect I agree to the USPS Privacy Act Statement is unchecked"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.checked?.should be false
end

Then /^Customs Form: Close Customs Form$/ do
  logger.step "Closing customs form"
  step "Pause for 4 seconds"
  step "Customs Form: Blur out"
  step "Customs Form: Save Total"
  stamps.orders.order_details.customs.edit_form.close.should be false
  step "Order Details: Blur out"
  step "Save Test Data"
end

Then /^Cancel Customs Form$/ do
  logger.step "Cancel customs form"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.cancel.should be false
  step "Save Test Data"
end

Then /^Customs Form: Expect USPS Privacy Act Warning is visible$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is visible"
  step "Customs Form: Blur out"
  15.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?.should be true
end

Then /^Customs Form: Expect USPS Privacy Act Warning is hidden$/ do
  logger.step "Customs Form: Expect USPS Privacy Act Warning is hidden"
  step "Customs Form: Blur out"
  10.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?.should be false
end

Then /^Customs Form: Expect More Info is hidden$/ do
  logger.step "Customs Form: Expect More Info is hidden"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.present?.should be false
end

Then /^Customs Form: Expect More Info is visible$/ do
  logger.step "Customs Form: Expect More Info is visible"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.present?.should be true
end

Then /^Customs Form: Expect License Number is visible$/ do
  logger.step "Customs Form: Expect License Number is visible"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.license.present?.should be true
end

Then /^Customs Form: Expect License Number is hidden$/ do
  logger.step "Customs Form: Expect License Number is hidden"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.license.present?.should be false
end

Then /^Customs Form: Expect Certificate Number is hidden$/ do
  logger.step "Customs Form: Expect Certificate Number is hidden"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.present?.should be false
end

Then /^Customs Form: Expect Certificate Number is visible$/ do
  logger.step "Customs Form: Expect Certificate Number is visible"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.present?.should be true
end

Then /^Customs Form: Expect Invoice Number is hidden$/ do
  logger.step "Customs Form: Expect Invoice Number is hidden"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.present?.should be false
end

Then /^Customs Form: Expect Invoice Number is visible$/ do
  logger.step "Customs Form: Expect Invoice Number is visible"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.present?.should be true
end

Then /^Customs Form: Expect ITN Number is hidden$/ do
  logger.step "Customs Form: Expect ITN Number is hidden"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.itn_number.enabled?.should be false
end

Then /^Customs Form: Expect ITN Number is visible$/ do
  logger.step "Customs Form: Expect ITN Number is visible"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.itn_number.enabled?.should be true
end

Then /^Expect Customs Form Internal Transaction Number is Required$/ do
  step "Expect Customs Form Internal Transaction is \"Required\""
end

Then /^Expect Customs Form Internal Transaction Number is Not required$/ do
  step "Expect Customs Form Internal Transaction is \"Not required\""
end

Then /^Expect Customs Form Internal Transaction Number is \"(.+)\"$/ do |expectation|
  logger.step "Expect Customs Form Internal Transaction Number is #{expectation}"
  step "Customs Form: Blur out"
  text_box = stamps.orders.order_details.customs.edit_form.internal_transaction.text_box
  10.times do
    break if text_box.text == expectation
  end
  text_box.text.should eql expectation
end

Then /^Customs Form: Expect Item Grid count is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Item Grid count is #{expectation}"
  step "Customs Form: Blur out"
  stamps.orders.order_details.customs.edit_form.item_grid.size.should eql expectation.to_i
end

Then /^Customs Form: Save Total$/ do
  test_data[:customs_total_value] = stamps.orders.order_details.customs.edit_form.total_value
end

Then /^Customs Form: Expect Total saved value is the same$/ do
  step "Customs Form: Expect Total Value is #{test_data[:customs_total_value]}"
end

Then /^Customs Form: Expect Total Value is (.+)$/ do |expectation|
  logger.step "Customs Form: Expect Total Value is #{expectation}"
  step "Customs Form: Blur out"
  expectation = expectation.to_f
  20.times do
    total_value = stamps.orders.order_details.customs.edit_form.total_value
    break if total_value.to_f == expectation
  end
  total_value = stamps.orders.order_details.customs.edit_form.total_value
  total_value.to_f.should eql expectation
end

Then /^Customs Form: Add Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "Customs Form: Add Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  step "Customs Form: Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  test_data["customs_total_value"]
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  step "Customs Form: Blur out"
  item.qty.set qty
  step "Customs Form: Blur out"
  step "Customs Form: Save Total"
  item.unit_price.set price
  step "Customs Form: Blur out"
  step "Customs Form: Save Total"
  item.made_in.select origin_country
  step "Customs Form: Blur out"
  step "Customs Form: Save Total"
  item.hs_tariff.set tariff
  step "Customs Form: Blur out"
  step "Customs Form: Save Total"
end

Then /^Customs Form: Add Item (\d+)$/ do |item_number|
  logger.step "Customs Form: Add Item #{item_number}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
end

Then /^Customs Form: Set Item Description to (.*)$/ do |value|
  logger.step "Order Details: Set Description to #{value}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  step "Customs Form: Save Total"
end

Then /^Customs Form: Set Item Qty to (\d+)$/ do |value|
  logger.step "Order Details: Set Qty to #{value}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item.qty.set value
  step "Customs Form: Save Total"
end

Then /^Customs Form: Set Item Unit Price to (.*)$/ do |value|
  logger.step "Order Details: Set Unit Price to #{value}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item.unit_price.set value
  step "Customs Form: Save Total"
end

Then /^Customs Form: Set Item Made In Country to (.*)$/ do |value|
  logger.step "Customs Form: Set Item Made In Country to #{value}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item.made_in.select value
  step "Customs Form: Save Total"
end

Then /^Customs Form: Set Item Tarriff to (.*)$/ do |value|
  logger.step "Order Details: Set Tarriff to #{value}"
  step "Customs Form: Blur out"
  @customs_item_grid_line_item.hs_tariff.set value
  step "Customs Form: Save Total"
end

Then /^Customs Form: Expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "Customs Form: Expect Item #{item_number} Description is #{expectation}"
  step "Customs Form: Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.description.text == expectation
  end
  item.description.text.should eql expectation
end

Then /^Customs Form: Expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "Customs Form: Expect Item #{item_number} Quantity is #{expectation}"
  step "Customs Form: Blur out"
  expectation = expectation.to_i
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.qty.text_box.text.to_i == expectation
  end
  item.qty.text_box.text.to_i.should eql expectation
end

Then /^Customs Form: Expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "Customs Form: Expect Item #{item_number} Unit Price is #{expectation}"
  step "Customs Form: Blur out"
  expectation = expectation.to_f
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.unit_price.text_box.text.to_f == expectation
  end
  item.unit_price.text_box.text.to_f.should eql expectation
end

Then /^Customs Form: Expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "Customs Form: Expect Item #{item_number} Origin Country is #{expectation}"
  step "Customs Form: Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.made_in.text_box.text == expectation
  end
  item.made_in.text_box.text.should eql expectation
end

Then /^Customs Form: Expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "Customs Form: Expect Item #{item_number} Tariff is #{expectation}"
  step "Customs Form: Blur out"
  expectation = expectation.to_f
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.hs_tariff.text.to_f == expectation
  end
  item.hs_tariff.text.to_f.should eql expectation
end