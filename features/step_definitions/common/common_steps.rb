Then /^Teardown$/ do
  logger.step "Teardown"
  test_helper.teardown
end

Given /^(?:|I )(?:L|l)aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  logger.step "I launched default browser #{selection}"
  ENV['BROWSER'] = selection unless selection.nil?
  test_helper.setup
end

Then /^Refresh Browser$/ do
  browser.refresh
  sleep 6
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  logger.step "Pause for #{seconds}"
  sleep seconds.to_i
end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  test_helper.clear_cookies
end


