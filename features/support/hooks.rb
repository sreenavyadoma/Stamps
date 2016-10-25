# encoding: utf-8
include Stamps
include Stamps::Browser
#include Stamps::Common
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation

Before do  |scenario|
  Stamps.init scenario.name
  # test data store
  @test_data = Hash.new
  scenario.feature.name
  logger.message "-"
  logger.message "Cucumber Test: #{ENV['TEST']}"
  logger.message "-"
  ENV['URL'].should be_truthy
  ENV['TEST'].should be_truthy
  ENV['BROWSER'].should be_truthy
  ENV['VERBOSE'].should be_truthy
  ENV['HEALTHCHECK'].should be_truthy

  logger.message "-"
  logger.message "REQUIRED TEST DATA"
  begin
    if (ENV['USR'].nil?) || (ENV['USR'].size==0) || (ENV['USR'].downcase == 'default')
      logger.message "Using Default Credentials from ../config/data/default.yml"
      ENV['USR'] = data_for(:credentials, {})[ENV['URL']][ENV['TEST']]['usr']
      ENV['PW'] = data_for(:credentials, {})[ENV['URL']][ENV['TEST']]['pw']
      ENV['USR'].should be_truthy
      ENV['PW'].should be_truthy
      logger.message "Default Username: #{ENV['USR']}"
    else
      logger.message "Environment Variable Username (USR) is defined: #{ENV['USR']}"
    end
  end unless (ENV['TEST'] == 'healthcheck' || ENV['TEST'].include?('webreg'))
  logger.message "URL: #{ENV['URL']}"
  logger.message "Test Name: #{ENV['TEST']}"
  logger.message "Browser: #{ENV['BROWSER']}"
  logger.message "Verbose: #{ENV['VERBOSE']}"
  logger.message "Healthcheck: #{ENV['HEALTHCHECK']}"
  logger.message "-"

  logger.message "Running Tests..."
  logger.message "-"
  logger.message "-"
  logger.message "---------------- Feature: #{scenario.feature}"
  logger.message "---------------- Scenario: #{scenario.name}"
  logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.message "---------------- Step #{index+1}: #{test_step.source.last.keyword}#{test_step.source.last.name}"}
  logger.message "-"
  logger.message "-"
end

After do |scenario|
  logger.message "Teardown Tests..."
  logger.message "-"
  logger.message "-"
  logger.message "---------------- Feature: #{scenario.feature}"
  logger.message "---------------- Scenario: #{scenario.name}"
  logger.message "---------------- Tags:"
  scenario.tags.each_with_index {|tag, index| logger.message "---------------- Tag #{index+1}: #{tag.name}" }
  logger.message "---------------- Steps:"
  scenario.test_steps.each_with_index { |test_step, index| logger.message "---------------- Step #{index}: #{test_step.source.last.keyword}#{test_step.source.last.name}" if index>0}
  logger.message "-"
  logger.message "-"

  Stamps.teardown

  if scenario.failed?
    logger.error "#{scenario.feature}"
    logger.error "#{scenario.feature} TEST FAILED! #{scenario.exception.message}"
    logger.error "#{scenario.feature}"
  end
  logger.step "  --  Test Parameters"
  test_data.each do |key, value|
    logger.step "  --  #{key} : #{value}"
  end
end

