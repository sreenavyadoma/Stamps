And /^Expect Order Details Form Ship-From Textbox to be enabled/ do
  expect(batch.order_details.ship_from.text_box.field.enabled?).to be true
end

And /^Expect Order Details Form Ship-From drop-down be enabled/ do
  expect(batch.order_details.ship_from.drop_down.field.enabled?).to be true
end

And /^Expect Order Details Form Ship-To Textbox to be enabled/ do
  expect(batch.order_details.ship_to.text_box.field.enabled?).to be true
end

And /^Expect Order Details Form Ship-To drop-down to be enabled/ do
  expect(batch.order_details.ship_to.drop_down.field.enabled?).to be true
end

And /^Expect Order Details Form Ship-To text area to be enabled/ do
  expect(batch.order_details.ship_to.address.text_area.field.enabled?).to be true
end

And /^Expect Order Details Form Phone Textbox to be enabled/ do
  expect(batch.order_details.ship_to.address.phone.field.enabled?).to be true
end

And /^Expect Order Details Form Email Textbox to be enabled/ do
  expect(batch.order_details.ship_to.email.phone.field.enabled?).to be true
end

And /^Expect Order Details Form Service Textbox to be enabled/ do
  expect(batch.order_details.service_textbox.text_box.field.enabled?).to be true
end

And /^Expect Order Details Form Service drop-down to be enabled/ do
  expect(batch.order_details.service_textbox.drop_down.field.enabled?).to be true
end

And /^Expect Order Detials Form Tracking Textbox to be enabled/ do
  expect(batch.order_details.tracking_dropdown.text_box.field.enabled?).to be true
end

And /^Expect Order Details Form Tracking drop-down to be enabled/ do
  expect(batch.order_details.tracking_dropdown.drop_down.field.enabled?).to be true
end