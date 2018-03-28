Then /^[Rr]un rate test PMI Comm Base in Country Price Group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmi_comm_base']
  step "run rate sheet #{param_sheet} in Country Price Group #{group}"
end

Then /^[Rr]un rate test PMI Comm Plus in Country Price Group (\d+)$/ do |group|
  param_sheet = data_for(:rates_test, {})['rates_pmi_comm_plus']
  step "run rate sheet #{param_sheet} in Country Price Group #{group}"
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

  TestData.store[:result_file] = Spreadsheet::Workbook.new
  TestData.store[:result_sheet] = TestData.store[:result_file].create_worksheet

  @rate_sheet = @rate_file.worksheet param_sheet
  @rate_sheet.should_not be nil

  # Set result sheet name to parameter sheet name
  TestData.store[:result_sheet].name = param_sheet

  @rate_sheet_columns = {}
  TestData.store[:result_sheet_columns] = {}
  TestData.store[:result_sheet_column_offset] = 8

  # map out parameter sheet column location
  @rate_sheet_header = @rate_sheet.row(0)
  #result sheet columns
  @bold = Spreadsheet::Format.new(:weight => :bold)

  @rate_sheet_header.each_with_index do |column_name, row_number|
    if column_name == 'weight_lb'
      @rate_sheet_columns[:weight_lb] = row_number
      (TestData.store[:result_sheet_columns])[:weight_lb] = row_number
      TestData.store[:result_sheet].row(0)[row_number] = 'weight_lb'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group1'
      @rate_sheet_columns[:group1] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group1'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group2'
      @rate_sheet_columns[:group2] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group2'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group3'
      @rate_sheet_columns[:group3] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group3'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group4'
      @rate_sheet_columns[:group4] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group4'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group5'
      @rate_sheet_columns[:group5] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group5'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group6'
      @rate_sheet_columns[:group6] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group6'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group7'
      @rate_sheet_columns[:group7] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group7'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group8'
      @rate_sheet_columns[:group8] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group8'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group9'
      @rate_sheet_columns[:group9] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group9'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group10'
      @rate_sheet_columns[:group10] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group10'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group11'
      @rate_sheet_columns[:group11] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group11'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group12'
      @rate_sheet_columns[:group12] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group12'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group13'
      @rate_sheet_columns[:group13] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group13'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group14'
      @rate_sheet_columns[:group14] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group14'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group15'
      @rate_sheet_columns[:group15] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group15'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group16'
      @rate_sheet_columns[:group16] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group16'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'group17'
      @rate_sheet_columns[:group17] = row_number
      TestData.store[:result_sheet_columns][:group] = 1
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = 'group17'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'service'
      @rate_sheet_columns[:service] = row_number
      TestData.store[:result_sheet_columns][:service] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:service]] = 'service'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'execution_date'
      @rate_sheet_columns[:execution_date] = row_number
      TestData.store[:result_sheet_columns][:execution_date] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:execution_date]] = 'execution_date'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'username'
      @rate_sheet_columns[:username] = row_number
      TestData.store[:result_sheet_columns][:username] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:username]] = 'username'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'ship_to_country'
      @rate_sheet_columns[:ship_to_country] = row_number
      TestData.store[:result_sheet_columns][:ship_to_country] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:ship_to_country]] = 'ship_to_country'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'weight'
      @rate_sheet_columns[:weight] = row_number
      TestData.store[:result_sheet_columns][:weight] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:weight]] = 'weight'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'service_selected'
      @rate_sheet_columns[:service_selected] = row_number
      TestData.store[:result_sheet_columns][:service_selected] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:service_selected]] = 'service_selected'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'total_ship_cost'
      @rate_sheet_columns[:total_ship_cost] = row_number
      TestData.store[:result_sheet_columns][:total_ship_cost] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:total_ship_cost]] = 'total_ship_cost'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'results'
      @rate_sheet_columns[:results] = row_number
      TestData.store[:result_sheet_columns][:results] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:results]] = 'results'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'status'
      @rate_sheet_columns[:status] = row_number
      TestData.store[:result_sheet_columns][:status] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:status]] = 'status'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
    end
    if column_name == 'error_msg'
      @rate_sheet_columns[:error_msg] = row_number
      TestData.store[:result_sheet_columns][:error_msg] = row_number - TestData.store[:result_sheet_column_offset]
      TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:error_msg]] = 'error_msg'
      TestData.store[:result_sheet].row(0).set_format(row_number, @bold)
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
  expect(group).to be_between(1, 17).inclusive
  group_column = case group
                   when 1
                     @rate_sheet_columns[:group1]
                   when 2
                     @rate_sheet_columns[:group2]
                   when 3
                     @rate_sheet_columns[:group3]
                   when 4
                     @rate_sheet_columns[:group4]
                   when 5
                     @rate_sheet_columns[:group5]
                   when 6
                     @rate_sheet_columns[:group6]
                   when 7
                     @rate_sheet_columns[:group7]
                   when 8
                     @rate_sheet_columns[:group8]
                   when 9
                     @rate_sheet_columns[:group9]
                   when 10
                     @rate_sheet_columns[:group10]
                   when 11
                     @rate_sheet_columns[:group11]
                   when 12
                     @rate_sheet_columns[:group12]
                   when 13
                     @rate_sheet_columns[:group13]
                   when 14
                     @rate_sheet_columns[:group14]
                   when 15
                     @rate_sheet_columns[:group15]
                   when 16
                     @rate_sheet_columns[:group16]
                   when 17
                     @rate_sheet_columns[:group17]
                   else
                     # ignore
                 end

  #TestData.store[:start_time]=Time.now
  #TestData.store[:max_time]=240 #seconds or 4 min

  format = Spreadsheet::Format.new :color => :blue, :pattern_fg_color => :yellow, :pattern => 1
  fail_format = Spreadsheet::Format.new :color => :red, :weight => :bold
  pass_format = Spreadsheet::Format.new :color => :green, :weight => :bold
  # Set weight and services
  @rate_sheet.each_with_index do |row, row_number|
    @row = row
    TestData.store[:result_sheet].row(0)[TestData.store[:result_sheet_columns][:group]] = "group#{group}"
    begin
      if row_number > 0
        SdcLog.step "#{"#" * 80} Rate Sheet: #{param_sheet}: Group #{group} - Row #{row_number}"

        #Set weight for country weight limit check
        TestData.store[:pounds] = (row[@rate_sheet_columns[:weight_lb]]).to_i

        # Set country to proper group

        if (row[@rate_sheet_columns[:service]]).include? "PMEI Flat Rate"
          if group < 9
            step "set Order Details Domestic Ship-To Country to a random country in PMEI Flat Rate price group #{group}" if @SdcEnv.sdc_app == :orders
            step "set Print Form Ship-To Country to a random country in PMEI Flat Rate price group #{group}" if @SdcEnv.sdc_app == :mail
          end
        elsif (row[@rate_sheet_columns[:service]]).include? "PMEI Package"
          step "set Order Details Domestic Ship-To Country to a random country in PMEI price group #{group}" if @SdcEnv.sdc_app == :orders
          step "set Print Form Ship-To Country to a random country in PMEI price group #{group}" if @SdcEnv.sdc_app == :mail
        end

        if (row[@rate_sheet_columns[:service]]).include? "PMI Flat Rate"
          if group < 9
            step "set Order Details Domestic Ship-To Country to a random country in PMI Flat Rate price group #{group}" if @SdcEnv.sdc_app == :orders
            step "set Print Form Ship-To Country to a random country in PMI Flat Rate price group #{group}" if @SdcEnv.sdc_app == :mail
          end
        elsif (row[@rate_sheet_columns[:service]]).include? "PMI Package"
          step "set Order Details Domestic Ship-To Country to a random country in PMI price group #{group}" if @SdcEnv.sdc_app == :orders
          step "set Print Form Ship-To Country to a random country in PMI price group #{group}" if @SdcEnv.sdc_app == :mail
        end


        # spreadsheet price for group

        if row[group_column] == nil
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 10} Test Row #{row_number} Skipped. No rates found on sheet."
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 80} "
          TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:group], format)
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight_lb]] = row[@rate_sheet_columns[:weight_lb]]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]] = row[group_column]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:username]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_to_country]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:execution_date]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]] = "--"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]] = "--"
        else
          price = (row[group_column].to_f * 100).round / 100.0
          # set expectation column for this row to group price
          TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:group], format)
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]] = price
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:username]] = TestData.store[:username]
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:ship_to_country]] = TestData.store[:country]

          # Set weight to 0
          SdcLog.step "#{"#" * 10} Desired Weight: #{row[@rate_sheet_columns[:weight_lb]]}"
          if @SdcEnv.sdc_app == :orders
            step "set Order Details Pounds to 0"
            step "set Order Details Ounces to 0"
          elsif @SdcEnv.sdc_app == :mail
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          end


          # Set weight per spreadsheet
          #row[@rate_sheet_columns[:weight_lb]].should_not be nil
          weight_lb = row[@rate_sheet_columns[:weight_lb]]
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 10} Weight: #{weight_lb}"
          SdcLog.step "#{"#" * 10} Price: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]]}"
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 50}"

          if TestHelper.is_whole_number?(weight_lb)
            weight_lb = weight_lb.to_i
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight_lb]] = weight_lb
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]] = "#{weight_lb} lb."
            step "set Order Details Pounds to #{weight_lb}" if @SdcEnv.sdc_app == :orders
            step "set Print form Pounds to #{weight_lb}" if @SdcEnv.sdc_app == :mail
          else
            weight_oz = Measured::Weight.new(weight_lb, "lb").convert_to("oz").value.to_i       #AB_ORDERSAUTO_3580 - IDE bug, Weight require 2 parameters
            #SdcLog.step "weight_lb: #{weight_lb} was converted to #{weight_oz} oz."
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]] = "#{weight_oz} oz."
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight_lb]] = weight_oz
            step "set Order Details Ounces to #{weight_oz}" if @SdcEnv.sdc_app == :orders
            step "set Print form Ounces to #{weight_oz}" if @SdcEnv.sdc_app == :mail
          end
          sleep(0.025)

          # Set Service
          row[@rate_sheet_columns[:service]].should_not be nil
          service = row[@rate_sheet_columns[:service]]
          SdcLog.step "#{"#" * 10} Desired Service: #{service}"
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service]] = service

          # record execution time as time service was selected.
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:execution_date]] = Time.now.strftime("%b %d, %Y %H:%M")

          step "set Order Details service to #{service}" if @SdcEnv.sdc_app == :orders
          step "select Print form service #{service}" if @SdcEnv.sdc_app == :mail
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]] = TestData.store[:service]
          sleep(0.525)

          # get total cost actual value from UI
          step "Save Order Details data" if @SdcEnv.sdc_app == :orders
          step "save Print Form Total Cost" if @SdcEnv.sdc_app == :mail
          TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]] = (TestData.store[:total_ship_cost].to_f * 100).round / 100.0

          # Set weight to 0
          if SdcEnv.sdc_app == :orders
            step "set Order Details Pounds to 0"
            step "set Order Details Ounces to 0"
          elsif SdcEnv.sdc_app == :mail
            step "set Print form Pounds to 0"
            step "set Print form Ounces to 0"
          end


          expectation_f = (TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]].to_f * 100).round / 100.0
          total_ship_cost_f = (TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]].to_f * 100).round / 100.0

          if expectation_f == total_ship_cost_f
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]] = "Passed"
            TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:status], pass_format)
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]] = "#{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]]}==#{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]}"
          else
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]] = "Failed"
            TestData.store[:result_sheet].row(row_number).set_format(TestData.store[:result_sheet_columns][:status], fail_format)
            TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:results]] = "Expected #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]]}, Got #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]}"
          end
          SdcLog.step "#{"#" * 10} "
          SdcLog.step "#{"#" * 10} Selected Weight: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:weight]]}"
          SdcLog.step "#{"#" * 10} Selected Service: #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:service_selected]]}"
          SdcLog.step "#{"#" * 10} Selected Country: #{TestData.store[:country]}"
          SdcLog.step "#{"#" * 10} #{"*" * 5} Test #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:status]] } - Expected #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:group]]}, Got #{TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:total_ship_cost]]} #{"*" * 5}"
          SdcLog.step "#{"#" * 10} "
        end

      end
    rescue Exception => e
      SdcLog.step e.message
      SdcLog.step e.backtrace.join("\n")
      TestData.store[:result_sheet][row_number, TestData.store[:result_sheet_columns][:error_msg]] = "Group #{group} - Row #{row_number}: #{e.message}"
    end
  end

 # if (Time.now - TestData.store[:start_time] > TestData.store[:max_time])
 #   step "click orders toolbar settings button"
 #   step "In Settings modal, Save"
 # end

  result_sheet = param_sheet.gsub(/\s+/, "")
  @result_filename = "#{data_for(:rates_test, {})['results_dir']}\\#{result_sheet}_#{ENV['WEB_APP'].downcase}_#{ENV['URL'].downcase}_Group_#{group}_#{Time.now.strftime("%Y.%m.%d.%H.%M")}.xls"
  TestData.store[:result_file].write @result_filename
  TestData.store[:result_sheet].each_with_index do |row, row_number|
    begin
      if row_number > 0
        if row[TestData.store[:result_sheet_columns][:status]].casecmp("failed") == 0 || (row[TestData.store[:result_sheet_columns][:status]].casecmp("passed") != 0 && !row[TestData.store[:result_sheet_columns][:error_msg]].nil?)
          @failed_test_count += 1
          SdcLog.step "Group #{group} - Row #{row_number} Failed"
        end
      end
    end
  end
  SdcLog.step "#{"*" * 80}"
  SdcLog.step "#{"*" * 80}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "Number of Failed Tests: #{@failed_test_count}"
  SdcLog.step "#{"*" * 80}"
  SdcLog.step "#{"*" * 80}"
end
