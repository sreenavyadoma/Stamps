
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
    logger.step e.message
    logger.step e.backtrace.join("\n")
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

Then /^Rates: Test PME Comm Plus in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test PME Comm Plus in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_plus']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test PM Comm Base in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test PME Comm Base in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_base']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test PM Comm Plus in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test PM Comm Plus in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_plus']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test Parcel Select Ground in Zone (\d+)$/ do |zone|
  logger.step "Rates: Test Parcel Select Ground in Zone #{zone}"
  param_sheet = data_for(:rates_test, {})['rates_parcel_select_ground']
  step "Rates: Test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^Rates: Test Sheet (.*) in Zone (\d+)$/ do |param_sheet, zone|
  logger.step ""
  logger.step "#{"*"*100} Rates: Test Sheet #{param_sheet} in Zone #{zone}"
  zone = zone.to_i

  @result_file = Spreadsheet::Workbook.new
  @result_sheet = @result_file.create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  @result_sheet.name = param_sheet

  @columns = Hash.new

  # map out parameter sheet column location
  @rate_sheet_columns = @rate_sheet.row(0)
  #result sheet columns
  @result_sheet_columns = @result_sheet.row(0)
  @bold = Spreadsheet::Format.new :weight => :bold

  @rate_sheet_columns.each_with_index do |column, row_num|
    if column=='weight_lb'
      @columns[:weight_lb] = row_num
      @result_sheet_columns[row_num] = 'weight_lb'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone1'
      @columns[:zone1] = row_num
      @result_sheet_columns[row_num] = 'zone1'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone2'
      @columns[:zone2] = row_num
      @result_sheet_columns[row_num] = 'zone2'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone3'
      @columns[:zone3] = row_num
      @result_sheet_columns[row_num] = 'zone3'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone4'
      @columns[:zone4] = row_num
      @result_sheet_columns[row_num] = 'zone4'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone5'
      @columns[:zone5] = row_num
      @result_sheet_columns[row_num] = 'zone5'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone6'
      @columns[:zone6] = row_num
      @result_sheet_columns[row_num] = 'zone6'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone7'
      @columns[:zone7] = row_num
      @result_sheet_columns[row_num] = 'zone7'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone8'
      @columns[:zone8] = row_num
      @result_sheet_columns[row_num] = 'zone8'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone9'
      @columns[:zone9] = row_num
      @result_sheet_columns[row_num] = 'zone9'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='service'
      @columns[:service] = row_num
      @result_sheet_columns[row_num] = 'service'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='tracking'
      @columns[:tracking] = row_num
      @result_sheet_columns[row_num] = 'tracking'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='execution_date'
      @columns[:execution_date] = row_num
      @result_sheet_columns[row_num] = 'execution_date'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='username'
      @columns[:username] = row_num
      @result_sheet_columns[row_num] = 'username'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='ship_from'
      @columns[:ship_from] = row_num
      @result_sheet_columns[row_num] = 'ship_from'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='ship_to_domestic'
      @columns[:ship_to_domestic] = row_num
      @result_sheet_columns[row_num] = 'ship_to_domestic'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='weight'
      @columns[:weight] = row_num
      @result_sheet_columns[row_num] = 'weight'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='service_selected'
      @columns[:service_selected] = row_num
      @result_sheet_columns[row_num] = 'service_selected'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='tracking_selected'
      @columns[:tracking_selected] = row_num
      @result_sheet_columns[row_num] = 'tracking_selected'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='zone'
      @columns[:zone] = row_num
      @result_sheet_columns[row_num] = 'zone'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='expectation'
      @columns[:expectation] = row_num
      @result_sheet_columns[row_num] = 'expectation'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='total_ship_cost'
      @columns[:total_ship_cost] = row_num
      @result_sheet_columns[row_num] = 'total_ship_cost'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='results'
      @columns[:results] = row_num
      @result_sheet_columns[row_num] = 'results'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='status'
      @columns[:status] = row_num
      @result_sheet_columns[row_num] = 'status'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
    if column=='error_msg'
      @columns[:error_msg] = row_num
      @result_sheet_columns[row_num] = 'error_msg'
      @result_sheet.row(0).set_format(row_num, @bold)
    end
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

  # parameter zone is set in step "On Order Details form, set Ship-To to address in Zone xxx"
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
      logger.step "Zone parameter (zone) should have a value between 1 through 9. #{zone} is an invalid selection. Check your test."
      expect(zone).to be_between(1, 9).inclusive
  end

  # Set address to proper zone
  step "On Order Details form, set Ship-To to address in Zone #{zone}"
  format = Spreadsheet::Format.new :color=> :blue,
                                   :pattern_fg_color => :yellow,
                                   :pattern => 1
  fail_format = Spreadsheet::Format.new :color=> :red,
                                   :weight => :bold
  pass_format = Spreadsheet::Format.new :color=> :green,
                                   :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_num|
    @row=row
    begin
      if row_num > 0
        logger.step ""
        logger.step"#{"#"*80} Starting Test for Zone #{zone} - Row #{row_num}"
        logger.step ""

        @result_sheet[row_num, @columns[:zone]] = zone
        @result_sheet[row_num, @columns[:username]] = test_data[:username]
        @result_sheet[row_num, @columns[:ship_from]] = test_data[:ship_from]
        @result_sheet[row_num, @columns[:ship_to_domestic]] = test_data[:ship_to_domestic]

        # set result sheet price for zone
        #@result_sheet[row_num, zone_column] = price

        # Set column zone being tested to bold
        @result_sheet.row(row_num).set_format(zone_column, format)
        @result_sheet[row_num, @columns[:zone1]] = row[@columns[:zone1]]
        @result_sheet[row_num, @columns[:zone2]] = row[@columns[:zone2]]
        @result_sheet[row_num, @columns[:zone3]] = row[@columns[:zone3]]
        @result_sheet[row_num, @columns[:zone4]] = row[@columns[:zone4]]
        @result_sheet[row_num, @columns[:zone5]] = row[@columns[:zone5]]
        @result_sheet[row_num, @columns[:zone6]] = row[@columns[:zone6]]
        @result_sheet[row_num, @columns[:zone7]] = row[@columns[:zone7]]
        @result_sheet[row_num, @columns[:zone8]] = row[@columns[:zone8]]
        @result_sheet[row_num, @columns[:zone9]] = row[@columns[:zone9]]

        # Set weight to 0
        step "On Order Details form, set Pounds to 0"
        step "On Order Details form, set Ounces to 0"

        # Set weight per spreadsheet
        row[@columns[:weight_lb]].should_not be nil
        weight_lb = row[@columns[:weight_lb]]
        logger.step "Column weight_lb: #{weight_lb}"
        if param_helper.is_whole_number?(weight_lb)
          weight_lb = weight_lb.to_i
          @result_sheet[row_num, @columns[:weight_lb]] = weight_lb
          @result_sheet[row_num, @columns[:weight]] = "#{weight_lb} lb."
          step "On Order Details form, set Pounds to #{weight_lb}"
        else
          weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i
          logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
          @result_sheet[row_num, @columns[:weight]] = "#{weight_oz} oz."
          @result_sheet[row_num, @columns[:weight_lb]] = weight_oz
          step "On Order Details form, set Ounces to #{weight_oz}"
        end

        # Set Service
        row[@columns[:service]].should_not be nil
        service = row[@columns[:service]]
        @result_sheet[row_num, @columns[:service]] = service

        # record execution time as time service was selected.
        @result_sheet[row_num, @columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

        step "On Order Details form, select service #{service}"
        @result_sheet[row_num, @columns[:service_selected]] = test_data[:service]

        # Set Tracking
        begin
          tracking = row[@columns[:tracking]]
          step "On Order Details form, set Tracking to #{tracking}"
        end unless row[@columns[:tracking]].nil?
        # Write tracking to spreadsheet
        step "On Order Details form, Store Tracking info to parameter"
        @result_sheet[row_num, @columns[:tracking_selected]] = test_data[:tracking]

        # spreadsheet price
        zone_column.should_not be nil
        row[zone_column].should_not be nil
        price = (row[zone_column].to_f * 100).round / 100.0

        # set expectation column for this row to zone price
        @result_sheet.row(row_num).set_format(@columns[:expectation], format)
        @result_sheet[row_num, @columns[:expectation]]= price

        # get total cost actual value from UI
        step "Save Test Data"
        #test_data[:total_ship_cost] = 21.64
        @result_sheet[row_num, @columns[:total_ship_cost]] = (test_data[:total_ship_cost].to_f * 100).round / 100.0

        # Set weight to 0
        step "On Order Details form, set Pounds to 0"
        step "On Order Details form, set Ounces to 0"

        @result_sheet[row_num, @columns[:expectation]].should_not be nil
        @result_sheet[row_num, @columns[:total_ship_cost]].should_not be nil

        expectation_f = (@result_sheet[row_num, @columns[:expectation]].to_f * 100).round / 100.0
        total_ship_cost_f = (@result_sheet[row_num, @columns[:total_ship_cost]].to_f * 100).round / 100.0

        if expectation_f == total_ship_cost_f
          @result_sheet[row_num, @columns[:status]] = "Passed"
          @result_sheet.row(row_num).set_format(@columns[:status], pass_format)
          @result_sheet[row_num, @columns[:results]] = "#{@result_sheet[row_num, @columns[:expectation]]} == #{@result_sheet[row_num, @columns[:total_ship_cost]]}"
        else
          @result_sheet[row_num, @columns[:status]] = "Failed"
          @result_sheet.row(row_num).set_format(@columns[:status], fail_format)
          @result_sheet[row_num, @columns[:results]] = "Expected #{@result_sheet[row_num, @columns[:expectation]]}, Got #{@result_sheet[row_num, @columns[:total_ship_cost]]}"
        end

        logger.step "#{"#"*10} "
        logger.step "#{"#"*10} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{row_num}"
        logger.step "#{"#"*10} Weight: #{@result_sheet[row_num, @columns[:weight]]}, Selected Service: #{@result_sheet[row_num, @columns[:service_selected]]}"
        logger.step "#{"#"*10} Ship-To Address: #{test_data[:name]}, #{test_data[:street_address]}, #{test_data[:city]}, #{test_data[:state]}, #{test_data[:zip]}"
        logger.step "#{"#"*10} Test #{@result_sheet[row_num, @columns[:status]] } - Expected #{@result_sheet[row_num, @columns[:expectation]]}, Got #{@result_sheet[row_num, @columns[:total_ship_cost]]}"
        logger.step "#{"#"*10} "
      end
    rescue Exception=> e
      logger.step e.message
      logger.step e.backtrace.join("\n")
      row[@columns[:error_msg]] = "Zone #{zone} - Row #{row_num}: #{e.message}"
    end
  end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  @result_file.write @result_filename
  @result_sheet.each_with_index do |row, row_num|
    begin
      if row_num > 0
        if row[@columns[:status]] == "Failed"
          @failed_test_count +=1
          logger.step "Zone #{zone} - Row #{row_num} Failed"
        end
      end
    end
  end
  logger.step "#{"*"*80}"
  logger.step "#{"*"*80}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "#{"*"*80}"
  logger.step "#{"*"*80}"
end

Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  logger.step "#{"*"*80}"
  logger.step "Rates: Number of failed test should be less than #{count}"
  count = count.to_i
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  logger.step "Number of Failed Tests: #{@failed_test_count}"
  @failed_test_count.should be < count
  logger.step "#{"*"*80}"
end


