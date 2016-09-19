Then /^View Print On option (.*) tooltip$/ do |label|
  logger.info "View Print On option #{label} tooltip"
  tooltip = web_apps.orders.toolbar.print_btn.print_modal.print_on_tooltip label
end

#Shipping Label 5.5 x 8.5
#Use these letter-sized label sheets with two 5 �� x 8 �� labels per sheet to mail mail, addresses, and tracking barcode.
#Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.
#Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783
Then /^Expect (.*) tool-tip to contain \"(.*)\"$/ do |label, tooltip_message|
  logger.info "Expect #{label} tool-tip to contain #{tooltip_message}"
  logger.info label
  logger.info tooltip_message
end



Then /^Select new option \"(.*)\"$/ do |label|
  logger.info "Select new option #{label}"
  web_apps.orders.toolbar.print_btn.print_modal
end

Then /^Expect saves settings to \"(.*)\"$/ do |label|

end

Then /^Expect a print of \"(.*)\"$/ do |label|
  logger.info "Expect a mail of #{label}"
  web_apps.orders.toolbar.print_btn.print_modal
end


Then /^Expect a print Sample of \"(.*)\"$/ do |label|
  logger.info "Expect a mail Sample of #{label}"
  web_apps.orders.toolbar.print_btn.print_modal.print_sample
end


Then /^Expect system will only print first order$/ do |label|
  logger.info "Expect system will only mail first order"
  web_apps.orders.toolbar.print_btn.print_modal
end

