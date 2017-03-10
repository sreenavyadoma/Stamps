Then /^(?:I|i)n Orders Toolbar, Import$/ do
  #logger.step "In Orders Toolbar, Import"
  @import_orders = stamps.orders.orders_toolbar.import
end

Then /^Import Orders: Import$/ do
  #logger.step "Import Orders: Import"
  @import_successful = @import_orders.import
end

Then /^Import Orders: Select CSV File$/ do
  #logger.step "Import Orders: Select CSV File"
  @open_file = @import_orders.select_csv_file
  expect(@open_file.present?).to be true
end

Then /^Import Orders: Expect Import is successful$/ do
  expect(@import_successful).to be_truthy
  expect(@import_successful.window_title).to eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  #logger.step "Import Orders: Success: OK"
  expect(@import_successful).to be_truthy
  @import_successful.ok
end

Then /^Import Orders: Cancel$/ do
  #logger.step "Import Orders: Cancel"
  @import_orders.cancel
end

Then /^Import Orders: Download sample file$/ do
  #logger.step "Import Orders: Download sample file"
  expect(@import_successful).to be_truthy
  @import_orders.orders.download_sample_file
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test.csv
  #logger.step "Import Orders: File Upload: Set Filename"
  step "In Orders Toolbar, Import" if @import_orders.nil?
  step "Import Orders: Select CSV File" if (@open_file.nil? || !(@open_file.present?))
  @csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  #logger.step "Import File:  #{@csv_import_filename}"

  @csv_import_file = CSV.read(@csv_import_filename, :headers=>true)
  logger.step @csv_import_file['Order ID (required)']

  @open_file.file_name @csv_import_filename
end

Then /^Import Orders: Expect Imported Filename is (.*)$/ do |expectation|
  #logger.step "Import Import Filename is #{expectation}"
  actual_value = @import_orders.filename_label
  expect(actual_value).to eql expectation
end


