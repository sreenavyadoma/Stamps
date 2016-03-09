Then /^Volusion Store: Set Volusion API URL$/ do
  @store.api_url ENV['VOLUSION_API_URL']
end

Then /^Volusion Store: Set Volusion API to (.*)$/ do |url|
  @store.api_url url
end

Then /^Volusion Store: Test Connection$/ do
  @store.test_connection
end

Then /^Volusion Store: Connect$/ do
  @store_settings = @store.connect
end