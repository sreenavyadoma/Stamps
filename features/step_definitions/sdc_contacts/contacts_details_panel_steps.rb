Then /^[Ss]et [Cc]ontact [Dd]etails to$/ do |table|

  param = table.hashes.first
  full_name = param['full_name']
  company = param['company']
  country = param['country']
  street_address = param['street_address']
  city = param['city']
  state = param['state']
  postal_code = param['postal_code']
  email = param['email']
  full_phone = param['phone']
  phone_ext = param['phone_ext']
  groups =  param['groups']
  reference_number = param['reference_number']
  cost_code =  param['cost_code']

  if full_name.empty? || full_name.downcase.include?('random')
    full_name = TestHelper.rand_full_name
  end

  if company.empty? || company.downcase.include?('random')
    company = TestHelper.rand_comp_name
  end

  if country.empty? || country.size.zero?
    country = 'United States'
  end

  if street_address && street_address.downcase.include?('random')
    street_address = TestHelper.rand_alpha_numeric(min: 2, max: 7)
  end

#  step "set contact details address to invalid domestic"

  if full_phone.empty? || full_phone.downcase.include?('random')
    full_phone = TestHelper.rand_phone
  end

  if email.empty? || email.downcase.include?('random')
    email = TestHelper.rand_email
  end

  step "set contact details name to #{full_name}"
  step "set contact details company to #{company}"
  step "set contact details country to #{country}"
  step "set contact details Street Address to #{street_address}"
  step "set contact details city to #{city}"
  step "set contact details state to #{state}"
  step "set contact details postal code to #{postal_code}"
  step "set contact details email to #{email}"

  if full_phone.to_s.include? ('-')
    temp = full_phone.to_s.split('-')
    phone=temp[0]
    phone_ext=temp[1]
    step "set contact details phone to #{phone}"
    step "set contact details phone extension to #{phone_ext}"
  else
    step "set contact details phone to #{full_phone}"
  end

  if groups.empty?
    # Do not set value of groups
  else
    step "set contact details groups to #{groups}"
  end

  if reference_number.empty?
    # Do not set value of reference number
    elsif reference_number.downcase.include?('random')
      reference_number = TestHelper.rand_reference_number
      step "set contact details reference number to #{reference_number}"
    else
      step "set contact details reference number to #{reference_number}"
  end

  if cost_code.empty?
    # Do not do anything
  else
    step "set contact details cost code to #{cost_code}"
  end

  TestData.hash[:full_name] = full_name
  TestData.hash[:company] = company
  TestData.hash[:country] = country
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:postal_code] = postal_code
  TestData.hash[:email] = email
  TestData.hash[:full_phone] = full_phone
  TestData.hash[:phone] = phone
  TestData.hash[:phone_ext] = phone_ext
  TestData.hash[:groups] = groups
  TestData.hash[:cost_code] = cost_code
  TestData.hash[:reference_number] = reference_number

end

Then /^[Ss]et [Cc]ontact [Dd]etails [Nn]ame [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name.safe_wait_until_present(timeout: 15)
  contacts_detail.name.set(str)
  contacts_detail.company.click
end

Then /^[Cc]lick [Oo]n [Cc]ontact [Dd]etails [Pp]anel [Nn]ame [Ee]xpand [Bb]utton$/ do
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name_expand.safe_wait_until_present(timeout: 15)
  #contacts_detail.name_expand.flash
  contacts_detail.name_expand.click
end

Then /^[Cc]lick [Oo]n [Cc]ontact [Dd]etails [Pp]anel [Nn]ame [Cc]ollapse [Bb]utton$/ do
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name_collapse.safe_wait_until_present(timeout: 15)
  #contacts_detail.name_collapse.flash
  contacts_detail.name_collapse.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Nn]ame [Pp]refix [Tt]o (.*)$/ do |str|
  name_pre = SdcContacts.contacts_name_prefix
  name_pre.prefix_selection(value: str)
  name_pre.prefix_drop_down.click unless name_pre.selection.present?
  name_pre.prefix_text_field.set(str)
  name_pre.selection.safe_click
  expect(name_pre.prefix_text_field.text_value).to include(str)
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ff]irst[Nn]ame [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.first_name.safe_wait_until_present(timeout: 15)
  contacts_detail.first_name.set(str)
  contacts_detail.middle_name.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Mm]iddle[Nn]ame [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.middle_name.safe_wait_until_present(timeout: 15)
  contacts_detail.middle_name.set(str)
  contacts_detail.last_name.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ll]ast[Nn]ame [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.last_name.safe_wait_until_present(timeout: 15)
  contacts_detail.last_name.set(str)
  contacts_detail.name_suffix.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ss]uffix [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.name_suffix.safe_wait_until_present(timeout: 15)
  contacts_detail.name_suffix.set(str)
  contacts_detail.company.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ompany [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.company.wait_until_present(timeout: 15)
  contacts_detail.company.set(str)
  contacts_detail.street_address.click
end

Then /^[Cc]lick [Oo]n [Cc]ontact [Dd]etails [Pp]anel [Cc]ompany [Ee]xpand [Bb]utton$/ do
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.company_expand.safe_wait_until_present(timeout: 15)
  contacts_detail.company_expand.click
end

Then /^[Cc]lick [Oo]n [Cc]ontact [Dd]etails [Pp]anel [Cc]ompany [Cc]ollapse [Bb]utton$/ do
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.company_collapse.safe_wait_until_present(timeout: 15)
  contacts_detail.company_collapse.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Tt]itle [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.title.safe_wait_until_present(timeout: 15)
  contacts_detail.title.set(str)
  contacts_detail.department.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Dd]epartment [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.department.safe_wait_until_present(timeout: 15)
  contacts_detail.department.set(str)
  contacts_detail.title.click
end

Then /^set contact details address to invalid domestic$/ do |str|

  #case str
  #when 'domestic' ||'invalid domestic'
  #  step "set contact details country to United States"
  #when 'international'
  #  step "set contact details country to <>"
 # end

#step "set contact details Street Address to #{street_address}"
#step "set contact details city to #{city}"
#step "set contact details state to #{state}"
#step "set contact details postal code to #{postal_code}"

end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ountry [Tt]o (.*)$/ do |str|
  country = SdcContacts.contacts_country
  country.selection_country(value: str)
  country.drop_down.click unless country.selection.present?
  country.text_field.set(str)
  country.selection.safe_click
  expect(country.text_field.text_value).to include(str)
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.street_address.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ss]treet [Aa]ddress [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.street_address.wait_until_present(timeout: 15)
  contacts_detail.street_address.send_keys(str)
  contacts_detail.postal_code.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ity [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.city.wait_until_present(timeout: 15)
  contacts_detail.city.set(str)
  contacts_detail.postal_code.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Ss]tate [Tt]o (.*)$/ do |str|
  state = SdcContacts.contacts_state
  state.selection_state(value: str)
  state.drop_down.click unless state.selection.present?
  state.text_field.set(str)
  state.selection.safe_click
  expect(state.text_field.text_value).to include(str)
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.postal_code.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]rovince [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.province.wait_until_present(timeout: 15)
  contacts_detail.province.set(str)
  contacts_detail.postal_code.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]ostal [Cc]ode [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.postal_code.wait_until_present(timeout: 15)
  contacts_detail.postal_code.set(str)
  contacts_detail.email.click
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
  contacts_detail.phone_ext.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Pp]hone [Ee]xtension [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.phone_ext.wait_until_present(timeout: 15)
  contacts_detail.phone_ext.set(str)
  contacts_detail.reference_number.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Gg]roups [Tt]o (.*)$/ do |str|
  group = SdcContacts.contacts_group
  group.selection_group(value: str)
  group.drop_down.click unless group.selection.present?
  group.text_field.set(str)
  group.selection.safe_click
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.reference_number.click
  #expect(group.text_list.text_value).to include(str)
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Rr]eference [Nn]umber [Tt]o (.*)$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.reference_number.wait_until_present(timeout: 15)
  contacts_detail.reference_number.set(str)
  contacts_detail.phone_ext.click
end

Then /^[Ss]et [Cc]ontact [Dd]etails [Cc]ost [Cc]ode [Tt]o (.*)$/ do |str|
  cost_code = SdcContacts.contacts_cost_code
  cost_code.selection_costcode(value: str)
  cost_code.drop_down.click unless cost_code.selection.present?
  cost_code.text_field.set(str)
  cost_code.selection.safe_click
  expect(cost_code.text_field.text_value).to include(str)
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.reference_number.click
end

Then /^[Ee]xpect [Ee]mail [Ee]rror [Ii]s [Dd]isplayed$/ do
  error= SdcContacts.contacts_email_error
  error.email_error.safe_wait_until_present(timeout:10)
  #expect(error.email_error.present?).to be(true)
end

Then /^[Ee]xpect [Ee]mail [Ee]rror [Ii]s [Nn]ot [Dd]isplayed$/ do
  error= SdcContacts.contacts_email_error
  expect(error.email_error.present?).to be(false)
end

Then /^[Cc]lick [Oo]n [Cc]ontact [Dd]etails [Mm]enu [Dd]ropdown$/ do
  toolbar_menu = SdcContacts.contacts_detail_toolbar_menu
  toolbar_menu.menu_button.safe_wait_until_present(timeout: 20)
  toolbar_menu.menu_button.wait_until_present(timeout: 20)
  toolbar_menu.menu_button.click
end

Then /^[Ss]elect (.*) from dropdown menu$/ do |menu_item|
  toolbar_menu = SdcContacts.contacts_detail_toolbar_menu
  case menu_item
  when menu_item.eql("Print Postage")
    toolbar_menu.menu_print_postage.wait_until_present(timeout: 10)
    toolbar_menu.menu_print_postage.click
  when menu_item.eql("Delete")
    toolbar_menu.menu_delete.wait_until_present(timeout: 10)
    toolbar_menu.menu_delete.click
  when menu_item.eql("Collapse Panel")
    toolbar_menu.menu_collapse_panel.wait_until_present(timeout: 10)
    toolbar_menu.menu_collapse_panel.click
  else
    failure_message
  end
end

Then /^[Ee]xpand [Cc]ollapsed [Cc]ontact [Dd]etails [Pp]anel$/ do
    contact_detail = SdcContacts.contacts_detail
    contact_detail.expand_button.wait_until_present(timeout: 10)
    contact_detail.expand_button.flash
    contact_detail.expand_button.click
end

Then /^expect values of contact added in contacts detail panel are correct$/ do
  full_name	=	TestData.hash[:full_name]
  company	=	TestData.hash[:company]
  country	=	TestData.hash[:country]
  street_address	=	TestData.hash[:street_address]
  city	=	TestData.hash[:city]
  state	=	TestData.hash[:state]
  postal_code	=	TestData.hash[:postal_code]
  email	=	TestData.hash[:email]
  phone	=	TestData.hash[:phone]
  phone_ext	=	TestData.hash[:phone_ext]
  groups	=	TestData.hash[:groups]
  reference_number	=	TestData.hash[:reference_number]
  cost_code	=	TestData.hash[:cost_code]

  step "expect value of Name in contact details panel is #{full_name}"
  step "expect value of Company in contact details panel is #{company}"
  step "expect value of Country in contact details panel is #{country}"
  step "expect value of Street Address in contact details panel is #{street_address}"
  step "expect value of City in contact details panel is #{city}"
  step "expect value of State/Prv in contact details panel is #{state}"
  step "expect value of Postal Code in contact details panel is #{postal_code}"
  step "expect value of Email in contact details panel is #{email}"
  step "expect value of Phone in contact details panel is #{phone}"
  step "expect value of Phone Extension in contact details panel is #{phone_ext}"
  step "expect value of Groups in contact details panel is #{groups}"
  step "expect value of Reference Number in contact details panel is #{reference_number}"
  step "expect value of Cost Code in contact details panel is #{cost_code}"
end

#Validation of Values on the Details Panel
Then /^expect value of (.*) in contact details panel is (.*)$/ do |label,value|
    contacts_detail= SdcContacts.contacts_detail
    contacts_detail.reference_number.safe_wait_until_present(timeout: 15)
	
p '**Details Panel**'

  if value=='blank'
    new_value = ""
  else
    new_value = value
  end

  case label

  when 'Name'
    actual_value = contacts_detail.name.text_value

  when 'Prefix'
    name_pre = SdcContacts.contacts_name_prefix
    actual_value =  name_pre.prefix_text_field.text_value

  when 'First Name'
    actual_value = contacts_detail.first_name.text_value

  when 'Middle Name'
    actual_value = contacts_detail.middle_name.text_value

  when 'Last Name'
    actual_value = contacts_detail.last_name.text_value

  when 'Suffix'
    actual_value = contacts_detail.name_suffix.text_value

  when 'Company'
    actual_value = contacts_detail.company.text_value

  when 'Title'
    actual_value = contacts_detail.title.text_value

  when 'Department'
    actual_value = contacts_detail.department.text_value

  when 'Country'
    country = SdcContacts.contacts_country
    actual_value = country.text_field.text_value

  when 'Street Address'
    actual_value = contacts_detail.street_address.text_value

  when 'City'
    actual_value = contacts_detail.city.text_value

  when 'State/Prv' ,'State','Province'
    state = SdcContacts.contacts_state
    if state.text_field.present?
      actual_value = state.text_field.text_value
      p 'incide case - IF:' + actual_value
    #actual_value = contacts_detail.state_prv.text_value
    else
      actual_value = contacts_detail.state_prv.text_value
    end

  when 'Postal Code'
    actual_value = contacts_detail.postal_code.text_value
    p "val " + actual_value
  when 'Email'
    actual_value = contacts_detail.email.text_value

  when 'Phone'
    actual_value = contacts_detail.phone.text_value

  when 'Phone Extension'
    actual_value = contacts_detail.phone_ext.text_value

  when 'Groups'
    groups = SdcContacts.contacts_group
    actual_value=groups.text_field.text_value
    #if p_c.nil?
      #actual_value = ""
    #else
      #actual_value = p_c
    #end
  when 'Reference Number'
    actual_value = contacts_detail.reference_number.text_value

  when 'Cost Code'
    cost_code = SdcContacts.contacts_cost_code
    actual_value = cost_code.text_field.text_value
    if new_value ==""
      new_value = 'None'
    end
  end
  p 'Label: ' + label
  p 'given value :' + value
  p 'Modified given value '+ new_value
  p 'Value in details panel :' + actual_value.to_s

  expect(actual_value.strip).to eql new_value.strip
end

