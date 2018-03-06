Then /^Navigation Bar: Customer Balance$/ do
  #StampsTest.log.step "Navigation Bar: Customer Balance"
  test_param[:customer_starting_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  StampsTest.log.info " ############## CUSTOMER BALANCE "
  StampsTest.log.info " ############## #{stamps.navigation_bar.balance.balance_amount.text}"
  StampsTest.log.info " ############## CUSTOMER BALANCE "
end

Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |expectation|
  #StampsTest.log.step "Navigation Bar: Wait while balance less than #{expectation}"
  expectation = expectation.to_f
  for i in 0..30
      new_balance = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
      StampsTest.log.info "New Account Balance: $#{new_balance}"
      sleep(0.35)
      break if new_balance > expectation
      StampsTest.driver.refresh
  end
end

Then /^Navigation Bar: Orders$/ do
  stamps.navigation_bar.orders
end

Then /^Navigation Bar: Mail$/ do
  stamps.navigation_bar.mail
end

#todo - Alex move Navigation Bar steps from Orders to Commmon
Then /^[Ee]xpect [Nn]avigation [Bb]ar Help Button is present$/ do
  expect(stamps.navigation_bar.help_link.present?).to be(true), "Help button is not present on Print form"
end

