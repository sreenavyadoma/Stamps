

Then /^[Ee]xpect WebReg Profile copyright link exists$/ do
  expect(registration.footer.copyright_link.present?).to be (true)
  #expect(registration.footer.copyright_link).to be_present
end

Then /^[Ee]xpect WebReg Profile Norton logo exists$/ do
  expect(registration.footer.norton_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile TRUSTe logo exists$/ do
  expect(registration.profile.trust_elogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile LIVE chat button exists$/ do
  expect(registration.profile.live_chat_button.present?).to be (true)
end
#:trust_elogo, :live_chat_button
#@live_chat_button = StampsElement.new(browser.html_tag(name: "property"))