Then /^[Ss]et PAM AppCap Overrides to Always On for all Required Fields for all users in the database$/ do

  credentials_list = user_credentials.all_user_credentials
  credentials_list.each_with_index do |row, index|

    username = row[:username]
    password = row[:password]

    step "search PAM Customer Search page for username #{username}"

    step "On PAM Customer Profile page, click  AppCap Overrides link"
    step "set PAM AppCap Overrides Allow High Risk Countries to Always On"
    step "On PAM AppCap Overrides page, set Internet Mail Printing to Always On"
    step "On PAM AppCap Overrides page, set Netstamps Printing to Always On"
    step "On PAM AppCap Overrides page, set Shipping Label Printing to Always On"
    step "On PAM AppCap Overrides page, set International Shipping to Always On"
    step "On PAM AppCap Overrides page, set Allow High Risk Countries to Always On"
    step "On PAM AppCap Overrides page, Submit"
  end

end

Then /^[Ss]eeart PAM Customer Search page username from parameter file$/ do
  step "set PAM Customer Search page username to #{test_config['username']}"
end

Then /^[Ss]earch PAM [Cc]ustomer [Ss]earch page for username (.*)$/ do |str|
  pam.customer_search.username.set(test_param[:username] = str)
  #customer_profile_found =  #CustomerProfilePage.new(param)
  #customer_not_found_page = CustomerNotFoundPage.new(param)
  20.times do |counter|
    search_btn.click
    search_btn.click
    sleep(0.5)
    break if pam.customer_profile_page.present?

    if pam.customer_not_found_page.present?
      logger.step "PAM:  #{pam.customer_not_found_page.status_reason}"
      test_config.browser.back
      sleep(0.25)
      pam.customer_search.username.set(str)
    end
  end
  search_btn.click
  search_btn.click
  return @customer_profile = customer_not_found_page if customer_not_found_page.present?
  return @customer_profile = customer_profile_found if customer_profile_found.present?
  expect(customer_profile_found.present? || customer_not_found_page.present?).to be_true, "Customer Profile or Customer Not Found page did not appear."
end

Then /^[Ss]et PAM [Cc]ustomer [Ss]earch page [Uu]sername to (?:cached value|(.*))$/ do |str|
  test_param[:username] = str unless str.nil?
  pam.customer_search.search_username(test_param[:username])
end

Then /^[Cc]lick PAM [Cc]ustomer [Ss]earch page [Ss]earch button$/ do
  test_param[:pam_search_result] = pam.customer_search.search_username(test_param[:username])
end
