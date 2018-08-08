Then /^[Aa]dd [Nn]ew [Cc]ontact [Ff]orm [Cc]ontacts [Dd]etail [Pp]anel$/ do

end

Then /^set contact details name to (.*)$/ do |str|
  SdcContacts.contacts_detail.name.set(str)
end

Then /^set contact details company to (.*)$/ do |str|
  SdcContacts.contacts_detail.company.set(str)
end

Then /^set contact details country to (.*)$/ do |str|
  country = SdcContacts.contacts_country
  country.selection_country(value: str)
  country.drop_down.click unless country.selection.present?
  country.text_field.set(str)
  country.selection.safe_click
  expect(country.text_field.text_value).to include(str)
end


Then /^set contact details street address to (.*)$/ do |str|
  SdcContacts.contacts_detail.street_address.send_keys(str)
end

Then /^set contact details city to (.*)$/ do |str|
  SdcContacts.contacts_detail.city.set(str)
end

Then /^set contact details state to (.*)$/ do |str|
  state = SdcContacts.contacts_state
  state.selection_state(value: str)
  state.drop_down.click unless state.selection.present?
  state.text_field.set(str)
  state.selection.click
  expect(state.text_field.text_value).to include(str)
end

Then /^set contact details Province to (.*)$/ do |str|
  SdcContacts.contacts_detail.province.set(str)
end

Then /^set contact details postal code to (.*)$/ do |str|
  SdcContacts.contacts_detail.postal_code.set(str)
end

Then /^set contact details email to (.*)$/ do |str|
  SdcContacts.contacts_detail.email.set(str)
  SdcContacts.contacts_detail.phone.click
  #SdcContacts.contacts_detail.email.set(str)
  #SdcContacts.contacts_detail.email.title.click
  end

Then /^set contact details phone to (.*)$/ do |str|
  SdcContacts.contacts_detail.phone.set(str)
end

Then /^set contact details phone extension to (.*)$/ do |str|
  SdcContacts.contacts_detail.phone_ext.set(str)
end

Then /^set contact details groups to (.*)$/ do |str|
  group = SdcContacts.contacts_group
  group.selection_group(value: str)
  group.drop_down.click unless group.selection.present?
  group.text_field.set(str)
  group.selection.safe_click
  #expect(group.text_list.text_value).to include(str)
end

Then /^set contact details reference number to (.*)$/ do |str|
  SdcContacts.contacts_detail.reference_number.set(str)
end

Then /^set contact details cost code to (.*)$/ do |str|
  cost_code = SdcContacts.contacts_cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
end

Then /^expect email error is displayed$/ do
  error= SdcContacts.contacts_email_error.email_error
  error.eql("true")
end