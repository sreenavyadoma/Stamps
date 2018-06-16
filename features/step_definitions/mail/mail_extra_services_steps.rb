Then /^expect extra services cod is present$/ do
  expect(SdcMail.modals.extra_services.cod).to be_present, "COD is not present!"
end

Then /^set extra services cod to (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  SdcMail.modals.extra_services.cod.set(amount)
  step "expect extra services cod value is #{amount}"
end

Then /^increment extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.increment.click
  end
  step "expect extra services cod value is #{cod_value+amount.to_f}"
end

Then /^decrement extra services cod by (\d+)$/ do |amount|
  step 'expect extra services cod is present'
  cod_value = SdcMail.modals.extra_services.cod.value.to_f
  amount.times do
    SdcMail.modals.extra_services.cod.decrement.click
  end
  step "expect extra services cod value is #{cod_value-amount.to_f}"
end

Then /^expect extra services cod value is (\d*.?\d+)$/ do |amount|
  step 'expect extra services cod is present'
  expect(SdcMail.modals.extra_services.cod.value.to_f).to eql(amount.to_f)
end

Then /^expect extra services cod price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.cod_price.wait_until_present(timeout: 10)
  expect(SdcMail.modals.extra_services.cod_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^expect extra services save button is present$/ do
  expect(SdcMail.modals.extra_services.save).to be_present, "Extra Services Save button is not present"
end

Then /^save extra services$/ do
  step 'expect extra services modal is present'
  SdcMail.modals.extra_services.save.click
  step 'expect extra services modal is not present'
end

Then /^expect extra services modal is present$/ do
  expect(SdcMail.modals.extra_services.title).to be_present, "Extra services modal is not present"
end

Then /^expect extra services modal is not present$/ do
  expect(SdcMail.modals.extra_services.title).not_to be_present, "Extra services modal is still present"
end

Then /^close extra services$/ do
  step 'expect extra services modal is present'
  SdcMail.modals.extra_services.x_btn.click
  step 'expect extra services modal is not present'
end

Then  /^expect extra services security is present$/ do |value|
  expect(SdcMail.modals.extra_services.security.drop_down).to be_present, "Extra services security drop down is not present!"
  expect(SdcMail.modals.extra_services.security.text_field).to be_present, "Extra services security text field is not present!"
end

Then /^set extra services security to (.*)$/ do |value|
  security = SdcMail.modals.extra_services.security
  security.selection_element(name: 'selection', value: value)
  security.drop_down.click unless security.selection.present?
  expect(security.selection).to be_present, "#{value} is not present in Extra Services Security list"
  security.selection.click
  expect(security.text_field.text_value).to include(value)
end

Then /^expect extra services security is (.*)$/ do |value|
  expect(SdcMail.modals.extra_services.security.text_field.text_value).to eql(value)
end

Then /^expect value must be shown modal is present$/ do
  expect(SdcMail.modals.value_must_be_shown.title).to be_present, "Value Must be shown modal is not present"
end

Then /^expect value must be shown modal is not present$/ do
  expect(SdcMail.modals.value_must_be_shown.title).not_to be_present, "Value Must be shown modal is still present"
end

Then /^click value must be shown window continue button$/ do
  step 'expect value must be shown modal is present'
  stamps.mail.print_form.advanced_options.value_must_be_shown.continue.click
end

Then /^expect special contents warning modal is present$/ do
  expect(SdcMail.modals.special_contents_warning.title).to be_present, "Special Contents Warning modal is not present"
end

Then /^expect special contents warning modal is not present$/ do
  expect(SdcMail.modals.special_contents_warning.title).not_to be_present, "Special Contents Warning modal is still present"
end

Then /^click special contents warning modal i agree$/ do
  step 'expect special contents warning modal is present'
  SdcMail.modals.special_contents_warning.i_agree.click
  step 'expect special contents warning modal is not present'
end

Then /^expect extra services security price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.security_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.security_price.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

# why we need this?
Then /^expect extra services security value is enabled$/ do
  expect(SdcMail.print_form.advanced_options.extra_services.value.enabled?).to be_truthy, 'Extra services security value is disabled'
end

Then /^set extra services security value to (\d*.?\d+)$/ do |value|
  SdcMail.modals.extra_services.value.set(value)
end

Then /^increment extra services security value by (\d+)$/ do |value|
  price = SdcMail.modals.extra_services.value.value.to_f
  value.times do
    SdcMail.modals.extra_services.value.increment.click
  end
  step "expect extra services security value is #{price + value.to_f}"
end

Then /^decrement extra services security value by (\d+)$/ do |value|
  price = SdcMail.modals.extra_services.value.value.to_f
  value.times do
    SdcMail.modals.extra_services.value.decrement.click
  end
  step "expect extra services security value is #{price - value.to_f}"
end

Then /^expect extra services security value is (\d*.?\d+)$/ do |value|
  expect(SdcMail.modals.extra_services.value.value.to_f).to eql(value.to_f)
end

Then /^set extra services handling to (.*)$/ do |str|
  stamps.mail.print_form.advanced_options.extra_services.handling.select(str)
  handling = SdcMail.modals.extra_services.handling
  handling.selection_element(name: "selection", value: str)
  handling.drop_down.click
  expect(handling.selection).to be_present, "Extra Services Handling selection element is not present in the list"
  handling.selection.click
end

Then /^expect extra services handling is (.*)$/ do |str|
  expect(SdcMail.modals.extra_services.handling.taxt_field.text_value).to eql(str)
end

Then /^check extra services return receipt$/ do
  SdcMail.modals.extra_services.return_receipt.check unless SdcMail.modals.extra_services.return_receipt.checked?
  step 'expect extra services return receipt is checked'
end

Then /^uncheck extra services return receipt$/ do
  SdcMail.modals.extra_services.return_receipt.uncheck if SdcMail.modals.extra_services.return_receipt.checked?
  step 'expect extra services return receipt is unchecked'
end

Then /^expect extra services return receipt is checked$/ do
  expect(SdcMail.modals.extra_services.return_receipt.checked?).to be_truthy, "Extra Services return receipt is not checked"
end

Then /^expect extra services return receipt is unchecked$/ do
  expect(SdcMail.modals.extra_services.return_receipt.checked?).not_to be_truthy, "Extra Services return receipt is still checked"
end

Then /^expect extra services return receipt price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.return_receipt_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.return_receipt_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

Then /^check extra services restricted delivery$/ do
  SdcMail.modals.extra_services.restricted_delivery.check unless SdcMail.modals.extra_services.restricted_delivery.checked?
  step 'expect extra services restricted delivery is checked'
end

Then /^uncheck extra services restricted delivery$/ do
  SdcMail.modals.extra_services.restricted_delivery.uncheck if SdcMail.modals.extra_services.restricted_delivery.checked?
  step 'expect extra services restricted delivery is unchecked'
end

Then /^expect extra services restricted delivery is checked$/ do
  expect(SdcMail.modals.extra_services.restricted_delivery.checked?).to be(true), "Extra Services Restricted Delivery is not checked"
end

Then /^expect extra services restricted delivery is unchecked$/ do
  expect(SdcMail.modals.extra_services.restricted_delivery.checked?).to be(false), "Extra Services Restricted Delivery is still checked"
end

Then /^expect extra services restricted delivery price to be (\d*.?\d+)$/ do |expectation|
  SdcMail.modals.extra_services.restricted_delivery_price.wait_until_present(timeout: 5)
  expect(SdcMail.modals.extra_services.restricted_delivery_price.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end



Then /^check extra services notice of non-delivery$/ do
  SdcMail.modals.extra_services.notice_non_delivery.check unless SdcMail.modals.extra_services.notice_non_delivery.checked?
  step 'expect extra services restricted delivery is checked'
end

Then /^uncheck extra services notice of non-delivery$/ do
  SdcMail.modals.extra_services.notice_non_delivery.uncheck if SdcMail.modals.extra_services.notice_non_delivery.checked?
  step 'expect extra services restricted delivery is unchecked'
end

Then /^expect extra services notice of non-delivery is checked$/ do
  expect(SdcMail.modals.extra_services.notice_non_delivery.checked?).to be(true), "Extra Services Notice of Non Delivery is not checked"
end

Then /^expect extra services notice of non-delivery is unchecked$/ do
  expect(SdcMail.modals.extra_services.notice_non_delivery.checked?).to be(false), "Extra Services Notice of Non Delivery Delivery is still checked"
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
  expect(SdcMail.modals.extra_services.fragile.checked?).to be(true), "Extra Services Fragile is not checked"
end

Then /^expect extra services fragile is unchecked$/ do
  expect(SdcMail.modals.extra_services.fragile.checked?).to be(false), "Extra Services Fragile is still checked"
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



# TODO ON MONDAYYYYYYYYYYY!!!!!!!!!!!!!!!!!!!!!!!
Then /^expect extra services return receipt for merchandise is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_merchandise.checked?).to be(true)
end

Then /^expect extra services return receipt for merchandise is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.return_receipt_merchandise.checked?).to be(false)
end








Then /^[Cc]heck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.check
end

Then /^[Uu]ncheck Extra Services Electronic Return Receipt$/ do
  stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.uncheck
end

Then /^[Ee]xpect [Ee]xtra [Ss]ervices Electronic Return Receipt is checked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.checked?).to be(true)
end

Then /^[Ee]xpect [Ee]xtra [Ss]ervices Electronic Return Receipt is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services.electronic_return_receipt.checked?).to be(false)
end
















Then /^[Cc]heck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.check
end

Then /^[Uu]ncheck Extra Services Non-Rectangular$/ do
  stamps.mail.print_form.advanced_options.extra_services.non_rectangular.uncheck
end

Then /^[Ee]xpect Extra Services Total Price to be (\d*.?\d+)$/ do |expectation|
  20.times do break if stamps.mail.print_form.advanced_options.extra_services.total_price==expectation.to_f.round(2) end
  expect(stamps.mail.print_form.advanced_options.extra_services.total_price).to eql(expectation.to_f.round(2))
end

Then /^[Cc]lick [Cc]ontinue in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  stamps.mail.mail_toolbar.hidden_postage_warning.continue
end

Then /^[Cc]lick [Cc]ancel in [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal$/ do
  stamps.mail.mail_toolbar.hidden_postage_warning.cancel
end

Then /^[Ee]xpect [Hh]idden [Pp]ostage [Nn]ot [Aa]llowed modal appears due to [Ee]xtra [Ss]ervice (.*)$/ do |service|
  expect(stamps.mail.mail_toolbar.hidden_postage_warning.present?).to be(true)
  expect(stamps.mail.mail_toolbar.hidden_postage_warning.extra_service(service).present?).to be(true)
end