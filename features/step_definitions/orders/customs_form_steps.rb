
Then /^On Order Details form, click Edit Form button$/ do
  logger.step "On Order Details form, click Edit Form button"
  stamps.orders.order_details.customs.edit_form
end

Then /^On Customs form, Open Modal$/ do
  step "On Order Details form, click Edit Form button"
end

Then /^On Customs form, Blur out$/ do
  stamps.orders.order_details.customs.edit_form.blur_out
end

Then /^On Customs form, set Package Contents to Merchandise$/ do
  step "On Customs form, set Package Contents to \"Merchandise\""
end

Then /^On Customs form, set Package Contents to Humanitarian Donation$/ do
  step "On Customs form, set Package Contents to \"Humanitarian Donation\""
end

Then /^On Customs form, set Package Contents to Returned Goods$/ do
  step "On Customs form, set Package Contents to \"Returned Goods\""
end

Then /^On Customs form, set Package Contents to Gift$/ do
  step "On Customs form, set Package Contents to \"Gift\""
end

Then /^On Customs form, set Package Contents to Document$/ do
  step "On Customs form, set Package Contents to \"Document\""
end

Then /^On Customs form, set Package Contents to Commercial Sample$/ do
  step "On Customs form, set Package Contents to \"Commercial Sample\""
end

Then /^On Customs form, set Package Contents to Other$/ do
  step "On Customs form, set Package Contents to \"Other\""
end

Then /^On Customs form, set Package Contents to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set Package Contents to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_package_contents] = value
  stamps.orders.order_details.customs.edit_form.package_contents.select test_data[:customs_package_contents]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Package Contents saved value is the same$/ do
  step "On Customs form, expect Package Contents is #{test_data[:customs_package_contents]}"
end

Then /^On Customs form, expect Package Contents is Merchandise$/ do
  step "On Customs form, expect Package Contents is \"Merchandise\""
end

Then /^On Customs form, expect Package Contents is Humanitarian Donation$/ do
  step "On Customs form, expect Package Contents is \"Humanitarian Donation\""
end

Then /^On Customs form, expect Package Contents is Returned Goods$/ do
  step "On Customs form, expect Package Contents is \"Returned Goods\""
end

Then /^On Customs form, expect Package Contents is$/ do
  step "On Customs form, expect Package Contents is \"Gift\""
end

Then /^On Customs form, expect Package Contents is Document$/ do
  step "On Customs form, expect Package Contents is \"Document\""
end

Then /^On Customs form, expect Package Contents is Commercial Sample$/ do
  step "On Customs form, expect Package Contents is \"Commercial Sample\""
end

Then /^On Customs form, expect Package Contents is Other$/ do
  step "On Customs form, expect Package Contents is \"Other\""
end

Then /^On Customs form, expect Package Contents is \"(.+)\"$/ do |expectation|
  logger.step "On Customs form, expect Package Contents is #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.package_contents.text_box.text.should eql expectation
end

Then /^On Customs form, set Non-Delivery Options to Treat as abandoned$/ do
  step "On Customs form, set Non-Delivery Options to \"Treat as abandoned\""
end

Then /^On Customs form, set Non-Delivery Options to Return to sender$/ do
  step "On Customs form, set Non-Delivery Options to \"Return to sender\""
end

Then /^On Customs form, set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set Non-Delivery Options to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_non_delivery_options] = value
  stamps.orders.order_details.customs.edit_form.non_delivery_options.select test_data[:customs_non_delivery_options]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Non-Delivery Options saved value is the same$/ do
  step "On Customs form, expect Non-Delivery Options is #{test_data[:customs_non_delivery_options]}"
end

Then /^On Customs form, expect Non-Delivery Options is Treat as abandoned$/ do
  step "On Customs form, expect Non-Delivery Options is \"Treat as abandoned\""
end

Then /^On Customs form, expect Non-Delivery Options is Return to sender$/ do
  step "On Customs form, expect Non-Delivery Options is \"Return to sender\""
end

Then /^On Customs form, expect Non-Delivery Options is \"(.+)\"$/ do |expectation|
  logger.step "On Customs form, expect Non-Delivery to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.non_delivery_options.text_box.text.should eql expectation
end

Then /^On Customs form, set Internal Transaction Number to Not required$/ do
  step "On Customs form, set Internal Transaction Number to \"Not required\""
end

Then /^On Customs form, set Internal Transaction Number to Required$/ do
  step "On Customs form, set Internal Transaction Number to \"Required\""
end

Then /^On Customs form, set Internal Transaction Number to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set Internal Transaction Number to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_internal_transaction_no] = value
  stamps.orders.order_details.customs.edit_form.internal_transaction.select test_data[:customs_internal_transaction_no]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Internal Transaction Number saved value is the same$/ do
  step "On Customs form, expect Internal Transaction Number is #{test_data[:customs_internal_transaction_no]}"
end

Then /^On Customs form, expect Internal Transaction Number is Not required$/ do
  step "On Customs form, expect Internal Transaction Number is \"Not required\""
end

Then /^On Customs form, expect Internal Transaction Number is Required$/ do
  step "On Customs form, expect Internal Transaction Number is \"Required\""
end

Then /^On Customs form, expect Internal Transaction Number is \"(.+)\"$/ do |expectation|
  logger.step "On Customs form, expect Internal Transaction Number to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.internal_transaction.text_box.text.should eql expectation
end

Then /^On Customs form, set More Info to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set More Info to #{value}"
  test_data[:customs_more_info] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric(18): value
  stamps.orders.order_details.customs.edit_form.more_info.set test_data[:customs_more_info]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect More Info saved value is the same$/ do
  step "On Customs form, expect More Info is #{test_data[:customs_more_info]}"
end

Then /^On Customs form, expect More Info is (.+)$/ do |expectation|
  logger.step "On Customs form, expect More Info to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.text.should eql expectation
end

Then /^On Customs form, set ITN Number to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set ITN Number to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_itn_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.itn_number.set test_data[:customs_itn_no]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect ITN Number saved value is the same$/ do
  step "On Customs form, expect ITN Number is #{test_data[:customs_itn_no]}"
end

Then /^On Customs form, expect ITN Number is (.+)$/ do |expectation|
  logger.step "On Customs form, expect ITN Number to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.itn_number.text.should eql expectation
end

Then /^On Customs form, set License Number to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set License Number to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_license_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.license.set test_data[:customs_license_no]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect License Number saved value is the same$/ do
  step "On Customs form, expect License Number is #{test_data[:customs_license_no]}"
end

Then /^On Customs form, expect License Number is (.+)$/ do |expectation|
  logger.step "On Customs form, expect License Number to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.license.text.should eql expectation
end

Then /^On Customs form, set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set Certificate Number to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_certificate_no] = ((value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.certificate.set test_data[:customs_certificate_no]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Certificate Number saved value is the same$/ do
  step "On Customs form, expect Certificate Number is #{test_data[:customs_certificate_no]}"
end

Then /^On Customs form, expect Certificate Number is (.+)$/ do |expectation|
  logger.step "On Customs form, expect Certificate Number to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.text.should eql expectation
end

Then /^On Customs form, set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "On Customs form, set Invoice Number to #{value}"
  step "On Customs form, Blur out"
  test_data[:customs_invoice_no] = (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.invoice.set test_data[:customs_invoice_no]
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Invoice Number saved value is the same$/ do
  step "On Customs form, expect Invoice Number is #{test_data[:customs_invoice_no]}"
end

Then /^On Customs form, expect Invoice Number is (.+)$/ do |expectation|
  logger.step "On Customs form, expect Invoice Number to  be #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.text.should eql expectation
end

Then /^On Customs form, Delete Item (\d+)$/ do |item_number|
  logger.step "On Customs form, Delete Item #{item_number}"
  step "On Customs form, Blur out"
  count = stamps.orders.order_details.customs.edit_form.item_grid.size
  item = stamps.orders.order_details.customs.edit_form.item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^On Customs form, check I agree to the USPS Privacy Act Statement$/ do
  logger.step "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.check
end

Then /^On Customs form, expect I agree to the USPS Privacy Act Statement is checked$/ do
  logger.step "On Customs form, expect I agree to the USPS Privacy Act Statement is checked"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.checked?.should be true
end

Then /^On Customs form, uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.uncheck
end

Then /^On Customs form, expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  logger.step "On Customs form, expect I agree to the USPS Privacy Act Statement is unchecked"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.checked?.should be false
end

Then /^On Customs form, click Close button$/ do
  logger.step "Closing customs form"
  step "Pause for 4 seconds"
  step "On Customs form, Blur out"
  step "On Customs form, Save Total"
  stamps.orders.order_details.customs.edit_form.close.should be false
  step "On Order Details form, Blur out"
  step "Save Test Data"
end

Then /^Cancel Customs Form$/ do
  logger.step "Cancel customs form"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.cancel.should be false
  step "Save Test Data"
end

Then /^On Customs form, expect USPS Privacy Act Warning is visible$/ do
  logger.step "On Customs form, expect USPS Privacy Act Warning is visible"
  step "On Customs form, Blur out"
  15.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?.should be true
end

Then /^On Customs form, expect USPS Privacy Act Warning is hidden$/ do
  logger.step "On Customs form, expect USPS Privacy Act Warning is hidden"
  step "On Customs form, Blur out"
  10.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?.should be false
end

Then /^On Customs form, expect More Info is hidden$/ do
  logger.step "On Customs form, expect More Info is hidden"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.present?.should be false
end

Then /^On Customs form, expect More Info is visible$/ do
  logger.step "On Customs form, expect More Info is visible"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.more_info.present?.should be true
end

Then /^On Customs form, expect License Number is visible$/ do
  logger.step "On Customs form, expect License Number is visible"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.license.present?.should be true
end

Then /^On Customs form, expect License Number is hidden$/ do
  logger.step "On Customs form, expect License Number is hidden"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.license.present?.should be false
end

Then /^On Customs form, expect Certificate Number is hidden$/ do
  logger.step "On Customs form, expect Certificate Number is hidden"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.present?.should be false
end

Then /^On Customs form, expect Certificate Number is visible$/ do
  logger.step "On Customs form, expect Certificate Number is visible"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.certificate.present?.should be true
end

Then /^On Customs form, expect Invoice Number is hidden$/ do
  logger.step "On Customs form, expect Invoice Number is hidden"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.present?.should be false
end

Then /^On Customs form, expect Invoice Number is visible$/ do
  logger.step "On Customs form, expect Invoice Number is visible"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.invoice.present?.should be true
end

Then /^On Customs form, expect ITN Number is hidden$/ do
  logger.step "On Customs form, expect ITN Number is hidden"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.itn_number.enabled?.should be false
end

Then /^On Customs form, expect ITN Number is visible$/ do
  logger.step "On Customs form, expect ITN Number is visible"
  step "On Customs form, Blur out"
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
  step "On Customs form, Blur out"
  text_box = stamps.orders.order_details.customs.edit_form.internal_transaction.text_box
  10.times do
    break if text_box.text == expectation
  end
  text_box.text.should eql expectation
end

Then /^On Customs form, expect Item Grid count is (.+)$/ do |expectation|
  logger.step "On Customs form, expect Item Grid count is #{expectation}"
  step "On Customs form, Blur out"
  stamps.orders.order_details.customs.edit_form.item_grid.size.should eql expectation.to_i
end

Then /^On Customs form, Save Total$/ do
  test_data[:customs_total_value] = stamps.orders.order_details.customs.edit_form.total_value
end

Then /^On Customs form, expect Total saved value is the same$/ do
  step "On Customs form, expect Total Value is #{test_data[:customs_total_value]}"
end

Then /^On Customs form, expect Total Value is (.+)$/ do |expectation|
  logger.step "On Customs form, expect Total Value is #{expectation}"
  step "On Customs form, Blur out"
  expectation = expectation.to_f
  20.times do
    total_value = stamps.orders.order_details.customs.edit_form.total_value
    break if total_value.to_f == expectation
  end
  total_value = stamps.orders.order_details.customs.edit_form.total_value
  total_value.to_f.should eql expectation
end

Then /^On Customs form, add associated Item (\d+), Description (.*), Qty (\d+), Price (.+), Origin (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  logger.step "On Customs form, add associated Item #{item_number}, Description #{description}, Qty #{qty}, Price #{price}, Origin #{origin_country}, Tariff #{tariff}"
  step "On Customs form, Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  test_data["customs_total_value"]
  item.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  step "On Customs form, Blur out"
  item.qty.set qty
  step "On Customs form, Blur out"
  step "On Customs form, Save Total"
  item.unit_price.set price
  step "On Customs form, Blur out"
  step "On Customs form, Save Total"
  item.made_in.select origin_country
  step "On Customs form, Blur out"
  step "On Customs form, Save Total"
  item.hs_tariff.set tariff
  step "On Customs form, Blur out"
  step "On Customs form, Save Total"
end

Then /^On Customs form, add associated Item (\d+)$/ do |item_number|
  logger.step "On Customs form, add associated Item #{item_number}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
end

Then /^On Customs form, set Item Description to (.*)$/ do |value|
  logger.step "On Order Details form, set Description to #{value}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item.description.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  step "On Customs form, Save Total"
end

Then /^On Customs form, set Item Qty to (\d+)$/ do |value|
  logger.step "On Order Details form, set Qty to #{value}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item.qty.set value
  step "On Customs form, Save Total"
end

Then /^On Customs form, set Item Unit Price to (.*)$/ do |value|
  logger.step "On Order Details form, set Unit Price to #{value}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item.unit_price.set value
  step "On Customs form, Save Total"
end

Then /^On Customs form, set Item Made In Country to (.*)$/ do |value|
  logger.step "On Customs form, set Item Made In Country to #{value}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item.made_in.select value
  step "On Customs form, Save Total"
end

Then /^On Customs form, set Item Tarriff to (.*)$/ do |value|
  logger.step "On Order Details form, set Tarriff to #{value}"
  step "On Customs form, Blur out"
  @customs_item_grid_line_item.hs_tariff.set value
  step "On Customs form, Save Total"
end

Then /^On Customs form, expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  logger.step "On Customs form, expect Item #{item_number} Description is #{expectation}"
  step "On Customs form, Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.description.text == expectation
  end
  item.description.text.should eql expectation
end

Then /^On Customs form, expect Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  logger.step "On Customs form, expect Item #{item_number} Quantity is #{expectation}"
  step "On Customs form, Blur out"
  expectation = expectation.to_i
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.qty.text_box.text.to_i == expectation
  end
  item.qty.text_box.text.to_i.should eql expectation
end

Then /^On Customs form, expect Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  logger.step "On Customs form, expect Item #{item_number} Unit Price is #{expectation}"
  step "On Customs form, Blur out"
  expectation = expectation.to_f
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.unit_price.text_box.text.to_f == expectation
  end
  item.unit_price.text_box.text.to_f.should eql expectation
end

Then /^On Customs form, expect Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  logger.step "On Customs form, expect Item #{item_number} Origin Country is #{expectation}"
  step "On Customs form, Blur out"
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.made_in.text_box.text == expectation
  end
  item.made_in.text_box.text.should eql expectation
end

Then /^On Customs form, expect Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  logger.step "On Customs form, expect Item #{item_number} Tariff is #{expectation}"
  step "On Customs form, Blur out"
  expectation = expectation.to_f
  item = stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
  10.times do
    break if item.hs_tariff.text.to_f == expectation
  end
  item.hs_tariff.text.to_f.should eql expectation
end