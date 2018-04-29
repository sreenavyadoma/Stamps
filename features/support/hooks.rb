# encoding: utf-8

include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  SdcTest.start(scenario)
end

After do
  SdcTest.teardown
  # Old framework
  @stamps = nil
  @health = nil
end

