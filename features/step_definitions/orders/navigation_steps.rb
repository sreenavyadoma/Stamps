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


Then /^Expect \$(\d+) is added to customer balance$/ do |balance|
  log.info "Step: Expect \$#{balance} is added to customer balance"
  log.info "Store new balance"
  sleep 4
  @new_balance = orders.navigation_bar.balance.amount
  log.info "Compare old and new balance"
  match = @new_balance.to_f - @old_balance.to_f
  balance_float = balance.to_f
  log.info "Verify correct postage amount added to balance"
  match.should eql  balance_float
  log.info "Postage purchase verified"
end

