When /^Print (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  logger.step "Print #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times {
    step "Toolbar: Add"
    step "Details: Set Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Details: Set Form Ship-To address to #{address}"
    #SETTING SERVICE
    step "Details: Set Form Service to #{service}"
    #PRINTING
    step "Print"
  }
end

Then /^Create (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  logger.step "Create #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times { |iteration|
    step "Toolbar: Add"
    step "Details: Set Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Details: Set Form Ship-To address to #{address}"
    #SETTING SERVICE
    #step "Details: Set Form Service to #{service}"
    logger.step "Details: Set Form Service to #{service}"
    batch.order_details.service.select service
    logger.step "Order #{iteration} created."
    sleep(1)
  }
end