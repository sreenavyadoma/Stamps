Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ss]hip [Ff]rom to (.*)$/ do |value|
  test_param[:ship_from] = stamps.orders.multi_order_details.multi_ship_from.select(value)
end

Then /^[Bb]lur [Oo]ut on [Mm]ulti [Oo]rder [Dd]etails [Ff]orm(?:| (\d+)(?:| times))$/ do |count|
  stamps.orders.multi_order_details.blur_out(count)
end

Then /^[Ss]ave [Mm]ulti [Oo]rder [Dd]etails [Dd]ata$/ do

end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Pp]ounds to (.*)$/ do |value|
  test_param[:pounds] = value
  stamps.orders.multi_order_details.weight.lb.set(test_param[:pounds])
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Oo]unces to (.*)$/ do |value|
  test_param[:ounces] = value
  stamps.orders.multi_order_details.weight.oz.set(test_param[:ounces])
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Dd]omestic [Ss]ervice to (.*)$/ do |service|
  test_param[:service] = test_helper.parse_service(stamps.orders.multi_order_details.multi_dom_service.select(service))
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ii]nternational [Ss]ervice to (.*)$/ do |service|
  test_param[:int_service] = test_helper.parse_service(stamps.orders.multi_order_details.multi_int_service.select(service))
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ii]nsurance to (.+)$/ do |value|
  stamps.orders.multi_order_details.insurance.select(value)
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ii]nsure [Aa]mount to (.+)$/ do |value|
  stamps.orders.multi_order_details.insurance.select(value)
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Tt]racking to (.+)$/ do |value|
  #step "set Order Details form Tracking to \"USPS Tracking\""
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set multi order details form length to #{length}"
  step "set multi order details form width to #{width}"
  step "set multi order details form height to #{height}"
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ll]ength to (.*)$/ do |val|
  stamps.orders.multi_order_details.dimensions.length.set(val)
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Ww]idth to (.*)$/ do |val|
  stamps.orders.multi_order_details.dimensions.width.set(val)
end

Then /^[Ss]et [Mm]ulti [Oo]rder [Dd]etails [Ff]orm [Hh]eight to (.*)$/ do |val|
  stamps.orders.multi_order_details.dimensions.height.set(val)
end

Then /^[Cc]lick [Mm]ulti Order [Ff]orm [Uu]pdate [Oo]rder button$/ do
  stamps.orders.multi_order_details.buttons.update_orders
end

Then /^expect multi order details form is present$/ do
  expect(stamps.orders.multi_order_details).to be_present, "Multi Order Details form is not present"
end