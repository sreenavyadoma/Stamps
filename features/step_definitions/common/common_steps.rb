Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  if browser.downcase.include? "default"
    @browser = Stamps::Test.setup
  else
    @browser = Stamps::Test.setup browser
  end
end

Then /^BROWSER:  Zoom Out$/ do
  @browser.send_keys [:control, '-']
end

Then /^BROWSER:  Zoom In$/ do
  @browser.send_keys [:control, '+']
end

