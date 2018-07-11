
Then /^[Ss]elect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.hash[:security_questions].first_security_question.select(TestData.hash[:first_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].first_security_question.text_box.text).to eql((str.nil?) ? TestData.hash[:first_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.hash[:security_questions].first_security_question.first_security_answer.set(TestData.hash[:first_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].first_security_question.first_security_answer.text).to eql((str.nil?) ? TestData.hash[:first_security_answer] : str)
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.hash[:security_questions].second_security_question.select(TestData.hash[:second_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].second_security_question.text_box.text).to eql((str.nil?) ? TestData.hash[:second_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.hash[:security_questions].second_security_question.second_security_answer.set(TestData.hash[:second_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].second_security_question.second_security_question.text).to eql((str.nil?) ? TestData.hash[:first_security_answer] : str)
end

Then /^[Cc]lick [Ss]ecurity [Qq]uestions [Pp]age [Cc]ontinue [Bb]utton$/ do
  TestData.hash[:security_questions].cont_btn.click
end

Then /^[Ee]xpect Security Questions successfully set dialog exists/ do
  expect(TestData.hash[:security_questions].window_title).to be_present, "Security Questions doesn't set up successfully"
end

Then /^[Ee]xpect Security Questions successfully set dialog contain (.*)/ do |str|
  expect(TestData.hash[:security_questions].security_que_successfully_msg.text).to eql(str)
end


Then /^sign out$/ do

end

Then /^wait for js to stop$/ do
  SdcPage.browser.wait_while { |b| b.execute_script("return Ext.Ajax.isLoading();") }
end






