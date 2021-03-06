Then /^[Ee]xpect Profile page Privacy Policy link exists$/ do
  expect(registration.footer.privacy_policy_link).to be_present, "Privacy Policy link doesn't exists in footer of a page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age copyright link exists$/ do
  expect(registration.footer.copyright_link).to be_present, "Copyright link doesn't exists in footer of a page"
end

#Then /^[Ee]xpect [Pp]rofile [Pp]age Norton logo exists$/ do
  #expect(registration.footer.norton_logo.present?).to be (true)
#end

Then /^[Ee]xpect [Pp]rofile [Pp]age TRUSTe logo exists$/ do
  expect(registration.footer.trust_elogo).to be_present, "TRUSTe logo doesn't exists in footer of a page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age LIVE chat button exists$/ do
  expect(registration.footer.live_chat_button).to be_present, "LIVE chat button doesn't exists in footer of a page"
end


#:trust_elogo, :live_chat_button
#@live_chat_button=StampsElement.new(driver.html_tag(name: "property"))


#Then expect Profile page Privacy Policy link exists
#    Then expect Profile page copyright link exists
#    Then expect Profile page Norton logo exists
#    Then expect Profile page TRUSTe logo exists
#    Then expect Profile page LIVE chat button exists