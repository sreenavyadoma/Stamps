Then /^[Ll]oad WebReg Profile page$/ do
  webreg.load_page
end

Then /^[Ss]et WebReg Profile email textbox and username textbox to random$/ do

end


Then /^[Ee]xpect WebReg navigationbar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be(true)
end