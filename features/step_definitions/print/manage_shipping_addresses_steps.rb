Then /^Postage Shipping Addresses: Close Modal/ do
  logger.info "Postage Shipping Addresses: Close Modal"
  web_apps.mail.ship_from.manage_shipping_address.close
end