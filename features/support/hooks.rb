# encoding: utf-8

include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  SdcEnv.scenario = scenario
  SdcTest.start
end

After do
  SdcTest.teardown
  # Old framework
  @stamps = nil
  @health = nil
end

