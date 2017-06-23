Then /^Navigation Bar: Customer Balance$/ do
  #test_config.logger.step "Navigation Bar: Customer Balance"
  test_param[:customer_starting_balance] = stamps.navigation_bar.balance.amount
  test_config.logger.message " ############## CUSTOMER BALANCE "
  test_config.logger.message " ############## #{test_param[:customer_starting_balance]}"
  test_config.logger.message " ############## #{test_param[:customer_starting_balance]}"
  test_config.logger.message " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |expectation|
  #test_config.logger.step "Navigation Bar: Wait while balance less than #{expectation}"
  expectation = expectation.to_f
  for i in 0..30
      new_balance = stamps.navigation_bar.balance.amount.to_f
      test_config.logger.message "New Account Balance: $#{new_balance}"
      sleep(0.35)
      break if new_balance > expectation
      test_config.browser.refresh
  end
end

Then /^Navigation Bar: Orders$/ do
  stamps.navigation_bar.orders
end

Then /^Navigation Bar: Mail$/ do
  stamps.navigation_bar.mail
end

