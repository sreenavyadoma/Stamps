Then /^[Pp]repare environment for ratings test$/ do
  if @modal_param.web_app == :mail
    step "select Print On Shipping Label - 8 ½\" x 11\" Paper"
  elsif @modal_param.web_app == :orders
    step "add new order"
  end
end


Then /^[Ee]xcel rate sheet is loaded$/ do
  expect([:orders, :mail]).to include(modal_param.web_app)
  Spreadsheet.client_encoding = 'UTF-8'
  rate_file = data_for(:rates_test, {})['rate_file']

  @rate_file_loc = "#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
  test_config.logger.step "Rate File: #{@rate_file_loc}"
  expect("Rate File: #{@rate_file_loc}").to eql "Rate File does not exist!" unless File.exist?(@rate_file_loc)

  begin
    @rate_file = Spreadsheet.open(@rate_file_loc)
  rescue Exception => e
    test_config.logger.step e.message
    test_config.logger.step e.backtrace.join("\n")
    expect(e.message).to eql "Excel Rate File is opened by someone at a computer somewhere. Close the excel sheet before running the test again."
  end

  @failed_test_count = 0
  @rate_file.should_not be nil
end







