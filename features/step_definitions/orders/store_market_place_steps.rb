Then /^Marketplace: Select amazon.com$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @amazon_store = @market_place.amazon
end