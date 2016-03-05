Then /^Volusion Store: Set Volusion API URL$/ do
  @volusion_store.api_url ENV['VOLUSION_API_URL']
end

Then /^Volusion Store: Test Connection$/ do
  @volusion_store.test_connection
end

Then /^Volusion Store: Connect$/ do
  @volusion_store.connect
end