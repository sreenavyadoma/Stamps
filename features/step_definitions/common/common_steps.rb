Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  @browser = Stamps::Test.setup browser
end

Given /^I launch default browser$/ do
  log.info "Step: I launch default browser"
  @browser = Stamps::Test.setup
end