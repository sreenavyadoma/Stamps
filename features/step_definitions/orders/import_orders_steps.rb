Then /^[Ii]n Orders Toolbar, Import$/ do
  stamps.orders.orders_toolbar.import
end

Then /^Import Orders: Import$/ do
  import_time = stamps.orders.orders_toolbar.import.import
  config.logger.step "Success modal is present after #{import_time} seconds"

  #import_timer_filename = "\\\\rcruz-win7\\Public\\automation\\data\\import_times.csv"

  import_time_file = data_for(:import_orders_test, {})['import_time_file']
  import_time_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{import_time_file}"

  config.logger.step "Import Orders File: #{import_time_loc}"
  expect("Import Orders File: #{import_time_loc}").to eql "Import Time File does not exist!" unless File.exist?(import_time_loc)

  csv_file = CSV.open(import_time_loc, "a")
  csv_file.add_row([Time.now,import_time])
  config.logger.step "Import Time Saved to CSV file"
  csv_file.close
end

Then /^Import Orders: Import Existing Orders$/ do
  import_time = stamps.orders.orders_toolbar.import.import
  config.logger.step "Success modal is present after #{import_time} seconds"

  import_time_file = data_for(:import_orders_test, {})['import_existing_orders_time_file']
  import_time_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{import_time_file}"

  config.logger.step "Import Orders File: #{import_time_loc}"
  expect("Import Orders File: #{import_time_loc}").to eql "Import Time File does not exist!" unless File.exist?(import_time_loc)

  csv_file = CSV.open(import_time_loc, "a")
  csv_file.add_row([Time.now,import_time])
  config.logger.step "Import Time Saved to CSV file"
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

Then /^Import Orders: Randomize data in (.*)$/ do |filename|

  import_old_file = data_for(:import_orders_test, {})['import_old_file']
  #config.logger.step "File location is #{'import_orders_dir'+ENV['URL']}"
  import_new_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{filename}"
  import_old_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{import_old_file}"

  CSV.open(import_new_loc, "w+") do |csv_out|
    old_csv = CSV.read(import_old_loc)
    old_csv.each_with_index do |row, index|
      if index != 0
        address = ParameterHelper.rand_zone_1_4
        row[2] = Random.rand(1..10)
        row[3] = ParameterHelper.random_name
        row[4] = ParameterHelper.random_name
        row[5] = ParameterHelper.random_company_name
        row[6] = address['street_address']
        row[9] = address['city']
        row[10] = address['state']
        row[11] = address['zip']
        row[13] = ParameterHelper.random_phone
        row[14] = ParameterHelper.random_email
        row[15] = Random.rand(1..10)
        row[16] = Random.rand(1..10)
        row[17] = Random.rand(1..10)
        row[18] = Random.rand(1..10)
        row[19] = ParameterHelper.random_name
        row[20] = ParameterHelper.random_name
        row[21] = [true, false].sample
        row[22] = ParameterHelper.random_name
      end
      csv_out << row
    end

    config.logger.step "Orders info in #{filename} has been randomized"
  end
end

Then /^Import Orders: Expect first (.*) orders in CSV file (.*) match orders in grid$/ do |num_orders, filename|

  import_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{filename}"

  num_orders = num_orders.to_i
  counter = 0

  import_csv = CSV.read(import_loc)
  import_csv.each_with_index do |row, index|

    order_id = row[0]
    if index  != 0
      counter += 1
      step "Filter Panel: Search for #{row[4]}"
      expect(stamps.orders.orders_grid.column.requested_service.data(order_id)).to eql(row[3]), "Expected Service for order #{row[0]} is #{row[3]}, Service in orders grid is #{stamps.orders.orders_grid.column.requested_service.data(order_id)}"
      expect(stamps.orders.orders_grid.column.recipient.data(order_id)).to eql(row[4]), "Expected Recipient for order #{row[0]} is #{row[4]}, Recipient in orders grid is #{stamps.orders.orders_grid.column.recipient.data(order_id)}"
      expect(stamps.orders.orders_grid.column.company.data(order_id)).to eql(row[5]), "Expected Company for order #{row[0]} is #{row[5]}, Company in orders grid is #{stamps.orders.orders_grid.column.company.data(order_id)}"
      expect(stamps.orders.orders_grid.column.address.data(order_id).downcase).to eql((row[6]).downcase), "Expected Address for order #{row[0]} is #{row[6]}, Address in orders grid is #{stamps.orders.orders_grid.column.address.data(order_id)}"
      expect(stamps.orders.orders_grid.column.city.data(order_id).downcase).to eql((row[9]).downcase), "Expected City for order #{row[0]} is #{row[9]}, City in orders grid is #{stamps.orders.orders_grid.column.city.data(order_id)}"
      expect(stamps.orders.orders_grid.column.state.data(order_id)).to eql(row[10]), "Expected State for order #{row[0]} is #{row[10]}, State in orders grid is #{stamps.orders.orders_grid.column.state.data(order_id)}"
      expect(stamps.orders.orders_grid.column.zip.data(order_id)).to eql(row[11]), "Expected Zip for order #{row[0]} is #{row[11]}, Zip in orders grid is #{stamps.orders.orders_grid.column.zip.data(order_id)}"
      expect(stamps.orders.orders_grid.column.phone.data(order_id)).to eql(row[13]), "Expected Phone for order #{row[0]} is #{row[13]}, Phone in orders grid is #{stamps.orders.orders_grid.column.phone.data(order_id)}"
      expect(stamps.orders.orders_grid.column.email.data(order_id)).to eql(row[14]), "Expected Email for order #{row[0]} is #{row[14]}, Email in orders grid is #{stamps.orders.orders_grid.column.email.data(order_id)}"
      expect(ParameterHelper.format_weight(stamps.orders.orders_grid.column.weight.data(order_id))).to eql(row[15]), "Expected Weight for order #{row[0]} is #{row[15]}, Weight in orders grid is #{ParameterHelper.format_weight(stamps.orders.orders_grid.column.weight.data(order_id))}"
      config.logger.step "Order # #{order_id} verified in Orders Grid"
    end
    break if counter >= num_orders
  end
end


Then /^Import Orders: File Upload: Set Filename to (.*)$/ do |filename|
  step "In Orders Toolbar, Import" if stamps.orders.orders_toolbar.import.nil?
  step "Import Orders: Select CSV File" if (stamps.orders.orders_toolbar.import.select_csv_file.nil? || !(stamps.orders.orders_toolbar.import.select_csv_file.present?))

  import_orders_loc = "#{data_for(:import_orders_test, {})['import_orders_dir']}\\#{ENV['URL']}\\#{filename}"

  #@csv_import_filename = "\\\\rcruz-win7\\Public\\automation\\data\\#{filename}"
  #config.logger.step "Import File:  #{@csv_import_filename}"
  config.logger.step "Import File:  #{import_orders_loc}"



  stamps.orders.orders_toolbar.import.select_csv_file.file_name import_orders_loc
end

Then /^Import Orders: Expect Imported Filename is (.*)$/ do |expectation|
  actual_value = stamps.orders.orders_toolbar.import.filename_label
  expect(actual_value).to eql expectation
end


