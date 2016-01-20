Then /^Set Postage Service to \"(.*)\"$/ do |service|
  log.info "Step: Order Details - Set Service to #{service}"
  orders.details.service.select service
end