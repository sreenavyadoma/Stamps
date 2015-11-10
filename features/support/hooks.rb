include Stamps
include Stamps::Browser
include Batch
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  log "Begin Test:  #{scenario.name}"
end

After do |scenario|
  log "End Test:  #{scenario.name}"
  Stamps::Test.teardown
  $start = false
end
