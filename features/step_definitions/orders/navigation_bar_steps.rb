Then /^Navigation Bar: Customer Balance$/ do
  #logger.step "Navigation Bar: Customer Balance"
  logger.message " ############## CUSTOMER BALANCE "
  logger.message " ############## #{stamps.navigation_bar.balance.amount}"
  logger.message " ############## #{stamps.navigation_bar.balance.amount}"
  logger.message " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |expectation|
  #logger.step "Navigation Bar: Wait while balance less than #{expectation}"
  expectation = expectation.to_f
  for i in 0..30
      new_balance = stamps.navigation_bar.balance.amount.to_f
      logger.message "New Account Balance: $#{new_balance}"
      sleep(1)
      break if new_balance > expectation
      browser.refresh
  end
end

Then /^Navigation Bar: Orders$/ do
  stamps.navigation_bar.orders
end

Then /^Navigation Bar: Mail$/ do
  stamps.navigation_bar.mail
end

