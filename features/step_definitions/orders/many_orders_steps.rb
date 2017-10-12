When /^Print (\d+) new orders with Address set to (.*) and service set to (.*)$/ do |count, address, service|
  #test_config.logger.step "Print #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times {
    step "add new order"
    step "set Order Details form Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "set Order Details form Form Ship-To address to #{address}"
    #SETTING SERVICE
    step "set Order Details form Form service to #{service}"
    #PRINTING
    step "Print"
  }
end

Then /^Create (\d+) new orders with Address set to (.*) and service set to (.*)$/ do |count, address, service|
  #test_config.logger.step "Create #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times { |iteration|
    step "add new order"
    step "set Order Details form Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "set Order Details form Form Ship-To address to #{address}"
    #SETTING SERVICE
    #step "set Order Details form Form service to #{service}"
    #test_config.logger.step "set Order Details form Form service to #{service}"
    batch.single_order_details.service.select service
    #test_config.logger.step "Order #{iteration} created."
    sleep(0.35)
  }
end