
Then /^[Ee]xpect WebReg navigation bar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^[Ee]xpect WebReg navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end

