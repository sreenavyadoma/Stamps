When /^Print (\d+) new orders with Address set to (.*) and service set to (.*)$/ do |count, address, service|
  #logger.step "Print #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times {
    step "In Orders Toolbar, click Add button"
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
  #logger.step "Create #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times { |iteration|
    step "In Orders Toolbar, click Add button"
    step "set Order Details form Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "set Order Details form Form Ship-To address to #{address}"
    #SETTING SERVICE
    #step "set Order Details form Form service to #{service}"
    #logger.step "set Order Details form Form service to #{service}"
    batch.order_details.service.select service
    #logger.step "Order #{iteration} created."
    sleep(0.35)
  }
end