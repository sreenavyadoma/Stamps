Then /^Navigation Bar: Customer Balance$/ do
  log.info "Navigation Bar: Customer Balance"
  log.message " ############## CUSTOMER BALANCE "
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |expectation|
  log.info "Navigation Bar: Wait while balance less than #{expectation}"
  expectation = expectation.to_f
  for i in 0..30
      new_balance = orders.navigation_bar.balance.amount.to_f
      log.message "New Account Balance: $#{new_balance}"
      sleep 1
      break if new_balance > expectation
      @browser.refresh
  end
end


#waiting examples
#waiting for updating div to clear:
#while browser.div(:id=>"updating_div").visible? do sleep 1 end
#This is how I handle waiting for something to display:
#until browser.div(:id=>"some_div").exists? do sleep 1 end


