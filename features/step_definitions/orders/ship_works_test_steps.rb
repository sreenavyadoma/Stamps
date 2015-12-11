
And /^Expect Order Details Ship-From Textbox to be enabled/ do
  expect(orders.order_details.ship_from.text_box.field.visible?).to be true
end

And /^Expect Order Details Ship-From drop-down be enabled/ do
  expect(orders.order_details.ship_from.drop_down.field.visible?).to be true
end

And /^Expect Order Details Ship-To Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.text_area.field.visible?).to be true
end

And /^Expect Order Details Ship-To drop-down to be enabled/ do
  expect(orders.order_details.ship_to.country.drop_down.field.visible?).to be true
end

And /^Expect Order Details Ship-To text area to be enabled/ do
  expect(orders.order_details.ship_to.address.text_area.field.visible?).to be true
end

And /^Expect Order Details Phone Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.phone.field.visible?).to be true
end

And /^Expect Order Details Email Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.email.field.visible?).to be true

end

And /^Expect Order Details Pounds Textbox to be enabled/ do
  expect(orders.order_details.lbs.field.visible?).to be true
end

And /^Expect Order Details Ounces Textbox to be enabled/ do
  expect(orders.order_details.oz.field.visible?).to be true
end

And /^Expect Order Details Service Textbox to be enabled/ do
  expect(orders.order_details.service.text_box.field.visible?).to be true
end

And /^Expect Order Details Service drop-down to be enabled/ do
  expect(orders.order_details.service.drop_down.field.visible?).to be true
end

And /^Expect Order Details Insured Textbox to be enabled/ do
  expect(orders.order_details.insured_value.field.visible?).to be true
end

And /^Expect Order Detials Form Tracking Textbox to be enabled/ do
  expect(orders.order_details.tracking.text_box.field.visible?).to be true
end

And /^Expect Order Details Tracking drop-down to be enabled/ do
  expect(orders.order_details.tracking.drop_down.field.visible?).to be true
end