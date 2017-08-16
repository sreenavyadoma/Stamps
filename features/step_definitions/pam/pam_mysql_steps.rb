Then /^[Ii]? ?[Ll]oad all user credentials from automation database$/ do

  credentials_hash = user_credentials.all_user_credentials

end

Then /^[Ss]eeart PAM Customer Search page username from parameter file$/ do
  step "set PAM Customer Search page username to #{test_config['username']}"
end