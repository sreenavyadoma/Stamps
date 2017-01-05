
Then /^Rates: Load PME Comm Base Test Sheet$/ do
  logger.step "Rates: Load PME Comm Base Test Sheet"
  Spreadsheet.client_encoding = 'UTF-8'

  @xls_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{data_for(:rates_test, {})['rates_pme_comm_base']}"
  logger.step "Rate File: #{@xls_loc}"
  File.exist?(@xls_loc).should be true

  begin
    @rates_xls = Spreadsheet.open @xls_loc
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    e.message.should eql "Excel param sheet is currently opened by someone, please close the excel sheet before running the test again!"
  end

  @rates_xls.should_not be nil

  @rates_xls.should_not be nil
  @rates_test_sheet = @rates_xls.worksheet 'data'
  @rates_test_sheet.should_not be nil
end

Then /^Rates: Test PME Comm Base$/ do
  logger.step "Rates: Test PME Comm Base"

  #test_data[:zone] = 1

  @rates_test_sheet_columns = Hash.new

  @columns = @rates_test_sheet.row(0)
  @columns.each_with_index do |column, index|
    @rates_test_sheet_columns[:weight_lb] = index if column=='weight_lb'
    @rates_test_sheet_columns[:zone1] = index if column=='zone1'
    @rates_test_sheet_columns[:zone2] = index if column=='zone2'
    @rates_test_sheet_columns[:zone3] = index if column=='zone3'
    @rates_test_sheet_columns[:zone4] = index if column=='zone4'
    @rates_test_sheet_columns[:zone5] = index if column=='zone5'
    @rates_test_sheet_columns[:zone6] = index if column=='zone6'
    @rates_test_sheet_columns[:zone7] = index if column=='zone7'
    @rates_test_sheet_columns[:zone8] = index if column=='zone8'
    @rates_test_sheet_columns[:zone9] = index if column=='zone9'
    @rates_test_sheet_columns[:service] = index if column=='service'
    @rates_test_sheet_columns[:execution_date] = index if column=='execution_date'
    @rates_test_sheet_columns[:username] = index if column=='username'
    @rates_test_sheet_columns[:ship_from] = index if column=='ship_from'
    @rates_test_sheet_columns[:ship_to_domestic] = index if column=='ship_to_domestic'
    @rates_test_sheet_columns[:weight] = index if column=='weight'
    @rates_test_sheet_columns[:zone] = index if column=='zone'
    @rates_test_sheet_columns[:expectation] = index if column=='expectation'
    @rates_test_sheet_columns[:total_ship_cost] = index if column=='total_ship_cost'
    @rates_test_sheet_columns[:results] = index if column=='results'
    @rates_test_sheet_columns[:status] = index if column=='status'
    @rates_test_sheet_columns[:error_msg] = index if column=='error_msg'
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rates_test_sheet_columns[:weight_lb].nil?
    missing_column = true
    error_msg = "Column weight_lb does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone1].nil?
    missing_column = true
    error_msg = "Column zone1 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone2].nil?
    missing_column = true
    error_msg = "Column zone2 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone3].nil?
    missing_column = true
    error_msg = "Column zone3 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone4].nil?
    missing_column = true
    error_msg = "Column zone4 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone5].nil?
    missing_column = true
    error_msg = "Column zone5 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone6].nil?
    missing_column = true
    error_msg = "Column zone6 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone7].nil?
    missing_column = true
    error_msg = "Column zone7 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone8].nil?
    missing_column = true
    error_msg = "Column zone8 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone9].nil?
    missing_column = true
    error_msg = "Column zone9 does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:ship_from].nil?
    missing_column = true
    error_msg = "Column ship_from does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:ship_to_domestic].nil?
    missing_column = true
    error_msg = "Column ship_to_domestic does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:zone].nil?
    missing_column = true
    error_msg = "Column zone does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:expectation].nil?
    missing_column = true
    error_msg = "Column expectation does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:total_ship_cost].nil?
    missing_column = true
    error_msg = "Column total_ship_cost does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:results].nil?
    missing_column = true
    error_msg = "Column results does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:status].nil?
    missing_column = true
    error_msg = "Column status does not exist in parameter sheet"
  elsif @rates_test_sheet_columns[:error_msg].nil?
    missing_column = true
    error_msg = "Column error_msg does not exist in parameter sheet"
  end

  "Check your paramter sheet: #{@xls_loc}".should eql error_msg if missing_column

  # test_data[:zone] is set in step "Details: Set Ship-To to address in Zone xxx"
  # where xxx is a number between 1-9
  test_data[:zone].should_not be nil
  case test_data[:zone]
    when 1
      zone_column = @rates_test_sheet_columns[:zone1]
    when 2
      zone_column = @rates_test_sheet_columns[:zone2]
    when 3
      zone_column = @rates_test_sheet_columns[:zone3]
    when 4
      zone_column = @rates_test_sheet_columns[:zone4]
    when 5
      zone_column = @rates_test_sheet_columns[:zone5]
    when 6
      zone_column = @rates_test_sheet_columns[:zone6]
    when 7
      zone_column = @rates_test_sheet_columns[:zone7]
    when 8
      zone_column = @rates_test_sheet_columns[:zone8]
    when 9
      zone_column = @rates_test_sheet_columns[:zone9]
    else
      logger.error "test_data[:zone] should have a value between 1 through 9. Check your test."
      expect(test_data[:zone]).to be_between(1, 9).inclusive
  end

  @rates_test_sheet.each_with_index do |row, index|
    begin
      if index > 0
        logger.step"Starting Test for Zone #{test_data[:zone]} - Row #{index}"
        row[@rates_test_sheet_columns[:zone]] = test_data[:zone]
        row[@rates_test_sheet_columns[:username]] = test_data[:username]
        row[@rates_test_sheet_columns[:ship_from]] = test_data[:ship_from]
        row[@rates_test_sheet_columns[:ship_to_domestic]] = test_data[:ship_to_domestic]

        # Set weight to 0
        step "Details: Set Pounds to 0"
        step "Details: Set Ounces to 0"

        # Set weight per spreadsheet
        weight_lb = row[@rates_test_sheet_columns[:weight_lb]]
        logger.step "Column weight_lb: #{weight_lb}"
        if param_helper.is_whole_number?(weight_lb)
          weight_lb = weight_lb.to_int
          row[@rates_test_sheet_columns[:weight]] = "#{weight_lb} lb."
          step "Details: Set Pounds to #{weight_lb}"
        else
          weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_int
          logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
          row[@rates_test_sheet_columns[:weight]] = "#{weight_oz} oz."
          step "Details: Set Ounces to #{weight_oz}"
        end

        # Set Service
        service = row[@rates_test_sheet_columns[:service]]
        # record execution time as time service was selected.
        row[@rates_test_sheet_columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")
        step "Details: Select Service #{service}"

        # spreadsheet price
        zone_column.should_not be nil
        price = row[zone_column]
        # set expectation column for this row to zone price
        row[@rates_test_sheet_columns[:expectation]] = price
        expectation = row[@rates_test_sheet_columns[:expectation]]

        # get total cost actual value from UI
        step "Save Shipping Costs Data"
        row[@rates_test_sheet_columns[:total_ship_cost]] = test_data[:total_ship_cost]
        if row[@rates_test_sheet_columns[:expectation]] == row[@rates_test_sheet_columns[:total_ship_cost]]
          row[@rates_test_sheet_columns[:status]] = "Passed"
          row[@rates_test_sheet_columns[:results]] = "#{row[@rates_test_sheet_columns[:expectation]]} == #{row[@rates_test_sheet_columns[:total_ship_cost]]}"
        else
          row[@rates_test_sheet_columns[:status]] = "Failed"
          row[@rates_test_sheet_columns[:results]] = "Expected #{row[@rates_test_sheet_columns[:expectation]]}, Got #{row[@rates_test_sheet_columns[:total_ship_cost]]}"
        end
      end
    rescue Exception=> e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      row[@rates_test_sheet_columns[:error_msg]] = "Zone #{test_data[:zone]} - Row #{index}: #{e.message}"
    end
  end

  @result_sheet_loc = "#{data_for(:rates_test, {})['results_dir']}\\rates_sheet_pme_comm_base_zone_#{test_data[:zone]}_zone1_#{Time.now.strftime("%Y.%m.%d.%H.%M")}_results.xls"
  @rates_xls.write @result_sheet_loc

  logger.step "Result Sheet Location: #{@result_sheet_loc}"
  failed_test_count = 0
  @rates_test_sheet.each_with_index do |row, index|
    begin
      if index > 0
        if row[@rates_test_sheet_columns[:status]] == "Failed"
          failed_test_count +=1
          logger.step"Zone #{test_data[:zone]} - Row #{index} Failed"
        end
      end
    end
  end
  logger.step "Result Sheet Location: #{@result_sheet_loc}"
  if failed_test_count>0
    logger.error "Number of Failed Tests: #{failed_test_count}"
    logger.error "Number of Failed Tests: #{failed_test_count}"
    logger.error "Number of Failed Tests: #{failed_test_count}"
    logger.error "Number of Failed Tests: #{failed_test_count}"
    logger.error "Number of Failed Tests: #{failed_test_count}"
    logger.error "Number of Failed Tests: #{failed_test_count}"
  end
  failed_test_count.should eql 0
end
