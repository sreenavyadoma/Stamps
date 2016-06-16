# encoding: utf-8
include Stamps
include Stamps::Browser
include Orders
include Print
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation

Before do  |scenario|
  @scenario_name = scenario.name
  Test.scenario_name = @scenario_name
  log.scenario_name = @scenario_name
  log.info "Begin Test Scenario:  -----------------------------------------  #{@scenario_name}"
  log.info "Begin Test Scenario:  -----------------------------------------  #{@scenario_name}"
  log.info "Begin Test Scenario:  -----------------------------------------  #{@scenario_name}"
end

After do |scenario|
  begin
    Stamps::Test.teardown
    @browser.close
  rescue
    #ignore
  end
  $start = false
  @scenario_name = scenario.name
  log.scenario_name = @scenario_name
  log.info "End Test Scenario:  -------------------------------------------  #{@scenario_name}"
  log.info "End Test Scenario:  -------------------------------------------  #{@scenario_name}"
  log.info "End Test Scenario:  -------------------------------------------  #{@scenario_name}"

  # kill any ruby instance running before proceeding with test
  begin
    #system "taskkill /im ruby.exe /f"
  rescue
    #ignore
  end
end

