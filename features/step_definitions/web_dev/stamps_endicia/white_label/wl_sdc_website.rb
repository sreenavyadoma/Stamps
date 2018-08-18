############ homepage #########

Then /^WL: expect homepage left content header is (.*)$/ do |str|
  hp_left_content_hdr = WhiteLabel.white_label_sdc_website.hp_left_content_hdr
  hp_left_content_hdr.wait_until_present(timeout: 1)
  str ||= TestData.hash[:hp_left_content_hdr]
  expect(hp_left_content_hdr.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^WL: expect homepage left content click image exists$/ do
  click_img = WhiteLabel.white_label_sdc_website.hp_click
  click_img.wait_until_present(timeout: 60)
  expect(click_img).to be_present
end

Then /^WL: expect homepage left content click header is (.*)$/ do |str|
  expect(WhiteLabel.white_label_sdc_website.hp_click_hdr.text_value.strip).to eql(str)
end

Then /^WL: expect homepage left content print image exists$/ do
  print_img = WhiteLabel.white_label_sdc_website.hp_print
  print_img.wait_until_present(timeout: 60)
  expect(print_img).to be_present
end

Then /^WL: expect homepage left content print header is (.*)$/ do |str|
  expect(WhiteLabel.white_label_sdc_website.hp_print_hdr.text_value.strip).to eql(str)
end

Then /^WL: expect homepage left content mail image exists$/ do
  mail_img = WhiteLabel.white_label_sdc_website.hp_mail
  mail_img.wait_until_present(timeout: 60)
  expect(mail_img).to be_present
end

Then /^WL: expect homepage left content mail header is (.*)$/ do |str|
  expect(WhiteLabel.white_label_sdc_website.hp_mail_hdr.text_value.strip).to eql(str)
end


Then /^WL: expect homepage left content click text is (.*)$/ do |str|
  hp_click_txt = WhiteLabel.white_label_sdc_website.hp_click_txt
  expect(hp_click_txt.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^WL: expect homepage left content print text is (.*)$/ do |str|
  hp_print_txt = WhiteLabel.white_label_sdc_website.hp_print_txt
  expect(hp_print_txt.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^WL: expect homepage left content mail text is (.*)$/ do |str|
  hp_mail_txt = WhiteLabel.white_label_sdc_website.hp_mail_txt
  expect(hp_mail_txt.text_value.gsub(/\n/, '')).to eql(str)
end
