Then /^Teardown$/ do
  test_config.teardown
end

Given /^(?:|I )[Ll]aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  ENV['BROWSER'] = selection unless selection.nil?
  config.setup
  expect(browser).not_to be_nil
end

Then /^Refresh the browser$/ do
  begin
    browser.refresh
    sleep(2)
  rescue
    #ignore
  end
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  begin
    sleep(seconds.to_i)
  rescue
    #ignore
  end
end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  config.clear_cookies
end


