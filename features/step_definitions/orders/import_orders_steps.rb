Then /^Toolbar: Import$/ do
  logger.step "Toolbar: Import"
  @import_orders = web_apps.orders.toolbar.import
end

Then /^Import Orders: Select CSV File$/ do
  logger.step "Import Orders: Select CSV File"
  step "Toolbar: Import" if @import_web_apps.orders.nil?
  @open_file = @import_web_apps.orders.select_csv_file
  @open_file.present?.should be true
end

Then /^Import Orders: Import$/ do
  logger.step "Import Orders: Import"
  @import_successful.should be_truthy
  @import_successful = @import_web_apps.orders.import
end

Then /^Import Orders: Expect Import is successful$/ do
  @import_successful.should be_truthy
  @import_successful.window_title.should eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  logger.step "Import Orders: Success: OK"
  @import_successful.should be_truthy
  @import_successful.ok
end

Then /^Import Orders: Cancel$/ do
  logger.step "Import Orders: Cancel"
  @import_successful.should be_truthy
  @import_web_apps.orders.cancel
end

Then /^Import Orders: Download sample file$/ do
  logger.step "Import Orders: Download sample file"
  @import_successful.should be_truthy
  @import_web_apps.orders.download_sample_file
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test.csv
  logger.step "Import Orders: File Upload: Set Filename"
  step "Toolbar: Import" if @import_web_apps.orders.nil?
  step "Import Orders: Select CSV File" if (@open_file.nil? || !(@open_file.present?))
  @csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  logger.step "Import File:  #{@csv_import_filename}"

  @csv_import_file = CSV.read(@csv_import_filename, :headers=>true)
  logger.step @csv_import_file['Order ID (required)']

  @open_file.file_name @csv_import_filename
end

Then /^Import Orders: Expect Imported Filename is (.*)$/ do |expectation|
  logger.step "Import Import Filename is #{expectation}"
  actual_value = @import_web_apps.orders.filename_label
  actual_value.should eql expectation
end


