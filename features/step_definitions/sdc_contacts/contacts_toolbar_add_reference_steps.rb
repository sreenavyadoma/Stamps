Then /^Set Reference Number to (.*)$/ do |value|
  ref = SdcContacts.reference_message_box
  ref.reference_num.set(value)
  p 'value: '+ value
end

Then /^Click on Close Reference Save Button$/ do
  ref = SdcContacts.reference_message_box
  ref.close.click
end

Then /^Click on Add Reference Save Button$/ do
  ref = SdcContacts.reference_message_box
  ref.save_button.click
end

Then /^[Ee]xpect [Rr]eference [Nn]umber [Ee]rror [Ii]s [Dd]isplayed$/ do
  ref = SdcContacts.reference_message_box
  ref.reference_error.wait_until_present(timeout:5)
  p 'availability :'
  p ref.reference_error.present?
  expect(ref.reference_error.present?).to be(true)
end

Then /^[Ee]xpect [Rr]eference [Nn]umber [Ee]rror [Ii]s [Nn]ot [Dd]isplayed$/ do
  ref = SdcContacts.reference_message_box
  p 'availability :'
  p ref.reference_error.present?
  expect(ref.reference_error.present?).to be(false)
end


