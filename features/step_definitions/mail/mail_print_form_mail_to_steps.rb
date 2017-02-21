
Then /^(?:S|s)et (?:Label|Roll|CM) form (?:M|m)ail (?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:mail_to_country] = country
  stamps.mail.print_form.mail_to.domestic.country.select(test_parameter[:mail_to_country])
end

Then /^(?:S|s)et (?:Envelope|Label|Roll|CM) form (?:I|i)nternational (?:M|m)ail (?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:mail_to_country] = country
  stamps.mail.print_form.mail_to.international.country.select(test_parameter[:mail_to_country])
end

Then /^(?:S|s)et (?:Envelope|Label|Roll|CM) form (?:M|m)ail (?:T|t)o to (?:|a )(?:|random )address(?: to| in|) (.*)$/ do |address|
  stamps.mail.print_form.mail_to.domestic.text_area.set(address_helper(address))
end

Then /^(?:C|c)lick (?:Envelope|Label|Roll|CM) Form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

Then /^(?:C|c)lick Search Contacts close button$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end


















Then /^on Shipping Label Print form, Expect Domestic Address field displays (.*)$/ do |value|
  20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.domestic.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ") == value
  end
  expect((stamps.mail.print_form.mail_to.domestic.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  logger.step 'Address Cleansed -- Expected Result Confirmed'
end

Then /^on Print form, set Ship-To to$/ do |table|
  address = table.hashes.first

  test_parameter[:ship_to_country] = address['country']

  test_parameter[:ship_to_name] = (address['name'].downcase.include? 'random') ? ParameterHelper.random_name : address['name']
  test_parameter[:ship_to_company] = (address['company'].downcase.include? 'random') ? ParameterHelper.random_company_name : address['company']
  test_parameter[:ship_to_city] = (address['city'].downcase.include? 'random') ? ParameterHelper.random_string : address['city']

  if test_parameter[:ship_to_country].downcase.include? "united states"
    test_parameter[:ship_to_street_address] = (address['street_address'].downcase.include? 'random') ? ParameterHelper.random_string : address['street_address']
    ship_to_state = (address['state'].downcase.include? 'random') ? ParameterHelper.random_string : address['state']
    ship_to_zip = (address['zip'].downcase.include? 'random') ? ParameterHelper.random_string : address['zip']

    ship_to_address = "#{test_parameter[:ship_to_name]},#{test_parameter[:ship_to_company]},#{ship_to_street_address},#{test_parameter[:ship_to_city]} #{ship_to_state} #{ship_to_zip}"
    step "on Print form, set Mail To address to #{ship_to_address}"
  else
    ship_to_street_address_1 = (address['street_address_1'].downcase.include? 'random') ? ParameterHelper.random_string : address['street_address_1']
    ship_to_street_address_2 = (address['street_address_2'].downcase.include? 'random') ? ParameterHelper.random_suite : address['street_address_2']
    ship_to_province = (address['province'].downcase.include? 'random') ? ParameterHelper.random_string : address['province']
    ship_to_postal_code = (address['postal_code'].downcase.include? 'random')?ParameterHelper.random_alpha_numeric : address['postal_code']
    ship_to_phone = (address['phone'].downcase.include? 'random') ? ParameterHelper.random_phone : address['phone']

    step "on Print form, set Mail To country to #{test_parameter[:ship_to_country]}"
    step "Mail International: Set Ship-To Name to \"#{test_parameter[:ship_to_name]}\""
    step "Mail International: Set Ship-To Company to \"#{ship_to_company}\""
    step "Mail International: Set Ship-To Address 1 to \"#{ship_to_street_address_1}\""
    step "Mail International: Set Ship-To Address 2 to \"#{ship_to_street_address_2}\""
    step "Mail International: Set Ship-To City to \"#{ship_to_city}\""
    step "Mail International: Set Ship-To Province to \"#{ship_to_province}\""
    step "Mail International: Set Ship-To Postal Code to \"#{ship_to_postal_code}\""
    step "Mail International: Set Ship-To Phone to \"#{ship_to_phone}\""
  end
end

=begin
Then /^(?:O|o)n Order Details form, set Ship-To to Domestic Address$/ do |table|
  address_table = table.hashes.first

  test_parameter[:name] = (address_table['name'].downcase.include?('random')) ? ParameterHelper.random_name : address_table['name']
  test_parameter[:company] = (address_table['company'].downcase.include?('random')) ? ParameterHelper.random_company_name : address_table['company']
  test_parameter[:street_address] = address_table['street_address']

  if address_table['street_address_2'].nil?
    test_parameter[:street_address_2] = ""
  else
    test_parameter[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? ParameterHelper.random_string(2, 7) : address_table['street_address_2']
  end

  test_parameter[:city] = (address_table['city'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['city']
  test_parameter[:state] = (address_table['state'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['state']
  test_parameter[:zip] = (address_table['zip'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['zip']
  test_parameter[:country] = (address_table['country'].size==0)?"United States":address_table['country']

  test_parameter[:ship_to] = "#{test_parameter[:name]},#{test_parameter[:company]},#{test_parameter[:street_address]},#{test_parameter[:street_address_2]} ,#{test_parameter[:city]} #{test_parameter[:state]} #{test_parameter[:zip]}"

  step "On Order Details form, set Ship-To Country to #{test_parameter[:country]}"
  step "On Order Details form, set Ship-To to Domestic Address #{test_parameter[:ship_to]}"
end

Then /^(?:O|o)n Order Details International form, set address to$/ do |table|
  address_table = table.hashes.first

  test_parameter[:country] = address_table['country']
  test_parameter[:name] = (address_table['name'].downcase.include?('random')) ? ParameterHelper.random_name : address_table['name']
  test_parameter[:company] = (address_table['company'].downcase.include?('random')) ? ParameterHelper.random_company_name : address_table['company']
  test_parameter[:street_address_1] = (address_table['street_address_1'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['street_address_1']
  test_parameter[:street_address_2] = (address_table['street_address_2'].downcase.include?('random')) ? ParameterHelper.random_suite : address_table['street_address_2']
  test_parameter[:city] = (address_table['city'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['city']
  test_parameter[:state] = (address_table['province'].downcase.include?('random')) ? ParameterHelper.random_string : address_table['province']
  test_parameter[:zip] = (address_table['postal_code'].downcase.include?('random'))?ParameterHelper.random_alpha_numeric : address_table['postal_code']
  test_parameter[:phone] = (address_table['phone'].downcase.include?('random')) ? ParameterHelper.random_phone : address_table['phone']
  test_parameter[:email] = (address_table['email'].downcase.include?('random')) ? ParameterHelper.random_email : address_table['email']

  step "On Order Details form, set Ship-To Country to #{test_parameter[:country]}"
  step "On Order Details form, set International Ship-To Name to \"#{test_parameter[:name]}\""
  step "On Order Details form, set International Ship-To Company to \"#{test_parameter[:company]}\""
  step "On Order Details form, set International Ship-To Address 1 to \"#{test_parameter[:street_address_1]}\""
  step "On Order Details form, set International Ship-To Address 2 to \"#{test_parameter[:street_address_2]}\""
  step "On Order Details form, set International Ship-To City to \"#{test_parameter[:city]}\""
  step "On Order Details form, set International Ship-To Province to \"#{test_parameter[:state]}\""
  step "On Order Details form, set International Ship-To Postal Code to \"#{test_parameter[:zip]}\""
  step "On Order Details form, set International Ship-To Phone to \"#{test_parameter[:phone]}\""
  step "On Order Details form, set International Ship-To Email to \"#{test_parameter[:email]}\""
end

Then /^(?:O|o)n Order Details form, set Ship-To to zone (.*)$/ do |zone|
  address_helper(zone)
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set(test_parameter[:ship_to_domestic])
  step "Save Order Details data"
end

Then /^(?:O|o)n Order Details form, set Ship-To to Domestic Address (.*)$/ do |address|
  test_parameter[:ship_to_domestic] = ParameterHelper.format_address(address)
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.set test_parameter[:ship_to_domestic]
  step "Save Order Details data"
end
=end