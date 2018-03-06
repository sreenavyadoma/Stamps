
Then /^[Ll]oad PAM [Pp]age$/ do
  step "I launched default browser" if StampsTest.driver.nil?
  pam.visit
end

Then /^I? ?[Ll]aunch browser and [Ll]oad PAM [Cc]ustomer [Ss]earch page$/ do
  step "I launched default browser" if StampsTest.driver.nil?
  step "load PAM Customer Search page"
end

Then /^[Ll]oad PAM [Cc]ustomer [Ss]earch page$/ do
  step "I launched default browser" if StampsTest.driver.nil?
  pam.customer_search_page.visit
end


