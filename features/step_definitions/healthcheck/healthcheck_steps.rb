Then /^Health Check: Verify Server Health$/ do
  log.info "Health Check: Verify Server Health"
  health.visit
end