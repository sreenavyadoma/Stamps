Then /^View Print On option (.*) tooltip$/ do |label|
  log.info "View Print On option #{label} tooltip"
  @print_window = orders.toolbar.print_order.click
  tooltip = @print_window.print_on_tooltip label
end

#Shipping Label 5.5 x 8.5
#Use these letter-sized label sheets with two 5 �� x 8 �� labels per sheet to print print, addresses, and tracking barcode.
#Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination.
#Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783
Then /^Expect (.*) tool-tip to contain \"(.*)\"$/ do |label, tooltip_message|
  log.info "Expect #{label} tool-tip to contain #{tooltip_message}"
  log.info label
  log.info tooltip_message
end



Then /^Select new option \"(.*)\"$/ do |label|
  log.info "Select new option #{label}"
  @print_window = orders.toolbar.print_order.click
end

Then /^Expect saves settings to \"(.*)\"$/ do |label|

end

Then /^Expect a print of \"(.*)\"$/ do |label|
  log.info "Expect a print of #{label}"
  @print_window = orders.toolbar.print_order.click
end


Then /^Expect a print Sample of \"(.*)\"$/ do |label|
  log.info "Expect a print Sample of #{label}"
  @print_window = orders.toolbar.print_order.click
  orders.toolbar.print_order.click.print_sample
end


Then /^Expect system will only print first order$/ do |label|
  log.info "Expect system will only print first order"
  @print_window = orders.toolbar.print_order.click
end

