

Then /^set Label Mail To Name to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.name.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.name.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Company to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.company.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.company.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Address 1 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.address_1.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.address_1.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Address 2 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.address_2.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.address_2.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To City to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.city.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.city.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Province to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.province.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.province.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Postal Code to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.postal_code.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.postal_code.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

Then /^set Label Mail To Phone to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.ship_to.phone.send_keys(:enter) if value.nil?
  stamps.mail.print_form.ship_to.phone.set((value.downcase == 'random')? ParameterHelper.random_name : value)
end

