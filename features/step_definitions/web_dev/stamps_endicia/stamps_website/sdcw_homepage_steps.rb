
Then /^SDCW: navigate to home page$/ do
  StampsWebsite::SDCWWebsite.visit
  stamps_logo = StampsWebsite.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  expect(stamps_logo).to be_present
end

Then /^SDCW: expect homepage left content header is (.*)$/ do |str|
  hp_left_content_hdr = StampsWebsite.home_page.hp_left_content_hdr
  hp_left_content_hdr.wait_until_present(timeout: 1)
  str ||= TestData.hash[:hp_left_content_hdr]
  expect(hp_left_content_hdr.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^SDCW: expect homepage left content click image exists$/ do
  click_img = StampsWebsite.home_page.hp_click
  click_img.wait_until_present(timeout: 60)
  expect(click_img).to be_present
end

Then /^SDCW: expect homepage left content click header is (.*)$/ do |str|
  expect(StampsWebsite.home_page.hp_click_hdr.text_value.strip).to eql(str)
end

Then /^SDCW: expect homepage left content print image exists$/ do
  print_img = StampsWebsite.home_page.hp_print
  print_img.wait_until_present(timeout: 60)
  expect(print_img).to be_present
end

Then /^SDCW: expect homepage left content print header is (.*)$/ do |str|
  expect(StampsWebsite.home_page.hp_print_hdr.text_value.strip).to eql(str)
end

Then /^SDCW: expect homepage left content mail image exists$/ do
  mail_img = StampsWebsite.home_page.hp_mail
  mail_img.wait_until_present(timeout: 60)
  expect(mail_img).to be_present
end

Then /^SDCW: expect homepage left content mail header is (.*)$/ do |str|
  expect(StampsWebsite.home_page.hp_mail_hdr.text_value.strip).to eql(str)
end


Then /^SDCW: expect homepage left content click text is (.*)$/ do |str|
  hp_click_txt = StampsWebsite.home_page.hp_click_txt
  expect(hp_click_txt.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^SDCW: expect homepage left content print text is (.*)$/ do |str|
  hp_print_txt = StampsWebsite.home_page.hp_print_txt
  expect(hp_print_txt.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^SDCW: expect homepage left content mail text is (.*)$/ do |str|
  hp_mail_txt = StampsWebsite.home_page.hp_mail_txt
  expect(hp_mail_txt.text_value.gsub(/\n/, '')).to eql(str)
end

Then /^SDCW: click on offer box$/ do
  StampsWebsite.home_page.offer_box.click!
end

Then /^SDCW: click on see offer details link$/ do
  StampsWebsite.home_page.offer_details_link
end
