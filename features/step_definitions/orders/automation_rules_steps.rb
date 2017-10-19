
Then /^[Cc]lick [Oo]rders [Ss]ettings [Aa]utomation [Rr]ules tab$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Aa]utomation [Rr]ules page Add Button$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal Rule name to (.*)$/ do |str|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Nn]ew [Rr]ule [Mm]odal Add Action$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal service to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Nn]ew [Rr]ule [Mm]odal Save Rule button$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Nn]ew [Rr]ule [Mm]odal specific criteria actions$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Nn]ew [Rr]ule [Mm]odal Add Criteria$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal first drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal second drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Nn]ew [Rr]ule [Mm]odal third drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Aa]utomation [Rr]ules page automation rule Name$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Aa]utomation [Rr]ules page Edit Button$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Aa]utomation [Rr]ules page Delete button$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal Rule name to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Ee]dit [Rr]ule [Mm]odal Add Action$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal service to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick [Ee]dit [Rr]ule [Mm]odal Save Rule button$/ do
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal first drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal second drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Ss]et [Ee]dit [Rr]ule [Mm]odal third drop-down to (.*)$/ do |value|
  stamps.orders.orders_toolbar.settings.select
end

Then /^[Cc]lick Delete Automation dialog Delete button$/ do
  stamps.orders.orders_toolbar.settings.select
end


Then /^[Ee]xpect [Aa]utomation [Rr]ules [Pp]age Add Button exists$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Add Button does not present in Automation Rules page"
end

Then /^[Ee]xpect New Rule modal exists$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "New rule modal does not exists"
end

Then /^[Ee]xpect Edit Rule modal exists$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Edit rule does not exists"
end

Then /^[Ee]xpect [Aa]utomation [Rr]ules [Pp]age paragraph contain (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Paragraph does not present in Automation Rules page"
end

Then /^[Ee]xpect [Aa]utomation [Rr]ules [Pp]age header contain (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Header does not present in Automation Rules page"
end

Then /^[Ee]xpect Active rule checkbox checked$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Active Rule check box does not checked"
end

Then /^[Ee]xpect Apply actions selected$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Apply Actions does not selected"
end

Then /^[Ee]xpect [Aa]utomation [Rr]ules modal, Rule name is present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Rule name does not present in Automation Rules modal"
end

Then /^[Ee]xpect [Aa]utomation [Rr]ules modal, updated Rule name present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Updated rule name does not present in Automation Rules modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, Rule name to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Rule Name does not match in Edit Rule modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, service to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Service does not match in Edit Rule modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, drop-down to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Drop-down value does not match in Edit Rule modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, first drop-down to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Drop-down value does not match in Edit Rule modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, second drop-down to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Drop-down value does not match in Edit Rule modal"
end

Then /^[Ee]xpect [Ee]dit [Rr]ule modal, third drop-down to (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Drop-down value does not match in Edit Rule modal"
end

Then /^[Ee]xpect Delete Automation Dialog is present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Delete Automation Dialog does not present"
end

Then /^[Ee]xpect Delete dialog header is (.*)$/ do |value|
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Delete Automation Dialog header does not match"
end

Then /^[Ee]xpect Delete Automation Dialog, Delete button is present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Delete Automation Dialog Delete button does not present"
end

Then /^[Ee]xpect Delete Automation Dialog, Cancel button is present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to eql(value), "Delete Automation Dialog Cancel button does not present"
end

Then /^[Ee]xpect Automation Rules page, rule name is not present$/ do
  expect(stamps.orders.orders_toolbar.settings.select).to be_present, "Rule name does not present in Automation Rules page"
end