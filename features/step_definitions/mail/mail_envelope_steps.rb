

Then /^Mail Envelopes: Set service to (.*)$/ do |service|
  logger.step "Envelopes: Set Print Mail service to: \n #{service}"
  stamps.mail.service.select service
end

Then /^Mail Envelopes: Select service First-Class Mail Letter$/ do
  step "Mail Envelopes: Set service to First-Class Mail Letter"
end

Then /^Mail Envelopes: Set Include Return Address to Checked$/ do
  logger.step "Mail Shipping Labels: Check Include Return Address"
  stamps.mail.envelope.form_view.include_return_address.check
  step "Mail Envelopes: Expect Include Return Address is checked"
end

Then /^Mail Envelopes: Expect Include Return Address is checked$/ do
  logger.step "Mail Envelopes: Expect Include Return Address is checked"
  stamps.mail.envelope.form_view.include_return_address.checked?.should be true
end

Then /^Mail Envelopes: Set Include Return Address to Unchecked$/ do
  logger.step "Mail Shipping Labels: Uncheck Include Return Address"
  stamps.mail.envelope.form_view.include_return_address.uncheck
end

Then /^Mail Envelopes: Set Include Delivery Address to Checked$/ do
  logger.step "Mail Shipping Labels: Check Include Delivery Address"
  stamps.mail.envelope.form_view.include_delivery_address.check
end

Then /^Mail Envelopes: Set Include Delivery Address to Unchecked$/ do
  logger.step "Mail Shipping Labels: Uncheck Include Delivery Address"
  stamps.mail.envelope.form_view.include_delivery_address.uncheck
end

Then /^Mail Envelopes: Set Include Postage to Checked$/ do
  logger.step "Mail Shipping Labels: Check Include Postage"
  stamps.mail.envelope.form_view.include_postage.check
end

Then /^Mail Envelopes: Set Include Postage to Unchecked$/ do
  logger.step "Mail Shipping Labels: Uncheck Include Postage"
  stamps.mail.envelope.form_view.include_postage.uncheck
end

Then /^Mail Envelopes: Set Reference Number to (.*)/ do |ref_no|
  logger.step "Set Envelope Reference Number to #{ref_no}"
  stamps.mail.envelope.form_view.reference_number.set ref_no
end

Then /^Mail Envelopes: Set Cost Code to (.*)/ do |code|
  logger.step "Mail Envelopes: Set Cost Code to \n #{code}"
  stamps.mail.envelope.form_view.cost_code.select code
end

