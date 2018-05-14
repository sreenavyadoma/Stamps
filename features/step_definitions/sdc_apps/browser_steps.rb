
Then /^Teardown$/ do
  SdcTest.teardown
end

Given /^I launched the browser$/ do
  step "Start test driver"
end

Then /^Start test driver$/ do
  SdcTest.configure
end

Then /^Refresh the browser$/ do
  begin
    SdcDriver.browser.refresh
    sleep(2)
  rescue
    # ignore
  end
end

Then /^[Pp]ause for (\d+) [Ss]econd(?:|s)?$/ do |seconds|
  if SdcEnv.new_framework
    #skip for now
  else
    begin
      sleep(seconds.to_i)
    rescue
      # ignore
    end
  end
end


