
Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age welcome_kit_message exists$/ do
  expect(registration.choose_supplies.welcome_kit_message.present?).to be(true), "Welcome kit Message DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect [Cc]hoose [Ss]upplies [Pp]age Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end

Then /^[Cc]lick Choose Supplies page Place Order button$/ do
  registration.choose_supplies.place_order
end