
Then /^[Ii]n Orders Toolbar, expect Print Tooltip to include (.*)$/ do |expectation|
  #StampsTest.log.step "In Orders Toolbar, expect Print Tooltip to include #{expectation}"
  actual=stamps.orders.orders_toolbar.toolbar_print.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ii]n Orders Toolbar, expect Move Tooltip to include (.*)$/ do |expectation|
  #StampsTest.log.step "In Orders Toolbar, expect Move Tooltip to include #{expectation}"
  actual=stamps.orders.orders_toolbar.toolbar_move.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ii]n Orders Toolbar, expect Add Tooltip to include (.*)$/ do |expectation|
  #StampsTest.log.step "In Orders Toolbar, expect Add Tooltip to include #{expectation}"
  actual=stamps.orders.orders_toolbar.add.order_details.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Toolbar Menu Tooltip is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Order Details Toolbar Menu Tooltip is #{expectation}"
  actual=stamps.orders.order_details.toolbar.menu.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Filter Panel: Menu Item collapse button tooltip should be (.*)$/ do |expectation|
  #StampsTest.log.step "Filter Panel: Menu Item collapse button tooltip should be #{expectation}"
  actual=stamps.orders.filter_panel.menu_item.collapse.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Filter Panel: Menu Item expand button tooltip should be (.*)$/ do |expectation|
  #StampsTest.log.step "Filter Panel: Menu Item expand button tooltip should be #{expectation}"
  actual=stamps.orders.filter_panel.menu_item.expand.tooltip
  #StampsTest.log.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  expect(actual).to include(expectation)
end

Then /^Tooltips: Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |expectation, data_qtip|
  #StampsTest.log.step "Tooltips: Expect Print Modal Print Media #{expectation} tooltip to include #{data_qtip}"
  tooltips=data_qtip.split "||"
  actual_tooltip=stamps.orders.modals.orders_print_modal.printing_on.tooltip expectation
  tooltips.each do |tooltip|
    #StampsTest.log.step "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    expect(actual_tooltip).to include tooltip
  end
end

Then /^Tooltips: Expect Customs Tooltip Error for Total Weight is (.+)$/ do |expectation|
  #StampsTest.log.step "Tooltips: Expect Customs Tooltip Error for Total Weight is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.total_weight.data_error
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Associated Item Description Tooltip Error is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Customs Associated Item Description Tooltip Error is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.associated_items.item_number(1).description.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Qty Tooltip Error is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Customs Qty Tooltip Error is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.associated_items.item_number(1).qty.textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Unit Price Tooltip Error is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Customs Unit Price Tooltip Error is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.associated_items.item_number(1).unit_price.textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Pounds Tooltip Error is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Customs Pounds Tooltip Error is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.associated_items.item_number(1).lb.textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(data_error_qtip).to include(expectation)
end

Then /^[Oo]n Customs form, expect Ounces Tooltip Error is (.*)$/ do |expectation|
  #StampsTest.log.step "expect Customs Ounces Tooltip Error is #{expectation}"
  stamps.common_modals.customs_form.should_not be_nil
  data_error_qtip=stamps.common_modals.customs_form.associated_items.item_number(1).oz.textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  expect(ddata_error_qtip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic Address data error tooltip is \"(.*)\"$/ do |expectation|
  step "show order details form ship-to fields"
  textbox=stamps.orders.order_details.ship_to.domestic.textarea
  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  expect(textbox.data_error_qtip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic Email data error tooltip is \"(.*)\"$/ do |expectation|
  step "show order details form ship-to fields"
  textbox=stamps.orders.order_details.ship_to.domestic.email
  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Weight Lbs data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Domestic  Weight lb data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.weight.lb.textbox
  20.times do
    textbox.scroll_into_view
    textbox.set "1"
    stamps.orders.order_details.blur_out
    textbox.set "0"
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  textbox.scroll_into_view
  sleep(2)
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Weight Oz data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Weight Oz data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.weight.oz.textbox
  20.times do
    textbox.scroll_into_view
    textbox.set "1"
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.double_click
    textbox.set "0"
    textbox.scroll_into_view
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  textbox.scroll_into_view
  sleep(2)
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Weight Oz data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.service.textbox
  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  textbox.scroll_into_view
  sleep(2)
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions Length data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Dimensions Length data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.dimensions.length.textbox

  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions Width data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Dimensions Width data error tooltip is #{expectation}"
  width_textbox=stamps.orders.order_details.dimensions.width.textbox

  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions Height data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details Dimensions Height data error tooltip is #{expectation}"
  height_textbox=stamps.orders.order_details.dimensions.height.textbox

  20.times do
    textbox.double_click
    stamps.orders.order_details.blur_out
    textbox.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.blur_out
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Name data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International Name data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.name
  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    textbox.double_click
    #web_apps.orders.order_details.ship_to.international.click_form
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  sleep(2)
  data_error_tooltip = textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Company data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International Company data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.company

  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Address 1 data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International Address 1 data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.address_1

  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International City data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International City data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.city

  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Phone data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International Phone data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.phone

  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  sleep(2)
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Email data error tooltip is \"(.*)\"$/ do |expectation|
  #StampsTest.log.step "expect Order Details International Email data error tooltip is #{expectation}"
  textbox=stamps.orders.order_details.ship_to.international.email

  20.times do
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    textbox.double_click
    stamps.orders.order_details.ship_to.international.blur_out
    stamps.orders.order_details.ship_to.international.name.scroll_into_view
    sleep(0.35)
    data_error_tooltip=textbox.data_error_qtip
    begin
      stamps.orders.order_details.ship_to.international.name.scroll_into_view
      sleep(0.35)
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  stamps.orders.order_details.ship_to.international.name.scroll_into_view
  data_error_tooltip=textbox.data_error_qtip
  #StampsTest.log.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include(expectation)
end