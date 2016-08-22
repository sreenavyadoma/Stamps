
Then /^Purchasing: Purchase Postage for \$(\d+)$/ do |amount|
   @old_balance = web_apps.navigation_bar.balance.amount
   logger.info "Buy More link selected"
   purchasing_modal = web_apps.navigation_bar.balance.buy_more

   case amount
     when "10"
       purchasing_modal.buy_10.check
     when "25"
       purchasing_modal.buy_25.check
     when "50"
       purchasing_modal.buy_50.check
     when "100"
       purchasing_modal.buy_100.check
     else
       purchasing_modal.buy_other amount
   end
   purchasing_modal.purchase.purchase.ok
 end


Then /^Purchasing: Expect customer balance increased by \$(\d+)$/ do |purchase_amount|
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

