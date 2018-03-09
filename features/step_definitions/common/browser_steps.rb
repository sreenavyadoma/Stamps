
Then /^Teardown$/ do
  SdcTest.teardown
end

Given /^(?:|I )[Ll]aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |str|
  SdcTest.setup((str.nil?)? modal_param.browser_str : str)
end

Then /^Refresh the browser$/ do
  begin
    SdcTest.driver.refresh
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

Then(/^Close the driver and clear cookies$/) do #Clear Cookies
  SdcTest.clear_cookies
end


