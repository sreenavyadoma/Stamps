Then /^[Ss]et [Cc]ontact [Dd]etails [Nn]ame [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name.wait_until_present(timeout: 15)
  contacts_detail.name.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ompany [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.company.wait_until_present(timeout: 15)
  contacts_detail.company.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ountry [Tt]o (.*)$/ do |str|
  country = SdcContacts.contacts_country
  country.selection_country(value: str)
  country.drop_down.click unless country.selection.present?
  country.text_field.set(str)
  country.selection.safe_click
  expect(country.text_field.text_value).to include(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ss]treet [Aa]ddress [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.street_address.wait_until_present(timeout: 15)
  contacts_detail.street_address.send_keys(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ity [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.city.wait_until_present(timeout: 15)
  contacts_detail.city.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ss]tate [Tt]o (.*)$/ do |str|
  state = SdcContacts.contacts_state
  state.selection_state(value: str)
  state.drop_down.click unless state.selection.present?
  state.text_field.set(str)
  state.selection.click
  expect(state.text_field.text_value).to include(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]rovince [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.province.wait_until_present(timeout: 15)
  contacts_detail.province.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]ostal code [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.postal_code.wait_until_present(timeout: 15)
  contacts_detail.postal_code.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ee]mail [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.email.wait_until_present(timeout: 15)
  contacts_detail.email.set(str)
  contacts_detail.phone.click
  #SdcContacts.contacts_detail.email.set(str)
  #SdcContacts.contacts_detail.title.click
  end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]hone to (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.phone.wait_until_present(timeout: 15)
  contacts_detail.phone.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]hone [Ee]xtension [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.phone_ext.wait_until_present(timeout: 15)
  contacts_detail.phone_ext.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Gg]roups [Tt]o (.*)$/ do |str|
  group = SdcContacts.contacts_group
  group.selection_group(value: str)
  group.drop_down.click unless group.selection.present?
  group.text_field.set(str)
  group.selection.safe_click
  #expect(group.text_list.text_value).to include(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Rr]eference [Nn]umber [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.reference_number.wait_until_present(timeout: 15)
  contacts_detail.reference_number.set(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ost [Cc]ode [Tt]o (.*)$/ do |str|
  cost_code = SdcContacts.contacts_cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
end

Then /^expect email error is displayed$/ do
  error= SdcContacts.contacts_email_error.email_error
  error.present?.eql("true")
end

Then /^expect email error is not displayed$/ do
  error= SdcContacts.contacts_email_error.email_error
  error.present?.eql("false")
end
