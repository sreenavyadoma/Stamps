Then /^Teardown$/ do
  logger.info "Teardown"
  test_helper.teardown
end

Given /^I launched (?:|the default )browser(?: (\w+)|)$/ do |selection|
  logger.info "I launched the default browser #{selection}"
  ENV['BROWSER'] = selection unless selection.nil?
  test_helper.setup
end

Then /^Refresh Browser$/ do
  browser.refresh
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end
