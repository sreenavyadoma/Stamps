
Then /^Mail Customs: Set Package Contents to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Package Contents to #{value}"
  @customs_form.package_contents.select value
end

Then /^Mail Customs: Set Non-Delivery Options to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Non-Delivery Options to #{value}"
  @customs_form.non_delivery_options.select value
end

Then /^Mail Customs: Set Internal Transaction Number Requirement to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Internal Transaction Number to #{value}"
  @customs_form.internal_transaction.select (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
  sleep 1
end

Then /^Mail Customs: Set More Info to \"(.+)\"$/ do |value|
  logger.step "Customs: Set More Info to #{value}"
  @customs_form.more_info.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Mail Customs: Set ITN Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set ITN Number to #{value}"
  @customs_form.itn_number.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Mail Customs: Set License Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set License Number to #{value}"
  @customs_form.license.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Mail Customs: Set Certificate Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Certificate Number to #{value}"
  @customs_form.certificate.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Mail Customs: Set Invoice Number to \"(.+)\"$/ do |value|
  logger.step "Customs: Set Invoice Number to #{value}"
  @customs_form.invoice.set (value.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : value
end

Then /^Mail Customs: Add Item - Description (\w+), Qty (\d+), Value ([\d.]+), Lbs (\d+), Oz (\d+), Origin (.+), Tariff (\d+)$/ do |description, qty, value, lbs, oz, origin_country, tariff|
  logger.step "Customs: Add Item - Description #{description}, Qty #{qty}, Value #{value}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"

  @add_item_form = @customs_form.add_item
  @add_item_form.description.set (description.downcase.include? "random") ? ParameterHelper.random_alpha_numeric : description
  @add_item_form.qty.set qty
  @add_item_form.value.set value
  @add_item_form.lbs.set lbs
  @add_item_form.oz.set oz
  @add_item_form.origin.select origin_country
  @add_item_form.hs_tariff.set tariff
  @add_item_form.save
end

Then /^Mail Customs: Delete Item (\d+)$/ do |item_number|
  logger.step "Customs: Delete Item #{item_number}"
  count = @customs_item_grid.size
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Mail Customs: Delete All Items$/ do
  logger.step "Mail Customs: Delete All Items"
  @customs_form.delete_all
end

Then /^Mail Customs: Check I agree to the USPS Privacy Act Statement$/ do
  logger.step "Check I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @customs_form.i_agree.check
end

Then /^Mail Customs: Uncheck I agree to the USPS Privacy Act Statement$/ do
  logger.step "Uncheck I agree to the USPS Privacy Act Statement and Restrictions and Prohibition"
  @customs_form.i_agree.uncheck
end

Then /^Mail Customs: Save$/ do
  logger.step "Save Customs Form"
  @customs_form.save
end