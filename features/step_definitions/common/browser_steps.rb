
Then /^Teardown$/ do
  test_config.teardown
end

Given /^(?:|I )[Ll]aunch(?:|ed) (?:|browser)(?:| (\w+))(?:|(?:|the )default browser)$/ do |selection|
  test_config.setup((selection.nil?)? modal_param.browser_str : selection)
end

Then /^Refresh the browser$/ do
  begin
    test_config.browser.refresh
    sleep(2)
  rescue
    #ignore
  end
end

Then /^[Pp]ause for (\d+) [Ss]econd(?:|s)?$/ do |seconds|
  begin
    sleep(seconds.to_i)
  rescue
    #ignore
  end






























end

Then(/^Close the browser and clear cookies$/) do #Clear Cookies
  test_config.clear_cookies
end


