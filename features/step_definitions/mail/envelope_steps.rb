
Then /^Mail Envelopes: Select Service First-Class Mail Letter$/ do
  step "Mail Envelopes: Set Service to First-Class Mail Letter"
end

Then /^Mail Envelopes: Set Service to (.*)$/ do |service|
  logger.info "Envelopes: Set Print Mail Service to: \n #{service}"
  web_apps.mail.service.select service
end

Then /^Mail Envelopes: Set Include Return Address to Checked$/ do
  logger.info "Mail Shipping Labels: Check Include Return Address"
  web_apps.mail.form_view.include_return_address.check
end

Then /^Mail Envelopes: Set Include Return Address to Unchecked$/ do
  logger.info "Mail Shipping Labels: Uncheck Include Return Address"
  web_apps.mail.form_view.include_return_address.uncheck
end

Then /^Mail Envelopes: Set Include Delivery Address to Checked$/ do
  logger.info "Mail Shipping Labels: Check Include Delivery Address"
  web_apps.mail.form_view.include_delivery_address.check
end

Then /^Mail Envelopes: Set Include Delivery Address to Unchecked$/ do
  logger.info "Mail Shipping Labels: Uncheck Include Delivery Address"
  web_apps.mail.form_view.include_delivery_address.uncheck
end

Then /^Mail Envelopes: Set Include Mail to Checked$/ do
  logger.info "Mail Shipping Labels: Check Include Postage"
  web_apps.mail.form_view.include_postage.check
end

Then /^Mail Envelopes: Set Include Mail to Unchecked$/ do
  logger.info "Mail Shipping Labels: Uncheck Include Postage"
  web_apps.mail.form_view.include_postage.uncheck
end

Then /^Mail Envelopes: Set Reference Number to (.*)/ do |ref_no|
  logger.info "Set Envelope Reference Number to #{ref_no}"
  web_apps.mail.form_view.reference_number.set ref_no
end

Then /^Mail Envelopes: Set Cost Code to (.*)/ do |code|
  logger.info "Mail Envelopes: Set Cost Code to \n #{code}"
  web_apps.mail.form_view.cost_code.select code
end

