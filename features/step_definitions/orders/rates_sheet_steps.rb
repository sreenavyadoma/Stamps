Then /^[Pp]repare environment for ratings test$/ do
  step "select Print On Shipping Label - Paper" if @modal_param.web_app==:mail
  step "add new order" if @modal_param.web_app==:orders
end

Then /^[Ee]xcel rate sheet is loaded$/ do
  expect([:orders, :mail]).to include(modal_param.web_app)
  Spreadsheet.client_encoding='UTF-8'
  rate_file=data_for(:rates_test, {})['rate_file']

  @rate_file_loc="#{data_for(:rates_test, {})['test_dir']}\\#{rate_file}"
  test_config.logger.step "Rate File: #{@rate_file_loc}"
  expect("Rate File: #{@rate_file_loc}").to eql "Rate File does not exist!" unless File.exist?(@rate_file_loc)

  begin
    @rate_file=Spreadsheet.open(@rate_file_loc)
  rescue Exception => e
    test_config.logger.step e.message
    test_config.logger.step e.backtrace.join("\n")
    expect(e.message).to eql "Excel Rate File is opened by someone at a computer somewhere. Close the excel sheet before running the test again."
  end

  @failed_test_count=0
  @rate_file.should_not be nil
end

Then /^Login and configure rate tests$/ do
  step "excel rate sheet is loaded"
  step "a valid user is signed in to Web Apps"
  #step "Open Settings Modal"
  #step "in Orders Settings, click on General Settings tab"
  #step "In Settings modal, set Logoff to 2 hours"
  step "prepare environment for ratings test"
end





