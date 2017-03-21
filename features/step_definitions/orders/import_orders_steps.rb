Then /^(?:I|i)n Orders Toolbar, Import$/ do
  stamps.orders.orders_toolbar.import
end

Then /^Import Orders: Import$/ do
  import_time = stamps.orders.orders_toolbar.import.import
  logger.step "Success modal is present after #{import_time} seconds"

  #import_timer_filename = "\\\\rcruz-win7\\Public\\automation\\data\\import_times.csv"

  import_time_file = data_for(:import_orders_test, {})['import_time_file']
  import_time_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{import_time_file}"

  logger.step "Import Orders File: #{import_time_loc}"
  expect("Import Orders File: #{import_time_loc}").to eql "Import Time File does not exist!" unless File.exist?(import_time_loc)

  csv_file = CSV.open(import_time_loc, "a")
  csv_file.add_row([Time.now,import_time])
  logger.step "Import Time Saved to CSV file"
  csv_file.close
end

Then /^Import Orders: Select CSV File$/ do
  stamps.orders.orders_toolbar.import.select_csv_file
  expect(stamps.orders.orders_toolbar.import.select_csv_file.present?).to be true
end

Then /^Import Orders: Expect Import is successful$/ do
  expect(stamps.orders.orders_toolbar.import_orders_modal.confirm_success).to be_truthy
  expect(stamps.orders.orders_toolbar.import_orders_modal.confirm_success.window_title).to eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  expect(stamps.orders.orders_toolbar.import_orders_modal.confirm_success).to be_truthy
  stamps.orders.orders_toolbar.import_orders_modal.confirm_success.ok
end

Then /^Import Orders: Cancel$/ do
  stamps.orders.orders_toolbar.import.cancel
end

Then /^Import Orders: Download sample file$/ do
  expect(stamps.orders.orders_toolbar.import_orders_modal.confirm_success).to be_truthy
  stamps.orders.orders_toolbar.import.orders.download_sample_file
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test_100.csv
  step "In Orders Toolbar, Import" if stamps.orders.orders_toolbar.import.nil?
  step "Import Orders: Select CSV File" if (stamps.orders.orders_toolbar.import.select_csv_file.nil? || !(stamps.orders.orders_toolbar.import.select_csv_file.present?))

  import_orders_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{filename}"

  #@csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  #logger.step "Import File:  #{@csv_import_filename}"
  logger.step "Import File:  #{import_orders_loc}"



  stamps.orders.orders_toolbar.import.select_csv_file.file_name import_orders_loc
end

Then /^Import Orders: Expect Imported Filename is (.*)$/ do |expectation|
  actual_value = stamps.orders.orders_toolbar.import.filename_label
  expect(actual_value).to eql expectation
end


