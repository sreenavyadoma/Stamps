Then /^Health Check: Print - Web Batch$/ do
  expect(health.health_check).to include("All tests passed") if SdcEnv.health_check
end

Then /^Health Check: Print - Address Book$/ do
  expect(health.address_book).to include("All tests passed") if SdcEnv.health_check
end

Then /^Health Check: OR - Reports$/ do
  expect(health.or_reports).to include("All tests passed") if SdcEnv.health_check
end

Then /^Health Check: OR - Postage Tools$/ do
  expect(health.or_postage_tools).to include("All tests passed") if SdcEnv.health_check
end
