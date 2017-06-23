
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form [Ii]nternational [Mm]ail [Tt]o [Cc]ountry to (.*)$/ do |country|
  test_param[:country] = country
  stamps.mail.print_form.mail_to.country.select(test_param[:country])
end

Then /^[Ss]et Print form [Mm]ail-[Tt]o (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |address|
  test_param[:address] = test_helper.address_test_helper(address)
  stamps.mail.print_form.mail_to.address.text_area.set(test_param[:address])
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^[Cc]lick Print form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

# Dimensions setters
Then /^[Ss]et Print form Length to (\d+)$/ do |length|
  test_param[:length] = length
  stamps.mail.print_form.dimensions.length.set(test_param[:length])
end

Then /^[Ss]et Print form width to (\d+)$/ do |width|
  test_param[:width] = width
  stamps.mail.print_form.dimensions.width.set(test_param[:width])
end

Then /^[Ss]et Print form height to (\d+)$/ do |height|
  test_param[:height] = height
  stamps.mail.print_form.dimensions.height.set(test_param[:height])
end