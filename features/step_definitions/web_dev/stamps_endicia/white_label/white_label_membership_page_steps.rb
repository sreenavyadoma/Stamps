Then /^WL: blur_out on membership page$/ do
  WhiteLabel.membership_page.header.blur_out
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

Then /^WL: set membership page personal info to(?: a |)(?: random info |)(?:to|in|between|) (.*)$/ do |address|
  TestData.hash[:personal_info] = TestHelper.address_helper_zone(address) #combine this

  TestData.hash[:first_name] = TestData.hash[:personal_info]['first_name'] #combine this in address_helper_zone
  TestData.hash[:last_name] = TestData.hash[:personal_info]['last_name']
  TestData.hash[:street_address] = TestData.hash[:personal_info]['street_address']
  TestData.hash[:city] = TestData.hash[:personal_info]['city']
  TestData.hash[:state] = TestData.hash[:personal_info]['state']
  TestData.hash[:zip] = TestData.hash[:personal_info]['zip']
  TestData.hash[:company] = TestData.hash[:personal_info]['company']
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(address)
  TestData.hash[:phone_number_format] = TestData.hash[:personal_info][:phone_number_format]

  step "WL: set membership page first name to #{TestData.store[:first_name]}"
  step "WL: set membership page last name to #{TestData.store[:last_name]}"
  step "WL: set membership page address to #{TestData.store[:street_address]}"
  step "blur_out on membership page"
  step "set Membership page City to #{TestData.store[:city]}"
  step "select Membership page State #{TestData.store[:state]}"
  step "blur_out on membership page"
  step "set Membership page Zip to #{TestData.store[:zip]}"
  step "set Membership page Phone to #{TestData.store[:phone_number_format]}"

end

