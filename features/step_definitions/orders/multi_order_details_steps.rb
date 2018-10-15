Then /^set bulk update ship from to (.*)$/ do |str|
  ship_from = SdcOrders.bulk_update.ship_from
  ship_from.selection_element(name: :selection, value: str)
  ship_from.drop_down.click unless ship_from.selection.present?
  ship_from.selection.click unless ship_from.selection.class_disabled?
  TestData.hash[:bulk_ship_from] = str.eql?('default') ? ship_from.text_field.text_value : str
  TestData.hash[:ship_from] = str.eql?('default') ? ship_from.text_field.text_value : str
  expect(ship_from.text_field.text_value).to include(str) unless str.eql?('default')
end

Then /^[Bb]lur [Oo]ut on [Mm]ulti [Oo]rder [Dd]etails [Ff]orm(?:| (\d+)(?:| times))$/ do |count|
  pending
  #stamps.orders.bulk_update.blur_out(count)
end

Then /^[Ss]ave [Mm]ulti [Oo]rder [Dd]etails [Dd]ata$/ do
  #pending
end

Then /^click bulk update update order button$/ do
  step 'wait for js to stop'
  bulk = SdcOrders.bulk_update
  bulk.title.safe_wait_until_present(timeout: 2)
  bulk.save_preset.safe_wait_until_present(timeout: 2)
  bulk.update_orders.safe_wait_until_present(timeout: 2)
  sleep 4 unless TestSession.env.build_number
  bulk.update_orders.click
  loading = SdcOrders.loading_orders
  loading.safe_wait_until_present(timeout: 2)
  loading.safe_wait_while_present(timeout: 2)
  updating = SdcOrders.updating_orders
  updating.safe_wait_until_present(timeout: 2)
  updating.safe_wait_while_present(timeout: 2)
  OrdersGrid.body.wait_until_present(timeout: 10)
  sleep 2 unless TestSession.env.build_number
  step 'wait for js to stop'
end

Then /^expect bulk update is present$/ do
  expect(SdcOrders.bulk_update.title).to be_present
end

# Update bulk orders
# Then /^[Cc]lick [Bb]ulk [Uu]pdate [Oo]rders [Bb]utton$/ do
#   step 'expect bulk update orders button is present'
#   5.times do
#     stamps.orders.bulk_update.update_orders.click
#     stamps.orders.bulk_update.updating_orders.wait_while_present(3)
#     break unless stamps.orders.bulk_update.updating_orders.present?
#   end
# end

Then /^expect bulk update orders button is present$/ do
  expect(SdcOrders.bulk_update.update_orders).to be_present, 'Bulk Update Orders button is not present'
end

# Begin Bulk Update Weight steps
Then /^set bulk update pounds to (.*)$/ do |str|
  SdcOrders.bulk_update.weight.lbs.set(TestData.hash[:bulk_lbs] = str)
end

Then /^expect bulk update pounds is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.weight.lbs.value).to eql((str.nil?) ? TestData.hash[:bulk_lbs] : str)
end

Then /^set bulk update ounces to (.*)$/ do |str|
  SdcOrders.bulk_update.weight.oz.set(TestData.hash[:bulk_oz] = str)
end

Then /^expect bulk update ounces is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.weight.oz.value).to eql((str.nil?) ? TestData.hash[:bulk_oz] : str)
end

Then /^expect bulk update weight is (checked|unchecked)$/ do |str|
  expect(checked = SdcOrders.bulk_update.weight.weight_cb.checked?).to be((str == 'checked') ? true : false), "Expectation: #{str}, got #{(checked) ? 'checked' : 'uncheck'}"
end

Then /^check bulk update weight$/ do
  SdcOrders.bulk_update.weight.checkbox.check
end

Then /^uncheck bulk update weight$/ do
  SdcOrders.bulk_update.weight.weight_cb.uncheck
end

Then /^increment bulk update pounds by (.*)$/ do |str|
  (TestData.hash[:bulk_lb_inc] = str).to_i.times {SdcOrders.bulk_update.weight.lbs.increment.click}
end

Then /^decrement bulk update pounds by (.*)$/ do |str|
  (TestData.hash[:bulk_lb_dec] = str).to_i.times { SdcOrders.bulk_update.weight.lbs.decrement.click }
end

Then /^increment bulk update ounces by (.*)$/ do |str|
  (TestData.hash[:bulk_oz_inc] = str).to_i.times {SdcOrders.bulk_update.weight.oz.increment.click}
end

Then /^decrement bulk update ounces by (.*)$/ do |str|
  (TestData.hash[:bulk_oz_dec] = str).to_i.times {SdcOrders.bulk_update.weight.oz.decrement.click}
end
# End Bulk Update Weight steps

Then /^set bulk update domestic service to (.*)$/ do |str|
  service = SdcOrders.bulk_update.dom_service
  service.drop_down.wait_until_present(timeout: 3)
  service.drop_down.click
  selections = service.selection_elements(name: :selection, value: str)
  selections.each do |element|
    if element.present?
      element.scroll_into_view
      element.click
    end
  end
  expect(service.text_field.text_value).to include(str)
  TestData.hash[:bulk_dom_service] = str
end

Then /^set bulk update international service to (.*)$/ do |str|
  service = SdcOrders.bulk_update.intl_service
  service.drop_down.wait_until_present(timeout: 3)
  service.drop_down.click
  selections = service.selection_elements(name: :selection, value: str)
  selections.each do |element|
    if element.present?
      element.scroll_into_view
      element.click
    end
  end
  expect(service.text_field.text_value).to include(str)
  TestData.hash[:bulk_int_service] = str
end

Then /^expect bulk update domestic service is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.dom_service.text_field.text_value).to eql(str.nil? ? TestData.hash[:bulk_dom_service] : str)
end

Then /^expect bulk update international service is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.intl_service.text_field.text_value).to eql(str.nil? ? TestData.hash[:bulk_int_service] : str)
end

Then /^set bulk update insurance to (.+)$/ do |str|
  insurance = SdcOrders.bulk_update.insurance
  insurance.selection_element(name: :selection, value: str)
  insurance.drop_down.click unless insurance.selection.present?
  insurance.selection.click unless insurance.selection.class_disabled?
  expect(insurance.text_field.text_value).to include(str)
end

Then /^set bulk update insure amount to (.+)$/ do |str|
  pending
  #stamps.orders.bulk_update.insure_amt.set(str)
end

Then /^set bulk update tracking to (.+)$/ do |str|
  tracking = SdcOrders.bulk_update.tracking
  tracking.selection_element(name: :selection, value: str)
  tracking.drop_down.click unless tracking.selection.present?
  tracking.selection.click unless tracking.selection.class_disabled?
  expect(tracking.text_field.text_value).to include(str)
end

Then /^set bulk update dimensions to length (\d+) width (\d+) height (\d+)$/ do |length, width, height|
  step "set bulk update length to #{length}"
  step "set bulk update width to #{width}"
  step "set bulk update height to #{height}"
end

Then /^check bulk update dimensions$/ do
  SdcOrders.bulk_update.dimensions.checkbox.check
end

Then /^uncheck bulk update dimensions$/ do
  SdcOrders.bulk_update.dimensions.checkbox.uncheck
end

Then /^expect bulk update dimensions is (checked|unchecked)$/ do |str|
  expect(checked = SdcOrders.bulk_update.dimensions.checkbox.checked?).to be((str == 'checked') ? true : false), "Expectation: #{str}, got #{(checked) ? 'checked' : 'uncheck'}"
end

Then /^set bulk update length to (.*)$/ do |str|
  SdcOrders.bulk_update.dimensions.length.set(TestData.hash[:bulk_length] = str)
  step "expect bulk update length is correct"
end

Then /^increment bulk update length by (.*)$/ do |str|
  (TestData.hash[:bulk_length_inc] = str).to_i.times {SdcOrders.bulk_update.dimensions.length.increment.click}
end

Then /^decrement bulk update length by (.*)$/ do |str|
  (TestData.hash[:bulk_length_dec] = str).to_i.times {SdcOrders.bulk_update.dimensions.length.decrement.click}
end

Then /^expect bulk update length is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.dimensions.length.value).to eql((str.nil?) ? TestData.hash[:bulk_length] : str)
end

Then /^set bulk update width to (.*)$/ do |str|
  SdcOrders.bulk_update.dimensions.width.set(TestData.hash[:bulk_width] = str)
  step "expect bulk update width is correct"
end

Then /^increment bulk update width by (.*)$/ do |str|
  (TestData.hash[:bulk_width_inc] = str).to_i.times {SdcOrders.bulk_update.dimensions.width.increment.click}
end

Then /^decrement bulk update width by (.*)$/ do |str|
  (TestData.hash[:bulk_width_dec] = str).to_i.times {SdcOrders.bulk_update.dimensions.width.decrement.click}
end

Then /^expect bulk update width is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.dimensions.width.value).to eql((str.nil?) ? TestData.hash[:bulk_width] : str)
end

Then /^set bulk update height to (.*)$/ do |str|
  SdcOrders.bulk_update.dimensions.height.set(TestData.hash[:bulk_height] = str)
  step "expect bulk update height is correct"
end

Then /^increment bulk update height by (.*)$/ do |str|
  (TestData.hash[:bulk_height_inc] = str).to_i.times {SdcOrders.bulk_update.dimensions.height.increment.click}
end

Then /^decrement bulk update height by (.*)$/ do |str|
  (TestData.hash[:bulk_height_dec] = str).to_i.times {SdcOrders.bulk_update.dimensions.height.decrement.click}
end

Then /^expect bulk update height is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.bulk_update.dimensions.height.text).to eql((str.nil?) ? TestData.hash[:bulk_height] : str)
end