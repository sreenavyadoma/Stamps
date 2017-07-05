
Then /^[Ii]n Choose Supplies page, click Place Order button$/ do
  registration.choose_supplies.place_order
end

Then /^[Ee]xpect welcome_kit_message exists$/ do
  expect(registration.choose_supplies.present?).to be(true)
end