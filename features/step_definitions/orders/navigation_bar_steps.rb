Then /^Navigation Bar: Customer Balance$/ do
  log.info "Navigation Bar: Customer Balance"
  log.message " ############## CUSTOMER BALANCE "
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |balance|
  log.info "Navigation Bar: Wait while balance less than #{balance}"
  balance = balance.to_f
  for i in 0..30
      amount = orders.navigation_bar.balance.amount.to_f
      if balance < amount
        sleep 1
        log.message "Account Balance: $#{amount}"
      else
        break if balance > amount
      end
  end
end


#waiting examples
#waiting for updating div to clear:
#while browser.div(:id=>"updating_div").visible? do sleep 1 end
#This is how I handle waiting for something to display:
#until browser.div(:id=>"some_div").exists? do sleep 1 end


