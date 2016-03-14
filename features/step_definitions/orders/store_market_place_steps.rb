Then /^Marketplace: Select Amazon$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.amazon
end

Then /^Marketplace: Select Volusion$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.rakuten
end

Then /^Marketplace: Select Etsy$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.etsy
end

Then /^Marketplace: Select Ebay$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.ebay
end

Then /^Marketplace: Select Shopify$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.shopify
end

