
# batch.navigation_bar.sign_out
#* Buy postage
#* Expect value is added to customer balance

 Then /^Buy \$(\d+) postage$/ do |amount|

   log "Storing old postage amount"
   @old_balance = batch.navigation_bar.balance
   log "Buy More link selected"
   buy_postage_window = batch.navigation_bar.select_buy_more

   log "$#{amount} postage radio button selected"

   case amount
     when "10"
       buy_postage_window.buy_more.buy_10
     when "25"
       buy_postage_window.buy_more.buy_25
     when "50"
       buy_postage_window.buy_more.buy_50
     when "100"
       buy_postage_window.buy_more.buy_100
     else
       buy_postage_window.buy_more.buy_other = amount
   end

   log "Purchase button clicked"
   batch.navigation_bar.buy_more.purchase
   log "Purchase confirmed"
   #todo create a ConfirmPurchase object.


   #2.  Ask confirmpurchase if it exist, (aka confirmPurchase.present?)
   # if it does, click confirm, if not...
   # check if Meter balance Limit
   # check for MeterBalanceLimit
   #if it exist, don't do expectation.
   #if not, go ahead with expectation
   batch.navigation_bar.buy_more.confirm_postage.verify_confirm_modal
   log "Waiting for purchase processing to complete"
   batch.navigation_bar.buy_more.confirm_postage.purchase_processing.wait_for_purchase_confirmation
   log "Purchase Complete, clicking OK"
   batch.navigation_bar.buy_more.confirm_postage.purchase_processing.purchase_complete.complete_purchase
 end


Then /^Expect \$(\d+) is added to customer balance$/ do |balance|
  log "Store new balance"
  @new_balance = batch.navigation_bar.balance
  log "Compare old and new balance"
  match = @new_balance - @old_balance
  match_float = match.to_f
  balance_float = balance.to_f
  log "Verify correct postage amount added to balance"
  match_float.should eql  balance_float
  log "Postage purchase verified"
end

