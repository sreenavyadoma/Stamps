Then /^Navigation Bar: Customer Balance$/ do
  log.info "Navigation Bar: Customer Balance"
  log.message " ############## CUSTOMER BALANCE "
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## #{orders.navigation_bar.balance.amount}"
  log.message " ############## CUSTOMER BALANCE "
end


Then /^Navigation Bar: Wait while balance less than (\d+)$/ do |balance|
  orders.navigation_bar.balance.amount
end