Then /^Health Check: Verify Server Health$/ do
  logger.info "Health Check: Verify Server Health"
  health.visit
end