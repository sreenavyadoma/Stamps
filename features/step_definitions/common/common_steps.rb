Given /^I launch browser$/ do
  log.info "I launch browser"
  @browser = Stamps::Test.setup
end

Then /^Teardown$/ do
  log.info "Teardown"
  Stamps::Test.teardown
end

Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  if browser.downcase.include? "default"
    @browser = Stamps::Test.setup
  else
    @browser = Stamps::Test.setup browser
  end
end

Then /^Refresh Browser$/ do
  @browser.refresh
end

Then /^Pause for (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end
