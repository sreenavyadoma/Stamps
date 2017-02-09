
Then /^Mail on Customs form, set Package Contents to \"(.+)\"$/ do |value|
  @customs_form.package_contents.select(value)
end

Then /^Mail on Customs form, set Non-Delivery Options to \"(.+)\"$/ do |value|
  @customs_form.non_delivery_options.select(value)
end

Then /^Mail on Customs form, set Internal Transaction Number Requirement to \"(.+)\"$/ do |value|
  @customs_form.internal_transaction.select(value.downcase.include?('random')?ParameterHelper.random_alpha_numeric : value)
  sleep(0.35)
end

Then /^Mail on Customs form, set More Info to \"(.+)\"$/ do |value|
  @customs_form.more_info.set(value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value
end

Then /^Mail on Customs form, set ITN Number to \"(.+)\"$/ do |value|
  @customs_form.itn_number.set((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
end

Then /^Mail on Customs form, set License Number to \"(.+)\"$/ do |value|
  @customs_form.license.set((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
end

Then /^Mail on Customs form, set Certificate Number to \"(.+)\"$/ do |value|
  @customs_form.certificate.set((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
end

Then /^Mail on Customs form, set Invoice Number to \"(.+)\"$/ do |value|
  @customs_form.invoice.set((value.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : value)
end

Then /^Mail on Customs form, add Associated Item - Description (\w+), Qty (\d+), Value ([\d.]+), Lbs (\d+), Oz (\d+), Made In (.+), Tariff (\d+)$/ do |description, qty, value, lb, oz, origin_country, tariff|
  @add_item_form = @customs_form.add_item
  @add_item_form.description.set((description.downcase.include? 'random')?ParameterHelper.random_alpha_numeric : description)
  @add_item_form.qty.set(qty)
  @add_item_form.value.set(value)
  @add_item_form.lb.set(lb)
  @add_item_form.oz.set(oz)
  @add_item_form.origin.select(origin_country)
  @add_item_form.hs_tariff.set(tariff)
  @add_item_form.save
end

Then /^Mail on Customs form, Delete Item (\d+)$/ do |item_number|
  count = @customs_item_grid.size
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Then /^Mail on Customs form, Delete All Items$/ do
  @customs_form.delete_all
end

Then /^Mail on Customs form, check I agree to the USPS Privacy Act Statement$/ do
  @customs_form.i_agree.check
end

Then /^Mail on Customs form, uncheck I agree to the USPS Privacy Act Statement$/ do
  @customs_form.i_agree.uncheck
end

Then /^Mail on Customs form, Save$/ do
  #logger.step "Save Customs Form"
  @customs_form.save
end