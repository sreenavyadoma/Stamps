Then /^WL: blur_out on membership page$/ do
  WhiteLabel.membership_page.membership_bread_crumb.blur_out
end

Then /^WL: set membership page first name to (?:random value|(.*))$/ do |str|
  first_name = WhiteLabel.membership_page.first_name
  first_name.wait_until_present(timeout: 10)
  first_name.set(TestData.hash[:first_name] = str.nil? ? TestHelper.rand_alpha_str.capitalize  : str)
end

Then /^WL: set membership page last name to (?:random value|(.*))$/ do |str|
  last_name = WhiteLabel.membership_page.last_name
  last_name.set(TestData.hash[:last_name] = str.nil? ? TestHelper.rand_alpha_str.capitalize  : str)
end

Then /^WL: set membership page company to (?:random value|(.*))$/ do |str|
  WhiteLabel.membership_page.company.set(TestData.hash[:company] = str.nil? ? TestHelper.rand_alpha_str  : str) if WhiteLabel.membership_page.company.present?
end

Then /^WL: set membership page address to (.*)$/ do |str|
  WhiteLabel.membership_page.address.set(TestData.hash[:address] = str)
end

Then /^WL: set membership page city to (.*)$/ do |str|
  WhiteLabel.membership_page.city.set(TestData.hash[:city] = str)
end

Then /^WL: select membership page state (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.state.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:state] = membership_page.state.attribute_value('title').strip
  expect(TestData.hash[:state].strip).to eql str

end

Then /^WL: set membership page zip to (.*)$/ do |str|
  WhiteLabel.membership_page.zip.set(TestData.hash[:city] = str)
end

Then /^WL: set membership page phone to (.*)$/ do |str|
  WhiteLabel.membership_page.phone.set(TestData.hash[:phone] = str)
end


Then /^WL: set membership page cardholder's name to (?:random value|(.*))$/ do |str|
   cc_holder_name = WhiteLabel.membership_page.cc_holder_name
   cc_holder_name.clear
   cc_holder_name.set(TestData.hash[:card_holder_name] = str.nil? ? TestHelper.rand_full_name  : str)
end

Then /^WL: set membership page credit card number to (?:default value|(.*))$/ do |str|
  WhiteLabel.membership_page.cc_number.set(TestData.hash[:cc_number] = str.nil? ? "4111111111111111"  : str)
end


Then /^WL: select membership page credit card month (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_month.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_month] =  membership_page.cc_month.attribute_value('title').strip
  expect(TestData.hash[:cc_month].strip).to eql str
end


Then /^WL: select membership page credit card year (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.cc_year.click
  membership_page.dropdown_selection(str)
  membership_page.dropdown_element.safe_wait_until_present(timeout: 2)
  membership_page.dropdown_element.click
  step "WL: blur_out on membership page"
  TestData.hash[:cc_month] = membership_page.cc_year.attribute_value('title').strip
  expect(TestData.hash[:cc_month].strip).to eql str
end

Then /^WL: set membership page credit card year to this year plus (\d+)$/ do |year|
  step "WL: select membership page credit card year #{Date.today.year + year.to_i}"
end

Then /^WL: check membership page Terms & Conditions$/ do
  WhiteLabel.membership_page.terms_conditions.click! #unless WhiteLabel.membership_page.terms_conditions.checked?
end

Then /^WL: expect membership page Terms & Conditions is checked$/ do
  expect(WhiteLabel.membership_page.terms_conditions.checked?).to be(true)
end

Then /^WL: click membership page submit button$/ do
  WhiteLabel.membership_page.submit.click
end


Then /^WL: set membership page personal info to(?: a |)(?: random info |)(?:to|in|between|) (.*)$/ do |address|
  stamps_logo = WhiteLabel.common_page.stamps_logo
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


Then /^WL: check if address standardized is present then click continue$/ do
  addr_std_continue = WhiteLabel.membership_page.addr_std_continue
  addr_std_continue.wait_until_present(timeout: 5) rescue false
  if addr_std_continue.present? == true
    addr_std_continue.click
  else
    #ignore
  end
end

Then /^WL: check if postage meter address is present then set the value$/ do
  membership_page = WhiteLabel.membership_page
  if TestData.hash[:street_address].include? 'PO Box'
    membership_page.meter_street.wait_until_present(timeout: 5)
    step 'WL: set postage meter address between zone 5 and 8'
    step 'WL: click membership page submit button'
  else
    expect(membership_page.meter_header).not_to be_present, 'Additional Postage Meter Address Page IS PRESENT for domestic address'
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
    expect(membership_page.username_taken_header).not_to be_present, 'Username Taken Modals is PRESENT when user DOES NOT EXISTS'
  else
    membership_page.new_username.wait_until_present(timeout: 5)
    expect(membership_page.username_taken_header).to be_present, 'Username Taken Modals is NOT PRESENT for an EXISTING USER'
    membership_page.new_username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
    print "UserName = #{TestData.hash[:username]}\n"
    step 'WL: click username taken continue button'
  end
end

Then /^WL: click username taken continue button$/ do
  WhiteLabel.membership_page.username_taken_continue_btn.click
end