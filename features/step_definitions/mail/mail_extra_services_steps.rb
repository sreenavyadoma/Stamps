Then /^blur out on extra services form$/ do
  SdcMail.modals.extra_services.total.blur_out
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
  SdcMail.modals.extra_services.cod_price.wait_until_present(timeout: 10)
  expect(SdcMail.modals.extra_services.cod_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^expect extra services save button is present$/ do
  expect(SdcMail.modals.extra_services.save).to be_present
end

Then /^save extra services$/ do
  step 'expect extra services modal is present'
  SdcMail.modals.extra_services.save.click
  step 'expect extra services modal is not present'
end

Then /^expect extra services modal is present$/ do
  expect(SdcMail.modals.extra_services.title).to be_present
end

Then /^expect extra services modal is not present$/ do
  expect(SdcMail.modals.extra_services.title).not_to be_present
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  SdcMail.modals.extra_services.x_btn.click
  step 'expect extra services modal is not present'
end

Then  /^expect extra services security is present$/ do |value|
  expect(SdcMail.modals.extra_services.security.drop_down).to be_present
  expect(SdcMail.modals.extra_services.security.text_field).to be_present
end

Then /^set extra services security to (.*)$/ do |value|
  security = SdcMail.modals.extra_services.security
  security.selection_element('selection', value)
  security.drop_down.click unless security.selection.present?
  expect(security.selection).to be_present, "#{value} is not present in Extra Services Security list"
  security.selection.click
  # expect(security.text_field.text_value).to include(value)
end

Then /^expect extra services security is (.*)$/ do |value|
  expect(SdcMail.modals.extra_services.security.text_field.text_value).to eql(value)
end

Then /^expect value must be shown modal is present$/ do
  expect(SdcMail.modals.value_must_be_shown.title).to be_present
end

Then /^expect value must be shown modal is not present$/ do
  expect(SdcMail.modals.value_must_be_shown.title).not_to be_present
end

Then /^click value must be shown window continue button$/ do
  step 'expect value must be shown modal is present'
  SdcMail.modals.value_must_be_shown.continue.click
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

Then /^expect extra services security price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.security_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.security_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

# why we need this?
Then /^expect extra services security value is enabled$/ do
  expect(SdcMail.print_form.advanced_options.extra_services.value.enabled?).to be_truthy
end

Then /^set extra services security value to (\d*.?\d+)$/ do |value|
  SdcMail.modals.extra_services.value.set(value)
end

Then /^increment extra services security value by (\d+)$/ do |value|
  price = SdcMail.modals.extra_services.value.text_value.to_f
  value.times do
    SdcMail.modals.extra_services.value.increment.click
  end
  step "expect extra services security value is #{price + value.to_f}"
end

Then /^decrement extra services security value by (\d+)$/ do |value|
  price = SdcMail.modals.extra_services.value.text_value.to_f
  value.times do
    SdcMail.modals.extra_services.value.decrement.click
  end
  step "expect extra services security value is #{price - value.to_f}"
end

Then /^expect extra services security value is (\d*.?\d+)$/ do |value|
  expect(SdcMail.modals.extra_services.value.text_value.to_f).to eql(value.to_f)
end

Then /^set extra services handling to (.*)$/ do |str|
  handling = SdcMail.modals.extra_services.handling
  handling.selection_element("selection", str)
  handling.drop_down.click
  expect(handling.selection).to be_present
  handling.selection.click
end

Then /^expect extra services handling is (.*)$/ do |str|
  expect(SdcMail.modals.extra_services.handling.text_field.text_value).to eql(str)
end

Then /^check extra services modal return receipt$/ do
  SdcMail.modals.extra_services.return_receipt.check unless SdcMail.modals.extra_services.return_receipt.checked?
  step 'expect extra services modal return receipt is checked'
end

Then /^uncheck extra services modal return receipt$/ do
  SdcMail.modals.extra_services.return_receipt.uncheck if SdcMail.modals.extra_services.return_receipt.checked?
  step 'expect extra services modal return receipt is unchecked'
end

Then /^expect extra services modal return receipt is checked$/ do
  expect(SdcMail.modals.extra_services.return_receipt.checked?).to be_truthy
end

Then /^expect extra services modal return receipt is unchecked$/ do
  expect(SdcMail.modals.extra_services.return_receipt.checked?).not_to be_truthy
end

Then /^expect extra services modal return receipt price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.return_receipt_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.return_receipt_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services modal restricted delivery$/ do
  SdcMail.modals.extra_services.restricted_delivery.check unless SdcMail.modals.extra_services.restricted_delivery.checked?
  step 'expect extra services modal restricted delivery is checked'
end

Then /^uncheck extra services modal restricted delivery$/ do
  SdcMail.modals.extra_services.restricted_delivery.uncheck if SdcMail.modals.extra_services.restricted_delivery.checked?
  step 'expect extra services modal restricted delivery is unchecked'
end

Then /^expect extra services modal restricted delivery is checked$/ do
  expect(SdcMail.modals.extra_services.restricted_delivery.checked?).to be(true)
end

Then /^expect extra services modal restricted delivery is unchecked$/ do
  expect(SdcMail.modals.extra_services.restricted_delivery.checked?).to be(false)
end

Then /^expect extra services modal restricted delivery price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.restricted_delivery_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.restricted_delivery_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services notice of non-delivery$/ do
  SdcMail.modals.extra_services.notice_non_delivery.check unless SdcMail.modals.extra_services.notice_non_delivery.checked?
  step 'expect extra services notice of non-delivery is checked'
end

Then /^uncheck extra services notice of non-delivery$/ do
  SdcMail.modals.extra_services.notice_non_delivery.uncheck if SdcMail.modals.extra_services.notice_non_delivery.checked?
  step 'expect extra services notice of non-delivery is unchecked'
end

Then /^expect extra services notice of non-delivery is checked$/ do
  expect(SdcMail.modals.extra_services.notice_non_delivery.checked?).to be(true)
end

Then /^expect extra services notice of non-delivery is unchecked$/ do
  expect(SdcMail.modals.extra_services.notice_non_delivery.checked?).to be(false)
end

Then /^expect extra services notice of non-delivery price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.notice_non_delivery_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.notice_non_delivery_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services fragile$/ do
  SdcMail.modals.extra_services.fragile.check unless SdcMail.modals.extra_services.fragile.checked?
  step 'expect extra services fragile is checked'
end

Then /^uncheck extra services fragile$/ do
  SdcMail.modals.extra_services.fragile.uncheck if SdcMail.modals.extra_services.fragile.checked?
  step 'expect extra services fragile is unchecked'
end

Then /^expect extra services fragile is checked$/ do
  expect(SdcMail.modals.extra_services.fragile.checked?).to be(true)
end

Then /^expect extra services fragile is unchecked$/ do
  expect(SdcMail.modals.extra_services.fragile.checked?).to be(false)
end

Then /^expect extra services fragile price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.fragile_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.fragile_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services return receipt for merchandise$/ do
  SdcMail.modals.extra_services.return_receipt_merchandise.check unless SdcMail.modals.extra_services.return_receipt_merchandise.checked?
  step 'expect extra services return receipt for merchandise is checked'
end

Then /^uncheck extra services return receipt for merchandise$/ do
  SdcMail.modals.extra_services.return_receipt_merchandise.uncheck if SdcMail.modals.extra_services.return_receipt_merchandise.checked?
  step 'expect extra services return receipt for merchandise is unchecked'
end

Then /^expect extra services return receipt for merchandise is checked$/ do
  expect(SdcMail.modals.extra_services.return_receipt_merchandise.checked?).to be(true)
end

Then /^expect extra services return receipt for merchandise is unchecked$/ do
  expect(SdcMail.modals.extra_services.return_receipt_merchandise.checked?).to be(false)
end

Then /^check extra services non-rectangular$/ do
  SdcMail.modals.extra_services.non_rectangular.check unless SdcMail.modals.extra_services.non_rectangular.checked?
  step 'expect extra services non-rectangular is checked'
end

Then /^uncheck extra services non-rectangular$/ do
  SdcMail.modals.extra_services.non_rectangular.uncheck if SdcMail.modals.extra_services.non_rectangular.checked?
  step 'expect extra services non-rectangular is unchecked'
end

Then /^expect extra services non-rectangular is checked$/ do
  expect(SdcMail.modals.extra_services.non_rectangular.checked?).to be(true)
end

Then /^expect extra services non-rectangular is unchecked$/ do
  expect(SdcMail.modals.extra_services.non_rectangular.checked?).to be(false)
end

Then /^expect extra services total price to be (\d*.?\d+)$/ do |expectation|
  expect(SdcMail.modals.extra_services.total.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services hold for pickup$/ do
  SdcMail.modals.extra_services.hold_pickup.check unless SdcMail.modals.extra_services.hold_pickup.checked?
  step 'expect extra services hold for pickup is checked'
end

Then /^uncheck extra services hold for pickup$/ do
  SdcMail.modals.extra_services.hold_pickup.uncheck if SdcMail.modals.extra_services.hold_pickup.checked?
  step 'expect extra services hold for pickup is unchecked'
end

Then /^expect extra services hold for pickup is checked$/ do
  expect(SdcMail.modals.extra_services.hold_pickup.checked?).to be(true)
end

Then /^expect extra services hold for pickup is unchecked$/ do
  expect(SdcMail.modals.extra_services.hold_pickup.checked?).to be(false)
end

Then /^expect extra services hold for pickup price to be (\d*.?\d+)$/ do |expectation|
  expect(SdcMail.modals.extra_services.hold_pickup_price.text_value.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^click extra services form 3811$/ do
  step 'expect form 3811 modal is not present'
  SdcMail.modals.extra_services.form_3811.click
  step 'expect form 3811 modal is present'
end

Then /^click extra services label 200$/ do
  step 'expect label 200 modal is not present'
  SdcMail.modals.extra_services.label_200.click
  step 'expect label 200 modal is present'
end

Then /^check extra services do not deliver on saturday$/ do
  SdcMail.modals.extra_services.do_not_deliver_saturday.check unless SdcMail.modals.extra_services.hold_pickup.checked?
  step 'expect extra services do not deliver on saturday is checked'
end

Then /^uncheck extra services do not deliver on saturday$/ do
  SdcMail.modals.extra_services.do_not_deliver_saturday.uncheck if SdcMail.modals.extra_services.hold_pickup.checked?
  step 'expect extra services do not deliver on saturday is unchecked'
end

Then /^expect extra services do not deliver on saturday is checked$/ do
  expect(SdcMail.modals.extra_services.do_not_deliver_saturday.checked?).to be(true)
end

Then /^expect extra services do not deliver on saturday is unchecked$/ do
  expect(SdcMail.modals.extra_services.do_not_deliver_saturday.checked?).to be(false)
end

Then /^expect extra services do not deliver on saturday price to be (\d*.?\d+)$/ do |expectation|
  expect(SdcMail.modals.extra_services.do_not_deliver_saturday_price.text_value.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services odd shaped\/non-machinable$/ do
  SdcMail.modals.extra_services.odd_shaped.check unless SdcMail.modals.extra_services.odd_shaped.checked?
  step 'expect extra services odd shaped/non-machinable is checked'
  step 'hover on extra services odd shaped/non-machinable tooltip'
end

Then /^uncheck extra services odd shaped\/non-machinable$/ do
  SdcMail.modals.extra_services.odd_shaped.uncheck if SdcMail.modals.extra_services.odd_shaped.checked?
  step 'expect extra services odd shaped/non-machinable is unchecked'
  step 'hover on extra services odd shaped/non-machinable tooltip'
end

Then /^expect extra services odd shaped\/non-machinable is checked$/ do
  expect(SdcMail.modals.extra_services.odd_shaped.checked?).to be(true)
end

Then /^expect extra services odd shaped\/non-machinable is unchecked$/ do
  expect(SdcMail.modals.extra_services.odd_shaped.checked?).to be(false)
end

Then /^expect extra services odd shaped\/non-machinable price to be (\d*.?\d+)$/ do |expectation|
  expect(SdcMail.modals.extra_services.odd_shaped_price.text_value.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^hover on extra services odd shaped\/non-machinable tooltip$/ do
  SdcMail.modals.extra_services.odd_shaped_tooltip.hover if SdcMail.modals.extra_services.odd_shaped_tooltip.present?
end

Then /^[Cc]lick [Cc]ontinue in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  pending #stamps.mail.mail_toolbar.hidden_postage_warning.continue
end

Then /^[Cc]lick [Cc]ancel in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  pending #stamps.mail.mail_toolbar.hidden_postage_warning.cancel
end

Then /^[Ee]xpect [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal appears due to [Ee]xtra [Ss]ervice (.*)$/ do |service|
  pending #expect(stamps.mail.mail_toolbar.hidden_postage_warning.present?).to be(true)
  #expect(stamps.mail.mail_toolbar.hidden_postage_warning.extra_service(service).present?).to be(true)
end


Then /^expect extra services electronic return receipt is present$/ do
  expect(SdcMail.print_form.advanced_options.electronic_return_receipt).to be_present
end

Then /^check extra services electronic return receipt$/ do
  SdcMail.print_form.advanced_options.electronic_return_receipt.check  unless SdcMail.print_form.electronic_return_receipt.checked?
  step 'expect extra services electronic return receipt is checked'
end

Then /^uncheck extra services electronic return receipt$/ do
  SdcMail.print_form.advanced_options.electronic_return_receipt.uncheck  if SdcMail.print_form.electronic_return_receipt.checked?
  step 'expect extra services electronic return receipt is unchecked'
end

Then /^expect extra services electronic return receipt is checked$/ do
  expect(SdcMail.print_form.advanced_options.electronic_return_receipt.checked?).to be(true)
end

Then /^expect extra services electronic return receipt is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.electronic_return_receipt.checked?).to be(false)
end

Then /^expect extra services restricted delivery is is present$/ do
  expect(SdcMail.print_form.advanced_options.restricted_delivery).to be_present
end

Then /^check extra services restricted delivery$/ do
  step 'blur out on print form'
  SdcMail.print_form.advanced_options.restricted_delivery.check unless SdcMail.print_form.advanced_options.restricted_delivery.checked?
  step 'expect extra services restricted delivery is checked'
end

Then /^uncheck extra services restricted delivery$/ do
  step 'blur out on print form'
  SdcMail.print_form.advanced_options.restricted_delivery.uncheck if SdcMail.print_form.advanced_options.restricted_delivery.checked?
  step 'expect extra services restricted delivery is unchecked'
end

Then /^expect extra services restricted delivery is checked$/ do
  expect(SdcMail.print_form.advanced_options.restricted_delivery.checked?).to be(true)
end

Then /^expect extra services restricted delivery is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.restricted_delivery.checked?).to be(false)
end

Then /^expect extra services restricted delivery price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.print_form.advanced_options.restricted_delivery_price.wait_until_present(timeout: 5)
  expect(SdcMail.print_form.advanced_options.restricted_delivery_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^expect extra services return receipt is present$/ do
  expect(SdcMail.print_form.advanced_options.return_receipt).to be_present
end

Then /^expect extra services return receipt is not present$/ do
  expect(SdcMail.print_form.advanced_options.return_receipt).not_to be_present
end

Then /^check extra services return receipt$/ do
  step 'blur out on print form'
  SdcMail.print_form.advanced_options.return_receipt.check unless SdcMail.print_form.advanced_options.return_receipt.checked?
  step 'expect extra services return receipt is checked'
end

Then /^uncheck extra services return receipt$/ do
  step 'blur out on print form'
  SdcMail.print_form.advanced_options.return_receipt.uncheck if SdcMail.print_form.return_receipt.checked?
  step 'expect extra services return receipt is unchecked'
end

Then /^expect extra services return receipt is checked$/ do
  expect(SdcMail.print_form.advanced_options.return_receipt.checked?).to be_truthy
end

Then /^expect extra services return receipt is unchecked$/ do
  expect(SdcMail.print_form.advanced_options.return_receipt.checked?).not_to be_truthy
end

Then /^expect extra services return receipt is disabled$/ do
  expect(SdcMail.print_form.advanced_options.return_receipt.class_disabled?).not_to be_truthy
end

Then /^expect extra services return receipt price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.print_form.advanced_options.return_receipt_price.wait_until_present(timeout: 5)
  expect(SdcMail.print_form.advanced_options.return_receipt_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end


Then /^expect extra services certified mail is checked$/ do
  expect(SdcMail.print_form.advanced_options.certified_mail.checked?).to be_truthy
end

Then /^expect extra services certified mail is present$/ do
  expect(SdcMail.print_form.advanced_options.certified_mail).to be_present
end

Then /^expect extra services certified mail is disabled$/ do
  expect(SdcMail.print_form.advanced_options.certified_mail.class_disabled?).to be_truthy
end







