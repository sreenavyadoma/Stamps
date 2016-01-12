Then /^Set Postage Service to \"(.*)\"$/ do |service|
  log.info "Step: Set Order Details Service to #{service}"
  orders.details.service.select service
end