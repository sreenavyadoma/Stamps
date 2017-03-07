Then /^on Add Funds modal, purchase 10$/ do
  #logger.step "on Add Funds modal, purchase 10"
  test_parameter[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_10.select
end

=begin
Then in Orders Toolbar, click Add button
Then set Order Details form Ship-From to default
Then set Order Details form Ship-To to address in Zone 5 through 8
Then on Order Details form, select service PM Package
Then set Order Details form Ounces to 1
Then set Order Details form Width to 1
Then set Order Details form Length to 1
Then set Order Details form Height to 1
Then in Orders Toolbar, click Print button
Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
Then set Print modal Printer to "factory"
Then in Print modal, click Print button
=end

Then /^on Add Funds modal, purchase 25$/ do
  test_parameter[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_25.select
end

Then /^on Add Funds modal, purchase 50$/ do
  test_parameter[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_50.select
end

Then /^on Add Funds modal, purchase 100$/ do
  test_parameter[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_100.select
end

Then /^on Add Funds modal, purchase Other Amount (\d+)$/ do |amount|
  test_parameter[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_other amount
end

Then /^on Add Funds modal, click Purchase button$/ do
  stamps.navigation_bar.balance.buy_more.purchase
end

Then /^Buy Mail Confirm Transction: Click Confirm button$/ do
  @purchase_approved = stamps.navigation_bar.balance.buy_more.purchase.confirm
end

Then /^Buy Mail Confirm Purchase: Expect text area contains, Please confirm your \$(.*) postage purchase.$/ do |amount|
  expectation = "Please confirm that you wish to add $#{amount} to your account balance. Once you click the Confirm button, the amount will be added to your account and cannot be refunded."
  actual_value = stamps.navigation_bar.balance.buy_more.purchase.text
  expect(actual_value).to eql expectation
end

Then /^Buy Mail Purchase Approved: Expect text area contains, Your fund request for \$(.*) has been approved.$/ do |amount|
  expect(@purchase_approved).to be_truthy
  expectation = "Your fund request for $#{amount} has been approved."
  actual_value = @purchase_approved.text
  expect(actual_value).to eql expectation
end

Then /^Buy Mail Purchase Approved: Click OK button$/ do
  expect(@purchase_approved).to be_truthy
  @purchase_approved.ok
end

Then /^Buy Mail: Expect customer balance increased by \$(\d+)$/ do |purchase_amount|
  10.times do
    sleep(0.35)
    new_balance = stamps.navigation_bar.balance.amount
    actual_purchased_amount = new_balance.to_f - test_parameter[:old_balance].to_f
    break if actual_purchased_amount ==  purchase_amount.to_f
  end
  new_balance = stamps.navigation_bar.balance.amount
  actual_purchased_amount = new_balance.to_f - test_parameter[:old_balance].to_f
  expect(actual_purchased_amount.round(2)).to eql purchase_amount.to_f.round(2)
end

