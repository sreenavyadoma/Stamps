

########### footer ############

Then /^SDCW: expect stamps website footer usps logo exists$/ do
  usps_logo = StampsWebsite.common_page.usps_logo
  usps_logo.wait_until_present(timeout: 2)
  expect(usps_logo).to be_present
end

Then /^SDCW: expect stamps website footer usps logo words is (.*)$/ do |str|
  usps_logo_caption = StampsWebsite.common_page.usps_logo_caption
  expect(usps_logo_caption.text_value.strip).to eql(str)
end

Then /^SDCW: expect stamps website footer copyright exists$/ do
  copyright = StampsWebsite.common_page.copyright
  copyright.wait_until_present(timeout: 2)
  expect(copyright).to be_present
end


Then /^SDCW: expect stamps website footer copyright text is (.*)$/ do |str|
  copyright = StampsWebsite.common_page.copyright
  expect(copyright.text_value.strip).to eql(str)
end