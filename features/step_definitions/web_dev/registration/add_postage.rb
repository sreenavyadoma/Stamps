Then /^[Ii]n Add Postage page, click Confirm button$/ do
  registration.add_postage.confirm
end

Then /^[Ee]xpect add_postage_to_account message exists$/ do
  expect(registration.add_postage.present?).to be(true), "Message DOES NOT exists on add postage page"
end

Then /^[Ee]xpect Confirm button exists$/ do
  expect(registration.add_postage.confirm.present?).to be(true), "Confirm button DOES NOT exists on add postage page"
end

Then /^[Ee]xpect buy postage 10 radio button exists$/ do
  expect(registration.add_postage.buy_postage_10.present?).to be(true), "$10 radio button textbox DOES NOT exists on add postage page"
end

Then /^[Ee]xpect buy postage 20 radio button exists$/ do
  expect(registration.add_postage.buy_postage_20.present?).to be(true), "$20 radio button DOES NOT exists on add postage page"
end