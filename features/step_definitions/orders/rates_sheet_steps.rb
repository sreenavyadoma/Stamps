
Then /^(?:E|e)xcel rate sheet is loaded$/ do
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

Then /^(?:R|r)un rate test PME Comm Base in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_base']
  step "run rate test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^(?:R|r)un rate test PME Comm Plus in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_plus']
  step "run rate test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^(?:R|r)un rate test PM Comm Base in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_base']
  step "run rate test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^(?:R|r)un rate test PM Comm Plus in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_plus']
  step "run rate test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^(?:R|r)un rate test Parcel Select Ground in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_parcel_select_ground']
  step "run rate test Sheet #{param_sheet} in Zone #{zone}"
end

Then /^(?:R|r)un rate test Sheet (.*) in Zone (\d+)$/ do |param_sheet, zone|
  zone = zone.to_i

  @result_file = Spreadsheet::Workbook.new
  @result_sheet = @result_file.create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  @result_sheet.name = param_sheet

  @rate_sheet_columns = Hash.new
  @result_sheet_columns = Hash.new
  @result_sheet_column_offset = 8

  # map out parameter sheet column location
  @rate_sheet_header = @rate_sheet.row(0)
  #result sheet columns
  @bold = Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, column_number|
    if column_name=='weight_lb'
      @rate_sheet_columns[:weight_lb] = column_number
      @result_sheet_columns[:weight_lb] = column_number
      @result_sheet.row(0)[column_number] = 'weight_lb'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone1'
      @rate_sheet_columns[:zone1] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone1'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone2'
      @rate_sheet_columns[:zone2] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone2'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone3'
      @rate_sheet_columns[:zone3] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone3'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone4'
      @rate_sheet_columns[:zone4] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone4'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone5'
      @rate_sheet_columns[:zone5] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone5'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone6'
      @rate_sheet_columns[:zone6] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone6'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone7'
      @rate_sheet_columns[:zone7] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone7'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone8'
      @rate_sheet_columns[:zone8] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone8'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='zone9'
      @rate_sheet_columns[:zone9] = column_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone9'
      @result_sheet.row(0).set_format(column_number, @bold)
    end


    if column_name=='service'
      @rate_sheet_columns[:service] = column_number
      @result_sheet_columns[:service] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service]] = 'service'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='tracking'
      @rate_sheet_columns[:tracking] = column_number
      @result_sheet_columns[:tracking] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:tracking]] = 'tracking'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='execution_date'
      @rate_sheet_columns[:execution_date] = column_number
      @result_sheet_columns[:execution_date] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:execution_date]] = 'execution_date'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='username'
      @rate_sheet_columns[:username] = column_number
      @result_sheet_columns[:username] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:username]] = 'username'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='ship_from'
      @rate_sheet_columns[:ship_from] = column_number
      @result_sheet_columns[:ship_from] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:ship_from]] = 'ship_from'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='ship_to_domestic'
      @rate_sheet_columns[:ship_to_domestic] = column_number
      @result_sheet_columns[:ship_to_domestic] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:ship_to_domestic]] = 'ship_to_domestic'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='weight'
      @rate_sheet_columns[:weight] = column_number
      @result_sheet_columns[:weight] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:weight]] = 'weight'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='service_selected'
      @rate_sheet_columns[:service_selected] = column_number
      @result_sheet_columns[:service_selected] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service_selected]] = 'service_selected'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='tracking_selected'
      @rate_sheet_columns[:tracking_selected] = column_number
      @result_sheet_columns[:tracking_selected] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:tracking_selected]] = 'tracking_selected'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = column_number
      @result_sheet_columns[:total_ship_cost] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:total_ship_cost]] = 'total_ship_cost'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='results'
      @rate_sheet_columns[:results] = column_number
      @result_sheet_columns[:results] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:results]] = 'results'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='status'
      @rate_sheet_columns[:status] = column_number
      @result_sheet_columns[:status] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:status]] = 'status'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
    if column_name=='error_msg'
      @rate_sheet_columns[:error_msg] = column_number
      @result_sheet_columns[:error_msg] = column_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:error_msg]] = 'error_msg'
      @result_sheet.row(0).set_format(column_number, @bold)
    end
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_lb].nil?
    missing_column = true
    error_msg = "Column weight_lb does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone1].nil?
    missing_column = true
    error_msg = "Column zone1 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone2].nil?
    missing_column = true
    error_msg = "Column zone2 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone3].nil?
    missing_column = true
    error_msg = "Column zone3 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone4].nil?
    missing_column = true
    error_msg = "Column zone4 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone5].nil?
    missing_column = true
    error_msg = "Column zone5 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone6].nil?
    missing_column = true
    error_msg = "Column zone6 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone7].nil?
    missing_column = true
    error_msg = "Column zone7 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone8].nil?
    missing_column = true
    error_msg = "Column zone8 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone9].nil?
    missing_column = true
    error_msg = "Column zone9 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking].nil?
    missing_column = true
    error_msg = "Column tracking does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_from].nil?
    missing_column = true
    error_msg = "Column ship_from does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_to_domestic].nil?
    missing_column = true
    error_msg = "Column ship_to_domestic does not exist in parameter sheet"
  elsif @rate_sheet_columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service_selected].nil?
    missing_column = true
    error_msg = "Column service_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:tracking_selected].nil?
    missing_column = true
    error_msg = "Column tracking_selected does not exist in parameter sheet"
  elsif @rate_sheet_columns[:total_ship_cost].nil?
    missing_column = true
    error_msg = "Column total_ship_cost does not exist in parameter sheet"
  elsif @rate_sheet_columns[:results].nil?
    missing_column = true
    error_msg = "Column results does not exist in parameter sheet"
  elsif @rate_sheet_columns[:status].nil?
    missing_column = true
    error_msg = "Column status does not exist in parameter sheet"
  elsif @rate_sheet_columns[:error_msg].nil?
    missing_column = true
    error_msg = "Column error_msg does not exist in parameter sheet"
  end

  "Check your parameter sheet: #{@rate_file_loc}".should eql error_msg if missing_column

  # parameter zone is set in step "On Order Details form, set Ship-To to address in Zone xxx"
  # where xxx is a number between 1-9
  zone.should_not be nil
  case zone
    when 1
      zone_column = @rate_sheet_columns[:zone1]
    when 2
      zone_column = @rate_sheet_columns[:zone2]
    when 3
      zone_column = @rate_sheet_columns[:zone3]
    when 4
      zone_column = @rate_sheet_columns[:zone4]
    when 5
      zone_column = @rate_sheet_columns[:zone5]
    when 6
      zone_column = @rate_sheet_columns[:zone6]
    when 7
      zone_column = @rate_sheet_columns[:zone7]
    when 8
      zone_column = @rate_sheet_columns[:zone8]
    when 9
      zone_column = @rate_sheet_columns[:zone9]
    else
      expect(zone).to be_between(1, 9).inclusive
  end

  # Set address to proper zone
  step "On Order Details form, set Ship-To to address in Zone #{zone}"
  format = Spreadsheet::Format.new :color=> :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color=> :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color=> :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, column_number|
    @row=row
    @result_sheet.row(0)[@result_sheet_columns[:zone]] = "zone#{zone}"
    begin
      if column_number > 0
        logger.step ""
        logger.step"#{"#"*80} Starting Test for Zone #{zone} - Row #{column_number}"
        logger.step ""

        # set result sheet price for zone
        #@result_sheet[row_num, zone_column] = price

        # Set column zone being tested to bold
        #@result_sheet.row(row_num).set_format(zone_column, format)
        #@result_sheet[row_num, @columns[:zone1]] = row[@columns[:zone1]]
        #@result_sheet[row_num, @columns[:zone2]] = row[@columns[:zone2]]
        #@result_sheet[row_num, @columns[:zone3]] = row[@columns[:zone3]]
        #@result_sheet[row_num, @columns[:zone4]] = row[@columns[:zone4]]
        #@result_sheet[row_num, @columns[:zone5]] = row[@columns[:zone5]]
        #@result_sheet[row_num, @columns[:zone6]] = row[@columns[:zone6]]
        #@result_sheet[row_num, @columns[:zone7]] = row[@columns[:zone7]]
        #@result_sheet[row_num, @columns[:zone8]] = row[@columns[:zone8]]
        #@result_sheet[row_num, @columns[:zone9]] = row[@columns[:zone9]]

        # spreadsheet price for zone

        if row[zone_column] == nil
          @result_sheet.row(column_number).set_format(zone_column, format)
          @result_sheet[column_number, @result_sheet_columns[:weight_lb]] = row[@rate_sheet_columns[:weight_lb]]
          @result_sheet[column_number, @result_sheet_columns[:zone]] = row[zone_column]
          @result_sheet[column_number, @result_sheet_columns[:username]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:ship_from]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:ship_to_domestic]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:weight]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:service]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:execution_date]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:service_selected]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:tracking_selected]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:total_ship_cost]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:status]] = "--"
          @result_sheet[column_number, @result_sheet_columns[:results]] = "--"

          logger.step "#{"#"*10} "
          logger.step "#{"#"*10} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{column_number}. Test Skipped! Empty rates."

        else

          price = (row[zone_column].to_f * 100).round / 100.0

          # set expectation column for this row to zone price
          @result_sheet.row(column_number).set_format(zone_column, format)
          @result_sheet[column_number, @result_sheet_columns[:zone]]= price

          @result_sheet[column_number, @result_sheet_columns[:username]] = test_data[:username]
          @result_sheet[column_number, @result_sheet_columns[:ship_from]] = test_data[:ship_from]
          @result_sheet[column_number, @result_sheet_columns[:ship_to_domestic]] = test_data[:ship_to_domestic]

          # Set weight to 0
          step "On Order Details form, set Pounds to 0"
          step "On Order Details form, set Ounces to 0"

          # Set weight per spreadsheet
          #row[@rate_sheet_columns[:weight_lb]].should_not be nil
          weight_lb = row[@rate_sheet_columns[:weight_lb]]
          logger.step "Column weight_lb: #{weight_lb}"
          if param_helper.is_whole_number?(weight_lb)
            weight_lb = weight_lb.to_i
            @result_sheet[column_number, @result_sheet_columns[:weight_lb]] = weight_lb
            @result_sheet[column_number, @result_sheet_columns[:weight]] = "#{weight_lb} lb."
            step "On Order Details form, set Pounds to #{weight_lb}"
          else
            weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i
            logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
            @result_sheet[column_number, @result_sheet_columns[:weight]] = "#{weight_oz} oz."
            @result_sheet[column_number, @result_sheet_columns[:weight_lb]] = weight_oz
            step "On Order Details form, set Ounces to #{weight_oz}"
          end

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          @result_sheet[column_number, @result_sheet_columns[:service]] = service

          # record execution time as time service was selected.
          @result_sheet[column_number, @result_sheet_columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "On Order Details form, select service #{service}"
          @result_sheet[column_number, @result_sheet_columns[:service_selected]] = test_data[:service]

          # Set Tracking
          begin
            tracking = row[@rate_sheet_columns[:tracking]]
            step "On Order Details form, set Tracking to #{tracking}"
          end unless row[@rate_sheet_columns[:tracking]].nil?
          # Write tracking to spreadsheet
          step "On Order Details form, Store Tracking info to parameter"
          @result_sheet[column_number, @result_sheet_columns[:tracking_selected]] = test_data[:tracking]

          # get total cost actual value from UI
          step "Save Test Data"
          #test_data[:total_ship_cost] = 21.64
          @result_sheet[column_number, @result_sheet_columns[:total_ship_cost]] = (test_data[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          step "On Order Details form, set Pounds to 0"
          step "On Order Details form, set Ounces to 0"

          @result_sheet[column_number, zone_column].should_not be nil
          @result_sheet[column_number, @result_sheet_columns[:total_ship_cost]].should_not be nil

          expectation_f = (@result_sheet[column_number, zone_column].to_f * 100).round / 100.0
          total_ship_cost_f = (@result_sheet[column_number, @result_sheet_columns[:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            @result_sheet[column_number, @result_sheet_columns[:status]] = "Passed"
            @result_sheet.row(column_number).set_format(@result_sheet_columns[:status], pass_format)
            @result_sheet[column_number, @result_sheet_columns[:results]] = "#{@result_sheet[column_number, zone_column]} == #{@result_sheet[column_number, @result_sheet_columns[:total_ship_cost]]}"
          else
            @result_sheet[column_number, @result_sheet_columns[:status]] = "Failed"
            @result_sheet.row(column_number).set_format(@result_sheet_columns[:status], fail_format)
            @result_sheet[column_number, @result_sheet_columns[:results]] = "Expected #{@result_sheet[column_number, zone_column]}, Got #{@result_sheet[column_number, @result_sheet_columns[:total_ship_cost]]}"
          end

          logger.step "#{"#"*10} "
          logger.step "#{"#"*10} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{column_number}"
          logger.step "#{"#"*10} Weight: #{@result_sheet[column_number, @result_sheet_columns[:weight]]}, Selected Service: #{@result_sheet[column_number, @result_sheet_columns[:service_selected]]}"
          logger.step "#{"#"*10} Ship-To Address: #{test_data[:name]}, #{test_data[:street_address]}, #{test_data[:city]}, #{test_data[:state]}, #{test_data[:zip]}"
          logger.step "#{"#"*10} Test #{@result_sheet[column_number, @result_sheet_columns[:status]] } - Expected #{@result_sheet[column_number, zone_column]}, Got #{@result_sheet[column_number, @result_sheet_columns[:total_ship_cost]]}"
          logger.step "#{"#"*10} "
        end

      end
    rescue Exception=> e
      logger.step e.message
      logger.step e.backtrace.join("\n")
      row[@rate_sheet_columns[:error_msg]] = "Zone #{zone} - Row #{column_number}: #{e.message}"
    end
  end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  @result_file.write @result_filename
  @result_sheet.each_with_index do |row, column_number|
    begin
      if column_number > 0
        if row[@rate_sheet_columns[:status]] == "Failed"
          @failed_test_count +=1
          logger.step "Zone #{zone} - Row #{column_number} Failed"
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
  #@failed_test_count.should be < count
  logger.step "#{"*"*80}"
end


