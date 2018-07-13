Then /^WL: establish stamps website db connection$/ do
  WhiteLabel.db_connection
end

Then /^WL: close stamps website db connection$/ do
  WhiteLabel.db_connection.close
end

Then /^WL: navigates to default registration page for stamps$/ do
  common_page = WhiteLabel.common_page
  step 'WL: establish stamps website db connection'
  TestData.hash[:source_id] , TestData.hash[:content]  = common_page.source_id_query
  step 'WL: close stamps website db connection'

  if TestData.hash[:content].include? 'SecurityQuestionsBeforeRegistration'
    hash = Hash.from_xml(TestData.hash[:content])
    TestData.hash[:security_questions_before_registration]  = hash['root']['SecurityQuestionsBeforeRegistration']
  else
    TestData.hash[:security_questions_before_registration] = 'true'
  end

  SDCWWebsite.visit
  common_page.stamps_logo.wait_until_present(timeout: 10)
  common_page.get_started.click!

end

Then /^WL: select security questions first security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.first_security_question.wait_until_present(timeout: 30)
  common_page.first_security_question.click
  common_page.dropdown_selection(str, 0)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  expect(common_page.first_security_question.attribute_value('title').strip).to eql str
end

Then /^WL: set security questions first security answer to (?:random value|(.*))$/ do |str|
  WhiteLabel.common_page.first_secret_answer.set(TestData.hash[:first_security_answer] = (str.nil?) ? TestHelper.rand_alpha_numeric(min:6, max:10) : str)
end

Then /^WL: select security questions second security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.second_security_question.click
  common_page.dropdown_selection(str, 1)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  expect(common_page.second_security_question.attribute_value('title').strip).to eql str
end

Then /^WL: set security questions second security answer to (?:random value|(.*))$/ do |str|
  WhiteLabel.common_page.second_secret_answer.set(TestData.hash[:second_security_answer] = (str.nil?) ? TestHelper.rand_alpha_numeric(min:6, max:10) : str)
end

Then /^WL: click security questions get stared button$/ do
  WhiteLabel.common_page.sq_get_started.click
end

Then /^WL: if security question is present before registration then set the values$/ do
  if TestData.hash[:security_questions_before_registration] == 'true'
    step "WL: select security questions first security question What is your mother's maiden name?"
    step 'WL: set security questions first security answer to random value'
    step "WL: select security questions second security question What is your pet's name?"
    step 'WL: set security questions second security answer to random value'
  else
    #ignore
  end
end

Then /^WL: if security question is present after registration then set the values$/ do
  if TestData.hash[:security_questions_before_registration] == 'false'
    step "WL: select security questions first security question What is your mother's maiden name?"
    step 'WL: set security questions first security answer to random value'
    step "WL: select security questions second security question What is your pet's name?"
    step 'WL: set security questions second security answer to random value'
    step 'WL: click security questions get stared button'
  else
    #ignore
  end
end


Then /^WL: if username taken is present then set username to (?:random value|(.*))$/ do |str|
  sleep 10
  if WhiteLabel.common_page.new_username.present? == true
    WhiteLabel.common_page.new_username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
  else
    #ignore
  end
end

Then /^Then WL: click username taken continue button$/ do
  WhiteLabel.common_page.username_taken_continue_btn.click
end




Then /^WL: expect user is singed in to print$/ do
  signed_in_user =  SdcWebsite.navigation.user_drop_down.signed_in_user
  5.times do
    if signed_in_user.present? == true
      break
    end
  end
  SdcPage.browser.refresh
  signed_in_user.wait_until_present(timeout: 30)
  expect(signed_in_user.text_value).to include(TestData.hash[:username])
end

