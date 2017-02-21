Then /^View Print On option (.*) tooltip$/ do |label|
  #logger.step "View Print On option #{label} tooltip"
  tooltip = stamps.orders.orders_toolbar.print_btn.print_modal.print_on_tooltip label
end

#Shipping Label 5.5 x 8.5
#Use these letter-sized label sheets with two 5 �� x 8 �� labels per sheet to mail mail, addresses, and tracking barcode.
#Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.
#Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783
Then /^Expect (.*) tool-tip to contain \"(.*)\"$/ do |label, tooltip_message|
  #logger.step "Expect #{label} tool-tip to contain #{tooltip_message}"
  logger.step label
  logger.step tooltip_message
end



Then /^Select new option \"(.*)\"$/ do |label|
  #logger.step "Select new option #{label}"
  stamps.orders.orders_toolbar.print_btn.print_modal
end

Then /^Expect saves settings to \"(.*)\"$/ do |label|

end

Then /^Expect a print of \"(.*)\"$/ do |label|
  #logger.step "Expect a mail of #{label}"
  stamps.orders.orders_toolbar.print_btn.print_modal
end


Then /^Expect a print Sample of \"(.*)\"$/ do |label|
  #logger.step "Expect a mail Sample of #{label}"
  stamps.orders.orders_toolbar.print_btn.print_modal.print_sample
end


Then /^Expect system will only print first order$/ do |label|
  #logger.step "Expect system will only mail first order"
  stamps.orders.orders_toolbar.print_btn.print_modal
end

