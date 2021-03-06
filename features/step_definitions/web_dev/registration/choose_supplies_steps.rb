
Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age welcome_kit_message exists$/ do
  step "pause for 1 seconds"
  expect(registration.choose_supplies.welcome_kit_message).to be_present, "Welcome kit Message DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age first paragraph contain (.*)$/ do |str|
  step "pause for 2 seconds"
  expect(registration.choose_supplies.welcome_kit_first_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age second paragraph contain (.*)$/ do |str|
  expect(registration.choose_supplies.welcome_kit_second_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age welcome_kit_logo exists$/ do
  expect(registration.choose_supplies.welcome_kit_logo).to be_present, "Welcome kit Logo DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age Place order button exists$/ do
  expect(registration.choose_supplies.place_order_btn).to be_present, "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Cc]lick Choose Supplies page Place Order [Bb]utton$/ do
  registration.choose_supplies.place_order
end