include Stamps
include Stamps::Browser
include Batch
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

log.info "rob"
log.debug "Cruz"

Before do  |scenario|
  log.info "Begin Test Scenario:  -----------------------------------------  #{scenario.name}"
end

After do |scenario|
  Stamps::Test.teardown
  $start = false
  log.info "End Test Scenario:  -------------------------------------------  #{scenario.name}"
end
