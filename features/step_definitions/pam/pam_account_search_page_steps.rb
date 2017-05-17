
Then /^load PAM [Pp]age$/ do
  pam.visit
end

Then /^[Vv]isit PAM [Cc]ustomer [Ss]earch page$/ do
  pam.customer_search_page.visit
end

Then /^[Ss]et PAM [Cc]ustomer [Ss]earch page [Uu]sername to (?:cached value|(.*))$/ do |str|
  test_param[:username] = str unless str.nil?
  pam.customer_search_page.username.set(test_param[:username])
end

Then /^[Cc]lick PAM [Cc]ustomer [Ss]earch page [Ss]earch button$/ do
  test_param[:pam_search_result] = pam.customer_search_page.search
end





