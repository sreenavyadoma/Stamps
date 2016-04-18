# encoding: utf-8

Then /^Postage Stamps: Select Calculate Postage Amount/ do
  log.info "Step:  Select Stamps Calculate Postage Amount"
  @print_postage = postage.print_postage if @postage_form.nil?
  @print_postage.calculate_postage_amount
end

Then /^Postage Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  log.info "Step:  Set Stamps Weight #{lbs} lbs #{oz} oz"
  @print_postage = postage.print_postage if @postage_form.nil?
  weight = @print_postage.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Postage Stamps: Set Calculate Postage Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.calculate_postage_service.select service
end

Then /^Postage Stamps: Open Extra Services$/ do

end