Then /^Marketplace: Select Amazon$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @amazon_store = @market_place.amazon
end

Then /^Marketplace: Select Volusion$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @volusion_store = @market_place.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @rakuten_store = @market_place.rakuten
end

