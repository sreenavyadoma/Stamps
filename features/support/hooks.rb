# encoding: utf-8

include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include RSpec
include RSpec::Matchers
include DataMagic
include PartnerPortal

Before do |scenario|
  SdcEnv.scenario = scenario
  SdcTest.start
end

After do
  system 'C:\Stamps\binaries\edge_rdp_lock.bat' if SdcEnv.browser = 'edge'
  SdcTest.teardown
  # Old framework
  @stamps = nil
  @health = nil
end
