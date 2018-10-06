
Then /^expand date printed on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.header.click unless date_printed.today.present?
  expect(date_printed.today.text).to eql 'Today'
end

Then /^select date printed today on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.today.click
  step 'expect date printed today is selected on history filter panel'
end

Then /^expect date printed today is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today.attribute_value('class')).to include 'selected'
end

Then /^expect history filter panel date printed count for today is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today_count.text.to_i).to be > num.to_i
end