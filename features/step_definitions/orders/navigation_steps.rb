Then /^Buy Mail: Purchase 10$/ do
  logger.step "Buy Mail: Purchase 10"
  test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_10.select
end

Then /^Buy Mail: Purchase 25$/ do
  logger.step "Buy Mail: Purchase 25"
  test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_25.select
end

Then /^Buy Mail: Purchase 50$/ do
  logger.step "Buy Mail: Purchase 50"
  test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_50.select
end

Then /^Buy Mail: Purchase 100$/ do
  logger.step "Buy Mail: Purchase 10"
  test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_100.select
end

Then /^Buy Mail: Purchase Other Amount (\d+)$/ do |amount|
  logger.step "Buy Mail: Purchase Other Amount #{amount}"
  test_data[:old_balance] = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_other amount
end

Then /^Buy Mail: Click Purchase button$/ do
  logger.step "Buy Mail: Click Purchase button"
  web_apps.navigation_bar.balance.buy_more.purchase
end

Then /^Buy Mail Confirm Purchase: Click Purchase button$/ do
  logger.step "Buy Mail: Click Purchase button"
  @purchase_approved = web_apps.navigation_bar.balance.buy_more.purchase.purchase
end

Then /^Buy Mail Confirm Purchase: Expect text area contains, Please confirm your \$(.*) postage purchase.$/ do |amount|
  logger.step "Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $#{amount} postage purchase."
  web_apps.navigation_bar.balance.buy_more.purchase.text.should include "Please confirm your $#{amount} postage purchase."
end

Then /^Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for \$(.*) has been approved.$/ do |amount|
  logger.step "Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for $#{amount} has been approved."
  @purchase_approved.should be_truthy
  @purchase_approved.text.should eql "Your postage purchase request for $#{amount} has been approved."
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
    new_balance = web_apps.navigation_bar.balance.amount
    actual_purchased_amount = new_balance.to_f - test_data[:old_balance].to_f
    break if actual_purchased_amount ==  purchase_amount.to_f
  end
  new_balance = web_apps.navigation_bar.balance.amount
  actual_purchased_amount = new_balance.to_f - test_data[:old_balance].to_f
  actual_purchased_amount.should eql  purchase_amount.to_f
end

