Then /^Teardown$/ do
  test_helper.teardown
end

Given /^(?:|I )(?:L|l)aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  #logger.step "I launched default browser #{selection}"
  ENV['BROWSER'] = selection unless selection.nil?
  test_helper.setup
end

Then /^Refresh the browser$/ do
  begin
    browser.refresh
  rescue
    #ignore
  end
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  begin
    sleep seconds.to_i
  rescue
    #ignore
  end
end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  test_helper.clear_cookies
end


