Then /^Teardown$/ do
  config.teardown
end

Given /^(?:|I )[Ll]aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  ENV['BROWSER'] = selection unless selection.nil?
  config.setup
end

Then /^Refresh the browser$/ do
  begin
    config.browser.refresh
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


