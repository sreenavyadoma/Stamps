
Then /^[Ee]xpect [Rr]egistration navigation bar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^[Ee]xpect [Rr]egistration navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end


