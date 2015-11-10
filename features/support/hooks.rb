include Stamps
include Stamps::Browser
include Batch
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  log "Begin Test Scenario:  -----------------------------------  #{scenario.name}"
end

After do |scenario|
  Stamps::Test.teardown
  $start = false
  log "End Test Scenario:  -----------------------------------  #{scenario.name}"
end
