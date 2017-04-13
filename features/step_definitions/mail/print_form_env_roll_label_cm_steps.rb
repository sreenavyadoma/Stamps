
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form (?:I|i)nternational (?:M|m)ail (?:T|t)o (?:C|c)ountry to (.*)$/ do |country|
  test_parameter[:country] = country
  stamps.mail.print_form.mail_to.country.select(test_parameter[:country])
end

Then /^[Ss]et Print form (?:M|m)ail-(?:T|t)o (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |address|
  test_parameter[:address] = address_helper(address)
  stamps.mail.print_form.mail_to.address.text_area.set(test_parameter[:address])
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to).to be_enabled, "Print form Mail To is NOT disabled"
end

Then /^[Cc]lick Print form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

# Dimensions setters
Then /^[Ss]et Print form Length to (\d+)$/ do |length|
  test_parameter[:length] = length
  stamps.mail.print_form.dimensions.length.set(test_parameter[:length])
end

Then /^[Ss]et Print form width to (\d+)$/ do |width|
  test_parameter[:width] = width
  stamps.mail.print_form.dimensions.width.set(test_parameter[:width])
end

Then /^[Ss]et Print form height to (\d+)$/ do |height|
  test_parameter[:height] = height
  stamps.mail.print_form.dimensions.height.set(test_parameter[:height])
end