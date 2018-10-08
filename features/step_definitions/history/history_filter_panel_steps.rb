
Then /^expand date printed on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.header.click unless date_printed.today.present?
  expect(date_printed.today.text).to eql 'Today'
end

Then /^select today on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.today.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.today.selected? }
  rescue
    # ignore
  end
  expect(date_printed.today.selected?).to be true
end

Then /^expect today is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today.selected?).to be true
end

Then /^expect today count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.today_count.text.to_i).to be > num.to_i
end

Then /^select past 30 days on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  date_printed.past_30_days.select
  step 'wait while loading history grid'
  begin
    SdcPage.browser.wait_until(timeout: 5) { date_printed.past_30_days.selected? }
  rescue
    # ignore
  end
  expect(date_printed.past_30_days.selected?).to be true
end

Then /^expect past 30 days is selected on history filter panel$/ do
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_30_days.selected?).to be true
end

Then /^expect past 30 days count on history filter panel is greater than (\d+)$/ do |num|
  date_printed = SdcHistory.filter_panel.date_printed
  expect(date_printed.past_30_days_count.text.to_i).to be > num.to_i
end