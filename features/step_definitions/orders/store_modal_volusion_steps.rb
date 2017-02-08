Then /^Volusion Store: Set Volusion API URL$/ do
  @store.api_url ENV['VOLUSION_API_URL']
end

Then /^Volusion Store: Set Volusion API to (.*)$/ do |url|
  @store.api_url url
end

Then /^Volusion Store: Connect$/ do
  @store_settings = @store.connect
end

Then /^Volusion Store: Reconnect$/ do
  @manage_stores = @store.reconnect
  expectation = "Reconnect was successful"
  expectation = "Reconnect was not successful, Manage Stores did not open or is nil" if @manage_stores.nil?
  expect(expectation).to eql "Reconnect was successful"
end

