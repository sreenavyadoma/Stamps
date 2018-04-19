# encoding: utf-8

include Stamps
include Stamps::WebApps
include Stamps::Orders
include Stamps::Mail
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic
include Stamps::WebDev::StampsEndicia

Before do  |scenario|
  SdcTest.start(scenario)
end

After do |scenario|
  SdcTest.teardown
  # Old framework
  @stamps = nil
  @health = nil
end

