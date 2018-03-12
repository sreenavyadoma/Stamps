
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form [Mm]ail-[Tt]o (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |address|
  stamps.mail.print_form.mail_to.mail_address.textarea.set(TestData.store[:address]=TestHelper.address_helper(address, modal_param.env))
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^[Cc]lick Print form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

# Dimensions setters
Then /^[Ss]et Print form Length to (\d+)$/ do |length|
  stamps.mail.print_form.dimensions.length.set(TestData.store[:length] = length)
end

Then /^[Ss]et Print form width to (\d+)$/ do |width|
  stamps.mail.print_form.dimensions.width.set(TestData.store[:width] = width)
end

Then /^[Ss]et Print form height to (\d+)$/ do |height|
  stamps.mail.print_form.dimensions.height.set(TestData.store[:height] = height)
end

