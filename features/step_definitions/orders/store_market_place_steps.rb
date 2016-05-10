
Then /^Marketplace: Select PayPal$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.paypal
end

Then /^Marketplace: Select Big Commerce$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.big_commerce
end

Then /^Marketplace: Select Amazon$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.amazon
end

Then /^Marketplace: Select Volusion$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.rakuten
end

Then /^Marketplace: Select Etsy$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.etsy
end

Then /^Marketplace: Select Ebay$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.ebay
end

Then /^Marketplace: Select Shopify$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.shopify
end

Then /^Marketplace: Select 3dcart$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do
  raise "Manage Stores: Market place modal is not present.  Check your workflow." if @market_place.nil?
  @store = @market_place.yahoo
end

Then /^Marketplace: Close Modal$/ do
  @market_place.close
  raise "Wrong number of arguments for BrowserHelper.text method." if @market_place.nil?
end

