
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form [Ii]nternational [Mm]ail [Tt]o [Cc]ountry to (.*)$/ do |country|
  parameter[:country] = country
  stamps.mail.print_form.mail_to.country.select(parameter[:country])
end

Then /^[Ss]et Print form [Mm]ail-[Tt]o (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |address|
  parameter[:address] = helper.address_helper(address)
  stamps.mail.print_form.mail_to.address.text_area.set(parameter[:address])
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to).to be_enabled, "Print form Mail To is NOT disabled"
end

Then /^[Cc]lick Print form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

# Dimensions setters
Then /^[Ss]et Print form Length to (\d+)$/ do |length|
  parameter[:length] = length
  stamps.mail.print_form.dimensions.length.set(parameter[:length])
end

Then /^[Ss]et Print form width to (\d+)$/ do |width|
  parameter[:width] = width
  stamps.mail.print_form.dimensions.width.set(parameter[:width])
end

Then /^[Ss]et Print form height to (\d+)$/ do |height|
  parameter[:height] = height
  stamps.mail.print_form.dimensions.height.set(parameter[:height])
end