
And /^Expect Order Details Form Ship-From Textbox to be enabled/ do
  expect(orders.order_details.ship_from.text_box.field.visible?).to be true
end

And /^Expect Order Details Form Ship-From drop-down be enabled/ do
  expect(orders.order_details.ship_from.drop_down.field.visible?).to be true
end

And /^Expect Order Details Form Ship-To Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.text_area.field.visible?).to be true
end

And /^Expect Order Details Form Ship-To drop-down to be enabled/ do
  expect(orders.order_details.ship_to.country.drop_down.field.visible?).to be true
end

And /^Expect Order Details Form Ship-To text area to be enabled/ do
  expect(orders.order_details.ship_to.address.text_area.field.visible?).to be true
end

And /^Expect Order Details Form Phone Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.phone.field.visible?).to be true
end

And /^Expect Order Details Form Email Textbox to be enabled/ do
  expect(orders.order_details.ship_to.address.email.field.visible?).to be true

end

And /^Expect Order Details Form Pounds Textbox to be enabled/ do
  expect(orders.order_details.lbs.field.visible?).to be true
end

And /^Expect Order Details Form Ounces Textbox to be enabled/ do
  expect(orders.order_details.oz.field.visible?).to be true
end

And /^Expect Order Details Form Service Textbox to be enabled/ do
  expect(orders.order_details.service.text_box.field.visible?).to be true
end

And /^Expect Order Details Form Service drop-down to be enabled/ do
  expect(orders.order_details.service.drop_down.field.visible?).to be true
end

And /^Expect Order Details Form Insured Textbox to be enabled/ do
  expect(orders.order_details.insured_value.field.visible?).to be true
end

And /^Expect Order Detials Form Tracking Textbox to be enabled/ do
  expect(orders.order_details.tracking.text_box.field.visible?).to be true
end

And /^Expect Order Details Form Tracking drop-down to be enabled/ do
  expect(orders.order_details.tracking.drop_down.field.visible?).to be true
end