
Then /^(?:O|o)n Order Details form, click Edit Form button$/ do
  stamps.orders.order_details.customs.edit_form
end

Then /^(?:O|o)n Customs form, Open Modal$/ do
  step "On Order Details form, click Edit Form button"
end

Then /^(?:O|o)n Customs form, blur out(?:| (\d+)(?:| times))$/ do |count|
  ((count.nil?)?1:count.to_i).times { stamps.orders.order_details.customs.edit_form.blur_out }
end

Then /^(?:O|o)n Customs form, set Package Contents to Merchandise$/ do
  step "On Customs form, set Package Contents to \"Merchandise\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Humanitarian Donation$/ do
  step "On Customs form, set Package Contents to \"Humanitarian Donation\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Returned Goods$/ do
  step "On Customs form, set Package Contents to \"Returned Goods\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Gift$/ do
  step "On Customs form, set Package Contents to \"Gift\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Document$/ do
  step "On Customs form, set Package Contents to \"Document\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Commercial Sample$/ do
  step "On Customs form, set Package Contents to \"Commercial Sample\""
end

Then /^(?:O|o)n Customs form, set Package Contents to Other$/ do
  step "On Customs form, set Package Contents to \"Other\""
end

Then /^(?:O|o)n Customs form, set Package Contents to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_package_contents] = value
  stamps.orders.order_details.customs.edit_form.package_contents.select test_parameter[:customs_package_contents]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Package Contents saved value is the same$/ do
  step "On Customs form, expect Package Contents is #{test_parameter[:customs_package_contents]}"
end

Then /^(?:O|o)n Customs form, expect Package Contents is Merchandise$/ do
  step "On Customs form, expect Package Contents is \"Merchandise\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is Humanitarian Donation$/ do
  step "On Customs form, expect Package Contents is \"Humanitarian Donation\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is Returned Goods$/ do
  step "On Customs form, expect Package Contents is \"Returned Goods\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is$/ do
  step "On Customs form, expect Package Contents is \"Gift\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is Document$/ do
  step "On Customs form, expect Package Contents is \"Document\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is Commercial Sample$/ do
  step "On Customs form, expect Package Contents is \"Commercial Sample\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is Other$/ do
  step "On Customs form, expect Package Contents is \"Other\""
end

Then /^(?:O|o)n Customs form, expect Package Contents is \"(.+)\"$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.package_contents.text_box.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set Non-Delivery Options to Treat as abandoned$/ do
  step "On Customs form, set Non-Delivery Options to \"Treat as abandoned\""
end

Then /^(?:O|o)n Customs form, set Non-Delivery Options to Return to sender$/ do
  step "On Customs form, set Non-Delivery Options to \"Return to sender\""
end

Then /^(?:O|o)n Customs form, set Non-Delivery Options to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_non_delivery_options] = value
  stamps.orders.order_details.customs.edit_form.non_delivery_options.select test_parameter[:customs_non_delivery_options]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Non-Delivery Options saved value is the same$/ do
  step "On Customs form, expect Non-Delivery Options is #{test_parameter[:customs_non_delivery_options]}"
end

Then /^(?:O|o)n Customs form, expect Non-Delivery Options is Treat as abandoned$/ do
  step "On Customs form, expect Non-Delivery Options is \"Treat as abandoned\""
end

Then /^(?:O|o)n Customs form, expect Non-Delivery Options is Return to sender$/ do
  step "On Customs form, expect Non-Delivery Options is \"Return to sender\""
end

Then /^(?:O|o)n Customs form, expect Non-Delivery Options is \"(.+)\"$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.non_delivery_options.text_box.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set Internal Transaction Number to Not required$/ do
  step "On Customs form, set Internal Transaction Number to \"Not required\""
end

Then /^(?:O|o)n Customs form, set Internal Transaction Number to Required$/ do
  step "On Customs form, set Internal Transaction Number to \"Required\""
end

Then /^(?:O|o)n Customs form, set Internal Transaction Number to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_internal_transaction_no] = value
  stamps.orders.order_details.customs.edit_form.internal_transaction.select test_parameter[:customs_internal_transaction_no]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Internal Transaction Number saved value is the same$/ do
  step "On Customs form, expect Internal Transaction Number is #{test_parameter[:customs_internal_transaction_no]}"
end

Then /^(?:O|o)n Customs form, expect Internal Transaction Number is Not required$/ do
  step "On Customs form, expect Internal Transaction Number is \"Not required\""
end

Then /^(?:O|o)n Customs form, expect Internal Transaction Number is Required$/ do
  step "On Customs form, expect Internal Transaction Number is \"Required\""
end

Then /^(?:O|o)n Customs form, expect Internal Transaction Number is \"(.+)\"$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.internal_transaction.text_box.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set More Info to \"(.+)\"$/ do |value|
  test_parameter[:customs_more_info] = (value.downcase.include? 'random') ? ParameterHelper.random_alpha_numeric(18): value
  stamps.orders.order_details.customs.edit_form.more_info.set test_parameter[:customs_more_info]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect More Info saved value is the same$/ do
  step "On Customs form, expect More Info is #{test_parameter[:customs_more_info]}"
end

Then /^(?:O|o)n Customs form, expect More Info is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.more_info.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set ITN Number to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_itn_no] = (value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.itn_number.set test_parameter[:customs_itn_no]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect ITN Number saved value is the same$/ do
  step "On Customs form, expect ITN Number is #{test_parameter[:customs_itn_no]}"
end

Then /^(?:O|o)n Customs form, expect ITN Number is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.itn_number.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set License Number to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_license_no] = ((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.license.set test_parameter[:customs_license_no]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect License Number saved value is the same$/ do
  step "On Customs form, expect License Number is #{test_parameter[:customs_license_no]}"
end

Then /^(?:O|o)n Customs form, expect License Number is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.license.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set Certificate Number to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_certificate_no] = ((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
  stamps.orders.order_details.customs.edit_form.certificate.set test_parameter[:customs_certificate_no]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Certificate Number saved value is the same$/ do
  step "On Customs form, expect Certificate Number is #{test_parameter[:customs_certificate_no]}"
end

Then /^(?:O|o)n Customs form, expect Certificate Number is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.certificate.text).to eql expectation
end

Then /^(?:O|o)n Customs form, set Invoice Number to \"(.+)\"$/ do |value|
  step "On Customs form, blur out"
  test_parameter[:customs_invoice_no] = (value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value
  stamps.orders.order_details.customs.edit_form.invoice.set test_parameter[:customs_invoice_no]
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Invoice Number saved value is the same$/ do
  step "On Customs form, expect Invoice Number is #{test_parameter[:customs_invoice_no]}"
end

Then /^(?:O|o)n Customs form, expect Invoice Number is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.invoice.text).to eql expectation
end

Then /^(?:O|o)n Customs form, Delete Item (\d+)$/ do |item_number|
  step "On Customs form, blur out"
  count = stamps.orders.order_details.customs.edit_form.item_grid.size
  item = stamps.orders.order_details.customs.edit_form.item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^(?:O|o)n Customs form, check I agree to the USPS Privacy Act Statement$/ do
  step "On Customs form, blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.check
end

Then /^(?:O|o)n Customs form, expect I agree to the USPS Privacy Act Statement is checked$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be true
end

Then /^(?:O|o)n Customs form, uncheck I agree to the USPS Privacy Act Statement$/ do
  step "On Customs form, blur out"
  stamps.orders.order_details.customs.edit_form.i_agree.uncheck
end

Then /^(?:O|o)n Customs form, expect I agree to the USPS Privacy Act Statement is unchecked$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be false
end

Then /^(?:O|o)n Customs form, click Close button$/ do
  step "Pause for 4 seconds"
  step "On Customs form, blur out 20 times"
  step "On Customs form, Save Total"
  expect(stamps.orders.order_details.customs.edit_form.close).to be false
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^Cancel Customs Form$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.cancel).to be false
  step "Save Order Details data"
end

Then /^(?:O|o)n Customs form, expect USPS Privacy Act Warning is visible$/ do
  step "On Customs form, blur out"
  15.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  expect(stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?).to be true
end

Then /^(?:O|o)n Customs form, expect USPS Privacy Act Warning is hidden$/ do
  step "On Customs form, blur out"
  10.times do
    break if stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?
  end
  expect(stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning.visible?).to be false
end

Then /^(?:O|o)n Customs form, expect More Info is hidden$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.more_info.present?).to be false
end

Then /^(?:O|o)n Customs form, expect More Info is visible$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.more_info.present?).to be true
end

Then /^(?:O|o)n Customs form, expect License Number is visible$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.license.present?).to be true
end

Then /^(?:O|o)n Customs form, expect License Number is hidden$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.license.present?).to be false
end

Then /^(?:O|o)n Customs form, expect Certificate Number is hidden$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.certificate.present?).to be false
end

Then /^(?:O|o)n Customs form, expect Certificate Number is visible$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.certificate.present?).to be true
end

Then /^(?:O|o)n Customs form, expect Invoice Number is hidden$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.invoice.present?).to be false
end

Then /^(?:O|o)n Customs form, expect Invoice Number is visible$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.invoice.present?).to be true
end

Then /^(?:O|o)n Customs form, expect ITN Number is hidden$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be false
end

Then /^(?:O|o)n Customs form, expect ITN Number is visible$/ do
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be true
end

Then /^Expect Customs Form Internal Transaction Number is Required$/ do
  step "Expect Customs Form Internal Transaction is \"Required\""
end

Then /^Expect Customs Form Internal Transaction Number is Not required$/ do
  step "Expect Customs Form Internal Transaction is \"Not required\""
end

Then /^Expect Customs Form Internal Transaction Number is \"(.+)\"$/ do |expectation|
  step "On Customs form, blur out"
  text_box = stamps.orders.order_details.customs.edit_form.internal_transaction.text_box
  10.times do
    break if text_box.text == expectation
  end
  expect(text_box.text).to eql expectation
end

Then /^(?:O|o)n Customs form, expect Associated Item Grid count is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expect(stamps.orders.order_details.customs.edit_form.item_grid.size).to eql expectation.to_i
end

Then /^(?:O|o)n Customs form, Save Total$/ do
  test_parameter[:customs_total_value] = stamps.orders.order_details.customs.edit_form.total_value
end

Then /^(?:O|o)n Customs form, expect Total saved value is the same$/ do
  step "On Customs form, expect Total Value is #{test_parameter[:customs_total_value]}"
end

Then /^(?:O|o)n Customs form, expect Total Value is (.+)$/ do |expectation|
  step "On Customs form, blur out"
  expectation = expectation.to_f
  20.times do
    total_value = stamps.orders.order_details.customs.edit_form.total_value
    break if total_value.to_f == expectation
  end
  total_value = stamps.orders.order_details.customs.edit_form.total_value
  expect(total_value.to_f).to eql expectation
end

Then /^(?:O|o)n Customs form, add Associated Item (\d+), Description (.*), Qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  step "on Customs form, add Associated Item #{item_number}"
  step "on Customs form, set Associated Item #{item_number} Description to #{description}"
  step "on Customs form, set Associated Item #{item_number} Qty to #{qty}"
  step "on Customs form, set Associated Item #{item_number} Unit Price to #{price}"
  step "on Customs form, set Associated Item #{item_number} Made In Country to #{origin_country}"
  step "on Customs form, set Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^(?:O|o)n Customs form, add Associated Item (\d+)$/ do |item_number|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i)
end

Then /^(?:O|o)n Customs form, set Associated Item (\d+) Description to (.*)$/ do |item_number, value|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_description.set((value.downcase.include?('random')?(ParameterHelper.random_alpha_numeric):value))
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, set Associated Item (\d+) Qty to (\d+)$/ do |item_number, value|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_qty.set(value)
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, set Associated Item (\d+) Unit Price to (.*)$/ do |item_number, value|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_unit_price.set(value)
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, set Associated Item (\d+) Made In Country to (.*)$/ do |item_number, value|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_origin.select(value)
end

Then /^(?:O|o)n Customs form, set Associated Item (\d+) Tarriff to (.*)$/ do |item_number, value|
  stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_hs_tariff.set(value)
  step "On Customs form, Save Total"
end

Then /^(?:O|o)n Customs form, expect Associated Item (\d+) Description is (.*)$/ do |item_number, expectation|
  20.times { break if stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_description.text == expectation }
  expect(stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_description.text).to eql expectation
end

Then /^(?:O|o)n Customs form, expect Associated Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  20.times { break if stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_qty.text_box.text.to_i == expectation.to_i }
  expect(stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_qty.text_box.text.to_i).to eql expectation.to_i
end

Then /^(?:O|o)n Customs form, expect Associated Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  20.times { break if stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_unit_price.text_box.text.to_f == expectation.to_f }
  expect(stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_unit_price.text_box.text.to_f).to eql expectation.to_f
end

Then /^(?:O|o)n Customs form, expect Associated Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  20.times { break if stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_origin.text_box.text == expectation }
  expect(stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_origin.text_box.text).to eql expectation
end

Then /^(?:O|o)n Customs form, expect Associated Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  20.times { break if stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_hs_tariff.text.to_f == expectation.to_f }
  expect(stamps.orders.order_details.customs.edit_form.item_grid.item(item_number.to_i).customs_item_hs_tariff.text.to_f).to eql expectation.to_f
end