# encoding: utf-8

include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  SdcTest.start(scenario)
end

After do |scenario|
  SdcTest.teardown
  user_credentials.close if SdcEnv.usr == 'default'
  @stamps = nil #TODO-Rob this needs to exist in StampsTest
  @health = nil
end

