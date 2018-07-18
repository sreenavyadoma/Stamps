# encoding: utf-8

include RSpec
include RSpec::Matchers
include DataMagic
include SdcCore
include SdcWebsite
include SdcOrders
include SdcMail
include SdcNavigation
include PartnerPortal
include WhiteLabel

Before do |scenario|
  SdcEnv.scenario = scenario
  SdcTest.start
end

After do
  SdcTest.teardown
end
