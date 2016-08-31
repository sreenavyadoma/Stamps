Then /^Buy Mail: Purchase 10$/ do
  logger.info "Buy Mail: Purchase $10"
  @old_balance = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_10.select
end

Then /^Buy Mail: Purchase 25$/ do
  logger.info "Buy Mail: Purchase $25"
  @old_balance = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_25.select
end

Then /^Buy Mail: Purchase 50$/ do
  logger.info "Buy Mail: Purchase $50"
  @old_balance = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_50.select
end

Then /^Buy Mail: Purchase 100$/ do
  logger.info "Buy Mail: Purchase $10"
  @old_balance = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_100.select
end

Then /^Buy Mail: Purchase Other Amount (\d+)$/ do |amount|
  logger.info "Buy Mail: Purchase Other Amount #{amount}"
  @old_balance = web_apps.navigation_bar.balance.amount
  web_apps.navigation_bar.balance.buy_more.buy_other amount
end

Then /^Buy Mail: Click Purchase button$/ do
  logger.info "Buy Mail: Click Purchase button"
  web_apps.navigation_bar.balance.buy_more.purchase
end

Then /^Buy Mail Confirm Purchase: Click Purchase button$/ do
  logger.info "Buy Mail: Click Purchase button"
  @purchase_approved = web_apps.navigation_bar.balance.buy_more.purchase.purchase
end

Then /^Buy Mail Confirm Purchase: Expect text area contains, Please confirm your \$(.*) postage purchase.$/ do |amount|
  expectation = "Please confirm your $#{amount} postage purchase."
  logger.info "Buy Mail Confirm Purchase: Expect text area contains, #{expectation}"
  text_area = web_apps.navigation_bar.balance.buy_more.purchase.text
  logger.info "Test #{(text_area.include?expectation)?"Passed":"Failed"}"
  text_area.should include expectation
end

Then /^Buy Mail Purchase Approved: Expect text area contains, Your postage purchase request for \$(.*) has been approved.$/ do |amount|
  expectation = "Your postage purchase request for $#{amount} has been approved."
  logger.info "Buy Mail Purchase Approved: Expect text area contains, #{expectation}"
  raise "Purchase Approved modal is nil! Check your test workflow." if @purchase_approved.nil?
  raise "Purchase Approved modal is not present." unless @purchase_approved.present?

  text_area = @purchase_approved.text
  logger.info "Test #{(text_area == expectation)?"Passed":"Failed"}"
  text_area.should eql expectation
end

Then /^Buy Mail Purchase Approved: Click OK button$/ do
  logger.info "Buy Mail Purchase Approved: Click OK button"
  raise "Purchase Approved modal is nil! Check your test workflow." if @purchase_approved.nil?
  raise "Purchase Approved modal is not present." unless @purchase_approved.present?

  @purchase_approved.ok
end

Then /^Buy Mail: Expect customer balance increased by \$(\d+)$/ do |purchase_amount|
  logger.info "Expect \$#{purchase_amount} is added to customer balance"
  20.times do
    sleep 1
    new_balance = web_apps.navigation_bar.balance.amount
    actual_purchased_amount = new_balance.to_f - @old_balance.to_f
    break if actual_purchased_amount ==  purchase_amount.to_f
  end
  new_balance = web_apps.navigation_bar.balance.amount
  actual_purchased_amount = new_balance.to_f - @old_balance.to_f

  logger.info "Test #{(actual_purchased_amount ==  purchase_amount.to_f)?"Passed":"Failed"}"
  actual_purchased_amount.should eql  purchase_amount.to_f
end

