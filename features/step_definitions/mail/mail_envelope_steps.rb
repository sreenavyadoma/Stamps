

Then /^on Envelopes Print form, select Envelope - #10, 4 ⅛” x 9 ½”$/ do
  step "on Print form, set Print On to Envelope 10"
end

Then /^on Envelopes Print form, select Envelope - #9, 3 ⅞” x 8 ⅞”$/ do
  step "on Print form, set Print On to Envelope 9"
end

Then /^on Envelopes Print form, select Envelope - #A9, 5 ¾” x 8 ¾”$/ do
  step "on Print form, set Print On to Envelope A9"
end

Then /^on Envelopes Print form, select Envelope - #6, 3 ⅝” x 6 ½”$/ do
  step "on Print form, set Print On to Envelope 6"
end

Then /^on Envelopes Print form, select Envelope - #A2, 4 ⅜” x 5 ¾”$/ do
  step "on Print form, set Print On to Envelope A2"
end

Then /^on Envelopes Print form, select Envelope - #7, 3 ⅞” x 7 ½”$/ do
  step "on Print form, set Print On to Envelope 7"
end

Then /^on Envelopes Print form, select Envelope - #11, 4 ½” x 10 ⅜”$/ do
  step "on Print form, set Print On to Envelope 11"
end

Then /^on Envelopes Print form, select Envelope - #12, 4 ¾” x 11”$/ do
  step "on Print form, set Print On to Envelope 12"
end

Then /^on Envelopes Print form, set service to (.*)$/ do |service|
  stamps.mail.service.select service
end

Then /^on Envelopes Print form, select service First-Class Mail Letter$/ do
  step "on Envelopes Print form, set service to First-Class Mail Letter"
end

Then /^on Envelopes Print form, set Include Return Address to Checked$/ do
  stamps.mail.envelope.form_view.include_return_address.check
  step "Mail Envelopes: Expect Include Return Address is checked"
end

Then /^Mail Envelopes: Expect Include Return Address is checked$/ do
  expect(stamps.mail.envelope.form_view.include_return_address.checked?).to be true
end

Then /^on Envelopes Print form, set Include Return Address to Unchecked$/ do
  stamps.mail.envelope.form_view.include_return_address.uncheck
end

Then /^on Envelopes Print form, set Include Delivery Address to Checked$/ do
  stamps.mail.envelope.form_view.include_delivery_address.check
end

Then /^on Envelopes Print form, set Include Delivery Address to Unchecked$/ do
  stamps.mail.envelope.form_view.include_delivery_address.uncheck
end

Then /^on Envelopes Print form, set Include Postage to Checked$/ do
  stamps.mail.envelope.form_view.include_postage.check
end

Then /^on Envelopes Print form, set Include Postage to Unchecked$/ do
  stamps.mail.envelope.form_view.include_postage.uncheck
end

Then /^on Envelopes Print form, set Reference Number to (.*)/ do |ref_no|
  stamps.mail.envelope.form_view.reference_number.set ref_no
end

Then /^on Envelopes Print form, set Cost Code to (.*)/ do |code|
  stamps.mail.envelope.form_view.cost_code.select code
end

