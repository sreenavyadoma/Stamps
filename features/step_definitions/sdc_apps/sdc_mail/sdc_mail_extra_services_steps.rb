Then /^blur out on extra services form$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.total.blur_out
  extra_services.title.blur_out
end

# fragile on extra services modal
Then /^check fragile on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.fragile.check
    step 'blur out on extra services modal'
    extra_services.fragile_cost.safe_click
    break if extra_services.fragile_cost.text_value.include? '$'
  end
  expect(extra_services.fragile.checked?).to be(true)
end

Then /^uncheck fragile on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.fragile.uncheck
    step 'blur out on extra services modal'
    extra_services.fragile_cost.safe_click
    break unless extra_services.fragile_cost.text_value.include? '$'
  end
  expect(extra_services.fragile.checked?).to be(false)
end

Then /^expect fragile on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.fragile.checked?).to be(true)
end

Then /^expect fragile on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.fragile.checked?).to be(false)
end

Then /^expect fragile on extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.fragile.present?).to be(true)
end

Then /^expect fragile on extra services modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.fragile.present?).to be(false)
end

Then /^expect fragile cost on extra services modal is \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.fragile_cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.fragile_cost.present?).to be(true)
  expect(extra_services.fragile_cost.text_value.parse_digits).to eql(str)
end

Then /^expect fragile cost on extra services modal is greater than \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.fragile_cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.fragile_cost.present?).to be(true)
  expect(extra_services.fragile_cost.text_value.parse_digits.to_f).to be > str.to_f
end

Then /^expect form 3811 link is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  extra_services.form_3811.safe_wait_until_present(timeout: 3)
  expect(extra_services.form_3811.present?).to be(true)
  expect(extra_services.form_3811.text).to eql('Form 3811')
end

Then /^expect form 3811 link is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.form_3811.present?).to be(false)
end

# return receipt for merchandise on extra services modal
Then /^check return receipt for merchandise on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.return_receipt_for_merchandise.check
    step 'blur out on extra services modal'
    extra_services.return_receipt_for_merchandise_cost.safe_click
    step 'click continue button on value must be shown modal'
    break if extra_services.return_receipt_for_merchandise_cost.text_value.include? '$'
  end
  expect(extra_services.return_receipt_for_merchandise.checked?).to be(true)
end

Then /^uncheck return receipt for merchandise on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.return_receipt_for_merchandise.uncheck
    step 'blur out on extra services modal'
    extra_services.return_receipt_for_merchandise_cost.safe_click
    break unless extra_services.return_receipt_for_merchandise_cost.text_value.include? '$'
  end
  expect(extra_services.return_receipt_for_merchandise.checked?).to be(false)
end

Then /^expect return receipt for merchandise on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.return_receipt_for_merchandise.checked?).to be(true)
end

Then /^expect return receipt for merchandise on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.return_receipt_for_merchandise.checked?).to be(false)
end

Then /^expect return receipt for merchandise on extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.return_receipt_for_merchandise.present?).to be(true)
end

Then /^expect return receipt for merchandise on extra services modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.return_receipt_for_merchandise.present?).to be(false)
end

Then /^expect return receipt for merchandise cost on extra services modal is \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt_for_merchandise_cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.return_receipt_for_merchandise_cost.present?).to be(true)
  expect(extra_services.return_receipt_for_merchandise_cost.text_value.parse_digits).to eql(str)
end

Then /^expect return receipt for merchandise cost on extra services modal is greater than \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt_for_merchandise_cost.safe_wait_until_present(timeout: 1)
  expect(extra_services.return_receipt_for_merchandise_cost.present?).to be(true)
  expect(extra_services.return_receipt_for_merchandise_cost.text_value.parse_digits.to_f).to be > str.to_f
end

# non-rectangular on extra services modal
Then /^check non-rectangular on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  extra_services.non_rectangular.check
  expect(extra_services.non_rectangular.checked?).to be(true)
end

Then /^uncheck non-rectangular on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  extra_services.non_rectangular.uncheck
  expect(extra_services.non_rectangular.checked?).to be(false)
end

Then /^expect non-rectangular on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.non_rectangular.checked?).to be(true)
end

Then /^expect non-rectangular on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.non_rectangular.checked?).to be(false)
end

Then /^expect non-rectangular on extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.non_rectangular.present?).to be(true)
end

Then /^expect non-rectangular on extra services modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.non_rectangular.present?).to be(false)
end

# hold for pickup on extra services modal
Then /^expect hold for pickup on extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.hold_for_pickup.present?).to be(true)
end

Then /^expect hold for pickup on extra services modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  step 'blur out on extra services modal'
  expect(extra_services.hold_for_pickup.present?).to be(false)
end

Then /^check hold for pickup on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  15.times do
    extra_services.hold_for_pickup.check
    step 'blur out on extra services modal'
    extra_services.hold_for_pickup_cost.safe_click
    break if extra_services.hold_for_pickup_cost.text_value.include? '$'
  end
  step 'expect hold for pickup on extra services modal is checked'
end

Then /^uncheck hold for pickup on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  15.times do
    extra_services.hold_for_pickup.uncheck
    step 'blur out on extra services modal'
    extra_services.hold_for_pickup_cost.safe_click
    break unless extra_services.hold_for_pickup_cost.text_value.include? '$'
  end
  step 'expect hold for pickup on extra services modal is unchecked'
end

Then /^expect hold for pickup on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.hold_for_pickup.checked?).to be(true)
end

Then /^expect hold for pickup on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.hold_for_pickup.checked?).to be(false)
end

Then /^expect hold for pickup cost on extra services modal is \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  result = extra_services.hold_for_pickup_cost.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(str.to_f.round(2))
end

Then /^expect hold for pickup cost on extra services modal is greater than \$(.+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.hold_for_pickup_cost.safe_wait_until_present(timeout: 3)
  expect(extra_services.hold_for_pickup_cost.present?).to be(true)
  expect(extra_services.hold_for_pickup_cost.text_value.parse_digits.to_f).to be > str.to_f
end







































Then /^expect extra services cod is present$/ do
  expect(SdcMail.modals.extra_services.cod).to be_present
end

Then /^set extra services cod to (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  SdcMail.modals.extra_services.cod.set(amount)
  step "expect extra services cod value is #{amount}"
end

Then /^increment extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.text_value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.increment.click
  end
  step "expect extra services cod value is #{cod_value+amount.to_f}"
end

Then /^decrement extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.text_value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.decrement.click
  end
  step "expect extra services cod value is #{cod_value-amount.to_f}"
end

Then /^expect extra services cod value is (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  expect(SdcMail.modals.extra_services.cod.text_value.to_f).to eql(amount.to_f)
end

Then /^expect extra services cod price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.cod_cost.wait_until_present(timeout: 10)
  expect(SdcMail.modals.extra_services.cod_cost.text_value.parse_digits.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^expect extra services save button is present$/ do
  expect(SdcMail.modals.extra_services.save).to be_present
end

Then /^save extra services$/ do
  step 'expect extra services modal is present'
  extra_services = SdcMail.modals.extra_services
  extra_services.title.blur_out
  extra_services.save.click
  extra_services.save.wait_while_present(timeout: 5)
  step 'expect extra services modal is not present'
end

Then /^expect extra services modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.title.text_value).to eql 'Extra Services'
end

Then /^expect extra services modal is not present$/ do
  expect(SdcMail.modals.extra_services.title).not_to be_present
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  extra_services = SdcMail.modals.extra_services
  3.times do
    extra_services.x_btn.safe_click
    extra_services.window.safe_wait_while_present(timeout: 1)
    break unless extra_services.window.present?
  end
  step 'expect extra services modal is not present'
end

Then /^expect extra services security is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.security.drop_down).to be_present
  expect(extra_services.security.text_field).to be_present
end

Then /^set extra services security to (.*)$/ do |value|
  security = SdcMail.modals.extra_services.security
  security.selection_element('selection', value)
  security.drop_down.click unless security.selection.present?
  expect(security.selection).to be_present
  security.selection.click

  if value.eql? 'Registered Mail'
    step 'click continue button on value must be shown modal'
  end
  step 'blur out on extra services form'
end

Then /^expect extra services security is (.*)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.security.text_field.text_value).to eql(value)
end

Then /^expect value must be shown modal is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.value_must_be_shown.title).to be_present
end

Then /^expect value must be shown modal is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.value_must_be_shown.title).not_to be_present
end

Then /^click continue button on value must be shown modal$/ do
  value_must_be_shown = SdcMail.modals.extra_services.value_must_be_shown
  value_must_be_shown.title.safe_wait_until_present(timeout: 5)
  expect(value_must_be_shown.title.text_value).to eql 'Value Must be Shown'
  value_must_be_shown.continue.click
  value_must_be_shown.continue.wait_while_present(timeout: 5)
  step 'blur out on extra services form'
  step 'expect value must be shown modal is not present'
end

Then /^click cancel button on value must be shown modal$/ do
  value_must_be_shown = SdcMail.modals.extra_services.value_must_be_shown
  value_must_be_shown.title.safe_wait_until_present(timeout: 5)
  expect(value_must_be_shown.title.text_value).to eql 'Value Must be Shown'
  value_must_be_shown.cancel.click
  value_must_be_shown.cancel.wait_while_present(timeout: 5)
  step 'blur out on extra services form'
  step 'expect value must be shown modal is not present'
end

Then /^expect special contents warning modal is present$/ do
  expect(SdcMail.modals.special_contents_warning.title).to be_present
end

Then /^expect special contents warning modal is not present$/ do
  expect(SdcMail.modals.special_contents_warning.title).not_to be_present
end

Then /^click special contents warning modal i agree$/ do
  SdcMail.modals.special_contents_warning.i_agree.click
  step 'expect special contents warning modal is not present'
end

Then /^set extra services security value to (\d*.?\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  extra_services.value.set(value)
end

Then /^increment extra services security value by (\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  price = extra_services.value.text_value.to_f
  value.times do
    extra_services.value.increment.click
  end
  step "expect extra services security value is #{price + value.to_f}"
end

Then /^decrement extra services security value by (\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  price = extra_services.value.text_value.to_f
  value.times do
    extra_services.value.decrement.click
  end
  step "expect extra services security value is #{price - value.to_f}"
end

Then /^expect extra services security value is (\d*.?\d+)$/ do |value|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.value.text_value.to_f).to eql(value.to_f)
end

Then /^set extra services handling to (.*)$/ do |str|
  handling = SdcMail.modals.extra_services.handling
  handling.selection_element("selection", str)
  handling.drop_down.click
  expect(handling.selection).to be_present
  handling.selection.click
end

Then /^expect extra services handling is (.*)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.handling.text_field.text_value).to eql(str)
end

Then /^check return receipt on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.return_receipt.check
    step 'blur out on extra services modal'
    extra_services.return_receipt_cost.safe_click
    break if extra_services.return_receipt_cost.text_value.include? '$'
  end
  step 'expect return receipt on extra services modal is checked'
end

Then /^uncheck return receipt on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.return_receipt.uncheck
    step 'blur out on extra services modal'
    extra_services.return_receipt_cost.safe_click
    break unless extra_services.return_receipt_cost.text_value.include? '$'
  end
  step 'expect return receipt on extra services modal is unchecked'
end

Then /^expect return receipt on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.return_receipt.checked?).to be_truthy
end

Then /^expect return receipt on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.return_receipt.checked?).not_to be_truthy
end

Then /^expect return receipt on extra services modal price to be (\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  result = extra_services.return_receipt_cost.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^check restricted delivery on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.restricted_delivery.check
    step 'blur out on extra services modal'
    extra_services.restricted_delivery_cost.safe_click
    extra_services.restricted_delivery_cost.safe_click
    break if extra_services.restricted_delivery_cost.text_value.include? '$'
  end
  step 'expect restricted delivery on extra services modal is checked'
end

Then /^uncheck restricted delivery on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  15.times do
    extra_services.restricted_delivery.uncheck
    step 'blur out on extra services modal'
    extra_services.restricted_delivery_cost.safe_click
    break unless extra_services.restricted_delivery_cost.text_value.include? '$'
  end
  step 'expect restricted delivery on extra services modal is unchecked'
end

Then /^expect restricted delivery on extra services modal is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.restricted_delivery.checked?).to be(true)
end

Then /^expect restricted delivery on extra services modal is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.restricted_delivery.checked?).to be(false)
end

Then /^expect restricted delivery on extra services modal price to be (\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  extra_services.restricted_delivery_cost.safe_wait_until_present(timeout: 1)
  result = extra_services.restricted_delivery_cost.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^blur out on extra services modal$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.security_label.blur_out if extra_services.security_label.present?
  extra_services.cod_label.blur_out if extra_services.cod_label.present?
  extra_services.handling_label.blur_out if extra_services.handling_label.present?
  extra_services.title.blur_out if extra_services.title.present?
end

Then /^expect extra services total cost is \$(\d*.?\d+)$/ do |expectation|
  extra_services = SdcMail.modals.extra_services
  result = extra_services.total.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(expectation.to_f.round(2))
end

Then /^click extra services form 3811$/ do
  step 'expect form 3811 modal is not present'
  SdcMail.modals.extra_services.form_3811.click
  step 'expect form 3811 modal is present'
end

Then /^click extra services label 200$/ do
  step 'expect label 200 modal is not present'
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  extra_services.label_200_or_200n.click
  step 'expect label 200 modal is present'
end

Then /^expect restricted delivery on extra services modal is is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.safe_wait_until_present(timeout: 1)
  expect(extra_services.restricted_delivery.present?).to be true
end

Then /^expect extra services return receipt is present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.present?).to be(true)
end

Then /^expect extra services return receipt is not present$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.present?).to be(false)
end

Then /^expect extra services return receipt is checked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.checked?).to be true
end

Then /^expect extra services return receipt is unchecked$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.checked?).not_to be false
end

Then /^expect extra services return receipt is disabled$/ do
  extra_services = SdcMail.modals.extra_services
  extra_services.window.wait_until_present(timeout: 5)
  expect(extra_services.return_receipt.class_disabled?).to be false
end

Then /^expect extra services return receipt price to be (\d*.?\d+)$/ do |str|
  extra_services = SdcMail.modals.extra_services
  extra_services.return_receipt_cost.wait_until_present(timeout: 5)
  result = extra_services.return_receipt_cost.text_value.parse_digits.to_f.round(2)
  expect(result).to eql(str.to_f.round(2))
end




