Then /^Health Check: Print - Web Batch$/ do
  health.health_check unless modal_param.developer
end

Then /^Health Check: Print - Address Book$/ do
  health.address_book unless modal_param.developer
end

Then /^Health Check: OR - Reports$/ do
  health.or_reports unless modal_param.developer
end

Then /^Health Check: OR - Postage Tools$/ do
  health.or_postage_tools unless modal_param.developer
end
