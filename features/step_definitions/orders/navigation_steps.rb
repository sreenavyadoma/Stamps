Then /^[Oo]n Add Funds modal, purchase 10$/ do
  #SdcTest.log.step "on Add Funds modal, purchase 10"
  TestData.store[:old_balance]=stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  stamps.navigation_bar.balance.buy_more.buy_10.select
end

=begin
Then add new order
Then set Order Details Ship-From to default
Then set Order Details Ship-To to a random address in Zone 5 through 8
Then set Order Details service to PM Package
Then set Order Details Ounces to 1
Then set Order Details Width to 1
Then set Order Details Length to 1
Then set Order Details Height to 1
Then click Orders Toolbar Print button
Then set Print modal Print-On to Shipping Label - 8 ½" x 11" Paper
Then set Orders print modal printer
Then click print modal print button
=end

Then /^[Oo]n Add Funds modal, purchase 25$/ do
  TestData.store[:old_balance]=stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  stamps.navigation_bar.balance.buy_more.buy_25.select
end

Then /^[Oo]n Add Funds modal, purchase 50$/ do
  TestData.store[:old_balance]=stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  stamps.navigation_bar.balance.buy_more.buy_50.select
end

Then /^[Oo]n Add Funds modal, purchase 100$/ do
  TestData.store[:old_balance]=stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  stamps.navigation_bar.balance.buy_more.buy_100.select
end

Then /^[Oo]n Add Funds modal, purchase Other Amount (\d+)$/ do |amount|
  TestData.store[:old_balance]=stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  stamps.navigation_bar.balance.buy_more.buy_other amount
end

Then /^[Oo]n Add Funds modal, click Purchase [Bb]utton$/ do
  stamps.navigation_bar.balance.buy_more.purchase
end

Then /^Buy Mail Confirm Transction: Click Confirm [Bb]utton$/ do
  @purchase_approved=stamps.navigation_bar.balance.buy_more.purchase.confirm
end

Then /^Buy Mail Confirm Purchase: Expect text area contains, Please confirm your \$(.*) postage purchase.$/ do |amount|
  expect(stamps.navigation_bar.balance.buy_more.purchase.text).to eql "Please confirm that you wish to add $#{amount} to your account balance. Once you click the Confirm button, the amount will be added to your account and cannot be refunded."
end

Then /^Buy Mail Purchase Approved: Expect text area contains, Your fund request for \$(.*) has been approved.$/ do |amount|
  expect(@purchase_approved).to be_truthy
  expect(@purchase_approved.text).to eql "Your fund request for $#{amount} has been approved."
end

Then /^Buy Mail Purchase Approved: Click OK [Bb]utton$/ do
  expect(@purchase_approved).to be_truthy
  @purchase_approved.ok
end

Then /^Buy Mail: Expect customer balance increased by \$(\d+)$/ do |purchase_amount|
  10.times do
    sleep(0.35)
    break if stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f - TestData.store[:old_balance].to_f ==  purchase_amount.to_f
  end
  expect((stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f - TestData.store[:old_balance].to_f).round(2)).to eql purchase_amount.to_f.round(2)
end