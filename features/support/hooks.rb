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
  test_config.init(scenario.name, ENV["BROWSER"], ENV["FIREFOX_PROFILE"], nil)
  test_config.logger.message "-"
  test_config.logger.message "-"
  test_config.logger.message "Cucumber Test: #{ENV['USER_CREDENTIALS']}"
  test_config.logger.message "-"
  test_config.logger.message "-"
  test_config.logger.message "URL: #{ENV['URL']}"
  expect("").to eql "Environment variable URL is not defined!" if (ENV['URL'].nil? || ENV['URL'].size==0)
  test_config.logger.message "Test Name: #{ENV['USER_CREDENTIALS']}"
  test_config.logger.message "Browser: #{ENV['BROWSER']}"
  expect("").to eql "Environment variable BROWSER is not defined!" if (ENV['BROWSER'].nil? || ENV['BROWSER'].size==0)
  test_config.logger.message "-"
  test_config.logger.message "-"
  test_config.logger.message "Verbose: #{ENV['DEBUG']}"
  expect(ENV['DEBUG']).to be_truthy
  test_config.logger.message "Healthcheck: #{ENV['HEALTHCHECK']}"
  expect(ENV['HEALTHCHECK']).to be_truthy
  test_config.logger.message "-"
  test_config.logger.message "-"
  test_config.logger.message "-"

  if (!ENV['USR'].nil? && ENV['USR'].downcase != 'default') && (!ENV['PW'].nil?)
    test_param[:username] = ENV['USR']
    test_param[:password] = ENV['PW']
  else
    # reset old usernames
    result = db_connection.query("select * from user_credentials where in_use=1 and in_use_date != CURDATE()")
    if result.size > 0
      result.each do |row|
        db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=0 where username=?").execute(row['username'])
      end
    end

    # get username
    result = db_connection.query("select * from user_credentials where test_env='#{modal_param.test_env}' and user_status='Active'  and in_use=0")
    rand_num = rand(result.size)
    result.each_with_index do |row, index|
      if rand_num==index
        test_param[:username] = row['username']
        test_param[:password] = row['password']
      end
    end
    db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use=1, user_credentials.in_use_date=CURDATE() where username=?").execute(test_param[:username])
  end

  test_param[:web_app] = ENV['WEB_APP']
  test_param[:url] = ENV['URL']
  test_param[:test] = ENV['USER_CREDENTIALS']
  test_config.logger.message "-"
  test_config.logger.message "Running Tests..."
  test_config.logger.message "-"
  test_config.logger.message "-"
  test_config.logger.message "---------------- Feature: #{scenario.feature}"
  test_config.logger.message "---------------- Scenario: #{scenario.name}"
  test_config.logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| test_config.logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  test_config.logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| test_config.logger.message "---------------- Step #{index+1}: #{test_step.source.last.keyword}#{test_step.source.last.name}"}
  test_config.logger.message "-"
  test_config.logger.message "-"
end

After do |scenario|
  test_config.logger.message "Teardown Tests..."
  test_config.logger.message "-"
  test_config.logger.message "-"

  begin
    begin
      db_connection.prepare("UPDATE user_credentials SET user_credentials.in_use = 0 where username = ?").execute(test_param[:username])
      db_connection.close
    rescue
      #do nothing
    end
  end unless (!ENV['USR'].nil? && ENV['USR'].downcase != 'default') && (!ENV['PW'].nil?)

  test_config.logger.message "---------------- Feature: #{scenario.feature}"
  test_config.logger.message "---------------- Scenario: #{scenario.name}"
  test_config.logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| test_config.logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  test_config.logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| test_config.logger.message "---------------- Step #{index}: #{test_step.source.last.keyword}#{test_step.source.last.name}" if index>0}
  test_config.logger.message "-"
  test_config.logger.message "-"

  test_config.teardown

  if scenario.failed?
    test_config.logger.error "#{scenario.feature}"
    test_config.logger.error "#{scenario.feature} USER_CREDENTIALS FAILED! #{scenario.exception.message}"
    test_config.logger.error "#{scenario.feature}"
  end
  test_config.logger.step "  --  Test Parameters"
  test_param.each do |key, value|
    test_config.logger.step "  --  #{key} : #{value}"
  end
end




# result = db_connection.query("select * from user_credentials where test_env = 'stg' and in_use=1 and in_use_date = #{Time.now.to_date}")
#
# result.each_with_index do |row, index|
#   if row['in_use_date']==Time.now.to_date
#     p row['username']
#     break
#   end
# end


