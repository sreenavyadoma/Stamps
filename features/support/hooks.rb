# encoding: utf-8


include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail

Before do  |scenario|
  SdcTest.start(scenario)
end

After do |scenario|
  SdcTest.teardown
  @stamps = nil #TODO-Rob this needs to exist in StampsTest
  @health = nil
  user_credentials.close if SdcEnv.usr == 'default'
  SdcLog.error "#{scenario.feature} #{scenario.name}:\n#{scenario.exception.message}" if scenario.failed?
end

