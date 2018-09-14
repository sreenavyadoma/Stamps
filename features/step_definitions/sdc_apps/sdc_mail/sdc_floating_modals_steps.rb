
Then /^set address on add address modal to (.+)$/ do |str|
  address = TestHelper.address_helper(str)
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  add_address.address.set!(address)
  add_address.address_label.blur_out
  add_address.email_label.blur_out
  TestData.hash[:add_address_address] = address
end

Then /^click cancel on add address modal$/ do
  add_address = SdcMail.modals.add_address
  3.times do
    add_address.cancel.safe_click
    break unless add_address.window.present?
  end
end

Then /^click ok on add address modal$/ do
  add_address = SdcMail.modals.add_address
  3.times do
    add_address.ok.safe_click
    break unless add_address.window.present?
  end
end

Then /^set email on add address modal to (.*)$/ do |str|
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  add_address.email.set(str)
  expect(add_address.email.text_value).to eql(str)
  TestData.hash[:add_address_email] = str
end

Then /^expect incomplete fields modal is not present$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 3)
  if incomplete_fields.window.present?
    expect(incomplete_fields.body.text).to eql('')
  end
end

Then /^expect incomplete fields modal is present$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 10)
  expect(incomplete_fields.window.present?).to be true
  expect(incomplete_fields.title.text.strip).to eql('Incomplete Fields')
end

Then /^expect error message on incomplete fields modal includes (.*)$/ do |str|
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 4)
  expect(incomplete_fields.window.present?).to be_truthy
  expect(incomplete_fields.error_message.text_value.strip).to include str
end

Then /^click close button on incomplete fields$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  3.times do
    incomplete_fields.close.safe_click
    break unless incomplete_fields.window.present?
  end
  expect(incomplete_fields.window.present?).to be(false)
end