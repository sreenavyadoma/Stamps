And /^Expect Order Details Form Ship-From Textbox to be enabled/ do
  expect(batch.order_details.ship_from.text_box.enabled?).to be true
end

And /^Expect Order Details Form Ship-From drop-down be enabled/ do
  expect(batch.order_details.ship_from.drop_down.enabled?).to be true
end

