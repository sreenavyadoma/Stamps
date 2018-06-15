
Then /^Teardown$/ do
  SdcTest.teardown
end

Given /^I launched the browser$/ do
  step "Start test driver"
end

Then /^configure saucelabs$/ do
  # SdcLogger.info "SELENIUM_HOST: #{SauceLabs.host}"
  # SdcLogger.info "SELENIUM_PORT: #{SauceLabs.port}"
  # SdcLogger.info "SELENIUM_PLATFORM: #{SauceLabs.platform}"
  # SdcLogger.info "SELENIUM_VERSION: #{SauceLabs.version}"
  # SdcLogger.info "SELENIUM_BROWSER: #{SauceLabs.browser}"
  # SdcLogger.info "SELENIUM_DRIVER: #{SauceLabs.driver}"
  # SdcLogger.info "SELENIUM_URL: #{SauceLabs.url}"
  # SdcLogger.info "SAUCE_USERNAME: #{SauceLabs.sauce_username}"
  # SdcLogger.info "SAUCE_ACCESS_KEY: #{SauceLabs.sauce_access_key}"
  # SdcLogger.info "SELENIUM_STARTING_URL: #{SauceLabs.selenium_starting_url}"
  # SdcLogger.info "SAUCE_ONDEMAND_BROWSERS: #{SauceLabs.sauce_on_demand_browsers}"
  # SdcLogger.info 'Jenkins....'
  # SdcLogger.info "JOB_NAME: #{ENV['JOB_NAME']}"
  # SdcLogger.info "JOB_BASE_NAME: #{ENV['JOB_BASE_NAME']}"
  # SdcLogger.info "BUILD_TAG: #{ENV['BUILD_TAG']}"
  # SdcLogger.info "BUILD_NUMBER: #{ENV['BUILD_NUMBER']}"
  # SdcLogger.info "BUILD_ID: #{ENV['BUILD_ID']}"
  # SdcLogger.info "NODE_NAME: #{ENV['NODE_NAME']}"
  # SdcLogger.info "EXECUTOR_NUMBER: #{ENV['EXECUTOR_NUMBER']}"
  # SdcLogger.info "NODE_LABELS: #{ENV['NODE_LABELS']}"
  # SdcLogger.info "WORKSPACE: #{ENV['WORKSPACE']}"
  # SdcLogger.info "JENKINS_URL: #{ENV['JENKINS_URL']}"
  # SdcLogger.info "BUILD_URL: #{ENV['BUILD_URL']}"
  # SdcLogger.info "JOB_URL: #{ENV['JOB_URL']}"

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


