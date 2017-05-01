Then /^Health Check: Print - Web Batch$/ do
  health.health_check unless param.developer
end

Then /^Health Check: Print - Address Book$/ do
  health.address_book unless param.developer
end

Then /^Health Check: OR - Reports$/ do
  health.or_reports unless param.developer
end

Then /^Health Check: OR - Postage Tools$/ do
  health.or_postage_tools unless param.developer
end
