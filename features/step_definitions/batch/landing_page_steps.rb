Given /^I am signed in as a batch shipper/ do
  expect { raise StandardError }.to raise_error
  batch.sign_in
end

Then /^Sign out$/ do
  batch.sign_out
end
