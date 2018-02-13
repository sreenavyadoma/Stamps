
Then /^[Ee]xpect [Mm]arketplace [Mm]odal is [Pp]resent$/ do
  expect(stamps.orders.modals.orders_settings_modal).to be_present, "Marketplace modal is NOT present"
end

Then /^Marketplace: Expect store selection modal contains (.*)$/ do |expectation|
  stamps.orders.modals.orders_settings_modal.stores_tab
  expect(stamps.orders.marketplace.add_your_store_modal.contains(expectation)).to eql(expectation)
end

Then /^[Ss]earch [Mm]arketplace for [Ss]tore [Nn]ame (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  stamps.orders.marketplace.add_your_store_modal.search_by_name.set(test_param[:store_name]=str)
end

Then /^[Cc]onnect [Mm]arketplace [Ss]tore (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  expect(stamps.orders.marketplace.add_your_store_modal.dataview.add_store(str)).to eql("Connect Your #{str} Store")
end

Then /^[Cc]click on [Mm]arketplace [Ss]tore (.*)$/ do |str|

end

Then /^[Aa]dd [Mm]arketplace [Ss]hip[Ss]tation [Ss]tore (.*)$/ do |str|
  step "validate store name #{str}"
  step "expect Marketplace modal is present"
  expect(stamps.orders.marketplace.add_your_store_modal.dataview.add_advanced_feature(str)).to eql("Add Advanced Shipping Features!")
end

Then /^validate store name (.*)$/ do |str|
  expect(data_for(:supported_stores, {}).keys.to_a).to include(str.downcase)
end


Then /^[Ee]xpect [Mm]arketplace [Dd]ataview [Cc]ount is (greater|less|equal) (?:than|to) (\d+)$/ do |operator, count|
  step "expect Marketplace modal is present"
  case(operator)
    when /greater/
      expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to be > count.to_i
    when /less/
      expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to be < count.to_i
    when /equal/
      expect(stamps.orders.marketplace.add_your_store_modal.dataview.store_count).to eql count.to_i
    else
      #ignore
  end
end
#
# Then /^[Ss]elect PayPal on Marketplace modal$/ do
#   step "expect PayPal is on Marketplace modal"
#   stamps.orders.marketplace.add_your_store_modal.paypal.click
# end
=begin

Then /^[Ee]xpect PayPal is on Marketplace modal$/ do
  expect(stamps.orders.marketplace.add_your_store_modal.paypal_store).to be_present, "PayPal is not on Marketplace modal"
end

Then /^Marketplace: Select Big Commerce$/ do
  @store=stamps.orders.marketplace.add_your_store_modal.big_commerce
end

Then /^Marketplace: Select Amazon$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.amazon
end

Then /^Marketplace: Select Volusion$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.volusion
end

Then /^Marketplace: Select Rakuten$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.rakuten
end

Then /^Marketplace: Select Etsy$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.etsy
end

Then /^Marketplace: Select Ebay$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.ebay
end

Then /^Marketplace: Select Shopify$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.shopify
end

Then /^Marketplace: Select 3dcart$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.three_d_cart
end

Then /^Marketplace: Select Yahoo$/ do
  stamps.orders.marketplace.add_your_store_modal.should_not be_nil
  @store=stamps.orders.marketplace.add_your_store_modal.yahoo
end

Then /^Marketplace: Close Modal$/ do
  stamps.orders.marketplace.add_your_store_modal.close
end
=end

#todo-codereview ORDERSAUTO-3282
Then /^[Ee]xpect [Mm]arketplace [Mm]odal [Rr]equires [Ff]ree [Uu]pgrade [Mm]essage [Pp]resent in (.*)$/ do |str|
  expect(stamps.orders.marketplace.add_your_store_modal.dataview.requires_upgrade_msg(str)).to be_present, " Requires Free Upgrade Message is NOT present"
end

Then /^[Ee]xpect [Mm]arketplace [Mm]odal [Aa]vailable in [Ss]hipStation [Mm]essage [Pp]resent in (.*)$/ do |str|
  expect(stamps.orders.marketplace.add_your_store_modal.dataview.available_shipstation_msg(str)).to be_present, " Available in ShipStation Message is NOT present"
end