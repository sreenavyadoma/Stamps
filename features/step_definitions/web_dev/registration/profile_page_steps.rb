Then /^(?:|[Ii] )[Ll]oad(?:|ed) (?:|default )[Rr]egistration(?: [Pp]age| [Tt]heme (.*))$/ do |str|
  parameter[:registration_theme] = str
  step "I launch default browser"
  registration.load_theme(parameter[:registration_theme])
end

Then /^(?:|[Ii] )[Ll]oad(?:|ed) SDC Website$/ do
  step "I launch default browser"
  sdc_website.load_page
end

Then /^click on Get Started$/ do
  registration = sdc_website.get_started
end

Then /^[Ss]et [Pp]rofile [Ee]mail to (?:random value|(.*))$/ do |str|
  parameter[:email] = (str.nil?)?(helper.random_email):str
  registration.profile.email.wait_until_present(10)
  registration.profile.email.set(parameter[:email])
end

Then /^[Ee]xpect [Pp]rofile [Ee]mail is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:email]:str
  expect(registration.profile.email.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Uu]sername to (?:random value|(.*))$/ do |str|
  parameter[:username] = (str.nil?)?(helper.random_string):str
  registration.profile.account_info.account_username.set(parameter[:username])
end

Then /^[Ee]xpect [Pp]rofile [Uu]sername is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:username]:str
  expect(registration.profile.account_info.account_username.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]assword to (?:random value|(.*))$/ do |str|
  parameter[:password] = (str.nil?)?(helper.random_password):str
  registration.profile.account_info.account_password.set(parameter[:password])
end

Then /^[Ee]xpect [Pp]rofile [Pp]assword is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:password]:str
  expect(registration.profile.account_info.account_password.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Rr]e-[Tt]ype [Pp]assword to (?:random value|(.*))$/ do |str|
  registration.profile.account_info.retype_password.set((str.nil?)?(parameter[:password]):str)
end

Then /^[Ee]xpect [Pp]rofile [Rr]e-[Tt]ype [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(registration.profile.account_info.retype_password.text).to eql(parameter[:password])
end

Then /^set [Pp]rofile [Ss]urvey [Qq]uestion to (.*)$/ do |str|
  parameter[:survey_question] = str
  parameter[:survey_question_selected] = registration.profile.survey_question.select(str)
end

Then /^set [Pp]rofile [Pp]romo [Cc]ode to (.*)$/ do |str|
  parameter[:promo_code] = str
  registration.profile.promo_code.show_promo_code.set(parameter[:promo_code])
end

Then /^[Ee]xpect [Pp]rofile [Pp]romo [Cc]ode is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?parameter[:promo_code]:str
  expect(registration.profile.promo_code.text_box.text).to eql(str)
end

Then /^check [Pp]rofile [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.check
end

Then /^[Ee]xpect [Pp]rofile [Mm]oney-saving offers and new products is checked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).to be_checked
end

Then /^uncheck [Pp]rofile [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.uncheck
end

Then /^[Ee]xpect [Pp]rofile [Mm]oney-saving offers and new products is unchecked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).to be_unchecked
end
















# legacy

Then /^select [Pp]rofile Security Question 1 (.*)$/ do |str|

end

Then /^[Oo]n [Pp]rofile page, Continue$/ do
  registration.profile.continue.click
end

Then /^[Oo]n [Pp]rofile page, continue to Mailing Information page$/ do
  10.times do
    registration.profile.continue.click
    sleep(0.35)
    break if registration.profile.membership.present?
  end
  expect("Unable to continue....").to eql "Mailing Information page Did not load." unless registration.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  expect(@registration_result).to be_truthy
  case @registration_result
    when Registration::UserIdTaken
      message = @registration_result.message
      raise "USER ID IS TAKEN!  #{message}"
    when Registration::ChooseSupplies
      if @registration_result.present?
        @web_mail = @registration_result.place_order
      end
    else
      raise "Unable to Place Order. Supplies page did not load"
  end
end

Then /^Registration Result: Wait for Download Page or Webpostage page to load$/ do
  case @registration_result_page
    when MailLandingPage
      @registration_result_page.wait_until_url_loads
    when Registration::DownloadPage
      @web_mail.landing_page.wait_until_present 10
    else
      #do nothing
  end
end


Then(/^Clear Email Field$/) do
  registration.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  registration.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  registration.profile.survey_question.clear
end

Then(/^Clear 1st Question$/) do
  registration.profile.secret_questions.secret_question_1.clear
end

Then(/^Clear 2nd Question$/) do
  registration.profile.secret_questions.secret_question_2.clear
end

