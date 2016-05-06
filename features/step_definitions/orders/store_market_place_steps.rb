
Then /^Marketplace: Select Big Commerce$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.big_commerce
end

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

Then /^Marketplace: Select 3dcart$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do
  step "Manage Stores: Add" if @market_place.nil?
  @store = @market_place.yahoo
end


