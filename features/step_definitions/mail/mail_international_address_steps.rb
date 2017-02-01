
Then /^Mail: Set Ship-To country to (.*)/ do |country|
  #logger.step "Mail: Set Ship-To country to #{country}"
  stamps.mail.ship_to.country.select country
end

Then /^Mail International: Set Ship-To Name to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Name to #{value}"
  field = stamps.mail.ship_to.name
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Company to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Company to #{value}"
  field = stamps.mail.ship_to.company
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Address 1 to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Address 1 to #{value}"
  field = stamps.mail.ship_to.address_1
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Address 2 to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Address 2 to #{value}"
  field = stamps.mail.ship_to.address_2

  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To City to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To City to #{value}"
  field = stamps.mail.ship_to.city
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Province to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Province to #{value}"
  field = stamps.mail.ship_to.province
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Postal Code to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Postal Code to #{value}"
  field = stamps.mail.ship_to.postal_code
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

Then /^Mail International: Set Ship-To Phone to \"(.*)\"$/ do |value|
  #logger.step "Set Ship-To Phone to #{value}"
  field = stamps.mail.ship_to.phone
  if value.length == 0
    field.send_keys(:enter)
  else
    field.set((value.downcase == "random")? ParameterHelper.random_name : value)
  end
end

