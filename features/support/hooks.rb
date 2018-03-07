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

Before do  |scenario|
  StampsTest.initialize(scenario)
  StampsTest.log.info "Begin..."
  StampsTest.log.info "-"
  StampsTest.print_test_steps
end

After do |scenario|
  StampsTest.log.info "Teardown..."
  StampsTest.print_test_steps
  StampsTest.teardown
  @stamps = nil #TODO-Rob this needs to exist in StampsTest
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
