
Then /^expect incomplete fields modal is not present$/ do
  incomplete_fields = SdcMail.modals.incomplete_fields
  incomplete_fields.window.safe_wait_until_present(timeout: 3)
  if incomplete_fields.window.present?
    expect(incomplete_fields.body.text).to eql('')
  end
end