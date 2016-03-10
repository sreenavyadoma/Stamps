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

