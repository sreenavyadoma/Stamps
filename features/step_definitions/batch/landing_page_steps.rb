Given /^I am signed in as a batch shipper/ do
  batch.sign_in
end

Then /^Sign out$/ do
  batch.sign_out
end
