
# common Print form steps for Envelope|Label|Roll|CM

Then /^set print form mail-to (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |str|
  address = TestHelper.address_helper(str)
  mail_to = SdcMail.print_form.mail_to
  5.times do
    mail_to.text_area.set(address)
    step 'blur out on print form'
    sleep 1
    break if mail_to.add.present?
  end

  step 'blur out on print form'
  TestData.hash[:address] = address
end

Then /^select address from print form mail-to (.+), (.+)$/ do |name, company|
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

Then /^click add address button on print form$/ do
  step 'blur out on print form'
  mail_to = SdcMail.print_form.mail_to
  statusbar = SdcMail.statusbar
  add_address = SdcMail.modals.add_address
  5.times do
    mail_to.add.safe_click
    statusbar.total.blur_out
    break if add_address.window.present?
  end
  expect(add_address.title.text).to eql('Add Address')
end

Then /^select address from add address modal (.+), (.+)$/ do |name, company|
  add_address = SdcMail.modals.add_address
  invalid_contact = SdcMail.modals.invalid_contact_selected
  5.times do
    add_address.address.set(name)
    add_address.address.click
    add_address.address.click
    selection = add_address.list_of_values(name, company)
    selection.safe_wait_until_present(timeout: 3)
    selection.safe_click if selection.present?
    break if invalid_contact.window.present?
    break if add_address.address.text_value.include?(company)
  end

end

Then /^expect selected contacts count is (.+)$/ do |str|
  add_address = SdcMail.modals.add_address
  add_address.selected_contacts_count.wait_until_present(timeout: 5)
  expect(add_address.selected_contacts_count.text.parse_digits.to_i).to eql str.to_i
end




Then /^[Ee]xpect Print form Mail To is disabled$/ do
  pending
  #expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^click print form mail to link$/ do
  SdcMail.print_form.mail_to.link.click
  step 'expect search contacts modal is present'
end

Then /^set print form email tracking(?:| (.+))$/ do |str|
  str ||= TestHelper.rand_email
  email_tracking = SdcMail.print_form.email_tracking
  email_tracking.text_field.set(str)
  expect(email_tracking.text_field.text_value).to eql(str)
  TestData.hash[:email_tracking] = str
end

Then /^set print form insure for to \$(.+)$/ do |str|
  insure_for = SdcMail.print_form.insure_for
  insure_for.insurance.set(str)
  insure_for.insurance.safe_click
  step 'click through insurance terms and conditions'
  expect(insure_for.insurance.text_value.to_f).to eql(str.to_f)
  TestData.hash[:insure_for] = str
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