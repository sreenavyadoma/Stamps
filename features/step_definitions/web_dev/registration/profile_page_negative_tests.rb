Then /^[Cc]lick Profile Page Continue button$/ do
  (registration.profile.continue_button.click)
end

Then /^[Ee]xpect Profile Page Email help text is (.*)$/ do |str|
  expect(registration.profile.email.help_text).to eql(str)
end

Then /^[Ee]xpect Profile Page Username help text is (.*)$/ do |str|
  expect(registration.profile.account_info.account_username.help_text).to eql(str)
end

Then /^[Ee]xpect Profile Page Password help text is (.*)$/ do |str|
  expect(registration.profile.account_info.account_password.help_text).to eql(str)
end

Then /^[Ee]xpect Profile Page Retype password help text is (.*)$/ do |str|
  expect(registration.profile.account_info.retype_password.help_text).to eql(str)
end

Then /^[Ee]xpect Profile Page Survey question help text is (.*)$/ do |str|
  expect(registration.profile.survey_question.help_text).to eql(str)
end

=begin
Then /^[Ss]et Profile Page Email to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end
=end



=begin
Then /^[Ee]xpect Profile page Email help text (\d+) is (.*)$/ do |number, str|
  expect(registration.profile.email.help_text(number.to_i)).to eql(str))
end

Then /^[Ss]et Profile Page Email to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end
=end

Then set Profile Page Email to sa
Then blur out of Profile Page

=begin

Then /^[Ee]xpect Profile page Email help text (\d+) is (.*)$/ do |number, str|
  expect(registration.profile.email.help_text(number.to_i)).to eql(str))
end

Then /^[Ss]et Profile Page Email to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end
=end

#Then set Profile Page Email to testqa@
#Then blur out of Profile Page


Then /^[Ee]xpect Profile page Email help text (\d+) is (.*)$/ do |number, str|
  expect(registration.profile.email.help_text(number.to_i)).to eql(str)
end

=begin
Then /^[Ss]et Profile Page Email to (.*)$/ do |str|

end
=end

Then set Profile page email to qawebdevelopment@stamps.com

=begin

Then /^[Ss]et Profile Page username to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end
=end


#Then set Profile page username to sa v
#Then blur out of the Profile page

Then /^[Ee]xpect Profile page username help text is (.*)$/ do |str|
  expect(registration.profile.account_info.account_username.help_text).to eql(str)
end

Then /^[Ss]et Profile Page username to (.*)$/ do |str|

end


Then /^[Ss]et Profile Page password to (.*)$/ do |str|

end



Then /^[Ee]xpect Profile page Password help text (\d+) is (.*)$/ do |number, str|
  expect(registration.profile.account_info.account_password.help_text(number.to_i)). to eql(str)
end



Then /^[Ee]xpect Profile page password help text is (.*)$/ do |number, str|
  expect(registration.profile.account_info.account_password.help_text(number.to_i)). to eql(str)
end


=begin

Then /^[Ss]et Profile page retype password field to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end
=end

Then /^[Ee]xpect Profile page retype password help text is (.*)$/ do |str|
  expect(registration.profile.account_info.retype_password.help_text). to eql(str)
end

Then /^[Ss]et Profile page retype password field to (.*)$/ do |str|

end

Then /^[Ss]et Profile page survey question to (.*)$/ do |str|

end

Then /^[Bb]lur blur out of Profile Page$/ do

end

Then /^[Cc]lick on link I have a promo code$/ do

end

=begin
Then /^[Ee]xpect Profile page promo code help text is not present$/ do
  expect()
end
=end

#Then expect Profile page promo code help text is not present

Then /^[Ss]et Profile page promo code field to (.*)$/ do |str|

end

Then /^[Ee]xpect Profile page promo code help text is (.*)$/ do |str|
  expect(registration.profile.promo_code.help_text). to eql(str)
end




##########################
#Then /^expect Profile Page Email help text (\d+) is (.*)$/ do |number, str|
  #expect(registration.profile.email.help_text(number.to_i-1)).to eql(str)
#end

#Then /^expect Profile Page Username help text is (.*)$/ do |str|
 # expect(registration.profile.username.help_text).to eql(str)
#end

