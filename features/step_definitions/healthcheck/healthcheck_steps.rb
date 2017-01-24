Then /^Health Check: Print - Web Batch$/ do
  #logger.step "Health Check: Print - Web Batch"
  health.health_check
end

Then /^Health Check: Print - Address Book$/ do
  #logger.step "Health Check: Print - Address Book"
  health.address_book
end

Then /^Health Check: OR - Reports$/ do
  #logger.step "Health Check: OR - Reports"
  health.or_reports
end

Then /^Health Check: OR - Postage Tools$/ do
  #logger.step "Health Check: OR - Postage Tools"
  health.or_postage_tools
end