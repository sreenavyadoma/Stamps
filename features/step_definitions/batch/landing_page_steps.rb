=begin
Given /^I am signed in as a batch shipper with credentials auto01/password1/ do
  log
  batch.sign_in
end
=end

Given /^I am signed in as a batch shipper with credentials (.*)\/(.*)/ do |username, password|
  #expect { raise StandardError }.to raise_error
  batch.sign_in username, password
end

Then /^Sign out$/ do
  batch.sign_out
end
