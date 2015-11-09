include Stamps
include Stamps::Browser
include Batch
include Postage
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

Before do  |scenario|
  log_step "#{scenario.name} :: BEGIN"
end

After do |scenario|
  log_step "#{scenario.name} :: END"
  Stamps::Test.teardown
  $start = false
end
