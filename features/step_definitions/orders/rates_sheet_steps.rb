
Then /^Rates: Load Rate File$/ do
  logger.step "Rates: Load Rate File"
  Spreadsheet.client_encoding = 'UTF-8'
  rate_file = data_for(:rates_test, {})['rate_file']

  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
  logger.step "Rate File: #{@rate_file_loc}"
  "Rate File: #{@rate_file_loc}".should eql "Rate File does not exist!" unless File.exist?(@rate_file_loc)

  begin
    @rate_file = Spreadsheet.open @rate_file_loc
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    e.message.should eql "Excel Rate File is opened by someone at a computer somewhere. Close the excel sheet before running the test again."
  end

  @failed_test_count = 0
  @rate_file.should_not be nil
end

Then /^Rates: Test PME Comm Base in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test PME Comm Base in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_base']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test PM Comm Base in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test PME Comm Base in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_base']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test Sheet (.*) in Zone (\d+)$/ do |param_sheet, zone|
  logger.step ""
  logger.step "#{"|"*100} Rates: Test Sheet #{param_sheet} in Zone #{zone}"
  zone = zone.to_i
  result_sheet = param_sheet.gsub(/\s+/, "")
  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  @columns = Hash.new

  # map out parameter sheet column location
  @rate_sheet_columns = @rate_sheet.row(0)
  @rate_sheet_columns.each_with_index do |column, index|
    @columns[:weight_lb] = index if column=='weight_lb'
    @columns[:zone1] = index if column=='zone1'
    @columns[:zone2] = index if column=='zone2'
    @columns[:zone3] = index if column=='zone3'
    @columns[:zone4] = index if column=='zone4'
    @columns[:zone5] = index if column=='zone5'
    @columns[:zone6] = index if column=='zone6'
    @columns[:zone7] = index if column=='zone7'
    @columns[:zone8] = index if column=='zone8'
    @columns[:zone9] = index if column=='zone9'
    @columns[:service] = index if column=='service'
    @columns[:tracking] = index if column=='tracking'
    @columns[:execution_date] = index if column=='execution_date'
    @columns[:username] = index if column=='username'
    @columns[:ship_from] = index if column=='ship_from'
    @columns[:ship_to_domestic] = index if column=='ship_to_domestic'
    @columns[:weight] = index if column=='weight'
    @columns[:service_selected] = index if column=='service_selected'
    @columns[:tracking_selected] = index if column=='tracking_selected'
    @columns[:zone] = index if column=='zone'
    @columns[:expectation] = index if column=='expectation'
    @columns[:total_ship_cost] = index if column=='total_ship_cost'
    @columns[:results] = index if column=='results'
    @columns[:status] = index if column=='status'
    @columns[:error_msg] = index if column=='error_msg'
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @columns[:weight_lb].nil?
    missing_column = true
    error_msg = "Column weight_lb does not exist in parameter sheet"
  elsif @columns[:zone1].nil?
    missing_column = true
    error_msg = "Column zone1 does not exist in parameter sheet"
  elsif @columns[:zone2].nil?
    missing_column = true
    error_msg = "Column zone2 does not exist in parameter sheet"
  elsif @columns[:zone3].nil?
    missing_column = true
    error_msg = "Column zone3 does not exist in parameter sheet"
  elsif @columns[:zone4].nil?
    missing_column = true
    error_msg = "Column zone4 does not exist in parameter sheet"
  elsif @columns[:zone5].nil?
    missing_column = true
    error_msg = "Column zone5 does not exist in parameter sheet"
  elsif @columns[:zone6].nil?
    missing_column = true
    error_msg = "Column zone6 does not exist in parameter sheet"
  elsif @columns[:zone7].nil?
    missing_column = true
    error_msg = "Column zone7 does not exist in parameter sheet"
  elsif @columns[:zone8].nil?
    missing_column = true
    error_msg = "Column zone8 does not exist in parameter sheet"
  elsif @columns[:zone9].nil?
    missing_column = true
    error_msg = "Column zone9 does not exist in parameter sheet"
  elsif @columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @columns[:tracking].nil?
    missing_column = true
    error_msg = "Column tracking does not exist in parameter sheet"
  elsif @columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @columns[:ship_from].nil?
    missing_column = true
    error_msg = "Column ship_from does not exist in parameter sheet"
  elsif @columns[:ship_to_domestic].nil?
    missing_column = true
    error_msg = "Column ship_to_domestic does not exist in parameter sheet"
  elsif @columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @columns[:service_selected].nil?
    missing_column = true
    error_msg = "Column service_selected does not exist in parameter sheet"
  elsif @columns[:tracking_selected].nil?
    missing_column = true
    error_msg = "Column tracking_selected does not exist in parameter sheet"
  elsif @columns[:zone].nil?
    missing_column = true
    error_msg = "Column zone does not exist in parameter sheet"
  elsif @columns[:expectation].nil?
    missing_column = true
    error_msg = "Column expectation does not exist in parameter sheet"
  elsif @columns[:total_ship_cost].nil?
    missing_column = true
    error_msg = "Column total_ship_cost does not exist in parameter sheet"
  elsif @columns[:results].nil?
    missing_column = true
    error_msg = "Column results does not exist in parameter sheet"
  elsif @columns[:status].nil?
    missing_column = true
    error_msg = "Column status does not exist in parameter sheet"
  elsif @columns[:error_msg].nil?
    missing_column = true
    error_msg = "Column error_msg does not exist in parameter sheet"
  end

  "Check your paramter sheet: #{@rate_file_loc}".should eql error_msg if missing_column

  # parameter zone is set in step "Details: Set Ship-To to address in Zone xxx"
  # where xxx is a number between 1-9
  zone.should_not be nil
  case zone
    when 1
      zone_column = @columns[:zone1]
    when 2
      zone_column = @columns[:zone2]
    when 3
      zone_column = @columns[:zone3]
    when 4
      zone_column = @columns[:zone4]
    when 5
      zone_column = @columns[:zone5]
    when 6
      zone_column = @columns[:zone6]
    when 7
      zone_column = @columns[:zone7]
    when 8
      zone_column = @columns[:zone8]
    when 9
      zone_column = @columns[:zone9]
    else
      logger.error "Zone parameter (zone) should have a value between 1 through 9. #{zone} is an invalid selection. Check your test."
      expect(zone).to be_between(1, 9).inclusive
  end

  # Set address to proper zone
  step "Details: Set Ship-To to address in Zone #{zone}"

  # Set weight and services
  @rate_sheet.each_with_index do |row, index|
    begin
      if index > 0
        logger.step ""
        logger.step"#{"#"*80} Starting Test for Zone #{zone} - Row #{index}"
        logger.step ""
        row[@columns[:zone]] = zone
        row[@columns[:username]] = test_data[:username]
        row[@columns[:ship_from]] = test_data[:ship_from]
        row[@columns[:ship_to_domestic]] = test_data[:ship_to_domestic]

        # Set weight to 0
        step "Details: Set Pounds to 0"
        step "Details: Set Ounces to 0"

        # Set weight per spreadsheet
        raise "weight_lb is empty" if row[@columns[:weight_lb]].nil?
        weight_lb = row[@columns[:weight_lb]]
        logger.step "Column weight_lb: #{weight_lb}"
        if param_helper.is_whole_number?(weight_lb)
          weight_lb = weight_lb.to_i
          row[@columns[:weight]] = "#{weight_lb} lb."
          step "Details: Set Pounds to #{weight_lb}"
        else
          weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i
          logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
          row[@columns[:weight]] = "#{weight_oz} oz."
          step "Details: Set Ounces to #{weight_oz}"
        end

        # Set Service
        raise "service is empty" if row[@columns[:service]].nil?
        service = row[@columns[:service]]
        # record execution time as time service was selected.
        row[@columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")
        step "Details: Select Service #{service}"
        row[@columns[:service_selected]] = test_data[:service]

        # Set Tracking
        begin
          tracking = row[@columns[:tracking]]
          step "Details: Set Tracking to #{tracking}"
        end unless row[@columns[:tracking]].nil?
        # Write tracking to spreadsheet
        test_data[:tracking] = stamps.orders.order_details.tracking.text_box.text
        row[@columns[:tracking_selected]] = test_data[:tracking]

        # spreadsheet price
        zone_column.should_not be nil
        raise "#{zone_column} is empty" if row[zone_column].nil?
        price = row[zone_column]
        # set expectation column for this row to zone price
        row[@columns[:expectation]] = price
        expectation = row[@columns[:expectation]]

        # get total cost actual value from UI
        step "Save Shipping Costs Data"
        row[@columns[:total_ship_cost]] = test_data[:total_ship_cost]
        if row[@columns[:expectation]] == row[@columns[:total_ship_cost]]
          row[@columns[:status]] = "Passed"
          row[@columns[:results]] = "#{row[@columns[:expectation]]} == #{row[@columns[:total_ship_cost]]}"
        else
          row[@columns[:status]] = "Failed"
          row[@columns[:results]] = "Expected #{row[@columns[:expectation]]}, Got #{row[@columns[:total_ship_cost]]}"
        end
      end
    rescue Exception=> e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      row[@columns[:error_msg]] = "Zone #{zone} - Row #{index}: #{e.message}"
    end
  end

  @result_sheet_loc = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  @rate_file.write @result_sheet_loc

  logger.step "Result Sheet Location: #{@result_sheet_loc}"
  @rate_sheet.each_with_index do |row, index|
    begin
      if index > 0
        if row[@columns[:status]] == "Failed"
          @failed_test_count +=1
          logger.step"Zone #{zone} - Row #{index} Failed"
        end
      end
    end
  end
  logger.step "Result Sheet Location: #{@result_sheet_loc}"
  if @failed_test_count>0
    logger.error "Number of Failed Tests: #{@failed_test_count}"
    logger.error "Number of Failed Tests: #{@failed_test_count}"
    logger.error "Number of Failed Tests: #{@failed_test_count}"
    logger.error "Number of Failed Tests: #{@failed_test_count}"
    logger.error "Number of Failed Tests: #{@failed_test_count}"
    logger.error "Number of Failed Tests: #{@failed_test_count}"
  end
  logger.step "#{"|"*80}"
end

Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  logger.step "Rates: Number of failed test should be less than #{count}"
  count = count.to_i
  if @failed_test_count > 0
    logger.step "#{"|"*80}"
    logger.error "Total number of failing tests: #{@failed_test_count}"
    logger.error "Total number of failing tests: #{@failed_test_count}"
    logger.error "Total number of failing tests: #{@failed_test_count}"
    logger.error "Total number of failing tests: #{@failed_test_count}"
    logger.step "#{"|"*80}"
  end
  @failed_test_count.should be < count
end


