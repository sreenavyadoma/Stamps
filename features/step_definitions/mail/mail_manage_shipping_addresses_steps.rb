Then /^Mail Shipping Addresses: Close Modal/ do
  #logger.step "Mail Shipping Addresses: Close Modal"
  stamps.mail.ship_from.manage_shipping_address.close
end