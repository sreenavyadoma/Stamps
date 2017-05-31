Then /^[Ee]xpect Profile page Privacy Policy link exists$/ do
  expect(registration.footer.privacy_policy_link.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age copyright link exists$/ do
  expect(registration.footer.copyright_link.present?).to be(true)
end

#Then /^[Ee]xpect [Pp]rofile [Pp]age Norton logo exists$/ do
  #expect(registration.footer.norton_logo.present?).to be (true)
#end

Then /^[Ee]xpect [Pp]rofile [Pp]age TRUSTe logo exists$/ do
  expect(registration.footer.trust_elogo.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age LIVE chat button exists$/ do
  expect(registration.footer.live_chat_button.present?).to be(true)
end
#:trust_elogo, :live_chat_button
#@live_chat_button = StampsElement.new(browser.html_tag(name: "property"))


#Then expect Profile page Privacy Policy link exists
#    Then expect Profile page copyright link exists
#    Then expect Profile page Norton logo exists
#    Then expect Profile page TRUSTe logo exists
#    Then expect Profile page LIVE chat button exists