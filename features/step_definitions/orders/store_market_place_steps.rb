
Then /^Marketplace: Expect store selection modal contains (.*)$/ do |expectation|
  @market_place.should_not be_nil
  actual = @market_place.contains expectation
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Marketplace: Select PayPal$/ do
  @market_place.should_not be_nil
  @store = @market_place.paypal
end

Then /^Marketplace: Select Big Commerce$/ do
  @market_place.should_not be_nil
  @store = @market_place.big_commerce
end

Then /^Marketplace: Select Amazon$/ do
  @market_place.should_not be_nil
  @store = @market_place.amazon
end

Then /^Marketplace: Select Volusion$/ do
  @market_place.should_not be_nil
  @store = @market_place.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  @market_place.should_not be_nil
  @store = @market_place.rakuten
end

Then /^Marketplace: Select Etsy$/ do
  @market_place.should_not be_nil
  @store = @market_place.etsy
end

Then /^Marketplace: Select Ebay$/ do
  @market_place.should_not be_nil
  @store = @market_place.ebay
end

Then /^Marketplace: Select Shopify$/ do
  @market_place.should_not be_nil
  @store = @market_place.shopify
end

Then /^Marketplace: Select 3dcart$/ do
  @market_place.should_not be_nil
  @store = @market_place.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do
  @market_place.should_not be_nil
  @store = @market_place.yahoo
end

Then /^Marketplace: Close Modal$/ do
  @market_place.close
end

