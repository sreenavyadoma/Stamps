
And /^Details: Expect Ship-From Textbox to be enabled/ do
  expect(orders.details.ship_from.text_box.field.visible?).to be true
end

And /^Details: Expect Ship-From drop-down be enabled/ do
  expect(orders.details.ship_from.drop_down.field.visible?).to be true
end

And /^Details: Expect Ship-To Textbox to be enabled/ do
  expect(orders.details.ship_to.address.text_area.field.visible?).to be true
end

And /^Details: Expect Ship-To drop-down to be enabled/ do
  expect(orders.details.ship_to.country.drop_down.field.visible?).to be true
end

And /^Details: Expect Ship-To text area to be enabled/ do
  expect(orders.details.ship_to.address.text_area.field.visible?).to be true
end

And /^Details: Expect Phone Textbox to be enabled/ do
  expect(orders.details.ship_to.address.phone.field.visible?).to be true
end

And /^Details: Expect Email Textbox to be enabled/ do
  expect(orders.details.ship_to.address.email.field.visible?).to be true

end

And /^Details: Expect Pounds Textbox to be enabled/ do
  expect(orders.details.weight.lbs.field.visible?).to be true
end

And /^Details: Expect Ounces Textbox to be enabled/ do
  expect(orders.details.weight.oz.field.visible?).to be true
end

And /^Details: Expect Service Textbox to be enabled/ do
  expect(orders.details.service.text_box.field.visible?).to be true
end

And /^Details: Expect Service drop-down to be enabled/ do
  expect(orders.details.service.drop_down.field.visible?).to be true
end

And /^Details: Expect Insured Textbox to be enabled/ do
  expect(orders.details.insured_for.text_box.field.visible?).to be true
end

And /^Expect Order Detials Form Tracking Textbox to be enabled/ do
  expect(orders.details.tracking.text_box.field.visible?).to be true
end

And /^Details: Expect Tracking drop-down to be enabled/ do
  expect(orders.details.tracking.drop_down.field.visible?).to be true
end