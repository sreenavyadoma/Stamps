Then /^[Ee]xpect Contacts Modal is Present/ do
  expect(stamps.mail.print_form.mail_to.mail_to_link.click).to be_present
end

#search contact modal for the contact that was last printed, based on first and last name
Then /^[Ss]earch Contacts Modal for last printed contact/ do
  address_array = TestData.store[:address].split("\n")
  stamps.mail.print_form.mail_to.mail_to_link.click.search address_array[0]
end

Then /^[Ss]earch Contacts Modal for (.*)$/ do |str|
  stamps.mail.print_form.mail_to.mail_to_link.click.search str
end

Then /^[Cc]lick Search Contacts close [Bb]utton$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^[Ee]xpect Contact Name (.*) is present$/ do |str|
  expect(stamps.mail.print_form.mail_to.mail_to_link.click.contact_name str).to be_present
end

Then /^[Ss]elect Contact Name (.*)$/ do |str|
  stamps.mail.print_form.mail_to.mail_to_link.click.select str
end

Then /^[Ss]elect Recently Printed Contact$/ do
  address_array = TestData.store[:address].split("\n")
  address_name_array = address_array[0].split(" ")
  address_name_array_reversed = address_name_array[1] + ", " + address_name_array[0]
  stamps.mail.print_form.mail_to.mail_to_link.click.select address_name_array_reversed
end