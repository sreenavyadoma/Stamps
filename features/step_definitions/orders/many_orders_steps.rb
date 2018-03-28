When /^Print (\d+) new orders with Address set to (.*) and service set to (.*)$/ do |count, address, service|
  #StampsTest.log.step "Print #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times {
    step "add new order"
    step "set Order Details Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "set Order Details Ship-To address to #{address}"
    #SETTING SERVICE
    step "set Order Details service to #{service}"
    #PRINTING
    step "Print"
  }
end

Then /^Create (\d+) new orders with Address set to (.*) and service set to (.*)$/ do |count, address, service|
  #StampsTest.log.step "Create #{count} new orders with Address set to #{address} and service set to #{service}"
  count.to_i.times { |iteration|
    step "add new order"
    step "set Order Details Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "set Order Details Ship-To address to #{address}"
    #SETTING SERVICE
    #step "set Order Details service to #{service}"
    #SdcLog.step "set Order Details service to #{service}"
    batch.order_details.service.select service
    #SdcLog.step "Order #{iteration} created."
    sleep(0.35)
  }
end