############ homepage #########

Then /^WL: expect homepage left content header is (.*)$/ do |str|
  microphone_text = WhiteLabel.common_page.microphone_text
  microphone_text.wait_until_present(timeout: 1)
  str ||= TestData.hash[:microphone_text]
  expect(microphone_text.text_value.gsub(/\n/, '')).to eql(str)
end