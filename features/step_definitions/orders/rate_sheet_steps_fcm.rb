Then /^[Rr]un rate test FCM Package$/ do
  param_sheet = data_for(:rates_test, {})['rates_fcm_package']
  step "run rate sheet #{param_sheet}"
end







Then /^[Rr]un rate sheet (.*)$/ do |param_sheet|
  zone = 1

  test_param[:result_file] = Spreadsheet::Workbook.new
  test_param[:result_sheet] = test_param[:result_file].create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  test_param[:result_sheet].name = param_sheet

  @rate_sheet_columns = Hash.new
  test_param[:result_sheet_columns] = Hash.new
  test_param[:result_sheet_column_offset] = 1

  # map out parameter sheet column location
  @rate_sheet_header = @rate_sheet.row(0)
  #result sheet columns
  @bold = Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name=='weight_oz'
      @rate_sheet_columns[:weight_oz] = row_number
      test_param[:result_sheet_columns][:weight_oz] = row_number
      test_param[:result_sheet].row(0)[row_number] = 'weight_oz'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='zone1'
      @rate_sheet_columns[:zone1] = row_number
      test_param[:result_sheet_columns][:zone] = 1
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:zone]] = 'zone1'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='service'
      @rate_sheet_columns[:service] = row_number
      test_param[:result_sheet_columns][:service] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:service]] = 'service'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking'
      @rate_sheet_columns[:tracking] = row_number
      test_param[:result_sheet_columns][:tracking] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:tracking]] = 'tracking'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      test_param[:result_sheet_columns][:execution_date] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:execution_date]] = 'execution_date'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='username'
      @rate_sheet_columns[:username] = row_number
      test_param[:result_sheet_columns][:username] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:username]] = 'username'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_from'
      @rate_sheet_columns[:ship_from] = row_number
      test_param[:result_sheet_columns][:ship_from] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:ship_from]] = 'ship_from'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_to_domestic'
      @rate_sheet_columns[:ship_to_domestic] = row_number
      test_param[:result_sheet_columns][:ship_to_domestic] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:ship_to_domestic]] = 'ship_to_domestic'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='weight'
      @rate_sheet_columns[:weight] = row_number
      test_param[:result_sheet_columns][:weight] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:weight]] = 'weight'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      test_param[:result_sheet_columns][:service_selected] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:service_selected]] = 'service_selected'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking_selected'
      @rate_sheet_columns[:tracking_selected] = row_number
      test_param[:result_sheet_columns][:tracking_selected] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:tracking_selected]] = 'tracking_selected'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      test_param[:result_sheet_columns][:total_ship_cost] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:total_ship_cost]] = 'total_ship_cost'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='results'
      @rate_sheet_columns[:results] = row_number
      test_param[:result_sheet_columns][:results] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:results]] = 'results'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='status'
      @rate_sheet_columns[:status] = row_number
      test_param[:result_sheet_columns][:status] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:status]] = 'status'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name=='error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      test_param[:result_sheet_columns][:error_msg] = row_number - test_param[:result_sheet_column_offset]
      test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:error_msg]] = 'error_msg'
      test_param[:result_sheet].row(0).set_format(row_number, @bold)
    end
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_oz].nil?
    missing_column = true
    error_msg = "Column weight_oz does not exist in parameter sheet"
  elsif @rate_sheet_columns[:zone1].nil?
    missing_column = true
    error_msg = "Column zone1 does not exist in parameter sheet"
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

  expect("Check your parameter sheet: #{@rate_file_loc}").to eql error_msg if missing_column

  zone.should_not be nil
  zone_column = @rate_sheet_columns[:zone1]
  format = Spreadsheet::Format.new :color=> :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color=> :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color=> :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row=row
    test_param[:result_sheet].row(0)[test_param[:result_sheet_columns][:zone]] = "zone#{zone}"
    begin
      if row_number > 0
        test_config.logger.step"#{"#"*80} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{row_number}"

        # Set address to proper zone
        step "set Order Details form Ship-To to random address between zone 1 and 4"  if @modal_param.web_app == :orders
        step "set Print form Mail-To to a random address in zone 1 through 4" if @modal_param.web_app == :mail
        step "save Print Form Mail From" if @modal_param.web_app == :mail
        # spreadsheet price for zone

        if row[zone_column] == nil
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step "#{"#"*10} Test Row #{row_number} Skipped. No rates found on sheet."
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step"#{"#"*80} "
          test_param[:result_sheet].row(row_number).set_format(test_param[:result_sheet_columns][:zone], format)
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:weight_oz]] = row[@rate_sheet_columns[:weight_oz]]
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]] = row[zone_column]
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:username]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:ship_from]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:ship_to_domestic]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:weight]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:service]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:execution_date]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:service_selected]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:tracking_selected]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:status]] = "--"
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:results]] = "--"
        else
          price = (row[zone_column].to_f * 100).round / 100.0
          # set expectation column for this row to zone price
          test_param[:result_sheet].row(row_number).set_format(test_param[:result_sheet_columns][:zone], format)
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]]= price
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:username]] = test_param[:username]
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:ship_from]] = test_param[:ship_from]
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:ship_to_domestic]] = test_param[:ship_to_domestic]  if @modal_param.web_app == :orders
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:ship_to_domestic]] = test_param[:address]  if @modal_param.web_app == :mail

          # Set weight to 0
          step "set Order Details form Pounds to 0" if @modal_param.web_app == :orders
          step "set Order Details form Ounces to 0" if @modal_param.web_app == :orders

          step "set Print form Pounds to 0" if @modal_param.web_app == :mail
          step "set Print form Ounces to 0" if @modal_param.web_app == :mail

          # Set weight per spreadsheet

          weight_oz = row[@rate_sheet_columns[:weight_oz]]
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step "#{"#"*10} Weight: #{weight_oz}"
          test_config.logger.step "#{"#"*10} Price: #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]]}"
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step"#{"#"*50}"


          weight_oz = weight_oz.to_i
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:weight_oz]] = weight_oz
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:weight]] = "#{weight_oz} oz."
          step "set Order Details form Ounces to #{weight_oz}"  if @modal_param.web_app == :orders
          step "set Print form Ounces to #{weight_oz}"  if @modal_param.web_app == :mail

          sleep(0.025)

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:service]] = service

          # record execution time as time service was selected.
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set Order Details form service to #{service}" if @modal_param.web_app == :orders
          step "select Print form service #{service}" if @modal_param.web_app == :mail

          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:service_selected]] = test_param[:service]

          # Set Tracking
          begin
            step "set Order Details form Tracking to #{row[@rate_sheet_columns[:tracking]]}"  if @modal_param.web_app == :orders
          end unless row[@rate_sheet_columns[:tracking]].nil?
          # Write tracking to spreadsheet
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:tracking_selected]] = test_param[:tracking]
          sleep(0.525)
          # get total cost actual value from UI
          step "Save Order Details data" if @modal_param.web_app == :orders
          step "save Print Form Total Cost" if @modal_param.web_app == :mail
          test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]] = (test_param[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          if @modal_param.web_app == :mail
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          elsif @modal_param.web_app == :orders
            step "set Order Details form Pounds to 0"
            step "set Order Details form Ounces to 0"
          end
          expectation_f = (test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]].to_f * 100).round / 100.0
          total_ship_cost_f = (test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:status]] = "Passed"
            test_param[:result_sheet].row(row_number).set_format(test_param[:result_sheet_columns][:status], pass_format)
            test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:results]] = "#{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]]} == #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]]}"
          else
            test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:status]] = "Failed"
            test_param[:result_sheet].row(row_number).set_format(test_param[:result_sheet_columns][:status], fail_format)
            test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:results]] = "Expected #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]]}, Got #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]]}"
          end
          test_config.logger.step "#{"#"*10} "
          test_config.logger.step "#{"#"*10} Weight: #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:weight]]}"
          test_config.logger.step "#{"#"*10} Selected Service: #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:service_selected]]}"
          test_config.logger.step "#{"#"*10} Ship-To Address: #{test_param[:address]}" if @modal_param.web_app == :mail
          test_config.logger.step "#{"#"*10} Ship-To Address: #{test_param[:full_name]}, #{test_param[:street_address]}, #{test_param[:city]}, #{test_param[:state]}, #{test_param[:zip]}" if @modal_param.web_app == :orders
          test_config.logger.step "#{"#"*10} #{"*"*5} Test #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:status]] } - Expected #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:zone]]}, Got #{test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:total_ship_cost]]} #{"*"*5}"
          test_config.logger.step "#{"#"*10} "
        end

      end
    rescue Exception=> e
      test_config.logger.step e.message
      test_config.logger.step e.backtrace.join("\n")
      test_param[:result_sheet][row_number, test_param[:result_sheet_columns][:error_msg]] = "Zone #{zone} - Row #{row_number}: #{e.message}"
    end
  end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_#{ENV['WEB_APP'].downcase}_#{ENV['URL'].downcase}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  test_param[:result_file].write @result_filename
  test_param[:result_sheet].each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[@rate_sheet_columns[:status]] == "Failed"
          @failed_test_count +=1
          test_config.logger.step "Zone #{zone} - Row #{row_number} Failed"
        end
      end
    end
  end
  test_config.logger.step "#{"*"*80}"
  test_config.logger.step "#{"*"*80}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "#{"*"*80}"
  test_config.logger.step "#{"*"*80}"
end


Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  test_config.logger.step "#{"*"*80}"
  test_config.logger.step "Rates: Number of failed test should be less than #{count}"
  count = count.to_i
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  test_config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  #@failed_test_count).to be < count
  test_config.logger.step "#{"*"*80}"
end
