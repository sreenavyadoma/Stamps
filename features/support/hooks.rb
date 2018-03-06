# encoding: utf-8
include Stamps
include Stamps::Browser
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation
include Spreadsheet
include DatabaseHelper

Before do  |scenario|
  StampsTest.initialize(scenario)
  StampsTest.log.info "Begin..."
  StampsTest.log.info "-"
  StampsTest.log.info "-"
  StampsTest.print_test_steps

  # todo-Rob refactor MySql
  if modal_param.web_app == :mail || modal_param.web_app == :orders
    if test_param[:username].nil? || test_param[:username].downcase == 'default' || test_param[:username].downcase == 'mysql'
      credentials = user_credentials.fetch(scenario.tags[0].name)
      test_param[:username] = credentials[:username]
      test_param[:password] = credentials[:password]
    end
    expect(test_param[:username]).to be_truthy
    expect(test_param[:password]).to be_truthy
  end
end

After do |scenario|
  StampsTest.log.info "Teardown..."
  StampsTest.print_test_steps

  #user_credentials.close if (modal_param.web_app == :mail || modal_param.web_app == :orders) && !((!ENV['USR'].nil? && ENV['USR'].downcase != 'default') && (!ENV['PW'].nil?))

  StampsTest.teardown
  @stamps = nil
  @health = nil
  if scenario.failed?
    StampsTest.log.error "#{scenario.feature}"
    StampsTest.log.error "#{scenario.feature} #{scenario.name}:\n#{scenario.exception.message}"
    StampsTest.log.error "#{scenario.feature}"
  end
  StampsTest.log.step "  --  Test Parameters"
  test_param.each do |key, value|
    StampsTest.log.step "  --  #{key} : #{value}"
  end
end

# result=db_connection.query("select * from user_credentials where test_env='stg' and in_use=1 and in_use_date=#{Time.now.to_date}")
#
# result.each_with_index do |row, index|
#   if row['in_use_date']==Time.now.to_date
#     p row['username']
#     break
#   end
# end
