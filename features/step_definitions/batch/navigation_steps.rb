
# batch.navigation_bar.sign_out
#* Buy $10 postage
#* Expect $10 is added to customer balance

 Then /^Buy \$(\d+) postage$/ do |amount|
   @old_balance = batch.navigation_bar.balance
   batch.navigation_bar.buy_more.buy amount
 end


Then /^Expect \$(\d+) is added to customer balance$/ do |balance|
  pending
end
