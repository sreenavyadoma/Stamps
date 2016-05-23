Then /^Postage Shipping Addresses: Close Modal/ do
  log.info "Postage Shipping Addresses: Close Modal"
  @print_postage.ship_from.manage_shipping_address.close
end