Then /^[Ii]n Ship Volume Survey page, click Submit button$/ do
  registration.ship_volume_survey.submit
end

Then /^[Ee]xpect header message exists$/ do
  expect(registration.ship_volume_survey.header_message.present?).to be(true), "Message DOES NOT exists on Ship Volume Survey page"
end

Then /^[Ee]xpect Submit button exists$/ do
  expect(registration.ship_volume_survey.submit.present?).to be(true), "submit button DOES NOT exists on Ship Volume Survey page"
end

