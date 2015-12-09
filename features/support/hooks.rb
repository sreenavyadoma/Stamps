# encoding: utf-8
include Stamps
include Stamps::Browser
include Orders
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  log.info "Begin Test Scenario:  -----------------------------------------  #{scenario.name}"
end

After do |scenario|
  Stamps::Test.teardown
  $start = false
  log.info "End Test Scenario:  -------------------------------------------  #{scenario.name}"
end
