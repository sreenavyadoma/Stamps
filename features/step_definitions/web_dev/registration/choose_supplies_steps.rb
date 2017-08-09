
Then /^[Ii]n Choose Supplies page, click Place Order button$/ do
  registration.choose_supplies.place_order
end

Then /^[Ee]xpect welcome_kit_message exists$/ do
  expect(registration.choose_supplies.present?).to be(true), "Welcome kit Message DOES NOT exists on choose supplies page"
end

Then /^[Ee]xpect Place order button exists$/ do
  expect(registration.choose_supplies.place_order.present?).to be(true), "Place Order button DOES NOT exists on choose supplies page"
end