Then /^WL: blur_out on membership page$/ do
  WhiteLabel.membership_page.membership_bread_crumb.blur_out
  step 'pause for 1 second'
end

Then /^WL: click modal x button$/ do
  WhiteLabel.membership_page.modal_x.click
  step 'pause for 1 second'
end

Then /^WL: click membership page submit button$/ do
  step 'pause for 1 second'
  WhiteLabel.membership_page.submit.click
  step 'pause for 1 second'
end

Then /^WL: click membership page back button$/ do
  WhiteLabel.membership_page.back.click
  step 'pause for 1 second'
end


Then /^WL: set membership page first name to (?:random value|(.*))$/ do |str|
  first_name = WhiteLabel.membership_page.first_name
  first_name.wait_until_present(timeout: 10)
  first_name.clear
  while first_name.text_value.strip == ''
    str ||=  TestHelper.rand_alpha_str.capitalize
    first_name.set(str)
  end
  step "WL: blur_out on membership page"
  TestData.hash[:first_name] = str
end

Then /^WL: expect membership page first name is (?:correct|(.*))$/ do |str|
  first_name = WhiteLabel.membership_page.first_name
  str ||= TestData.hash[:first_name]
  expect(first_name.text_value.strip).to eql(str)
  TestData.hash[:first_name] = str
end

Then /^WL: expect membership page first name tooltip to be (.*)$/ do |str|
  step "WL: blur_out on membership page"
  first_name_help_block = WhiteLabel.membership_page.first_name_help_block
  first_name_help_block.wait_until_present(timeout: 10)
  expect(first_name_help_block.text_value.strip).to eql(str)
end

Then /^WL: set membership page last name to (?:random value|(.*))$/ do |str|
  last_name = WhiteLabel.membership_page.last_name
  last_name.clear
  while last_name.text_value.strip == ''
    str ||= TestHelper.rand_alpha_str.capitalize
    last_name.set(str)
  end
  step "WL: blur_out on membership page"
  TestData.hash[:last_name] = str
end

Then /^WL: expect membership page last name is (?:correct|(.*))$/ do |str|
  last_name = WhiteLabel.membership_page.last_name
  str ||= TestData.hash[:last_name]
  expect(last_name.text_value.strip).to eql(str)

  TestData.hash[:last_name] = str
end

Then /^WL: expect membership page last name tooltip to be (.*)$/ do |str|
  last_name_help_block = WhiteLabel.membership_page.last_name_help_block
  expect(last_name_help_block.text_value.strip).to eql(str)
end

Then /^WL: set membership page company to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_str
  WhiteLabel.membership_page.company.set(str)
  TestData.hash[:company] = str
end

Then /^WL: expect membership page company is (?:correct|(.*))$/ do |str|
  company = WhiteLabel.membership_page.company
  str ||= TestData.hash[:company]
  expect(company.text_value.strip).to eql(str)

  TestData.hash[:company] = str
end

Then /^WL: set membership page address to (.*)$/ do |str|
  address = WhiteLabel.membership_page.address
  address.clear
  while address.text_value.strip == ''
    WhiteLabel.membership_page.address.set(str)
  end
  step "WL: blur_out on membership page"
  TestData.hash[:address] = str
end

Then /^WL: click membership page address$/ do
   WhiteLabel.membership_page.address.click
   step 'pause for 1 second'
end

Then /WL: select membership page address autocomplete index (\d+)$/ do |index|
  address_auto_complete = WhiteLabel.membership_page.address_auto_complete(index)
  address_auto_complete.wait_until_present(timeout: 2)
  address_auto_complete.click
  step "WL: blur_out on membership page"
end

Then /^WL: expect membership page address is (?:correct|(.*))$/ do |str|
  address = WhiteLabel.membership_page.address
  str ||= TestData.hash[:address]
  expect(address.text_value.strip).to eql(str)

  TestData.hash[:address] = str
end


Then /^WL: expect membership page address tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.address_help_block.text_value.strip).to eql(str)
end

Then /^WL: set membership page city to (.*)$/ do |str|
   city = WhiteLabel.membership_page.city
   city.clear
   city.set(str)
   step "WL: blur_out on membership page"

   TestData.hash[:city] = str
end

Then /^WL: expect membership page city is (?:correct|(.*))$/ do |str|
  city = WhiteLabel.membership_page.city
  str ||= TestData.hash[:city]
  expect(city.text_value.strip).to eql(str)

  TestData.hash[:city] = str
end

Then /^WL: expect membership page city tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.city_help_block.text_value.strip).to eql(str)
end

Then /^WL: select membership page state (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.state.click
  membership_page.dropdown_selection(str, 0)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:state] = membership_page.state.attribute_value('title').strip
  expect(TestData.hash[:state].strip).to eql str
end

Then /^WL: expect membership page state is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:state]
  expect(WhiteLabel.membership_page.state.attribute_value('title').strip).to eql(str)
  TestData.hash[:state] = str
end

Then /^WL: expect membership page state tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.state_help_block.text_value.strip).to eql str
end

Then /^WL: set membership page zip to (.*)$/ do |str|
  zip = WhiteLabel.membership_page.zip
  zip.clear
  while zip.text_value.strip == ''
    zip.set(str)
  end
  TestData.hash[:zip] = str
end

Then /^WL: expect membership page zip is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:zip]
  expect(WhiteLabel.membership_page.zip.text_value.strip).to eql(str)
  TestData.hash[:zip] = str
end

Then /^WL: set membership page phone to (?:random value|(.*))$/ do |str|
  phone = WhiteLabel.membership_page.phone
  phone.clear
  rand_phone = TestHelper.rand_phone_format
  while phone.text_value.strip == ''
    str ||= rand_phone
    phone.set(str)
  end
  TestData.hash[:phone] = str
  step "WL: blur_out on membership page"
end

Then /^WL: expect membership page phone tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.phone_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page phone is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:phone]
  expect(WhiteLabel.membership_page.phone.text_value.strip).to eql(str)
  TestData.hash[:phone] = str
end

Then /^WL: set membership page personal info to(?: a |)(?: random info |)(?:to|in|between|) (.*)$/ do |address|
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.scroll_into_view
  stamps_logo.wait_until_present(timeout: 10)

  TestData.hash[:personal_info] = TestHelper.address_helper_zone(address) #combine this

  TestData.hash[:first_name] = TestData.hash[:personal_info]['first_name'] #combine this in address_helper_zone
  TestData.hash[:last_name] = TestData.hash[:personal_info]['last_name']
  TestData.hash[:street_address] = TestData.hash[:personal_info]['street_address']
  TestData.hash[:city] = TestData.hash[:personal_info]['city']
  TestData.hash[:state] = TestData.hash[:personal_info]['state']
  TestData.hash[:zip] = TestData.hash[:personal_info]['zip']
  TestData.hash[:company] = TestData.hash[:personal_info]['company']
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(TestData.hash[:personal_info])
  TestData.hash[:phone_number_format] =  TestData.hash[:personal_info]['phone_number_format']

  step "WL: set membership page first name to #{TestData.hash[:first_name]}"
  step "WL: set membership page last name to #{TestData.hash[:last_name]}"
  step "WL: set membership page company to #{ TestData.hash[:company]}"
  step "WL: set membership page address to #{TestData.hash[:street_address]}"
  step 'WL: blur_out on membership page'
  step "WL: set membership page city to #{TestData.hash[:city]}"
  step "WL: select membership page state #{TestData.hash[:state]}"
  step 'WL: blur_out on membership page'
  step "WL: set membership page zip to #{TestData.hash[:zip]}"
  step "WL: set membership page phone to #{TestData.hash[:phone_number_format]}"

end

Then /^WL: expect membership page credit card stamps logo is present$/ do
  expect(WhiteLabel.membership_page.cc_stamps_logo).to be_present
end

Then /^WL: expect membership page credit card usps logo is present$/ do
  expect(WhiteLabel.membership_page.cc_usps_logo).to be_present
end

Then /^WL: expect membership page credit card authorization text to be$/ do |str|
  actual = []
  expected= str.split("\n")
  tmp = WhiteLabel.membership_page.cc_auth.text_value.strip.split("\n")
  actual << tmp[0].strip
  actual << tmp[1].strip

  expect(actual).to match_array(expected)
end


Then /^WL: set membership page cardholder's name to (?:random value|(.*))$/ do |str|
   cc_holder_name = WhiteLabel.membership_page.cc_holder_name
   cc_holder_name.clear
   str ||= TestHelper.rand_full_name
   while cc_holder_name.text_value.strip == ''
     cc_holder_name.set(TestData.hash[:card_holder_name] =str)
   end
    step 'WL: blur_out on membership page'
end

Then /^WL: expect membership page cardholder's name is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:card_holder_name]
  expect(WhiteLabel.membership_page.cc_holder_name.text_value.strip).to eql(str)
  TestData.hash[:card_holder_name]= str
end

Then /WL: expect membership page cardholder's name tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.cc_holder_name_help_block.text_value.strip).to eql(str)
end

Then /^WL: set membership page credit card number to (?:default value|(.*))$/ do |str|
  cc_number = WhiteLabel.membership_page.cc_number
  cc_number.clear
  while cc_number.text_value == ''
    str ||= '4111111111111111'
    cc_number.set(str)
  end
  TestData.hash[:cc_number] = str
  step 'WL: blur_out on membership page'
end

Then /^WL: expect membership page credit card number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:cc_number]
  expect(WhiteLabel.membership_page.cc_number.text_value.strip.delete(' ')).to eql(str)
  TestData.hash[:cc_number] = str
end

Then /^WL: expect membership page credit card number tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.cc_number_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page credit card visa is present$/ do
  expect(WhiteLabel.membership_page.cc_visa).to be_present
end

Then /^WL: expect membership page credit card mastercard is present$/ do
  expect(WhiteLabel.membership_page.cc_mastercard).to be_present
end

Then /^WL: expect membership page credit card discover is present$/ do
  expect(WhiteLabel.membership_page.cc_discover).to be_present
end

Then /^WL: expect membership page credit card american express is present$/ do
  expect(WhiteLabel.membership_page.cc_amex).to be_present
end

Then /^WL: select membership page credit card month (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_month.click
  membership_page.dropdown_selection(str, 0)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_month] =  membership_page.cc_month.attribute_value('title').strip
  expect(TestData.hash[:cc_month].strip).to eql str
end

Then /^WL: expect membership page month is (?:correct|(.*))$/ do |str|
  str ||=  TestData.hash[:cc_month]
  expect(WhiteLabel.membership_page.cc_month.attribute_value('title').strip).to eql(str)
  TestData.hash[:cc_month] = str
end

Then /^WL: expect membership page month tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.cc_month_help_block.text_value.strip).to eql(str)
end

Then /^WL: select membership page credit card year (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_year.click
  membership_page.dropdown_selection(str, 0)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_year] = membership_page.cc_year.attribute_value('title').strip
  expect(TestData.hash[:cc_year].strip).to eql str
end

Then /^WL: expect membership page year tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.cc_year_help_block.text_value.strip).to eql(str)
end

Then /^WL: set membership page credit card year to this year plus (\d+)$/ do |year|
  step "WL: select membership page credit card year #{Date.today.year + year.to_i}"
end

Then /^WL: expect membership page credit card year is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:cc_year]
  expect(WhiteLabel.membership_page.cc_year.attribute_value('title').strip).to eql(str)
  TestData.hash[:cc_year] = str
end

Then /^WL: uncheck membership page billing address same as mailing address$/ do
  billing_addr_checkbox = WhiteLabel.membership_page.billing_addr_checkbox
  if billing_addr_checkbox.attribute_value('checked') == 'true'
    billing_addr_checkbox.click!
  end
end

Then /^WL: check membership page billing address same as mailing address$/ do
  billing_addr_checkbox = WhiteLabel.membership_page.billing_addr_checkbox
  if billing_addr_checkbox.attribute_value('checked') == nil
    billing_addr_checkbox.click!
  end
end

Then /^WL: expect membership page billing address same as mailing address is checked$/ do
  billing_addr_checkbox = WhiteLabel.membership_page.billing_addr_checkbox
  billing_addr_checkbox.safe_wait_until_present(timeout: 5)
  expect(billing_addr_checkbox.attribute_value('checked')).to eql('true')
end

Then /^WL: expect membership page billing header to be present$/ do
  expect(WhiteLabel.membership_page.billing_addr_header).to be_present
end

Then /^WL: expect membership page billing header not to be present$/ do
  expect(WhiteLabel.membership_page.billing_addr_header).not_to be_present
end

Then /^WL: set membership page billing address to (.*)$/ do |str|
  billing_addr = WhiteLabel.membership_page.billing_addr
  billing_addr.wait_until_present(timeout: 2)
  billing_addr.scroll_into_view
  billing_addr.clear
  while billing_addr.text_value.strip == ''
    billing_addr.set(TestData.hash[:billing_addr] = str)
  end
  step "WL: blur_out on membership page"
end

Then /^WL: click membership page billing address$/ do
  WhiteLabel.membership_page.billing_addr.click
  step 'pause for 1 second'
end

Then /WL: select membership page billing address autocomplete index (\d+)$/ do |index|
  billing_addr_auto_complete = WhiteLabel.membership_page.billing_addr_auto_complete(index)
  billing_addr_auto_complete.wait_until_present(timeout: 2)
  billing_addr_auto_complete.click
  step "WL: blur_out on membership page"
end

Then /^WL: expect membership page billing address is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:billing_addr]
  expect(WhiteLabel.membership_page.billing_addr.text_value.strip).to eql(str)
  TestData.hash[:billing_addr] = str
end

Then /^WL: expect membership page billing address tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.billing_addr_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page billing address to be present$/ do
  expect(WhiteLabel.membership_page.billing_addr).to be_present
end

Then /^WL: expect membership page billing address not to be present$/ do
  expect(WhiteLabel.membership_page.billing_addr).not_to be_present
end

Then /^WL: set membership page billing city to (.*)$/ do |str|
  billing_city = WhiteLabel.membership_page.billing_city
  billing_city.clear
  while billing_city.text_value.strip == ''
    billing_city.set(str)
  end
  step "WL: blur_out on membership page"
  TestData.hash[:billing_city] = str
end

Then /^WL: expect membership page billing city is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:billing_city]
  expect(WhiteLabel.membership_page.billing_city.text_value.strip).to eql( str )
  TestData.hash[:billing_city] = str
end

Then /^WL: expect membership page billing city tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.billing_city_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page billing city to be present$/ do
  expect(WhiteLabel.membership_page.billing_city).to be_present
end

Then /^WL: expect membership page billing city not to be present$/ do
  expect(WhiteLabel.membership_page.billing_city).not_to be_present
end

Then /^WL: select membership page billing state (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.billing_state.click
  membership_page.billing_dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:billing_state] =  membership_page.billing_state.attribute_value('title').strip
  expect(TestData.hash[:billing_state].strip).to eql str
end

Then /^WL: expect membership page billing state is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:billing_state]
  expect(WhiteLabel.membership_page.billing_state.attribute_value('title').strip).to eql(str)
  TestData.hash[:billing_state] = str
end

Then /^WL: expect membership page billing state tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.billing_state_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page billing state to be present$/ do
  expect(WhiteLabel.membership_page.billing_state).to be_present
end

Then /^WL: expect membership page billing state not to be present$/ do
  expect(WhiteLabel.membership_page.billing_state).not_to be_present
end

Then /^WL: set membership page billing zip to (.*)$/ do |str|
  billing_zip = WhiteLabel.membership_page.billing_zip
  billing_zip.clear
  while billing_zip.text_value.strip == ''
    billing_zip.set(str)
  end
  step "WL: blur_out on membership page"
  TestData.hash[:billing_zip] = str
end

Then /^WL: expect membership page billing zip is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:billing_zip]
  expect(WhiteLabel.membership_page.billing_zip.text_value.strip).to eql(str)
  TestData.hash[:billing_zip] = str
end

Then /^WL: expect membership page billing zip tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.billing_zip_help_block.text_value.strip).to eql(str)
end

Then /^WL: expect membership page billing zip to be present$/ do
  expect(WhiteLabel.membership_page.billing_zip).to be_present
end

Then /^WL: expect membership page billing zip not to be present$/ do
  expect(WhiteLabel.membership_page.billing_zip).not_to be_present
end

Then /^WL: check membership page terms & conditions$/ do
  mm_page = WhiteLabel.membership_page
  mm_page.terms_conditions.scroll_into_view
  att_value = mm_page.addr_enable_disable_check.attribute_value('class')
  mm_page.terms_conditions.click! if att_value == 'form-group checkbox has-error'
end

Then /^WL: uncheck membership page terms & conditions$/ do
  mm_page = WhiteLabel.membership_page
  mm_page.terms_conditions.scroll_into_view
  step "WL: blur_out on membership page"
  att_value = mm_page.addr_enable_disable_check.attribute_value('class')
  mm_page.terms_conditions.click! if att_value == 'form-group checkbox'
end

Then /^WL: expect membership page terms & conditions is checked$/ do
  mm_page = WhiteLabel.membership_page
  step "WL: blur_out on membership page"
  att_value = mm_page.addr_enable_disable_check.attribute_value('class')
  expect(att_value).to eql('form-group checkbox')
end

Then /^WL: expect membership page terms & conditions is unchecked$/ do
  membership_page = WhiteLabel.membership_page
  membership_page.submit.scroll_into_view
  step 'pause for 1 second'
  membership_page.submit.click
  membership_page.addr_enable_disable_check.wait_until_present(timeout: 2)
  att_value = membership_page.addr_enable_disable_check.attribute_value('class')
  expect(att_value).to eql('form-group checkbox has-error')
end

Then /^WL: expect membership page terms & conditions tooltip to be (.*)$/ do |str|
  expect(WhiteLabel.membership_page.terms_conditions_help_block.text_value.strip).to eql(str)
end

Then /^WL: click membership page terms & conditions link$/ do
  WhiteLabel.membership_page.terms_conditions_link.scroll_into_view
  step 'pause for 1 second'
  WhiteLabel.membership_page.terms_conditions_link.click
end

Then /^WL: click membership page terms & conditions modal x button$/ do
  WhiteLabel.membership_page.modal_x.click
end

Then /^WL: expect membership page terms and conditions modal is present$/ do
  terms_conditions_header = WhiteLabel.membership_page.terms_conditions_header
  terms_conditions_header.wait_until_present(timeout: 2)
  expect(terms_conditions_header).to be_present
end

############################################################################Standardized Address Modal##################
Then /^WL: expect membership page standardized addr modal header to be (.*)$/ do |str|
  addr_std_header  = WhiteLabel.membership_page.addr_std_header
  addr_std_header.wait_until_present(timeout: 2)
  expect(addr_std_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page standardized addr modal paragraph to be$/ do |str|
  addr_std_p  = WhiteLabel.membership_page.addr_std_p
  expect(addr_std_p.text_value.strip).to eql(str)
end

Then /^WL: expect membership page standardized addr modal original address label to be (.*)$/ do |str|
  membership_page  = WhiteLabel.membership_page
  if membership_page.addr_std_addr_orig_lbl.present? == false
    membership_page.submit.doube_click
    membership_page.submit.click
  end
  expect(addr_std_addr_orig_lbl.text_value.strip).to eql(str)
end

Then /^WL: expect membership page standardized addr modal original address to be$/ do |str|
  addr_std_addr_orig  = WhiteLabel.membership_page.addr_std_addr_orig
  expect(addr_std_addr_orig.text_value.strip).to eql(str)
end

Then /^WL: expect membership page standardized addr modal standardized by the usps label to be (.*)$/ do |str|
  addr_std_addr_new_lbl  = WhiteLabel.membership_page.addr_std_addr_new_lbl
  expect(addr_std_addr_new_lbl.text_value.strip).to eql(str)
end

Then /^WL: expect membership page standardized addr modal standardized by the usps address to be$/ do |str|
  addr_std_addr_new  = WhiteLabel.membership_page.addr_std_addr_new
  expect(addr_std_addr_new.text_value.strip).to eql(str)
end

Then /^WL: click membership page standardized addr modal continue button$/ do
  WhiteLabel.membership_page.addr_std_continue.click
  step 'pause for 1 second'
end

Then /^WL: check if address standardized is present then click continue$/ do
  addr_std_continue = WhiteLabel.membership_page.addr_std_continue
  addr_std_continue.wait_until_present(timeout: 5) rescue false
  if addr_std_continue.present? == true
    addr_std_continue.click
  else
    #ignore
  end
end

###################################################################Postage Meter Address################################
Then /^WL expect membership page postage meter addr to be (.*)$/ do |str|
  meter_header = WhiteLabel.membership_page.meter_header
  meter_header.wait_until_present(timeout: 5)
  expect(meter_header.text_value.strip).to eql(str)
end

Then /^WL: check if postage meter address is present then set the value$/ do
  membership_page = WhiteLabel.membership_page
  if TestData.hash[:street_address].include? 'PO Box'
    membership_page.meter_street.wait_until_present(timeout: 5)
    step 'WL: set postage meter address between zone 5 and 8'
    step 'WL: click membership page submit button'
  else
    expect(membership_page.meter_header).not_to be_present
  end
end

Then /^WL: set postage meter address between (.*)$/ do |address|
  TestData.hash[:personal_info] = TestHelper.address_helper_zone(address) #combine this

  TestData.hash[:street_address] = TestData.hash[:personal_info]['street_address']
  TestData.hash[:city] = TestData.hash[:personal_info]['city']
  TestData.hash[:state] = TestData.hash[:personal_info]['state']
  TestData.hash[:zip] = TestData.hash[:personal_info]['zip']

  step "WL: set postage meter address to #{TestData.hash[:street_address]}"
  step "WL: set postage meter city to #{TestData.hash[:city]}"
  step "WL: select postage meter state #{TestData.hash[:state]}"
  step "WL: set postage meter zip to #{TestData.hash[:zip]}"
end

Then /^WL: set postage meter address to (.*)$/ do |str|
  WhiteLabel.membership_page.meter_street.set(TestData.hash[:address] = str)
end


Then /^WL: set postage meter city to (.*)$/ do |str|
  WhiteLabel.membership_page.meter_city.set(TestData.hash[:city] = str)
end

Then /^WL: select postage meter state (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.meter_state.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:state] =  membership_page.meter_state.attribute_value('title').strip
  expect(TestData.hash[:state].strip).to eql str
end

Then /^WL: set postage meter zip to (.*)$/ do |str|
  WhiteLabel.membership_page.meter_zip.set(TestData.hash[:zip] = str)
end

Then /^WL: if username taken is present then set username to (?:random value|(.*))$/ do |str|
  membership_page =  WhiteLabel.membership_page
  if TestData.hash[:username_taken].empty?
    expect(membership_page.username_taken_header).not_to be_present
  else
    membership_page.new_username.wait_until_present(timeout: 5)
    expect(membership_page.username_taken_header).to be_present
    membership_page.new_username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
    print "UserName = #{TestData.hash[:username]}\n"
    step 'WL: click username taken continue button'
  end
end

#######################################################################Username Taken Modal#############################
Then /^WL: click username taken continue button$/ do
  WhiteLabel.membership_page.username_taken_continue_btn.click
end

##################################################Side content##########################################################
Then /^WL: expect membership page need mailing info header to be$/ do |str|
  expect(WhiteLabel.membership_page.need_mailing_info_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page need mailing info paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.need_mailing_info_p.text_value.strip).to eql(str)
end

Then /^WL: expect membership page change mailing address header to be$/ do |str|
  expect(WhiteLabel.membership_page.change_mailing_addr_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page change mailing address paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.change_mailing_addr_p.text_value.strip).to eql(str)
end

Then /^WL: expect membership page outside my office header to be$/ do |str|
  expect(WhiteLabel.membership_page.outside_my_office_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page outside my office paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.outside_my_office_p.text_value.strip).to eql(str)
end

Then /^WL: expect membership page credit card information safe header to be$/ do |str|
  expect(WhiteLabel.membership_page.cc_info_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page credit card information safe paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.cc_info_header_p.text_value.strip).to eql(str)
end

Then /^WL: expect membership page pricing and billing header to be$/ do |str|
  expect(WhiteLabel.membership_page.pricing_and_billing_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page pricing and billing paragraph to be$/ do |str|
  plan_sku = WhiteLabel.common_page.plan_sku

  step 'WL: establish stamps website db connection'
  plan_rate =  WhiteLabel.common_page.plan_query(TestData.hash[:offer_id], plan_sku )
  step 'WL: close stamps website db connection'
  expect(WhiteLabel.membership_page.pricing_and_billing_p.text_value.strip).to eql(str.gsub('plan_rate', plan_rate.to_s))
end

Then /^WL: expect membership page cancel anytime header to be$/ do |str|
  expect(WhiteLabel.membership_page.cancel_anytime_header.text_value.strip).to eql(str)
end

Then /^WL: expect membership page cancel anytime paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.cancel_anytime_p.text_value.strip).to eql(str)
end

Then /^WL: click membership page bonus offer details link$/ do
  WhiteLabel.membership_page.bonus_offer_details.click
end

Then /^WL: click membership page bonus offer details modal x button$/ do
  WhiteLabel.membership_page.modal_x.click
end

Then /^WL: expect membership page your stamps.com offer modal to be present$/ do
  bonus_offer_details_header  = WhiteLabel.membership_page.bonus_offer_details_header
  bonus_offer_details_header.wait_until_present(timeout: 2)
  expect(bonus_offer_details_header).to be_present
end

####################################Invalid Address Modal###############################################################
Then /^WL: expect membership page invalid address modal header to be Invalid Address$/ do
  invalid_addr_header = WhiteLabel.membership_page.invalid_addr_header
  invalid_addr_header.wait_until_present(timeout: 2)
  expect(invalid_addr_header).to be_present
end

Then /^WL: expect membership page invalid address modal paragraph to be$/ do |str|
  expect(WhiteLabel.membership_page.invalid_addr_p.text_value.strip).to eql(str)
end


Then /^WL: set membership page default values$/ do
  step 'WL: click membership page submit button'
  step 'WL: set membership page personal info to random info between zone 5 and zone 8'
  step 'WL: set membership page credit card number to 4111111111111111'
  step 'WL: select membership page credit card month Dec (12)'
  step 'WL: set membership page credit card year to this year plus 1'
  step 'WL: check membership page terms & conditions'
end

