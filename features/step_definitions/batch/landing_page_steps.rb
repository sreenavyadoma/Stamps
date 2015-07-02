Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  #expect { raise StandardError }.to raise_error
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper$/ do
  #expect { raise StandardError }.to raise_error
  batch.sign_in
end

Then /^Sign out$/ do
  batch.navigation_bar.sign_out
end
