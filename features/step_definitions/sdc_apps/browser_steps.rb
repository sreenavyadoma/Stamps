
Then /^Teardown$/ do
  SdcTest.teardown
end

Given /^I launched the browser$/ do
  step "Start test driver"
end

Then /^configure saucelabs$/ do

  SauceLabs.host = ENV['SELENIUM_HOST']
  SauceLabs.port = ENV['SELENIUM_PORT']
  SauceLabs.platform = ENV['SELENIUM_PLATFORM']
  SauceLabs.version = ENV['SELENIUM_VERSION']
  SauceLabs.browser = ENV['SELENIUM_BROWSER']
  SauceLabs.driver = ENV['SELENIUM_DRIVER']
  SauceLabs.url = ENV['SELENIUM_URL']
  SauceLabs.sauce_username = ENV['SAUCE_USERNAME']
  SauceLabs.sauce_access_key = ENV['SAUCE_ACCESS_KEY']
  SauceLabs.selenium_starting_url = ENV['SELENIUM_STARTING_URL']
  SauceLabs.sauce_on_demand_browsers = ENV['SAUCE_ONDEMAND_BROWSERS']
end

Then /^Start test driver$/ do
  SdcTest.configure
end

Then /^refresh the browser$/ do
  begin
    SdcDriver.browser.refresh
    sleep(2)
  rescue
    # ignore
  end
end

Then /^pause for (\d+) second(?:|s)?$/ do |seconds|
  if SdcEnv.new_framework
    #skip for now
    sleep(seconds.to_i)
  else
    begin
      sleep(seconds.to_i)
    rescue
      # ignore
    end
  end
end


