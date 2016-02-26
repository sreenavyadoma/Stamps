Then /^Toolbar: Import$/ do
  log.info "Step: Step: Toolbar: Import"
  @import_orders = orders.toolbar.import
  log.info "Test #{(@import_orders.present?)?"Passed":"Failed - Unable to open Import Orders modal."}"
end

Then /^Import Orders: Select CSV File$/ do
  log.info "Step: Import Orders: Select CSV File"
  step "Toolbar: Import" if @import_orders.nil?
  
  @open_file = @import_orders.select_csv_file
  log.info "Test #{(@open_file.present?)?"Passed":"Failed"}"
  @open_file.present?.should be true
end

Then /^Import Orders: Import$/ do
  log.info "Step: Import Orders: Import"
  step "Toolbar: Import" if @import_orders.nil?

  @import_successful = @import_orders.import
end

Then /^Import Orders: Expect Import is successful$/ do
  raise "Import failed.  Success modal did not show up." if @import_successful.nil?
  @import_successful.window_title.should eql "Success"
end

Then /^Import Orders: Success: OK$/ do
  log.info "Step: Import Orders: Success: OK"
  step "Toolbar: Import" if @import_orders.nil?

  @import_successful.ok
end

Then /^Import Orders: Cancel$/ do
  log.info "Step: Import Orders: Cancel"
  step "Toolbar: Import" if @import_orders.nil?

  @import_orders.cancel
end

Then /^Import Orders: Download sample file$/ do
  log.info "Step: Import Orders: Download sample file"
  step "Toolbar: Import" if @import_orders.nil?

  @import_orders.download_sample_file
end

Then /^Import Orders: Expect imported filed name on read-only textbox to be (.*)$/ do |filename|
  log.info "Step: Import Orders: Expect imported filed name on read-only textbox"
  raise "Import Orders: Expect imported filed name on read-only textbox to be #{filename} - ILLEGAL STATE EXCEPTION.  Check your test." if @import_orders.nil?
  sleep 1
  import_filename = @import_orders.text_box.text
  log.info "Test #{(import_filename==filename)?"Passed":"Failed"}"
  import_filename.should eql filename
end

Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename| #import_orders_test.csv
  log.info "Step: Import Orders: File Upload: Set Filename"
  step "Toolbar: Import" if @import_orders.nil?
  step "Import Orders: Select CSV File" if (@open_file.nil? || !(@open_file.present?))
  file = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  log.info "Import File:  #{file}"
  @open_file.file_name file
end


