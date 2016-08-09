Then /^Toolbar: Import$/ do
  logger.info "Toolbar: Import"
  @import_orders = web_apps.orders.toolbar.import
  logger.info "Test #{(@import_web_apps.orders.present?)?"Passed":"Failed - Unable to open Import Orders modal."}"
end

Then /^Import Orders: Select CSV File$/ do
  logger.info "Import Orders: Select CSV File"
  step "Toolbar: Import" if @import_web_apps.orders.nil?
  
  @open_file = @import_web_apps.orders.select_csv_file
  logger.info "Test #{(@open_file.present?)?"Passed":"Failed"}"
  @open_file.present?.should be true
end

Then /^Import Orders: Import$/ do
  logger.info "Import Orders: Import"
  step "Toolbar: Import" if @import_web_apps.orders.nil?

  @import_successful = @import_web_apps.orders.import
end

Then /^Import Orders: Expect Order Number (.*) was imported$/ do |order_number|
  raise "Import failed.  Success modal did not show up." if @import_successful.nil?
  @import_successful.window_title.should eql "Success"
end

Then /^Import Orders: Expect Import is successful$/ do
  raise "Import failed.  Success modal did not show up." if @import_successful.nil?
  @import_successful.window_title.should eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  logger.info "Import Orders: Success: OK"
  step "Toolbar: Import" if @import_web_apps.orders.nil?

  @import_successful.ok
end

Then /^Import Orders: Cancel$/ do
  logger.info "Import Orders: Cancel"
  step "Toolbar: Import" if @import_web_apps.orders.nil?

  @import_web_apps.orders.cancel
end

Then /^Import Orders: Download sample file$/ do
  logger.info "Import Orders: Download sample file"
  step "Toolbar: Import" if @import_web_apps.orders.nil?

  @import_web_apps.orders.download_sample_file
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test.csv
  logger.info "Import Orders: File Upload: Set Filename"
  step "Toolbar: Import" if @import_web_apps.orders.nil?
  step "Import Orders: Select CSV File" if (@open_file.nil? || !(@open_file.present?))
  @csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  logger.info "Import File:  #{@csv_import_filename}"

  @csv_import_file = CSV.read(@csv_import_filename, :headers=>true)
  logger.info @csv_import_file['Order ID (required)']

  @open_file.file_name @csv_import_filename
end

Then /^Import Orders: Expect Imported Filename to be (.*)$/ do |expectation|
  logger.info "Import Import Filename to be #{expectation}"
  actual_value = @import_web_apps.orders.filename_label
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end


