Then /^Buy Mail: Purchase 10$/ do
  logger.step "Buy Mail: Purchase 10"
  test_data[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_10.select
end

=begin
Then In Orders Toolbar, click Add button
Then On Order Details form, set Ship-From to default
Then On Order Details form, set Ship-To to address in Zone 5 through 8
Then On Order Details form, select service PM Package
Then On Order Details form, set Ounces to 1
Then On Order Details form, set Width to 1
Then On Order Details form, set Length to 1
Then On Order Details form, set Height to 1
Then In Orders Toolbar, click Print button
Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
Then In Print modal, set Printer to "factory"
Then In Print modal, click Print button
=end
Then /^Buy Mail: Purchase 25$/ do
  logger.step "Buy Mail: Purchase 25"
  test_data[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_25.select
end

Then /^Buy Mail: Purchase 50$/ do
  logger.step "Buy Mail: Purchase 50"
  test_data[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_50.select
end

Then /^Buy Mail: Purchase 100$/ do
  logger.step "Buy Mail: Purchase 10"
  test_data[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_100.select
end

Then /^Buy Mail: Purchase Other Amount (\d+)$/ do |amount|
  logger.step "Buy Mail: Purchase Other Amount #{amount}"
  test_data[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.navigation_bar.balance.buy_more.buy_other amount
end

Then /^Buy Mail: Click Purchase button$/ do
  logger.step "Buy Mail: Click Purchase button"
  stamps.navigation_bar.balance.buy_more.purchase
end

Then /^Buy Mail Confirm Transction: Click Confirm button$/ do
  logger.step "Buy Mail: Click Purchase button"
  @purchase_approved = stamps.navigation_bar.balance.buy_more.purchase.confirm
end

Then /^Buy Mail Confirm Purchase: Expect text area contains, Please confirm your \$(.*) postage purchase.$/ do |amount|
  logger.step "Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $#{amount} postage purchase."
  expectation = "Please confirm that you wish to add $#{amount} to your account balance. Once you click the Confirm button, the amount will be added to your account and cannot be refunded."
  actual_value = stamps.navigation_bar.balance.buy_more.purchase.text
  actual_value.should eql expectation
end

Then /^Buy Mail Purchase Approved: Expect text area contains, Your fund request for \$(.*) has been approved.$/ do |amount|
  logger.step "Buy Mail Purchase Approved: Expect text area contains, Your fund request for $#{amount} has been approved."
  @purchase_approved.should be_truthy
  expectation = "Your fund request for $#{amount} has been approved."
  actual_value = @purchase_approved.text
  actual_value.should eql expectation
end

Then /^Buy Mail Purchase Approved: Click OK button$/ do
  logger.step "Buy Mail Purchase Approved: Click OK button"
  @purchase_approved.should be_truthy
  @purchase_approved.ok
end

Then /^Buy Mail: Expect customer balance increased by \$(\d+)$/ do |purchase_amount|
  logger.step "Expect \$#{purchase_amount} is added to customer balance"
  10.times do
    sleep 1
    new_balance = stamps.navigation_bar.balance.amount
    actual_purchased_amount = new_balance.to_f - test_data[:old_balance].to_f
    break if actual_purchased_amount ==  purchase_amount.to_f
  end
  new_balance = stamps.navigation_bar.balance.amount
  actual_purchased_amount = new_balance.to_f - test_data[:old_balance].to_f
  actual_purchased_amount.should eql  purchase_amount.to_f
end

