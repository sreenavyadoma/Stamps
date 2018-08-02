Then /^WL: expect registration navigation bar stamps logo exists$/ do
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 60)
  expect(stamps_logo).to be_present
end

Then /^WL: expect registration navigation bar usps logo exists$/ do
  expect(WhiteLabel.common_page.usps_logo).to be_present
end


Then /^WL: establish stamps website db connection$/ do
  WhiteLabel.sdc_db_connection
end

Then /^WL: close stamps website db connection$/ do
  WhiteLabel.sdc_db_connection.close
end

Then /^WL: navigates to default registration page for stamps with the following offer id (?:random value|(.*))$/ do |str|
  SdcPage.browser.cookies.clear

  step 'WL: establish stamps website db connection'
  common_page = WhiteLabel.common_page
  if str.nil?
    source_id, content, promo_code, offer_id, target_url = common_page.sdc_website_source_id_query(nil)
    if content.include? 'SecurityQuestionsBeforeRegistration'
      hash = Hash.from_xml(content)
      security_questions_before_reg  = hash['root']['SecurityQuestionsBeforeRegistration']
    else
      security_questions_before_reg = 'true'
    end
  else
    source_id, content, promo_code, offer_id, target_url  = common_page.sdc_website_source_id_query(str)
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
  SdcLogger.info "Sourceid = #{source_id}"

  TestData.hash[:source_id] = source_id
  TestData.hash[:content] = content
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
  TestData.hash[:security_questions_before_registration] = security_questions_before_reg
end

#...................Security Question.....................#
Then /^WL: expect security questions header to be (.*)$/ do |str|
  sq_header = WhiteLabel.common_page.sq_header
  sq_header.wait_until_present(timeout: 100)
  expect(sq_header.text_value).to eql(str)
end

Then /^WL: expect profile security questions header to be (.*)$/ do |str|
  expect(WhiteLabel.common_page.sq_header_profile.text_value.strip).to eql(str)
end

Then /^WL: expect profile security questions header is not present$/ do
  expect(WhiteLabel.common_page.sq_header_profile).not_to be_present
end

Then /^WL: expect security questions title to be (.*)$/ do |str|
  security_question_title = WhiteLabel.common_page.security_question
  security_question_title.wait_until_present(timeout: 5)
  expect(security_question_title.text_value).to eql(str)
end

Then /^WL: select security questions first security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.first_security_question.wait_until_present(timeout: 30)
  common_page.first_security_question.click
  common_page.dropdown_selection(str, 0)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  TestData.hash[:first_security_question] = common_page.first_security_question.attribute_value('title').strip
  expect(TestData.hash[:first_security_question]).to eql str
end

Then /^WL: expect first security question tooltip index (\d+) to be (.*)$/ do |index, str|
  first_security_question_help_block = WhiteLabel.common_page.first_security_question_help_block
  first_security_question_help_block.wait_until_present(timeout: 5)
  help_block_text = first_security_question_help_block.text_value.split("\n")
  expect(help_block_text[index - 1]).to eql(str)
end

Then /^WL: expect security questions first security question is (?:correct|(.*))$/ do |str|
  first_security_question = WhiteLabel.common_page.first_security_question
  str ||= TestData.hash[:first_security_question]
  expect(first_security_question.title).to eql(str)
  TestData.hash[:first_security_question] = str
end

Then /^WL: set security questions first security answer to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.first_secret_answer.set(str)
  TestData.hash[:first_security_answer] = str
end

Then /^WL: expect first security answer tooltip index (\d+) to be (.*)$/ do |index, str|
  first_security_answer_help_block = WhiteLabel.common_page.first_security_answer_help_block
  first_security_answer_help_block.wait_until_present(timeout: 5)
  help_block_text = first_security_answer_help_block.text_value.split("\n")
  expect(help_block_text[index - 1]).to eql(str)
end

Then /^WL: select security questions second security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.second_security_question.click
  common_page.dropdown_selection(str, 1)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  TestData.hash[:second_security_question] = common_page.second_security_question.attribute_value('title').strip
  expect(TestData.hash[:second_security_question]).to eql str
end

Then /^WL: expect second security question tooltip index (\d+) to be (.*)$/ do |index, str|
  second_security_question_help_block = WhiteLabel.common_page.second_security_question_help_block
  second_security_question_help_block.wait_until_present(timeout: 5)
  help_block = second_security_question_help_block.text_value.split("\n")
  expect(help_block[index - 1]).to eql(str)
end

Then /^WL: expect security questions second security question is (?:correct|(.*))$/ do |str|
  second_security_question = WhiteLabel.common_page.second_security_question
  str ||= TestData.hash[:second_security_question]
  expect(second_security_question.title).to eql(str)
  TestData.hash[:second_security_question] = str
end

Then /^WL: set security questions second security answer to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min:6, max:10)
  WhiteLabel.common_page.second_secret_answer.set(str)
  TestData.hash[:second_security_answer] = str
end

Then /^WL: expect second security answer tooltip index (\d+) to be (.*)$/ do |index, str|
  second_security_answer_help_block = WhiteLabel.common_page.second_security_answer_help_block
  second_security_answer_help_block.wait_until_present(timeout: 5)
  help_block = second_security_answer_help_block.text_value.split("\n")
  expect(help_block[index - 1]).to eql(str)
end

Then /^WL: expect security question page tooltip to be (.*)$/ do |str|
  sq_page_sq_help_block =  WhiteLabel.common_page.sq_page_sq_help_block
  expect(sq_page_sq_help_block[0].inner_text.strip).to eql(str)
  expect(sq_page_sq_help_block[1].inner_text.strip).to eql(str)
  expect(sq_page_sq_help_block[2].inner_text.strip).to eql(str)
  expect(sq_page_sq_help_block[3].inner_text.strip).to eql(str)
end

Then /^WL: click security questions get started button$/ do
  WhiteLabel.common_page.sq_get_started.click
end

Then /^WL: expect security questions get started button exists$/ do
  WhiteLabel.common_page.sq_get_started.wait_until_present(timeout: 50)
  expect(WhiteLabel.common_page.sq_get_started).to be_present
end

Then /^WL: expect security question modal does not exists$/ do
  expect(WhiteLabel.common_page.security_question).not_to be_present
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
    step 'WL: click security questions get started button'
  else
    expect(WhiteLabel.common_page.second_security_question).not_to be_present
  end
end

#...............................Username Taken Modal....................#
Then /^WL: if username taken is present then set username to (?:random value|(.*))$/ do |str|
  membership_page =  WhiteLabel.membership_page
  if TestData.hash[:username_taken] == TestData.hash[:username]
    expect(membership_page.username_taken_header).not_to be_present
  else
    membership_page.new_username.wait_until_present(timeout: 5)
    expect(membership_page.username_taken_header).to be_present
    membership_page.new_username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))

    SdcLogger.info "UserName = #{TestData.hash[:username]}"
    step 'WL: click username taken continue button'
  end
end

Then /^WL: set username taken to (?:random value|(.*))/ do |str|
  new_username = WhiteLabel.membership_page.new_username
  new_username.set((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
  new_username.send_keys(:tab)
  SdcLogger.info "UserName Taken = #{TestData.hash[:username]}"
end

Then /^WL: set username taken username to an existing username from db$/ do
  existing_usr = WhiteLabel.common_page.existing_username_query
  step "WL: set username taken to #{existing_usr}"
end

Then /^WL: click username taken continue button$/ do
  WhiteLabel.membership_page.username_taken_continue_btn.click!
end

Then /^WL: expect username taken header to be (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.username_taken_header.wait_until_present(timeout: 15)
  expect(membership_page.username_taken_header.text_value.strip).to eql(str)
end

Then /^WL: expect username taken paragraph to be$/ do |str|
  username_taken_p = WhiteLabel.membership_page.username_taken_p
  actual = username_taken_p.text_value.strip.gsub(/\P{ASCII}/, '')
  expected = str.gsub('USERNAME', TestData.hash[:username].strip)

  expect(expected).to eql(actual)
end

Then /^WL: expect username taken tooltip to be (.*)$/ do |str|
  membership_page = WhiteLabel.membership_page
  membership_page.new_username.send_keys(:tab)
  membership_page.new_username.send_keys(:tab)
  membership_page.new_username_help_block.wait_until_present(timeout: 2)
  expect(membership_page.new_username_help_block.text_value.strip).to eql(str)
end

#.........................An Error Occurred..............................#
Then /^WL: expect an error occurred modal head to be (.*)$/ do |str|
  error_occurred_header = WhiteLabel.common_page.error_occurred_header
  error_occurred_header.wait_until_present(timeout: 5)
  expect(error_occurred_header.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_p.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal error code to be (.*)$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_error_code.text_value.strip).to eql(str)
end

Then /^WL: expect an error occurred modal error description to include (.*)$/ do |str|
  expect(WhiteLabel.common_page.error_occurred_error_description.text_value.strip).to include(str)
end

#................................Offer 573 Landing Page..............................#
Then /^WL: expect offer 573 landing page header to be (.*)$/ do |str|
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_573_header = WhiteLabel.common_page.offer_573_header
  offer_573_header.wait_until_present(timeout: 30)
  step 'pause for 1 second'
  expect(offer_573_header.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page sub header paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.offer_573_p.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page hp upgrade paragraph to be$/ do |str|
  expect(WhiteLabel.common_page.offer_573_p2.text_value.strip).to eql(str)
end

Then /^WL: expect offer 573 landing page shipping labels img is present$/ do
  expect(WhiteLabel.common_page.offer_573_img).to be_present
end

#..........................Offer 592 Landing Page.............................#
Then /^WL: expect offer 592 landing page header to be (.*)$/ do |str|
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_592_header = WhiteLabel.common_page.offer_592_header
  offer_592_header.wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(offer_592_header.text_value.strip).to eql(str)
end

Then /^WL: expect offer 592 landing page paragraph index (\d+) to be$/ do |index, str|
  expect(WhiteLabel.common_page.offer_592_p[index-1].inner_text.strip).to eql(str)
end

Then /^WL: click offer 592 landing page continue button$/ do
  WhiteLabel.common_page.offer_592_continue.click
end

Then /^WL: expect offer 592 landing page avery img is present$/ do
  SdcPage.browser.alert.close if SdcPage.browser.alert.exists?

  offer_592_avery = WhiteLabel.common_page.offer_592_avery
  offer_592_avery[0].wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(offer_592_avery[0]).to be_present
  expect(SdcPage.browser.url).to include("avery.com/myavery")
end

#.............................Printing Landing Page..............................#
Then /^WL: expect user is navigated to print page$/ do
  step 'pause for 2 second'
  if SdcPage.browser.alert.exists?
    SdcPage.browser.alert.close
  end

  common_page= WhiteLabel.common_page

  if SdcEnv.browser == :edge
  common_page.print_edge_detail_link.safe_wait_until_present(timeout: 10)
  common_page.print_edge_detail_link.click if common_page.print_edge_detail_link.present?
  common_page.print_cert_error.click if common_page.print_cert_error.present?
  end

  common_page.print_stamps_logo.wait_until_present(timeout: 120) rescue false

  case  SdcEnv.env
    when :qacc
      expect(SdcPage.browser.url).to include('https://print.qacc.stamps.com')
    when :stg
      expect(SdcPage.browser.url).to include('https://print.staging.stamps.com')
    when ''
      expect(SdcPage.browser.url).to include('https://print.stamps.com')
  end
  expect(common_page.print_username.attribute_value('title').strip).to eql(TestData.hash[:username])
end

#..................................Modal....................#
Then /^WL: click modal continue button$/ do
  modal_continue = WhiteLabel.common_page.modal_continue
  modal_continue.wait_until_present(timeout: 2)
  modal_continue.click
  step 'pause for 1 second'
end

Then /^WL: click modal cancel button$/ do
  modal_cancel = WhiteLabel.common_page.modal_cancel
  modal_cancel.wait_until_present(timeout: 2)
  modal_cancel.click
  step 'pause for 1 second'
end


Then /^WL: click modal x button$/ do
  modal_x = WhiteLabel.common_page.modal_x
  modal_x.wait_until_present(timeout: 2)
  modal_x.click if modal_x.present?
  step 'pause for 1 second'
end
