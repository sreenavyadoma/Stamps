
# common Print form steps for Envelope|Label|Roll|CM

Then /^set print form mail-to (?:|to )(?:|a )(?:|random )address(?: to| in| between|) (.*)$/ do |str|
  address = TestHelper.address_helper(str)
  if SdcEnv.new_framework
    SdcMail.print_form.mail_to.text_area.set(address)
  else
    stamps.mail.print_form.mail_to.mail_address.textarea.set(address)
  end

  TestData.hash[:address] = address
end

Then /^[Ee]xpect Print form Mail To is disabled$/ do
  expect(stamps.mail.print_form.mail_to.enabled?).to be(true), "Print form Mail To is NOT disabled"
end

Then /^[Cc]lick Print form Mail To link/ do
  stamps.mail.print_form.mail_to.mail_to_link.click
end

# Then /^check print form email traching$/ do
#   stamps.mail.print_form.mail_to.mail_to_link.click
# end
