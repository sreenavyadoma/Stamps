
Then /^[Ss]et [Rr]egistration [Mm]embership first name text box to (.*)$/ do |firstname|
  registration.membership.first_name.set firstname
end

Then /^[Ss]et [Rr]egistration [Mm]embership last name text box to (.*)$/ do |lastname|
  registration.membership.last_name.set lastname
end

Then /^[Ss]et [Rr]egistration [Mm]embership company text box to (.*)$/ do |company|
  registration.membership.company.set company
end

Then /^[Ss]et [Rr]egistration [Mm]embership address text box to (.*)$/ do |address|
  registration.membership.address.set address
end

Then /^[Ss]et [Rr]egistration [Mm]embership city text box to (.*)$/ do |city|
  registration.membership.city.set city
end

Then /^[Ss]et [Rr]egistration [Mm]embership state text box to (.*)$/ do |state|
  registration.membership.state.set state
end

Then /^[Ss]et [Rr]egistration [Mm]embership zip text box to (.*)$/ do |zip|
  registration.membership.zip.set zip
end

Then /^[Ss]et [Rr]egistration [Mm]embership phone text box to (.*)$/ do |phone|
  registration.membership.phone.set phone
end

Then /^[Ss]et [Rr]egistration [Mm]embership cardholders name textbox to (.*)$/ do |cardholdersname|
  registration.membership.cardholders_name.set cardholdersname
end

Then /^[Ss]et [Rr]egistration [Mm]embership credit card number textbox to (.*)$/ do |creditcardnumber|
  registration.membership.credit_card_number.set creditcardnumber
end

Then /^[Ss]et [Rr]egistration [Mm]embership month dropdown to (.*)$/ do |month|
  registration.membership.month.set month
end

Then /^[Ss]et [Rr]egistration [Mm]embership year to (.*)$/ do |year|
  registration.membership.year.set year
end

Then /^[Ss]et [Rr]egistration [Mm]embership billing address same as mailing address$/ do
  registration.membership.billingadd_same_as_mailingadd
end

Then /^[Ss]et [Rr]egistration [Mm]embership terms and condition$/ do
  registration.membership.termsnconditions
end

Then /^[Ss]et Security questions page select first question to (.*)$/ do |str|
  registration.security_questions.first_question.select(str)
end

Then /^[Ss]et Security questions page select first answer to (.*)$/ do |str|
  registration.security_questions.first_answer.set(str)
end

Then /^[Ss]et Security questions page select second question to (.*)$/ do |str|
  registration.security_questions.second_question.select(str)
end

Then /^[Ss]et Security questions page select second answer to (.*)$/ do |str|
  registration.security_questions.second_answer.set(str)
end

Then /^[Cc]lick Get Started button$/ do
  registration.security_second_question.get_started_btn
end

Then /^[Oo]n [Mm]embership [Pp]age continue to Choose Supplies page$/ do
  registration.membership.submit_button
end

Then /^[Ee]xpect [Rr]egistration Security questions header contain (.*)$/ do |str|
  expect(registration.securityquestion.header).to eql(str)
end

Then /^[Ee]xpect [Rr]egistration Security questions subheader contain (.*)$/ do |str|
  expect(registration.securityquestion.subheader).to eql(str)
end

Then /^[Oo]n [Rr]egistration ATG page continue to Registration Security questions page$/ do
  registration.membership.atg_placeorderbutton
end

Then /^[Ee]xpect [Rr]egistration Securityquestions first secret question dropup to contain (.*)$/ do |str|
  expect(registration.securityquestion.firstsecret_question_dropup). to eql(str)
end

Then /^[Ee]xpect [Rr]egistration Securityquestions second secret question dropup to contain (.*)$/ do |str|
  expect(registration.securityquestion.secondsecret_question_dropup). to eql(str)
end

Then /^[Ee]xpect Registration Securityquestions get started button exists/ do
  registration.securityquestion.getstarted_button
end

Then /^[Ee]xpect congratulations message exists$/ do
  expect(registration.security_second_question.present?).to be(true)
end


