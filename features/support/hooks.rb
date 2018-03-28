# encoding: utf-8
include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

# WebDriver
# include Spreadsheet
#include RAutomation
#
Before do  |scenario|
  SdcTest.start(scenario)
end

After do |scenario|
  SdcTest.teardown
  @stamps = nil #TODO-Rob this needs to exist in StampsTest
  @health = nil
  user_credentials.close
  SdcLog.error "#{scenario.feature} #{scenario.name}:\n#{scenario.exception.message}" if scenario.failed?
end

