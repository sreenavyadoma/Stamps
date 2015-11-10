include Stamps
include Stamps::Browser
include Batch
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  log "Before:  #{scenario.name}"
end

After do |scenario|
  log "After:  #{scenario.name}"
  Stamps::Test.teardown
  $start = false
end
