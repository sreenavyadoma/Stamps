# encoding: utf-8
include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include RAutomation
include Spreadsheet

Before do  |scenario|
  SdcTest.init(scenario)
  SdcTest.log.info "Begin..."
  SdcTest.log.info "-"
  SdcTest.print_test_steps
end

After do |scenario|
  SdcTest.log.info "Teardown..."
  SdcTest.print_test_steps
  SdcTest.teardown
  @stamps = nil #TODO-Rob this needs to exist in StampsTest
  @health = nil
  SdcTest.log.error "#{scenario.feature} #{scenario.name}:\n#{scenario.exception.message}" if scenario.failed?
end

