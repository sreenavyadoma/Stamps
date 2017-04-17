Then /^[Ss]et Multi Order Details Form Ship From to (.+)$/ do |value|
  stamps.orders.multi_order.ship_from.select(value)
  step "On Multi Order Details form, blur out"
  step "Save Multi Order Details data"
end

Then /^[Ss]et Multi Order Details Form Pounds to (\d+)$/ do |value|
  parameter[:pounds] = value
  stamps.orders.multi_order.weight.lb.set parameter[:pounds]
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details form Ounces to (\d+)$/ do |value|
  parameter[:ounces] = value
  stamps.orders.order_details.weight.oz.set parameter[:ounces]
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details form Domestic service to (.*)$/ do |service|
  stamps.orders.order_details.service.select(service)
  15.times do
    step "On Order Details form, blur out"
    break if stamps.orders.order_details.service.cost > 0
    step "On Order Details form, blur out"
  end
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details form International service to (.*)$/ do |service|
  stamps.orders.order_details.service.select(service)
  15.times do
    step "On Order Details form, blur out"
    break if stamps.orders.order_details.service.cost > 0
    step "On Order Details form, blur out"
  end
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details Form Insurance to (.+)$/ do |value|
  stamps.orders.order_details.ship_from.select(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details Form Insure Amount to (.+)$/ do |value|
  stamps.orders.order_details.ship_from.select(value)
  step "On Order Details form, blur out"
  step "Save Order Details data"
end

Then /^[Ss]et Multi Order Details form Tracking to USPS Tracking$/ do
  step "set Order Details form Tracking to \"USPS Tracking\""
end

Then /^[Ss]et Multi Order Details form Dimensions to Length (\d+) Width (\d+) Height (\d+)$/ do |length, width, height|
  stamps.orders.order_details.dimensions.length.set length
  stamps.orders.order_details.dimensions.width.set width
  stamps.orders.order_details.dimensions.height.set height
  step "Save Order Details data"
end

Then /^(?:I|i)n Multi Order Form, click Update Orders$/ do
  print_modal = stamps.orders.orders_toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
  sleep(4)
end

Then /^(?:I|i)n Multi Order Form, click Save as Present$/ do
  print_modal = stamps.orders.orders_toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
  sleep(4)
end