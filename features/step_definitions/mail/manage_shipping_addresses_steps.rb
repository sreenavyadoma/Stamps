Then /^Mail Shipping Addresses: Close Modal/ do
  logger.step "Mail Shipping Addresses: Close Modal"
  web_apps.mail.ship_from.manage_shipping_address.close
end