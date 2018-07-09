# encoding: utf-8

include RSpec
include RSpec::Matchers
include DataMagic
include PartnerPortal

Before do |scenario|
  SdcEnv.scenario = scenario
  SdcTest.start
end

After do
  SdcTest.teardown
end
