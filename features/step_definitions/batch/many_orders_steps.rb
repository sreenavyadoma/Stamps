When /^Print (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  log "Test: Print #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times {
    step "I Add a new order"
    step "Set Order Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Set Order Form Ship-To address to #{address}"
    #SETTING SERVICE
    step "Set Order Form Service to #{service}"
    #PRINTING
    step "Print"
  }
end

Then /^Create (\d+) new orders with Address set to (.*) and Service set to (.*)$/ do |count, address, service|
  log "Test: Create #{count} new orders with Address set to #{address} and Service set to #{service}"
  count.to_i.times { |iteration|
    step "I Add a new order"
    step "Set Order Form Ship-From to default"
    #SETTING RECIPIENT ADDRESS
    step "Set Order Form Ship-To address to #{address}"
    #SETTING SERVICE
    step "Set Order Form Service to #{service}"
    log "Order #{iteration} created."
    sleep(1)
  }
end