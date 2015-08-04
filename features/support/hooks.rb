include Batch
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

log test_helper.random_address_all_zone
log test_helper.random_address_all_zone
log test_helper.random_address_all_zone
log test_helper.random_address_all_zone
log test_helper.random_address_all_zone
log test_helper.random_address_all_zone
log test_helper.random_address_all_zone

Before do  |scenario|
  log_step "#{scenario.name} :: BEGIN"
  setup
end

After do |scenario|
  log_step "#{scenario.name} :: END"
  teardown
  $start = false
end
