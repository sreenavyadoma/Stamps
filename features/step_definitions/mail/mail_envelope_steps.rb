

Then /^Mail Envelopes: Set service to (.*)$/ do |service|
  stamps.mail.service.select service
end

Then /^Mail Envelopes: Select service First-Class Mail Letter$/ do
  step "Mail Envelopes: Set service to First-Class Mail Letter"
end

Then /^Mail Envelopes: Set Include Return Address to Checked$/ do
  stamps.mail.envelope.form_view.include_return_address.check
  step "Mail Envelopes: Expect Include Return Address is checked"
end

Then /^Mail Envelopes: Expect Include Return Address is checked$/ do
  expect(stamps.mail.envelope.form_view.include_return_address.checked?).to be true
end

Then /^Mail Envelopes: Set Include Return Address to Unchecked$/ do
  stamps.mail.envelope.form_view.include_return_address.uncheck
end

Then /^Mail Envelopes: Set Include Delivery Address to Checked$/ do
  stamps.mail.envelope.form_view.include_delivery_address.check
end

Then /^Mail Envelopes: Set Include Delivery Address to Unchecked$/ do
  stamps.mail.envelope.form_view.include_delivery_address.uncheck
end

Then /^Mail Envelopes: Set Include Postage to Checked$/ do
  stamps.mail.envelope.form_view.include_postage.check
end

Then /^Mail Envelopes: Set Include Postage to Unchecked$/ do
  stamps.mail.envelope.form_view.include_postage.uncheck
end

Then /^Mail Envelopes: Set Reference Number to (.*)/ do |ref_no|
  stamps.mail.envelope.form_view.reference_number.set ref_no
end

Then /^Mail Envelopes: Set Cost Code to (.*)/ do |code|
  stamps.mail.envelope.form_view.cost_code.select code
end

