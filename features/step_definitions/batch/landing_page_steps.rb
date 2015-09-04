Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper$/ do
  batch.sign_in
end

Then /^Sign out$/ do
  #batch.navigation_bar.sign_out
end
