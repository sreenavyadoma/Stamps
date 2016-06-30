Then /^Navigation Bar: Customer Balance$/ do
  logger.info "Navigation Bar: Customer Balance"
  logger.message " ############## CUSTOMER BALANCE "
  logger.message " ############## #{orders.navigation_bar.balance.amount}"
  logger.message " ############## #{orders.navigation_bar.balance.amount}"
  logger.message " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |expectation|
  logger.info "Navigation Bar: Wait while balance less than #{expectation}"
  expectation = expectation.to_f
  for i in 0..30
      new_balance = orders.navigation_bar.balance.amount.to_f
      logger.message "New Account Balance: $#{new_balance}"
      sleep 1
      break if new_balance > expectation
      browser.refresh
  end
end


#waiting examples
#waiting for updating div to clear:
#while browser.div(:id=>"updating_div").visible? do sleep 1 end
#This is how I handle waiting for something to display:
#until browser.div(:id=>"some_div").exists? do sleep 1 end


