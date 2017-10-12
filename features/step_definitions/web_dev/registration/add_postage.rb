Then /^[Ii]n Add Postage page, click Confirm button$/ do
  registration.add_postage.confirm
end

Then /^[Ee]xpect add_postage_to_account message exists$/ do
  expect(registration.add_postage).to be_present, "Message DOES NOT exists on add postage page"
end

Then /^[Ee]xpect Confirm button exists$/ do
  expect(registration.add_postage.confirm).to be_present, "Confirm button DOES NOT exists on add postage page"
end

Then /^[Ee]xpect buy postage 10 radio button exists$/ do
  expect(registration.add_postage.buy_postage_10).to be_present, "$10 radio button textbox DOES NOT exists on add postage page"
end

Then /^[Ee]xpect buy postage 20 radio button exists$/ do
  expect(registration.add_postage.buy_postage_20).to be_present, "$20 radio button DOES NOT exists on add postage page"
end

Then /^[Ee]xpect No thanks radio button exists$/ do
  expect(registration.add_postage.no_thanks).to be_present, "$10 radio button textbox DOES NOT exists on add postage page"
end