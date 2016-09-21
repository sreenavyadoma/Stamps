Then /^Teardown$/ do
  logger.info "Teardown"
  test_helper.teardown
end

Given /^(?:|I )(?:L|l)aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  logger.info "I launched default browser #{selection}"
  ENV['BROWSER'] = selection unless selection.nil?
  test_helper.setup
end

Then /^Refresh Browser$/ do
  browser.refresh
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  test_helper.clear_cookies
end


