

Then /^set (?:Label|Roll|CM) form Name to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.name.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_name] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.name.set(test_parameter[:mail_to_name])
end

Then /^set (?:Label|Roll|CM) form Company to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.company.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_company] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.company.set(test_parameter[:mail_to_company])
end

Then /^set (?:Label|Roll|CM) form Address 1 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_1.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_street_address_1] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.address_1.set(test_parameter[:mail_to_street_address_1])
end

Then /^set (?:Label|Roll|CM) form Address 2 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_2.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_street_address_2] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.address_2.set(test_parameter[:mail_to_street_address_2])
end

Then /^set (?:Label|Roll|CM) form City to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.city.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_city] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.city.set(test_parameter[:mail_to_city])
end

Then /^set (?:Label|Roll|CM) form Province to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.province.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_province] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.province.set(test_parameter[:mail_to_province])
end

Then /^set (?:Label|Roll|CM) form Postal Code to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.postal_code.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_postal_code] = (value.downcase == 'random')? ParameterHelper.random_name : value
  stamps.mail.print_form.mail_to.address.postal_code.set(test_parameter[:mail_to_postal_code])
end

Then /^set (?:Label|Roll|CM) form Phone to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.phone.send_keys(:enter) if value.nil?
  test_parameter[:mail_to_phone] = (value.downcase == 'random')? ParameterHelper.random_phone : value
  stamps.mail.print_form.mail_to.address.phone.set(test_parameter[:mail_to_phone])
end

