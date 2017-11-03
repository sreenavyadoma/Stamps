
Then /^[Ee]xpect [Mm]arketplace [Mm]odal is [Pp]resent$/ do
  expect(stamps.orders.marketplace).to be_present, "Marketplace modal is NOT present"
end

Then /^Marketplace: Expect store selection modal contains (.*)$/ do |expectation|
  @market_place.should_not be_nil
  actual = @market_place.contains expectation
  expect(actual).to eql expectation
end

Then /^[Ss]earch [Mm]arketplace for [Ss]tore [Nn]ame (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  stamps.orders.marketplace.search_by_name.set(test_param[:username]=str)
end

Then /^[Cc]lick [Mm]arketplace [Ss]tore [Nn]ame (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  stamps.orders.marketplace.dataview.click_store(str)
end

Then /^validate store name (.*)$/ do |str|
  expect(data_for(:supported_stores, {}).values.to_a).to include(str.downcase.capitalize)
end

#browser.div(css: "[style*='ebaybanner.png']") browser.div(css: "[style*='ebaybanner.png']")
Then /^[Ee]xpect [Mm]arketplace [Dd]ataview [Cc]ount is (greater|less|equal) (?:than|to) (\d+)$/ do |operator, count|
  step "expect Marketplace modal is present"
  case(operator)
    when /greater/
      expect(stamps.orders.marketplace.dataview.count).to be > count.to_i
    when /less/
      expect(stamps.orders.marketplace.dataview.count).to be < count.to_i
    when /equal/
      expect(stamps.orders.marketplace.dataview.count).to eql count.to_i
    else
      #ignore
  end
end

#
# Then /^[Ss]elect Paypal on Marketplace modal$/ do
#   step "expect Paypal is on Marketplace modal"
#   stamps.orders.marketplace.paypal.click
# end

Then /^[Ee]xpect Paypal is on Marketplace modal$/ do
  expect(stamps.orders.paypal).to be_present, "Paypal is not on Marketplace modal"
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

