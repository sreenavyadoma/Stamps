# encoding: utf-8

Then /^Stamps: Select Calculate Postage Amount/ do
  log.info "Step:  Select Stamps Calculate Postage Amount"
  @postage_form = postage.stamps if @postage_form.nil?
  @postage_form.calculate_postage_amount
end

Then /^Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  log.info "Step:  Set Stamps Weight #{lbs} lbs #{oz} oz"
  @postage_form = postage.stamps if @postage_form.nil?
  weight = @postage_form.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Stamps: Open Extra Services$/ do

end