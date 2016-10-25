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
  logger.message "-"
  logger.message "Cucumber Test: #{ENV['TEST']}"
  logger.message "-"
  logger.message "-"
  logger.message "URL: #{ENV['URL']}"
  "".should eql "Environment variable URL is not defined!" if (ENV['URL'].nil? || ENV['URL'].size==0)
  logger.message "Test Name: #{ENV['TEST']}"
  "".should eql "Environment variable TEST is not defined!" if (ENV['TEST'].nil? || ENV['TEST'].size==0)
  logger.message "Browser: #{ENV['BROWSER']}"
  "".should eql "Environment variable BROWSER is not defined!" if (ENV['BROWSER'].nil? || ENV['BROWSER'].size==0)
  logger.message "-"
  logger.message "-"
  logger.message "Verbose: #{ENV['VERBOSE']}"
  ENV['VERBOSE'].should be_truthy
  logger.message "Healthcheck: #{ENV['HEALTHCHECK']}"
  ENV['HEALTHCHECK'].should be_truthy
  logger.message "-"
  logger.message "-"

  logger.message "-"
  logger.message "REQUIRED TEST DATA"
  begin
    if (ENV['USR'].nil?) || (ENV['USR'].size==0) || (ENV['USR'].downcase == 'default')
      logger.message "Using Default Credentials from ../config/data/default.yml"
      begin
        ENV['USR'] = data_for(:credentials, {})[ENV['URL']][ENV['TEST']]['usr']
      rescue
        "".should eql "There are no user credentials defined in default.yml file for URL:#{ENV['URL']} TEST:#{ENV['TEST']} usr:#{ENV['usr']}"
      end
      begin
        ENV['PW'] = data_for(:credentials, {})[ENV['URL']][ENV['TEST']]['pw']
      rescue
        "".should eql "There are no user credentials defined in default.yml file for URL:#{ENV['URL']} TEST:#{ENV['TEST']} usr:#{ENV['pw']}"
      end
      logger.message "Default Username: #{ENV['USR']}"
    else
      logger.message "Environment Variable Username (USR) is defined: #{ENV['USR']}"
    end
  end unless (ENV['TEST'] == 'healthcheck' || ENV['TEST'].include?('webreg'))
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

