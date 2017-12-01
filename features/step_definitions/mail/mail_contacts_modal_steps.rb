Then /^[Ee]xpect Contacts Modal is Present/ do
  expect(stamps.mail.print_form.mail_to.mail_to_link.click).to be_present
end

Then /^[Ss]earch Contacts Modal for Recently added Contact/ do
  address_array = test_param[:last_printed_address].split("\n")
  stamps.mail.print_form.mail_to.mail_to_link.click.search address_array[0]
end

Then /^[Ss]earch Contacts Modal for (.*)$/ do |str|
  stamps.mail.print_form.mail_to.mail_to_link.click.search str
end

Then /^[Cc]lick Search Contacts close [Bb]utton$/ do
  stamps.mail.print_form.mail_to.mail_to_link.click.close
end

Then /^[Ee]xpect Contact Name (.*) is present$/ do |str|
#  @found_item=false
#  selection="#{firstname} #{lastname}, #{company}"
#  stamps.orders.single_order_details.ship_to.domestic.auto_suggest.auto_suggest_box.name_fields.each do |field|
#    @found_item=true  if field.text.eql? selection
#  end
#  expect(@found_item).to be(true)
end

Then /^[Ss]elect Contact Name (.*)$/ do |str|
  stamps.mail.print_form.mail_to.mail_to_link.click.select str
end

Then /^[Ss]elect Recently Added Contact$/ do
  address_array = test_param[:last_printed_address].split("\n")
  address_name_array = address_array[0].split(" ")
  address_name_array_reversed = address_name_array[1] + ", " + address_name_array[0]
  stamps.mail.print_form.mail_to.mail_to_link.click.select address_name_array_reversed
end