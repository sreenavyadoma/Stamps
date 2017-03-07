

Then /^on Envelope form, set Include Return Address to Checked$/ do
  stamps.mail.envelopes.form_view.include_return_address.check
  step "Mail Envelopes: Expect Include Return Address is checked"
end

Then /^Mail Envelopes: Expect Include Return Address is checked$/ do
  expect(stamps.mail.envelopes.form_view.include_return_address.checked?).to be(true)
end

Then /^on Envelope form, set Include Return Address to Unchecked$/ do
  stamps.mail.envelopes.form_view.include_return_address.uncheck
end

Then /^on Envelope form, set Include Delivery Address to Checked$/ do
  stamps.mail.envelopes.form_view.include_delivery_address.check
end

Then /^on Envelope form, set Include Delivery Address to Unchecked$/ do
  stamps.mail.envelopes.form_view.include_delivery_address.uncheck
end

Then /^on Envelope form, set Include Postage to Checked$/ do
  stamps.mail.envelopes.form_view.include_postage.check
end

Then /^on Envelope form, set Include Postage to Unchecked$/ do
  stamps.mail.envelopes.form_view.include_postage.uncheck
end

Then /^on Envelope form, set Reference Number to (.*)$/ do |ref_no|
  stamps.mail.envelopes.form_view.reference_number.set ref_no
end

Then /^on Envelope form, set Cost Code to (.*)$/ do |code|
  stamps.mail.envelopes.form_view.cost_code.select code
end

