# encoding: utf-8

# These browser elements exists on all forms (i.e. Stamps, Envelopes, Shipping Label and Certified Mail)
Then /^(?:S|s)elect Print On (.*)$/ do |media|
  test_parameter[:print_on] = media
  stamps.mail.print_on(test_parameter[:print_on])
end

Then /^(?:S|s)et Print form Mail-From to (.*)$/ do |value|
  test_parameter[:ship_from] = value
  stamps.mail.print_form.mail_from.select(test_parameter[:ship_from])
end

Then /^(?:S|s)et Print form Pounds to (\d+)$/ do |pounds|
  stamps.mail.print_form.mail_weight.mail_pounds.set(pounds)
end

Then /^(?:S|s)et Print form Ounces to (\d+)$/ do |ounces|
  stamps.mail.print_form.mail_weight.mail_ounces.set(ounces)
end

Then /^(?:S|s)elect Print form (?:S|s)ervice (.*)$/ do |service|
  stamps.mail.print_form.mail_service.select(service)
end

When /^(?:C|c)lick Print form Print button$/ do
  stamps.mail.mail_toolbar.print
end

When /^(?:C|c)lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end

# These steps are form specific

Then /^(?:S|s)et (?:Envelope|Label|Roll|CM) form (?:I|i)nternational (?:M|m)ail (?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:mail_to_country] = country
  stamps.mail.print_form.mail_to.country.select(test_parameter[:mail_to_country])
end

Then /^(?:C|c)lick (?:Envelope|Label|Roll|CM) Form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

Then /^(?:C|c)lick Search Contacts close button$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^(?:C|c)lick (?:Label|Roll) form Edit Customs Form button$/ do
  stamps.mail.print_form.mail_customs.edit_form
end

Then /^(?:S|s)et (?:Envelope|Label|Roll|CM) form (?:M|m)ail-(?:T|t)o (?:|to )(?:|a )(?:|random )address(?: to| in|) (.*)$/ do |address|
  stamps.mail.print_form.mail_to.address.text_area.set(address_helper(address))
end

Then /^(?:S|s)et (?:Label|Roll|CM) form (?:M|m)ail-(?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:mail_to_country] = country
  stamps.mail.print_form.mail_to.country(test_parameter[:mail_to_country])
end

Then /^(?:S|s)et (?:Label|Roll) form Ship-To to international address$/ do |table|
  address = table.hashes.first
  step "set Label form Mail-To Country to #{address['country']}"
  step "set Label form Name to #{address['name']}"
  step "set Label form Company to #{address['company']}"
  step "set Label form Address 1 to #{address['street_address_1']}"
  step "set Label form Address 2 to #{address['street_address_2']}"
  step "set Label form City to #{address['city']}"
  step "set Label form Province to #{address['province']}"
  step "set Label form Postal Code to #{address['postal_code']}"
  step "set Label form Phone to #{address['phone']}"
end

