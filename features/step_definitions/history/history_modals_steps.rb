#refund
Then /^expect refund modal on history is present$/ do
  expect(SdcHistory.modals.refund.title).to be_present
end

Then /^click submit button on refund modal$/ do
  SdcHistory.modals.refund.submit.click
end

Then /^click cancel button on refund modal$/ do
  SdcHistory.modals.refund.submit.click
end

Then /^close refund modal on history$/ do
  SdcHistory.modals.refund.x_btn.click
end

#schedule pickup
Then /^expect schedule pickup on history is present$/ do
  expect(SdcHistory.modals.schedule_pickup.title).to be_present
end

Then /^click submit button on schedule pickup modal$/ do
  SdcHistory.modals.schedule_pickup.submit.click
end

Then /^click cancel button on schedule pickup modal$/ do
  SdcHistory.modals.schedule_pickup.submit.click
end

Then /^close schedule pickup modal on history$/ do
  SdcHistory.modals.schedule_pickup.x_btn.click
end

Then /^set first name on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.first_name.set(str)
  step "expect first name on schedule pickup is #{str}"
end
Then /^expect first name on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.first_name.text_value).to eql(str)
end

Then /^set last name on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.last_name.set(str)
  step "expect last name on schedule pickup is #{str}"
end
Then /^expect last name on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.last_name.text_value).to eql(str)
end

Then /^set company on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.company.set(str)
  step "expect company on schedule pickup is #{str}"
end
Then /^expect company on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.company.text_value).to eql(str)
end

Then /^set address on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.address.set(str)
  step "expect address on schedule pickup is #{str}"
end
Then /^expect address on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.address.text_value).to eql(str)
end

Then /^set city on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.city.set(str)
  step "expect city on schedule pickup is #{str}"
end
Then /^expect city on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.city.text_value).to eql(str)
end

#todo - State

Then /^set zip on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.zip.set(str)
  step "expect zip on schedule pickup is #{str}"
end
Then /^expect zip on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.zip.text_value).to eql(str)
end

Then /^set phone on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.phone_number.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect phone on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.phone_number.text_value).to eql(str)
end

Then /^set phone ext on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.phone_ext.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect phone ext on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.phone_ext.text_value).to eql(str)
end

Then /^set number of express mail pieces on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.express_mail_pieces.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect number of express mail pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.express_mail_pieces.text_value).to eql(str)
end

Then /^set number of priority mail pieces on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.priority_mail_pieces.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect number of priority mail pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.priority_mail_pieces.text_value).to eql(str)
end

Then /^set number of international pieces on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.international_pieces.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect number of international pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.international_pieces.text_value).to eql(str)
end

Then /^set number of first class pieces on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.first_class_pieces.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect number of first class pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.first_class_pieces.text_value).to eql(str)
end

Then /^set number of other pieces on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.other_pieces.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect number of other pieces on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.other_pieces.text_value).to eql(str)
end

Then /^set estimated weight on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.estimated_weight.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect estimated weight on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.estimated_weight.text_value).to eql(str)
end

#todo - Package location

Then /^set special instructions on schedule pickup modal to (.+)$/ do |str|
  SdcHistory.modals.schedule_pickup.special_instructions.set(str)
  step "expect phone on schedule pickup is #{str}"
end
Then /^expect special instructions on schedule pickup is (.*)$/ do |str|
  expect(SdcHistory.modals.schedule_pickup.special_instructions.text_value).to eql(str)
end

#manage pickups
Then /^expect manage pickups on history is present$/ do
  expect(SdcHistory.modals.manage_pickups.title).to be_present
end

Then /^expect edit pickup button on manage pickups modal is enabled$/ do
  expect(SdcHistory.modals.manage_pickups.edit_pickup.class_disabled?).to be_falsy
end

Then /^click edit pickup button on manage pickups modal$/ do
  SdcHistory.modals.manage_pickups.edit_pickup.click
end

Then /^expect cancel pickup button on manage pickups modal is enabled$/ do
  expect(SdcHistory.modals.manage_pickups.cancel_pickup.class_disabled?).to be_falsy
end

Then /^click cancel pickup button on manage pickups modal$/ do
  SdcHistory.modals.manage_pickups.cancel_pickup.click
end

Then /^select row (\d+) on manage pickups modal$/ do |num|
  SdcHistory.modals.manage_pickups.row_select(num).click
end

Then /^close manage pickups modal on history$/ do
  SdcHistory.modals.manage_pickups.x_btn.click
end

#scan form
Then /^expect scan form on history is present$/ do
  expect(SdcHistory.modals.scan_form.title).to be_present
end

Then /^close scan form modal on history$/ do
  SdcHistory.modals.scan_form.x_btn.click
end

Then /^click print scan form on scan form modal$/ do
  SdcHistory.modals.scan_form.print_scan_form.click
end

Then /^click close on scan form modal$/ do
  SdcHistory.modals.scan_form.close.click
end

Then /^check print details on scan form modal$/ do
  step 'expect print details on scan form modal is unchecked'
  SdcHistory.modals.scan_form.print_details.click
  step 'expect print details on scan form modal is checked'
end

Then /^uncheck print details on scan form modal$/ do
  step 'expect print details on scan form modal is checked'
  SdcHistory.modals.scan_form.print_details.click
  step 'expect print details on scan form modal is unchecked'
end

Then /^expect print details on scan form modal is checked$/ do
  expect(SdcHistory.modals.scan_form.print_details.checked?).to be_truthy
end

Then /^expect print details on scan form modal is unchecked$/ do
  expect(SdcHistory.modals.scan_form.print_details.checked?).to be_falsy
end

#reprint scan form
Then /^expect reprint scan form on history is present$/ do
  expect(SdcHistory.modals.reprint_scan_form.title).to be_present
end

Then /^close reprint scan form modal on history$/ do
  SdcHistory.modals.reprint_scan_form.x_btn.click
end

Then /^expect print scan form button on reprint scan form is enabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_scan_form.class_disabled?).to be_falsy
end

Then /^expect print scan form button on reprint scan form is disabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_scan_form.class_disabled?).to be_truthy
end

Then /^expect print details button on reprint scan form is enabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_details.class_disabled?).to be_falsy
end

Then /^expect print details button on reprint scan form is disabled$/ do
  expect(SdcHistory.modals.reprint_scan_form.print_details.class_disabled?).to be_truthy
end

Then /^click print scan form button on reprint scan form modal$/ do
  step 'expect print scan form button on reprint scan form is enabled'
  SdcHistory.modals.reprint_scan_form.print_details.click
end

Then /^click print details button on reprint scan form modal$/ do
  step 'expect print scan form button on reprint scan form is enabled'
  SdcHistory.modals.reprint_scan_form.print_details.click
end

Then /^select row (\d+) on reprint scan form modal$/ do |num|
  SdcHistory.modals.reprint_scan_form.row_select(num).click
end

