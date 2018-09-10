Then /^[Ss]et [Rr]eference [Nn]umber [Tt]o (.*)$/ do |value|
  ref = SdcContacts.reference_message_box
  ref.reference_num.wait_until_present(timeout:15)
  ref.reference_num.set(value)
  p 'value: '+ value
end

Then /^[Cc]lick [Oo]n [Aa]dd [Rr]eference [Cc]lose [Bb]utton$/ do
  ref = SdcContacts.reference_message_box
  ref.close.wait_until_present(timeout:15)
  ref.close.click
end

Then /^[Cc]lick [Oo]n [Aa]dd [Rr]eference [Ss]ave [Bb]utton$/ do
  ref = SdcContacts.reference_message_box
  ref.save_button.wait_until_present(timeout:15)
  ref.save_button.click
end

Then /^[Ee]xpect [Rr]eference [Nn]umber [Ee]rror [Ii]s [Dd]isplayed$/ do
  ref = SdcContacts.reference_message_box
  ref.reference_error.wait_until_present(timeout:15)
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


