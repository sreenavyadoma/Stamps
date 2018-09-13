
# common Print form steps for Envelope|Label|Roll|CM

Then /^set print form mail-to (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |str|
  address = TestHelper.address_helper(str)
  SdcMail.print_form.mail_to.text_area.set(address)
  TestData.hash[:address] = address
end

Then /^select from print form mail-to text area (.+), (.+)$/ do |name, company|
  step 'blur out on print form'
  mail_to = SdcMail.print_form.mail_to
  selection = mail_to.list_of_values(name, company)
  # add
  15.times do
    mail_to.text_area.set(name)
    mail_to.text_area.click
    mail_to.text_area.click
    selection.safe_wait_until_present(timeout: 3)
    selection.safe_click if selection.present?
    #break if mail_to.text_area.text_value.include?(company)
    break if mail_to.add.present?
  end
  expect(mail_to.add.present?).to be(true)
end

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

Then /^expect invalid contact selected modal is present$/ do
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  expect(invalid_contact.title.text.strip).to eql 'Invalid Contact Selected'
end

Then /^expect error message on invalid contact selected modal is (.*)$/ do |str|
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  expect(invalid_contact.body.text.strip).to eql str
end

Then /^click close button on invalid contact selected modal$/ do
  invalid_contact = SdcMail.modals.invalid_contact_selected
  invalid_contact.window.safe_wait_until_present(timeout: 3)
  10.times do
    if invalid_contact.title.present?
      invalid_contact.close_buttons.each { |button| SdcElement.new(button).safe_click }
    else
      break
    end
  end
end

Then /^expect mail-to add address email is (.*)$/ do |str|
  str ||= TestData.hash[:mail_to_add_address_email]
  add_address = SdcMail.modals.add_address
  expect(add_address.window.present?).to be(true)
  expect(add_address.email.text_value).to eql(str)
end

Then /^click mail-to add button$/ do
  step 'blur out on print form'
  mail_to = SdcMail.print_form.mail_to
  add_address = SdcMail.modals.add_address
  5.times do
    mail_to.add.safe_click
    break if add_address.window.present?
  end
  expect(add_address.title.text).to eql('Add Address')
end

Then /^select from mail-to add address text area (.+), (.+)$/ do |name, company|
  add_address = SdcMail.modals.add_address
  selection = add_address.list_of_values(name, company)
  # add
  15.times do
    add_address.text_area.set(name)
    add_address.text_area.click
    add_address.text_area.click
    selection.safe_wait_until_present(timeout: 3)
    selection.safe_click if selection.present?
    break if add_address.text_area.text_value.include?(company)
  end

end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^click print form mail to link$/ do
  SdcMail.print_form.mail_to.link.click
  step 'expect search contacts modal is present'
end

Then /^set print form email tracking (.+)$/ do |value|
  SdcMail.print_form.email_tracking.text_field.set(value)
  expect(SdcMail.print_form.email_tracking.text_field.text_value).to eql(value)
end

Then /^set print form insure for to \$(.+)$/ do |value|
  insure_for = SdcMail.print_form.insure_for
  insure_for.insurance.set(value)
  insure_for.insurance.safe_click
  step 'click through insurance terms and conditions'
  expect(insure_for.insurance.text_value.to_f).to eql(value.to_f)
end

Then /^click through insurance terms and conditions$/ do
  # This is a work around, there's a bug in the code where there are more
  # than one Terms and Conditions modal on top of each other.
  insurance_terms = SdcWebsite.modals.insurance_terms
  insurance_terms.window.safe_wait_until_present(timeout: 3)
  10.times do
    if insurance_terms.title.present?
      window_title = 'Stamps.com Insurance Terms and Conditions'
      expect(insurance_terms.title.text).to eql window_title
      insurance_terms.i_agree_btns.each { |button| SdcElement.new(button).safe_click }
    else
      break
    end
  end
end

Then /^set print form tracking (.+)$/ do |value|
  step 'wait for js to stop'
  tracking = SdcMail.print_form.tracking
  tracking.tracking_element(name: "selection", value: value)
  tracking.drop_down.click unless tracking.selection.present?
  expect(tracking.selection).to be_present, "#{value} is not present in Tracking list"
  tracking.selection.click
  expect(tracking.text_field.text_value).to include(value)
end