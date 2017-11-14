
Then /^[Ee]xpect [Mm]arketplace [Mm]odal is [Pp]resent$/ do
  expect(stamps.orders.marketplace).to be_present, "Marketplace modal is NOT present"
end

Then /^Marketplace: Expect store selection modal contains (.*)$/ do |expectation|
  actual=stamps.orders.marketplace.contains(expectation)
  expect(actual).to eql expectation
end

Then /^[Ss]earch [Mm]arketplace for [Ss]tore [Nn]ame (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  stamps.orders.marketplace.search_by_name.set(test_param[:username]=str)
end

Then /^[Aa]dd [Mm]arketplace [Ss]tore (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  expect(stamps.orders.marketplace.dataview.add_store(str)).to eql("Connect Your #{data_for(:supported_stores, {})[str.downcase]} Store")
end

Then /^[Aa]dd [Mm]arketplace shipstation [Ss]tore (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  expect(stamps.orders.marketplace.dataview.add_advanced_feature(str)).to eql("Add Advanced Shipping Features!")
end

Then /^validate store name (.*)$/ do |str|
  expect(data_for(:supported_stores, {}).keys.to_a).to include(str.downcase)
end


Then /^[Ee]xpect [Mm]arketplace [Dd]ataview [Cc]ount is (greater|less|equal) (?:than|to) (\d+)$/ do |operator, count|
  step "expect Marketplace modal is present"
  case(operator)
    when /greater/
      expect(stamps.orders.marketplace.dataview.store_count).to be > count.to_i
    when /less/
      expect(stamps.orders.marketplace.dataview.store_count).to be < count.to_i
    when /equal/
      expect(stamps.orders.marketplace.dataview.store_count).to eql count.to_i
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
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.big_commerce
end

Then /^Marketplace: Select Amazon$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.amazon
end

Then /^Marketplace: Select Volusion$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.rakuten
end

Then /^Marketplace: Select Etsy$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.etsy
end

Then /^Marketplace: Select Ebay$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.ebay
end

Then /^Marketplace: Select Shopify$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.shopify
end

Then /^Marketplace: Select 3dcart$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do
  stamps.orders.marketplace.should_not be_nil
  @store=stamps.orders.marketplace.yahoo
end

Then /^Marketplace: Close Modal$/ do
  stamps.orders.marketplace.close
end

