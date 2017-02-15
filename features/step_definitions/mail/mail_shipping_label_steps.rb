
Then /^on Shipping Label Print form, Edit Customs Form$/ do
  #logger.step "on Shipping Label Print form, Edit Customs Form"
  @customs_form = stamps.mail.customs.edit_form
end

Then /^on Shipping Label Print form, Open Contacts modal/ do
  #logger.step "on Shipping Label Print form, Open Contacts Modal"
  @contacts = stamps.mail.print_form.ship_to.contacts.open
end

Then /^on Print form, select left side starting label/ do
  selected = stamps.mail.shipping_labels.form_view.starting_label.left
end

Then /^on Print form, select right side starting label/ do
  selected = stamps.mail.shipping_labels.form_view.starting_label.right
end

Then /^on Shipping Label Print form, set Hide Mail Value to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Hide Mail Value"
  
  stamps.mail.shipping_labels.form_view.hide_postage_value.check
end

Then /^on Shipping Label Print form, set Hide Mail Value to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Hide Mail Value"
  
  stamps.mail.shipping_labels.form_view.hide_postage_value.uncheck
end

Then /^on Shipping Label Print form, set Print Receipt to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Print Receipt"
  
  stamps.mail.shipping_labels.form_view.print_receipt.check
end

Then /^on Shipping Label Print form, set Print Receipt to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Print Receipt"
  
  stamps.mail.shipping_labels.form_view.print_receipt.uncheck
end

Then /^on Shipping Label Print form, set Print Reference Number to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Print Reference Number"
  
  stamps.mail.shipping_labels.form_view.print_reference_number.check
end

Then /^on Shipping Label Print form, set Print Reference Number to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Print Reference Number"
  
  stamps.mail.shipping_labels.form_view.print_reference_number.uncheck
end

Then /^on Shipping Label Print form, set Reference Number to (.*)$/ do |ref_no|
  #logger.step "Set Shipping Label Reference Number to #{ref_no}"
  
  stamps.mail.shipping_labels.form_view.reference_number.set ref_no
end

Then /^on Shipping Label Print form, set Cost Code to (.*)$/ do |code|
  #logger.step "on Shipping Label Print form, set Cost Code to \n #{code}"
  
  stamps.mail.shipping_labels.form_view.cost_code.select code
end