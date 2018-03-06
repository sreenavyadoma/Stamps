
Then /^Teardown$/ do
  StampsTest.teardown
end

Given /^(?:|I )[Ll]aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |str|
  StampsTest.setup((str.nil?)? modal_param.browser_str : str)
end

Then /^Refresh the browser$/ do
  begin
    StampsTest.driver.refresh
    sleep(2)
  rescue
    # ignore
  end
end

Then /^[Pp]ause for (\d+) [Ss]econd(?:|s)?$/ do |seconds|
  begin
    sleep(seconds.to_i)
  rescue
    # ignore
  end
end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  StampsTest.clear_cookies
end


