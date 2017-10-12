
Then /^[Ee]xpect [Rr]egistration navigation bar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo).to be_present, "Stamps logo doesn't exists on navigation bar"
end

Then /^[Ee]xpect [Rr]egistration navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo).to be_present, "USPS logo doesn't exists on navigation bar"
end


