Then /^WL: establish stamps website db connection$/ do
  WhiteLabel.sdc_db_connection
end

Then /^WL: close stamps website db connection$/ do
  WhiteLabel.sdc_db_connection.close
end

Then /^WL: navigates to default registration page for stamps with the following source id (?:random value|(.*))$/ do |str|
  step 'WL: establish stamps website db connection'
  common_page = WhiteLabel.common_page
  if str.nil?
    source_id, content, promo_code, offer_id, target_url = common_page.source_id_query(nil)
    if content.include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(content)
      security_questions_before_reg  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      security_questions_before_reg = 'true'
    end
  else
    source_id, content, promo_code, offer_id, target_url  = common_page.source_id_query(str)
    if content.include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(content)
      security_questions_before_reg  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      security_questions_before_reg = 'true'
    end
  end
  step 'WL: close stamps website db connection'

  SDCWWebsite.visit(source_id)
  common_page.stamps_logo.wait_until_present(timeout: 10)
  expect(SdcPage.browser.url).to include(target_url.to_s)

  common_page.get_started.click!

  print "Sourceid = #{source_id}\n"

  TestData.hash[:source_id] = source_id
  TestData.hash[:content] = content
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
  TestData.hash[:security_questions_before_registration] = security_questions_before_reg
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
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.first_secret_answer.set(str)
  TestData.hash[:first_security_answer] = str
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
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.second_secret_answer.set(str)
  TestData.hash[:second_security_answer] = str
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
    expect(WhiteLabel.common_page.first_security_question).not_to be_present
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
    expect(WhiteLabel.common_page.second_security_question).not_to be_present
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

