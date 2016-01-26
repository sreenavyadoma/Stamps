
Then /^Purchase Postage for \$(\d+)$/ do |amount|
   @old_balance = orders.navigation_bar.balance.amount
   log.info "Buy More link selected"
   buy_postage_modal = orders.navigation_bar.balance.buy_more

   case amount
     when "10"
       buy_postage_modal.buy_10.check
     when "25"
       buy_postage_modal.buy_25.check
     when "50"
       buy_postage_modal.buy_50.check
     when "100"
       buy_postage_modal.buy_100.check
     else
       buy_postage_modal.buy_other amount
   end
   buy_postage_modal.purchase.purchase.ok
 end


Then /^Expect \$(\d+) is added to customer balance$/ do |purchase_amount|
  log.info "Step: Expect \$#{purchase_amount} is added to customer balance"
  20.times do
    sleep 1
    new_balance = orders.navigation_bar.balance.amount
    actual_purchased_amount = new_balance.to_f - @old_balance.to_f
    break if actual_purchased_amount ==  purchase_amount.to_f
  end
  new_balance = orders.navigation_bar.balance.amount
  actual_purchased_amount = new_balance.to_f - @old_balance.to_f

  log.info "Test #{(actual_purchased_amount ==  purchase_amount.to_f)?"Passed":"Failed"}"
  actual_purchased_amount.should eql  purchase_amount.to_f
end

