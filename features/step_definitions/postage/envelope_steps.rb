Then /^Set Print Envelope Ship-To address to (.*)/ do |address|
  step "Order Details - Set Ship-To to #{address}"
end

Then /^Set Print Shipping Label Ship-To address to (.*)/ do |address|
  step "Order Details - Set Ship-To to #{address}"
end

Then /^Order Details - Set Ship-To to (.*)$/ do |address|
  log.info "Step:  Set Print Postage Form Ship-To address to #{address}"
  @postage_form = postage.envelope if @postage_form.nil?
  @postage_form.calculate_postage_amount
end

Then /^Set Print Postage Form Ship-To address to$/ do |table|

end


