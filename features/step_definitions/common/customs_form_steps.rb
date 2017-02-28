
Then /^(?:C|c)lick (?:Order Details|Print) form Edit Form button$/ do
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form
    when :mail
      stamps.mail.print_form.mail_customs.edit_form
    else
      # do nothing
  end
end

Then /^(?:B|b)lur out on Customs form(?:| (\d+)(?:| times))$/ do |count|
  count = (count.nil?)?1:count.to_i
  case param.web_app
    when :orders
      count.times { stamps.orders.order_details.customs.edit_form.blur_out }
    when :mail
      count.times { stamps.mail.print_form.mail_customs.edit_form.edit_form.blur_out }
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form Package Contents to (.+)$/ do |value|
  test_parameter[:customs_package_contents] = value
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.package_contents.select(test_parameter[:customs_package_contents])
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.package_contents.select(test_parameter[:customs_package_contents])
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form Package Contents is (.*)$/ do |expectation|
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.package_contents.combo_box.text_box.text).to eql expectation
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.package_contents.combo_box.text_box.text).to eql expectation
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form Non-Delivery Options to (.*)$/ do |value|
  test_parameter[:customs_non_delivery_options] = value
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.non_delivery_options.select(test_parameter[:customs_non_delivery_options])
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.non_delivery_options.select(test_parameter[:customs_non_delivery_options])
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Non-Delivery Options saved value is the same$/ do
  step "expect Customs form Non-Delivery Options is #{test_parameter[:customs_non_delivery_options]}"
end

Then /^(?:E|e)xpect Customs form Non-Delivery Options is (.+)$/ do |expectation|
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.non_delivery_options.combo_box.text_box.text).to eql expectation
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.non_delivery_options.combo_box.text_box.text).to eql expectation
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form Internal Transaction Number to (.+)$/ do |value|
  test_parameter[:customs_internal_transaction_no] = value
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.internal_transaction.select(test_parameter[:customs_internal_transaction_no])
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.internal_transaction.select(test_parameter[:customs_internal_transaction_no])
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form Internal Transaction Number is (?:correct|(.*))$/ do |expectation|
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.internal_transaction.combo_box.text_box.text).to eql expectation
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.internal_transaction.combo_box.text_box.text).to eql expectation
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form More Info to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_more_info] = (value.nil?)?ParameterHelper.random_alpha_numeric(18):value
  case param.web_app
    when :orders
      more_info = stamps.orders.order_details.customs.edit_form.contents.more_info
    when :mail
      more_info = stamps.mail.print_form.mail_customs.edit_form.contents.more_info
    else
      # do nothing
  end
  expect(more_info.present?).to be true
  more_info.set(test_parameter[:customs_more_info])
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form More Info saved value is the same$/ do
  step "expect Customs form More Info is #{test_parameter[:customs_more_info]}"
end

Then /^(?:E|e)xpect Customs form More Info is (.+)$/ do |expectation|
  case param.web_app
    when :orders
      more_info = stamps.orders.order_details.customs.edit_form.contents.more_info
    when :mail
      more_info = stamps.mail.print_form.mail_customs.edit_form.contents.more_info
    else
      # do nothing
  end
  expect(more_info.present?).to be true
  expect(more_info.text).to eql expectation
end

Then /^(?:S|s)et Customs form ITN Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_itn_no] = (value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric(50): value
  case param.web_app
    when :orders
      itn_number = stamps.orders.order_details.customs.edit_form.itn_number
    when :mail
      itn_number = stamps.mail.print_form.mail_customs.edit_form.itn_number
    else
      # do nothing
  end
  itn_number.set(test_parameter[:customs_itn_no])
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form ITN Number is (.+)$/ do |expectation|
  case param.web_app
    when :orders
      itn_number = stamps.orders.order_details.customs.edit_form.itn_number
    when :mail
      itn_number = stamps.mail.print_form.mail_customs.edit_form.itn_number
    else
      # do nothing
  end
  expect(itn_number.present?).to be true
  expect(itn_number.text).to eql expectation
end

Then /^(?:S|s)et Customs form License Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_license_no] = ((value.nil?)?ParameterHelper.random_alpha_numeric(6): value)
  case param.web_app
    when :orders
      license = stamps.orders.order_details.customs.edit_form.contents.license
    when :mail
      license = stamps.mail.print_form.mail_customs.edit_form.contents.license
    else
      # do nothing
  end
  expect(license.present?).to be true
  license.set test_parameter[:customs_license_no]
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form License Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_license_no] : expectation
  case param.web_app
    when :orders
      license = stamps.orders.order_details.customs.edit_form.contents.license
    when :mail
      license = stamps.mail.print_form.mail_customs.edit_form.contents.license
    else
      # do nothing
  end
  expect(license.present?).to be true
  expect(license.text).to eql expectation
end

Then /^(?:S|s)et Customs form Certificate Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_certificate_no] = ((value.nil?)?ParameterHelper.random_alpha_numeric(8):value)
  case param.web_app
    when :orders
      certificate = stamps.orders.order_details.customs.edit_form.contents.certificate
    when :mail
      certificate = stamps.mail.print_form.mail_customs.edit_form.contents.certificate
    else
      # do nothing
  end
  expect(certificate.present?).to be true
  certificate.set(test_parameter[:customs_license_no])
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form Certificate Number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:customs_certificate_no]:expectation
  case param.web_app
    when :orders
      certificate = stamps.orders.order_details.customs.edit_form.contents.certificate
    when :mail
      certificate = stamps.mail.print_form.mail_customs.edit_form.contents.certificate
    else
      # do nothing
  end
  expect(certificate.present?).to be true
  expect(certificate.text).to eql expectation
end

Then /^(?:S|s)et Customs form Invoice Number to (?:(?:a|some) random string|(.*))$/ do |value|
  test_parameter[:customs_invoice_no] = (value.nil?)?ParameterHelper.random_alpha_numeric(10):value
  case param.web_app
    when :orders
      invoice = stamps.orders.order_details.customs.edit_form.contents.invoice
    when :mail
      invoice = stamps.mail.print_form.mail_customs.edit_form.contents.invoice
    else
      # do nothing
  end
  expect(invoice.present?).to be true
  expect(invoice.text).to eql expectation
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form Invoice Number is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:customs_invoice_no] if expectation.nil?
  case param.web_app
    when :orders
      invoice = stamps.orders.order_details.customs.edit_form.contents.invoice
    when :mail
      invoice = stamps.mail.print_form.mail_customs.edit_form.contents.invoice
    else
      # do nothing
  end
  expect(invoice.present?).to be true
  expect(invoice.text).to eql expectation
end

Then /^(?:D|d)elete Customs form Associated Item (\d+)$/ do |item_number|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  count = associated_items.size
  item_field = associated_items.item_number(item_number.to_i)
  if count > 1
    item_field.delete.click_while_present
  else
    item_field.delete.safe_click
  end
end

Then /^(?:O|o)n Customs form, check I agree to the USPS Privacy Act Statement$/ do
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.i_agree.check
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.i_agree.check
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form I agree to the USPS Privacy Act Statement is checked$/ do
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.i_agree.checked?).to be true
    else
      # do nothing
  end
end

Then /^(?:O|o)n Customs form, uncheck I agree to the USPS Privacy Act Statement$/ do
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.i_agree.uncheck
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.i_agree.uncheck
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form I agree to the USPS Privacy Act Statement is unchecked$/ do
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.i_agree.checked?).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.i_agree.checked?).to be false
    else
      # do nothing
  end
end

Then /^(?:C|c)lick Customs form Close button$/ do
  step "Pause for 4 seconds"
  step "Blur out on Customs form 20 times"
  step "On Customs form, Save Total"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.close).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.close).to be false
    else
      # do nothing
  end
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^Cancel Customs Form$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.cancel).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.cancel).to be false
    else
      # do nothing
  end
  step "Save Order Details data"
end

Then /^(?:E|e)xpect Customs form USPS Privacy Act Warning is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      usps_privacy_act_warning = stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning
    when :mail
      usps_privacy_act_warning = stamps.mail.print_form.mail_customs.edit_form.usps_privacy_act_warning
    else
      # do nothing
  end
  15.times do
    break if usps_privacy_act_warning.visible?
  end
  expect(usps_privacy_act_warning.visible?).to be true
end

Then /^(?:E|e)xpect Customs form USPS Privacy Act Warning is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      usps_privacy_act_warning = stamps.orders.order_details.customs.edit_form.usps_privacy_act_warning
    when :mail
      usps_privacy_act_warning = stamps.mail.print_form.mail_customs.edit_form.usps_privacy_act_warning
    else
      # do nothing
  end
  10.times { break if usps_privacy_act_warning.visible?}
  expect(usps_privacy_act_warning.visible?).to be false
end

Then /^(?:E|e)xpect Customs form More Info is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.more_info.present?).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.more_info.present?).to be false
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form More Info is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.more_info.present?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.more_info.present?).to be true
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form License Number is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.license.present?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.license.present?).to be true
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form License Number is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.license.present?).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.license.present?).to be false
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Certificate Number is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.certificate.present?).to be false
    when :mail
      expect(stamps.orders.order_details.customs.edit_form.contents.certificate.present?).to be false
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Certificate Number is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.certificate.present?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.certificate.present?).to be true
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Invoice Number is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.invoice.present?).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.invoice.present?).to be false
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Invoice Number is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.contents.invoice.present?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.contents.invoice.present?).to be true
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form ITN Number is hidden$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be false
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.itn_number.enabled?).to be false
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form ITN Number is visible$/ do
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.itn_number.enabled?).to be true
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.itn_number.enabled?).to be true
    else
      # do nothing
  end
end

Then /^Expect Customs Form Internal Transaction Number is (.+)$/ do |expectation|
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      internal_transaction = stamps.orders.order_details.customs.edit_form.internal_transaction.text_box
    when :mail
      internal_transaction = stamps.mail.print_form.mail_customs.edit_form.internal_transaction.text_box
    else
      # do nothing
  end
  10.times { break if internal_transaction.text == expectation }
  expect(internal_transaction.text).to eql expectation
end

Then /^(?:E|e)xpect Customs form Associated Item Grid count is (.+)$/ do |expectation|
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      expect(stamps.orders.order_details.customs.edit_form.associated_items.size).to eql expectation.to_i
    when :mail
      expect(stamps.mail.print_form.mail_customs.edit_form.associated_items.size).to eql expectation.to_i
    else
      # do nothing
  end
end

Then /^(?:O|o)n Customs form, Save Total$/ do
  case param.web_app
    when :orders
      test_parameter[:customs_total_value] = stamps.orders.order_details.customs.edit_form.total_value
    when :mail
      test_parameter[:customs_total_value] = stamps.mail.print_form.mail_customs.edit_form.total_value
    else
      # do nothing
  end
end

Then /^(?:E|e)xpect Customs form Total saved value is the same$/ do
  step "expect Customs form Total Value is #{test_parameter[:customs_total_value]}"
end

Then /^(?:E|e)xpect Customs form Total Value is (.+)$/ do |expectation|
  expectation = expectation.to_f
  step "Blur out on Customs form"
  case param.web_app
    when :orders
      customs_form = stamps.orders.order_details.customs.edit_form
    when :mail
      customs_form = stamps.mail.print_form.mail_customs.edit_form
    else
      # do nothing
  end
  20.times { break if customs_form.total_value == expectation }
  expect(customs_form.total_value).to eql expectation
end

Then /^(?:A|a)dd Customs form Associated Item (\d+), Description (.*), Qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, origin_country, tariff|
  step "add Customs form Associated Item #{item_number}"
  step "set Customs form Associated Item #{item_number} Description to #{description}"
  step "set Customs form Associated Item #{item_number} Qty to #{qty}"
  step "set Customs form Associated Item #{item_number} Unit Price to #{price}"
  step "set Customs form Associated Item #{item_number} Made In Country to #{origin_country}"
  step "set Customs form Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^(?:A|a)dd Customs form Associated Item (\d+)$/ do |item_number|
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i)
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Description to (.*)$/ do |item_number, value|
  value = (value.downcase.include?('random')?(ParameterHelper.random_alpha_numeric):value)
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.set(value)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_description.set(value)
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Qty to (\d+)$/ do |item_number, value|
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.set(value)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_qty.set(value)
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Unit Price to (.*)$/ do |item_number, value|
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.set(value)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_unit_price.set(value)
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Made In Country to (.*)$/ do |item_number, value|
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_origin.select(value)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_origin.select(value)
    else
      # do nothing
  end
end

Then /^(?:S|s)et Customs form Associated Item (\d+) Tarriff to (.*)$/ do |item_number, value|
  case param.web_app
    when :orders
      stamps.orders.order_details.customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.set(value)
    when :mail
      stamps.mail.print_form.mail_customs.edit_form.associated_items.item_number(item_number.to_i).customs_item_hs_tariff.set(value)
    else
      # do nothing
  end
  step "On Customs form, Save Total"
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Description is (.*)$/ do |item_number, expectation|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  20.times { break if associated_items.item_number(item_number.to_i).customs_item_description.text == expectation }
  expect(associated_items.item_number(item_number.to_i).customs_item_description.text).to eql expectation
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Quantity is (\d+)$/ do |item_number, expectation|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  20.times { break if associated_items.item_number(item_number.to_i).customs_item_qty.text_box.text.to_i == expectation.to_i }
  expect(associated_items.item_number(item_number.to_i).customs_item_qty.text_box.text.to_i).to eql expectation.to_i
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  20.times { break if associated_items.item_number(item_number.to_i).customs_item_unit_price.text_box.text.to_f == expectation.to_f }
  expect(associated_items.item_number(item_number.to_i).customs_item_unit_price.text_box.text.to_f).to eql expectation.to_f
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Origin Country is (.*)$/ do |item_number, expectation|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  20.times { break if associated_items.item_number(item_number.to_i).customs_item_origin.text_box.text == expectation }
  expect(associated_items.item_number(item_number.to_i).customs_item_origin.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Customs form Associated Item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  case param.web_app
    when :orders
      associated_items = stamps.orders.order_details.customs.edit_form.associated_items
    when :mail
      associated_items = stamps.mail.print_form.mail_customs.edit_form.associated_items
    else
      # do nothing
  end
  20.times { break if associated_items.item_number(item_number.to_i).customs_item_hs_tariff.text.to_f == expectation.to_f }
  expect(associated_items.item_number(item_number.to_i).customs_item_hs_tariff.text.to_f).to eql expectation.to_f
end

