Given /^I am signed in as a batch shipper/ do
  log
  batch.sign_in
end

Given /^I am signed in as a batch shipper with credentials (.*)\/(.*)/ do |username, password|
  #expect { raise StandardError }.to raise_error
  batch.sign_in username, password
end

Then /^Sign out$/ do
  batch.sign_out
end
