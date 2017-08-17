Then /^[Ss]et PAM AppCap Overrides to Always On for all Required Fields for all users in the database$/ do

  credentials_hash = user_credentials.all_user_credentials
  credentials_hash.each_with_index do |row, index|
    username = row[:username]
    password = row[:password]

    step "set PAM Customer Search page username to #{username}"
    step "click PAM Customer Search page Search button"
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