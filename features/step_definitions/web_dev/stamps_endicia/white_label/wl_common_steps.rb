Then /^WL: establish stamps website db connection$/ do
  WhiteLabel.sdc_db_connection
end

Then /^WL: close stamps website db connection$/ do
  WhiteLabel.sdc_db_connection.close
end

# todo-Mohammed Please make the following changes
# 1. We need to keep our code up to 120 characters per line for readability. Anything over 320 lines should go to the
# next line of the code.
# 2.  We should only use TestData.hash[:param] if we need to pass parameters on step definition to other step
# definitions, otherwise, we should use a local variable.
# 2.a If you need to use TestData.hash[:param], do the assignment at the very end of the step definition. This is to
# indicate that you will use it's value else where.
# 3.  We will no longer use descriptions since it's redundant, instead of doing this;
# expect(Some.object).to be_present, "Object was not present"
# we should do this;
# expect(Some.object).to be_present
Then /^WL: navigates to default registration page for stamps with the following source id (?:random value|(.*))$/ do |str|
  step 'WL: establish stamps website db connection'
  common_page = WhiteLabel.common_page
  if str.nil?
    TestData.hash[:source_id], TestData.hash[:content], TestData.hash[:promo_code], TestData.hash[:offer_id], TestData.hash[:target_url]  = common_page.source_id_query(nil)
    if TestData.hash[:content].include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(TestData.hash[:content])
      TestData.hash[:security_questions_before_registration]  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      TestData.hash[:security_questions_before_registration] = 'true'
    end
  else
    TestData.hash[:source_id], TestData.hash[:content], TestData.hash[:promo_code], TestData.hash[:offer_id], TestData.hash[:target_url]  = common_page.source_id_query(str)
    if TestData.hash[:content].include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(TestData.hash[:content])
      TestData.hash[:security_questions_before_registration]  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      TestData.hash[:security_questions_before_registration] = 'true'
    end
  end

  step 'WL: close stamps website db connection'

  print "Sourceid = #{TestData.hash[:source_id]}\n"

  SDCWWebsite.visit
  common_page.stamps_logo.wait_until_present(timeout: 10)

  expect(SdcPage.browser.url).to include(TestData.hash[:target_url].to_s)

  common_page.get_started.click!

  TestData.hash[:username_taken] = WhiteLabel.common_page.username_query(TestData.hash[:username])
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
    expect(WhiteLabel.common_page.first_security_question).not_to be_present, 'First Security Question IS PRESENT before registration, when it should be PRESENT AFTER REGISTRATION'
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
    expect(WhiteLabel.common_page.second_security_question).not_to be_present, 'Second Security Question IS PRESENT after registration, when it should be PRESENT BEFORE REGISTRATION'
  end
end



Then /^WL: expect user is navigated to print page$/ do
  if SdcPage.browser.alert.exists?
    SdcPage.browser.alert.close
  end

  if WhiteLabel.common_page.account_created_continue.present?
    WhiteLabel.common_page.account_created_continue.click
  end

  WhiteLabel.common_page.print_stamps_logo.wait_until_present(timeout: 120) rescue false

  case  SdcEnv.env
    when :qacc
      expect(SdcPage.browser.url).to include('https://print.qacc.stamps.com')
    when :stg
      expect(SdcPage.browser.url).to include('https://print.staging.stamps.com')
    when ''
      expect(SdcPage.browser.url).to include('https://print.stamps.com')
  end
end

