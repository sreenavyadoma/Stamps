
Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age welcome_kit_message exists$/ do
  expect(registration.choose_supplies.welcome_kit_message.present?).to be(true), "Welcome kit Message DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age first paragraph contain (.*)$/ do |str|
  step "pause for 2 seconds"
  expect(registration.choose_supplies.welcome_kit_first_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age second paragraph contain (.*)$/ do |str|
  expect(registration.choose_supplies.welcome_kit_second_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age welcome_kit_logo exists$/ do
  expect(registration.choose_supplies.welcome_kit_logo.present?).to be(true), "Welcome kit Logo DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age Place order button exists$/ do
  expect(registration.choose_supplies.place_order_btn.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Cc]lick Choose Supplies page Place Order button$/ do
  registration.choose_supplies.place_order
end