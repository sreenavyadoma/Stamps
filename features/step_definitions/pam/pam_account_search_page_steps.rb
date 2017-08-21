
Then /^[Ll]oad PAM [Pp]age$/ do
  step "I launched default browser" if test_config.browser.nil?
  pam.visit
end

Then /^[Ll]oad PAM [Cc]ustomer [Ss]earch page$/ do
  step "I launched default browser" if test_config.browser.nil?
  pam.load_customer_search_page
end


