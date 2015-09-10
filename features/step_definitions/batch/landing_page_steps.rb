
Given /^I am signed in as a batch shipper (.*)/ do |browser|
  @browser = Stamps.setup browser
  batch.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  @browser = Stamps.setup browser
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  @browser = Stamps.setup
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper$/ do
  @browser = Stamps.setup
  batch.sign_in
end

Then /^Sign out$/ do
  #batch.navigation_bar.sign_out
end
