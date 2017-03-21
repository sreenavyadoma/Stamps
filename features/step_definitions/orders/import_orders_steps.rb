Then /^(?:I|i)n Orders Toolbar, Import$/ do
  stamps.orders.orders_toolbar.import = stamps.orders.orders_toolbar.import
end

Then /^Import Orders: Import$/ do
  import_time = stamps.orders.orders_toolbar.import.import

  logger.step "Success modal is present after #{import_time} seconds"

  import_timer_filename = "\\\\rcruz-win7\\Public\\automation\\data\\import_times.csv"
  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"


  csv_file = CSV.open(@import_timer_filename, "a")
  csv_file.add_row([Time.now,import_time])
  logger.step "Import Time Saved to CSV file"
  csv_file.close
end

Then /^Import Orders: Select CSV File$/ do
  @open_file = stamps.orders.orders_toolbar.import.select_csv_file
  expect(@open_file.present?).to be true
end

Then /^Import Orders: Expect Import is successful$/ do
  stamps.orders.orders_toolbar.import.confirm_success = stamps.orders.orders_toolbar.import.confirm_success
  expect(stamps.orders.orders_toolbar.import.confirm_success).to be_truthy
  expect(stamps.orders.orders_toolbar.import.confirm_success.window_title).to eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  expect(stamps.orders.orders_toolbar.import.confirm_success).to be_truthy
  stamps.orders.orders_toolbar.import.confirm_success.ok
end

Then /^Import Orders: Cancel$/ do
  stamps.orders.orders_toolbar.import.cancel
end

Then /^Import Orders: Download sample file$/ do
  expect(stamps.orders.orders_toolbar.import.confirm_success).to be_truthy
  stamps.orders.orders_toolbar.import.orders.download_sample_file
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test.csv
  step "In Orders Toolbar, Import" if stamps.orders.orders_toolbar.import.nil?
  step "Import Orders: Select CSV File" if (@open_file.nil? || !(@open_file.present?))
  @csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  #logger.step "Import File:  #{@csv_import_filename}"

  @csv_import_file = CSV.read(@csv_import_filename, :headers=>true)
  logger.step @csv_import_file['Order ID (required)']

  @open_file.file_name @csv_import_filename
end

Then /^Import Orders: Expect Imported Filename is (.*)$/ do |expectation|
  actual_value = stamps.orders.orders_toolbar.import.filename_label
  expect(actual_value).to eql expectation
end


