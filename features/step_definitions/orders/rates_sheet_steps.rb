Then /^[Pp]repare environment for ratings test$/ do
  if @modal_param.web_app == :mail
    step "select Print On Shipping Label - 8 ½\" x 11\" Paper"
    step "set Print form Mail-From to default"
  else
    step "add new order"
    set "Order Details form Ship-From to default"
  end
end


Then /^[Ee]xcel rate sheet is loaded$/ do
  expect([:orders, :mail]).to include(modal_param.web_app)
  Spreadsheet.client_encoding = 'UTF-8'
  rate_file = data_for(:rates_test, {})['rate_file']

  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
  config.logger.step "Rate File: #{@rate_file_loc}"
  expect("Rate File: #{@rate_file_loc}").to eql "Rate File does not exist!" unless File.exist?(@rate_file_loc)

  begin
    @rate_file = Spreadsheet.open(@rate_file_loc)
  rescue Exception => e
    config.logger.step e.message
    config.logger.step e.backtrace.join("\n")
    expect(e.message).to eql "Excel Rate File is opened by someone at a computer somewhere. Close the excel sheet before running the test again."
  end

  @failed_test_count = 0
  @rate_file.should_not be nil
end

Then /^[Rr]un rate test PME Comm Base in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_base']
  step "run rate sheet #{param_sheet} in Zone #{zone}"
end

Then /^[Rr]un rate test PME Comm Plus in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pme_comm_plus']
  step "run rate sheet #{param_sheet} in Zone #{zone}"
end

Then /^[Rr]un rate test PM Comm Base in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_base']
  step "run rate sheet #{param_sheet} in Zone #{zone}"
end

Then /^[Rr]un rate test PM Comm Plus in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_pm_comm_plus']
  step "run rate sheet #{param_sheet} in Zone #{zone}"
end

Then /^[Rr]un rate test Parcel Select Ground in Zone (\d+)$/ do |zone|
  param_sheet = data_for(:rates_test, {})['rates_parcel_select_ground']
  step "run rate sheet #{param_sheet} in Zone #{zone}"
end

Then /^[Rr]un rate test PMEI Comm Base in Country Price Group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmei_comm_base']
  step "run rate sheet #{param_sheet} in Country Price Group #{group}"
end

Then /^[Rr]un rate test PMEI Comm Plus in Country Price Group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmei_comm_plus']
  step "run rate sheet #{param_sheet} in Country Price Group #{group}"
end

Then /^[Rr]un rate sheet (.*) in Country Price Group (\d+)$/ do |param_sheet, group|
  group = group.to_i

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

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name=='weight_lb'
      @rate_sheet_columns[:weight_lb] = row_number
      @result_sheet_columns[:weight_lb] = row_number
      @result_sheet.row(0)[row_number] = 'weight_lb'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group1'
      @rate_sheet_columns[:group1] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group1'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group2'
      @rate_sheet_columns[:group2] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group2'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group3'
      @rate_sheet_columns[:group3] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group3'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group4'
      @rate_sheet_columns[:group4] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group4'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group5'
      @rate_sheet_columns[:group5] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group5'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group6'
      @rate_sheet_columns[:group6] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group6'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group7'
      @rate_sheet_columns[:group7] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group7'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group8'
      @rate_sheet_columns[:group8] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group8'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group9'
      @rate_sheet_columns[:group9] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group9'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group10'
      @rate_sheet_columns[:group10] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group10'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group11'
      @rate_sheet_columns[:group11] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group11'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group12'
      @rate_sheet_columns[:group12] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group12'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group13'
      @rate_sheet_columns[:group13] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group13'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group14'
      @rate_sheet_columns[:group14] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group14'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group15'
      @rate_sheet_columns[:group15] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group15'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group16'
      @rate_sheet_columns[:group16] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group16'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='group17'
      @rate_sheet_columns[:group17] = row_number
      @result_sheet_columns[:group] = 1
      @result_sheet.row(0)[@result_sheet_columns[:group]] = 'group17'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='service'
      @rate_sheet_columns[:service] = row_number
      @result_sheet_columns[:service] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service]] = 'service'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      @result_sheet_columns[:execution_date] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:execution_date]] = 'execution_date'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='username'
      @rate_sheet_columns[:username] = row_number
      @result_sheet_columns[:username] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:username]] = 'username'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_to_country'
      @rate_sheet_columns[:ship_to_country] = row_number
      @result_sheet_columns[:ship_to_country] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:ship_to_country]] = 'ship_to_country'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='weight'
      @rate_sheet_columns[:weight] = row_number
      @result_sheet_columns[:weight] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:weight]] = 'weight'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      @result_sheet_columns[:service_selected] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service_selected]] = 'service_selected'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      @result_sheet_columns[:total_ship_cost] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:total_ship_cost]] = 'total_ship_cost'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='results'
      @rate_sheet_columns[:results] = row_number
      @result_sheet_columns[:results] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:results]] = 'results'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='status'
      @rate_sheet_columns[:status] = row_number
      @result_sheet_columns[:status] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:status]] = 'status'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      @result_sheet_columns[:error_msg] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:error_msg]] = 'error_msg'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
  end

  # Verify all columns exists in parameter sheet
  missing_column = false
  # noinspection RubyScope
  if @rate_sheet_columns[:weight_lb].nil?
    missing_column = true
    error_msg = "Column weight_lb does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group1].nil?
    missing_column = true
    error_msg = "Column group1 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group2].nil?
    missing_column = true
    error_msg = "Column group2 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group3].nil?
    missing_column = true
    error_msg = "Column group3 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group4].nil?
    missing_column = true
    error_msg = "Column group4 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group5].nil?
    missing_column = true
    error_msg = "Column group5 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group6].nil?
    missing_column = true
    error_msg = "Column group6 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group7].nil?
    missing_column = true
    error_msg = "Column group7 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group8].nil?
    missing_column = true
    error_msg = "Column group8 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group9].nil?
    missing_column = true
    error_msg = "Column group9 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group10].nil?
    missing_column = true
    error_msg = "Column group10 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group11].nil?
    missing_column = true
    error_msg = "Column group11 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group12].nil?
    missing_column = true
    error_msg = "Column group12 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group13].nil?
    missing_column = true
    error_msg = "Column group13 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group14].nil?
    missing_column = true
    error_msg = "Column group14 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group15].nil?
    missing_column = true
    error_msg = "Column group15 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group16].nil?
    missing_column = true
    error_msg = "Column group16 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:group17].nil?
    missing_column = true
    error_msg = "Column group17 does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service].nil?
    missing_column = true
    error_msg = "Column service does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:username].nil?
    missing_column = true
    error_msg = "Column username does not exist in parameter sheet"
  elsif @rate_sheet_columns[:execution_date].nil?
    missing_column = true
    error_msg = "Column execution_date does not exist in parameter sheet"
  elsif @rate_sheet_columns[:ship_to_country].nil?
    missing_column = true
    error_msg = "Column ship_to_country does not exist in parameter sheet"
  elsif @rate_sheet_columns[:weight].nil?
    missing_column = true
    error_msg = "Column weight does not exist in parameter sheet"
  elsif @rate_sheet_columns[:service_selected].nil?
    missing_column = true
    error_msg = "Column service_selected does not exist in parameter sheet"
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

  # parameter group is set in step
  # where xxx is a number between 1-17
  group.should_not be nil
  case group
    when 1
      group_column = @rate_sheet_columns[:group1]
    when 2
      group_column = @rate_sheet_columns[:group2]
    when 3
      group_column = @rate_sheet_columns[:group3]
    when 4
      group_column = @rate_sheet_columns[:group4]
    when 5
      group_column = @rate_sheet_columns[:group5]
    when 6
      group_column = @rate_sheet_columns[:group6]
    when 7
      group_column = @rate_sheet_columns[:group7]
    when 8
      group_column = @rate_sheet_columns[:group8]
    when 9
      group_column = @rate_sheet_columns[:group9]
    when 10
      group_column = @rate_sheet_columns[:group10]
    when 11
      group_column = @rate_sheet_columns[:group11]
    when 12
      group_column = @rate_sheet_columns[:group12]
    when 13
      group_column = @rate_sheet_columns[:group13]
    when 14
      group_column = @rate_sheet_columns[:group14]
    when 15
      group_column = @rate_sheet_columns[:group15]
    when 16
      group_column = @rate_sheet_columns[:group16]
    when 17
      group_column = @rate_sheet_columns[:group17]
    else
      expect(group).to be_between(1, 17).inclusive
  end

  format = Spreadsheet::Format.new :color=> :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color=> :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color=> :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row=row
    @result_sheet.row(0)[@result_sheet_columns[:group]] = "group#{group}"
    begin
      if row_number > 0
        config.logger.step"#{"#"*80} Rate Sheet: #{param_sheet}: Group #{group} - Row #{row_number}"

        # Set country to proper group
        if (row[@rate_sheet_columns[:service]]).include? "Flat Rate"
          step "Set Order Details Ship-To Country to a random country in PMEI Flat Rate price group #{group}" if @modal_param.web_app == :orders
          step "Set Print Form Ship-To Country to a random country in PMEI Flat Rate price group #{group}" if @modal_param.web_app == :mail
        else
          step "Set Order Details Ship-To Country to a random country in PMEI price group #{group}" if @modal_param.web_app == :orders
          step "Set Print Form Ship-To Country to a random country in PMEI price group #{group}" if @modal_param.web_app == :mail
        end

        # spreadsheet price for group

        if row[group_column] == nil
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Test Row #{row_number} Skipped. No rates found on sheet."
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} "
          config.logger.step"#{"#"*80} "
          @result_sheet.row(row_number).set_format(@result_sheet_columns[:group], format)
          @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = row[@rate_sheet_columns[:weight_lb]]
          @result_sheet[row_number, @result_sheet_columns[:group]] = row[group_column]
          @result_sheet[row_number, @result_sheet_columns[:username]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:ship_to_country]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:weight]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:service]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:execution_date]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:service_selected]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:total_ship_cost]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:status]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:results]] = "--"
        else
          price = (row[group_column].to_f * 100).round / 100.0
          # set expectation column for this row to group price
          @result_sheet.row(row_number).set_format(@result_sheet_columns[:group], format)
          @result_sheet[row_number, @result_sheet_columns[:group]]= price
          @result_sheet[row_number, @result_sheet_columns[:username]] = test_param[:username]
          @result_sheet[row_number, @result_sheet_columns[:ship_to_country]] = test_param[:country]

          # Set weight to 0

          if @modal_param.web_app == :mail
            step "set Order Details form Pounds to 0"
            step "set Order Details form Ounces to 0"
          elsif @modal_param.web_app == :orders
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          end
          step "Open Settings Modal"
          step "In Settings modal, Save"

          # Set weight per spreadsheet
          #row[@rate_sheet_columns[:weight_lb]].should_not be nil
          weight_lb = row[@rate_sheet_columns[:weight_lb]]
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Weight: #{weight_lb}"
          config.logger.step "#{"#"*10} Price: #{@result_sheet[row_number, @result_sheet_columns[:group]]}"
          config.logger.step "#{"#"*10} "
          config.logger.step"#{"#"*50}"

          if helper.is_whole_number?(weight_lb)
            weight_lb = weight_lb.to_i
            @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = weight_lb
            @result_sheet[row_number, @result_sheet_columns[:weight]] = "#{weight_lb} lb."
            step "set Order Details form Pounds to 0" if @modal_param.web_app == :orders
            step "set Print form Pounds to 0" if @modal_param.web_app == :mail
          else
            weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i
            #config.logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
            @result_sheet[row_number, @result_sheet_columns[:weight]] = "#{weight_oz} oz."
            @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = weight_oz
            step "set Order Details form Ounces to 0" if @modal_param.web_app == :orders
            step "set Print form Ounces to 0" if @modal_param.web_app == :mail
          end
          sleep(0.025)

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          @result_sheet[row_number, @result_sheet_columns[:service]] = service

          # record execution time as time service was selected.
          @result_sheet[row_number, @result_sheet_columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set Order Details form service to #{service}" if @modal_param.web_app == :orders
          step "select Print form service #{service}" if @modal_param.web_app == :mail
          @result_sheet[row_number, @result_sheet_columns[:service_selected]] = test_param[:service]

          # get total cost actual value from UI
          step "Save Order Details data" if @modal_param.web_app == :orders
          step "Save Print Form Total Cost" if @modal_param.web_app == :mail
          @result_sheet[row_number, @result_sheet_columns[:total_ship_cost]] = (test_param[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          if modal_param.test_env == :orders
            step "set Order Details form Pounds to 0"
            step "set Order Details form Ounces to 0"
          elsif modal_param.test_env == :mail
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          end

          expectation_f = (@result_sheet[row_number, @result_sheet_columns[:group]].to_f * 100).round / 100.0
          total_ship_cost_f = (@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            @result_sheet[row_number, @result_sheet_columns[:status]] = "Passed"
            @result_sheet.row(row_number).set_format(@result_sheet_columns[:status], pass_format)
            @result_sheet[row_number, @result_sheet_columns[:results]] = "#{@result_sheet[row_number, @result_sheet_columns[:group]]} == #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]}"
          else
            @result_sheet[row_number, @result_sheet_columns[:status]] = "Failed"
            @result_sheet.row(row_number).set_format(@result_sheet_columns[:status], fail_format)
            @result_sheet[row_number, @result_sheet_columns[:results]] = "Expected #{@result_sheet[row_number, @result_sheet_columns[:group]]}, Got #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]}"
          end
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Weight: #{@result_sheet[row_number, @result_sheet_columns[:weight]]}"
          config.logger.step "#{"#"*10} Selected Service: #{@result_sheet[row_number, @result_sheet_columns[:service_selected]]}"
          config.logger.step "#{"#"*10} Country: #{test_param[:country]}"
          config.logger.step "#{"#"*10} #{"*"*5} Test #{@result_sheet[row_number, @result_sheet_columns[:status]] } - Expected #{@result_sheet[row_number, @result_sheet_columns[:group]]}, Got #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]} #{"*"*5}"
          config.logger.step "#{"#"*10} "
        end

      end
    rescue Exception=> e
      config.logger.step e.message
      config.logger.step e.backtrace.join("\n")
      row[@rate_sheet_columns[:error_msg]] = "Group #{group} - Row #{row_number}: #{e.message}"
    end
  end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_Group_#{group}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  @result_file.write @result_filename
  @result_sheet.each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[@rate_sheet_columns[:status]] == "Failed"
          @failed_test_count +=1
          config.logger.step "Group #{group} - Row #{row_number} Failed"
        end
      end
    end
  end
  config.logger.step "#{"*"*80}"
  config.logger.step "#{"*"*80}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "#{"*"*80}"
  config.logger.step "#{"*"*80}"
end





Then /^[Rr]un rate sheet (.*) in Zone (\d+)$/ do |param_sheet, zone|
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

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name=='weight_lb'
      @rate_sheet_columns[:weight_lb] = row_number
      @result_sheet_columns[:weight_lb] = row_number
      @result_sheet.row(0)[row_number] = 'weight_lb'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone1'
      @rate_sheet_columns[:zone1] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone1'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone2'
      @rate_sheet_columns[:zone2] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone2'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone3'
      @rate_sheet_columns[:zone3] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone3'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone4'
      @rate_sheet_columns[:zone4] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone4'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone5'
      @rate_sheet_columns[:zone5] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone5'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone6'
      @rate_sheet_columns[:zone6] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone6'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone7'
      @rate_sheet_columns[:zone7] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone7'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone8'
      @rate_sheet_columns[:zone8] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone8'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='zone9'
      @rate_sheet_columns[:zone9] = row_number
      @result_sheet_columns[:zone] = 1
      @result_sheet.row(0)[@result_sheet_columns[:zone]] = 'zone9'
      @result_sheet.row(0).set_format(row_number, @bold)
    end


    if column_name=='service'
      @rate_sheet_columns[:service] = row_number
      @result_sheet_columns[:service] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service]] = 'service'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking'
      @rate_sheet_columns[:tracking] = row_number
      @result_sheet_columns[:tracking] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:tracking]] = 'tracking'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      @result_sheet_columns[:execution_date] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:execution_date]] = 'execution_date'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='username'
      @rate_sheet_columns[:username] = row_number
      @result_sheet_columns[:username] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:username]] = 'username'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_from'
      @rate_sheet_columns[:ship_from] = row_number
      @result_sheet_columns[:ship_from] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:ship_from]] = 'ship_from'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='ship_to_domestic'
      @rate_sheet_columns[:ship_to_domestic] = row_number
      @result_sheet_columns[:ship_to_domestic] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:ship_to_domestic]] = 'ship_to_domestic'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='weight'
      @rate_sheet_columns[:weight] = row_number
      @result_sheet_columns[:weight] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:weight]] = 'weight'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      @result_sheet_columns[:service_selected] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:service_selected]] = 'service_selected'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='tracking_selected'
      @rate_sheet_columns[:tracking_selected] = row_number
      @result_sheet_columns[:tracking_selected] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:tracking_selected]] = 'tracking_selected'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      @result_sheet_columns[:total_ship_cost] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:total_ship_cost]] = 'total_ship_cost'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='results'
      @rate_sheet_columns[:results] = row_number
      @result_sheet_columns[:results] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:results]] = 'results'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='status'
      @rate_sheet_columns[:status] = row_number
      @result_sheet_columns[:status] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:status]] = 'status'
      @result_sheet.row(0).set_format(row_number, @bold)
    end
    if column_name=='error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      @result_sheet_columns[:error_msg] = row_number - @result_sheet_column_offset
      @result_sheet.row(0)[@result_sheet_columns[:error_msg]] = 'error_msg'
      @result_sheet.row(0).set_format(row_number, @bold)
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

  expect("Check your parameter sheet: #{@rate_file_loc}").to eql error_msg if missing_column

  # parameter zone is set in step "set Order Details form Ship-To to a random address in Zone xxx"
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
  format = Spreadsheet::Format.new :color=> :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color=> :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color=> :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row=row
    @result_sheet.row(0)[@result_sheet_columns[:zone]] = "zone#{zone}"
    begin
      if row_number > 0
        config.logger.step"#{"#"*80} Rate Sheet: #{param_sheet}: Zone #{zone} - Row #{row_number}"

        # Set address to proper zone
        step "set Order Details form Ship-To to a random address in Zone #{zone}"

        # spreadsheet price for zone

        if row[zone_column] == nil
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Test Row #{row_number} Skipped. No rates found on sheet."
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} "
          config.logger.step"#{"#"*80} "
          @result_sheet.row(row_number).set_format(@result_sheet_columns[:zone], format)
          @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = row[@rate_sheet_columns[:weight_lb]]
          @result_sheet[row_number, @result_sheet_columns[:zone]] = row[zone_column]
          @result_sheet[row_number, @result_sheet_columns[:username]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:ship_from]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:ship_to_domestic]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:weight]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:service]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:execution_date]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:service_selected]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:tracking_selected]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:total_ship_cost]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:status]] = "--"
          @result_sheet[row_number, @result_sheet_columns[:results]] = "--"
        else
          price = (row[zone_column].to_f * 100).round / 100.0
          # set expectation column for this row to zone price
          @result_sheet.row(row_number).set_format(@result_sheet_columns[:zone], format)
          @result_sheet[row_number, @result_sheet_columns[:zone]]= price
          @result_sheet[row_number, @result_sheet_columns[:username]] = test_param[:username]
          @result_sheet[row_number, @result_sheet_columns[:ship_from]] = test_param[:ship_from]
          @result_sheet[row_number, @result_sheet_columns[:ship_to_domestic]] = test_param[:ship_to_domestic]

          # Set weight to 0
          step "set Order Details form Pounds to 0"
          step "set Order Details form Ounces to 0"

          # Set weight per spreadsheet
          #row[@rate_sheet_columns[:weight_lb]].should_not be nil
          weight_lb = row[@rate_sheet_columns[:weight_lb]]
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Weight: #{weight_lb}"
          config.logger.step "#{"#"*10} Price: #{@result_sheet[row_number, @result_sheet_columns[:zone]]}"
          config.logger.step "#{"#"*10} "
          config.logger.step"#{"#"*50}"

          if helper.is_whole_number?(weight_lb)
            weight_lb = weight_lb.to_i
            @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = weight_lb
            @result_sheet[row_number, @result_sheet_columns[:weight]] = "#{weight_lb} lb."
            step "set Order Details form Pounds to #{weight_lb}"
          else
            weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i
            #config.logger.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
            @result_sheet[row_number, @result_sheet_columns[:weight]] = "#{weight_oz} oz."
            @result_sheet[row_number, @result_sheet_columns[:weight_lb]] = weight_oz
            step "set Order Details form Ounces to #{weight_oz}"
          end
          sleep(0.025)

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          @result_sheet[row_number, @result_sheet_columns[:service]] = service

          # record execution time as time service was selected.
          @result_sheet[row_number, @result_sheet_columns[:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set Order Details form service to #{service}"
          @result_sheet[row_number, @result_sheet_columns[:service_selected]] = test_param[:service]

          # Set Tracking
          begin
            step "set Order Details form Tracking to #{row[@rate_sheet_columns[:tracking]]}"
          end unless row[@rate_sheet_columns[:tracking]].nil?
          # Write tracking to spreadsheet
          @result_sheet[row_number, @result_sheet_columns[:tracking_selected]] = test_param[:tracking]

          # get total cost actual value from UI
          step "Save Order Details data"
          @result_sheet[row_number, @result_sheet_columns[:total_ship_cost]] = (test_param[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          if @modal_param.web_app == :mail
            step "set Order Details form Pounds to 0"
            step "set Order Details form Ounces to 0"
          elsif @modal_param.web_app == :orders
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          end
          expectation_f = (@result_sheet[row_number, @result_sheet_columns[:zone]].to_f * 100).round / 100.0
          total_ship_cost_f = (@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            @result_sheet[row_number, @result_sheet_columns[:status]] = "Passed"
            @result_sheet.row(row_number).set_format(@result_sheet_columns[:status], pass_format)
            @result_sheet[row_number, @result_sheet_columns[:results]] = "#{@result_sheet[row_number, @result_sheet_columns[:zone]]} == #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]}"
          else
            @result_sheet[row_number, @result_sheet_columns[:status]] = "Failed"
            @result_sheet.row(row_number).set_format(@result_sheet_columns[:status], fail_format)
            @result_sheet[row_number, @result_sheet_columns[:results]] = "Expected #{@result_sheet[row_number, @result_sheet_columns[:zone]]}, Got #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]}"
          end
          config.logger.step "#{"#"*10} "
          config.logger.step "#{"#"*10} Weight: #{@result_sheet[row_number, @result_sheet_columns[:weight]]}"
          config.logger.step "#{"#"*10} Selected Service: #{@result_sheet[row_number, @result_sheet_columns[:service_selected]]}"
          config.logger.step "#{"#"*10} Ship-To Address: #{test_param[:full_name]}, #{test_param[:street_address]}, #{test_param[:city]}, #{test_param[:state]}, #{test_param[:zip]}"
          config.logger.step "#{"#"*10} #{"*"*5} Test #{@result_sheet[row_number, @result_sheet_columns[:status]] } - Expected #{@result_sheet[row_number, @result_sheet_columns[:zone]]}, Got #{@result_sheet[row_number, @result_sheet_columns[:total_ship_cost]]} #{"*"*5}"
          config.logger.step "#{"#"*10} "
        end

      end
    rescue Exception=> e
      config.logger.step e.message
      config.logger.step e.backtrace.join("\n")
      row[@rate_sheet_columns[:error_msg]] = "Zone #{zone} - Row #{row_number}: #{e.message}"
    end
  end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_Zone_#{zone}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  @result_file.write @result_filename
  @result_sheet.each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[@rate_sheet_columns[:status]] == "Failed"
          @failed_test_count +=1
          config.logger.step "Zone #{zone} - Row #{row_number} Failed"
        end
      end
    end
  end
  config.logger.step "#{"*"*80}"
  config.logger.step "#{"*"*80}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "#{"*"*80}"
  config.logger.step "#{"*"*80}"
end

Then /^Rates: Number of failed test should be less than (\d+)$/ do |count|
  config.logger.step "#{"*"*80}"
  config.logger.step "Rates: Number of failed test should be less than #{count}"
  count = count.to_i
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  config.logger.step "Number of Failed Tests: #{@failed_test_count}"
  #@failed_test_count).to be < count
  config.logger.step "#{"*"*80}"
end


