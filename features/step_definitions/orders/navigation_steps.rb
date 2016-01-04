
#* Buy postage
#* Expect value is added to customer balance

 Then /^Buy \$(\d+) postage$/ do |amount|
   log.info "Step: Buy \$#{amount} postage"
   log.info "Storing old postage amount"
   @old_balance = orders.navbar.balance
   log.info "Buy More link selected"
   buy_postage_window = orders.navbar.select_buy_more

   log.info "$#{amount} postage radio button selected"

   case amount
     when "10"
       orders.navbar.buy_more.buy_10.purchase
     when "25"
       orders.navbar.buy_more.buy_25.purchase
     when "50"
       orders.navbar.buy_more.buy_50.purchase
     when "100"
       orders.navbar.buy_more.buy_100.purchase
     else
       orders.navbar.buy_more.buy_other(amount).purchase
   end

   #2.  Ask confirmpurchase if it exist, (aka confirmPurchase.present?)
   # if it does, click confirm, if not...
   # check if Meter balance Limit
   # check for MeterBalanceLimit
   #if it exist, don't do expectation.
   #if not, go ahead with expectation
   orders.navbar.buy_more.confirm_postage.click_confirm_modal
   orders.navbar.buy_more.confirm_postage.purchase_processing.wait_for_purchase_confirmation.purchase_complete.complete_purchase
 end


Then /^Expect \$(\d+) is added to customer balance$/ do |balance|
  log.info "Step: Expect \$#{balance} is added to customer balance"
  log.info "Store new balance"
  sleep 4
  @new_balance = orders.navbar.balance
  log.info "Compare old and new balance"
  match = @new_balance.to_f - @old_balance.to_f
  balance_float = balance.to_f
  log.info "Verify correct postage amount added to balance"
  match.should eql  balance_float
  log.info "Postage purchase verified"
end

