Then /^[Ee]xpect WebReg Profile Privacy Policy link exists$/ do
  expect(registration.profile_privacy_policy.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile copyright link exists$/ do
  expect(registration.profile_copyrightlink.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Norton logo exists$/ do
  expect(registration.profile_nortonlogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile TRUSTe logo exists$/ do
  expect(registration.profile_trustelogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile LIVE chat button exists$/ do
  expect(registration.profile_livechatbutton.present?).to be (true)
end
