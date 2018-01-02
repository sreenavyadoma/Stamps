Then /^[Ss]et [Bb]ulk [Uu]pdate [Ss]hip [Ff]rom to (.*)$/ do |str|
  test_param[:multi_ship_from]=stamps.orders.bulk_update.ship_from.select(str)
end

Then /^[Bb]lur [Oo]ut on [Mm]ulti [Oo]rder [Dd]etails [Ff]orm(?:| (\d+)(?:| times))$/ do |count|
  stamps.orders.bulk_update.blur_out(count)
end

Then /^[Ss]ave [Mm]ulti [Oo]rder [Dd]etails [Dd]ata$/ do

end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Pp]ounds to (.*)$/ do |str|
  stamps.orders.bulk_update.weight.lb.set(test_param[:pounds]=str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Oo]unces to (.*)$/ do |str|
  stamps.orders.bulk_update.weight.oz.set(test_param[:ounces]=str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Dd]omestic [Ss]ervice to (.*)$/ do |service|
  test_param[:service]=test_helper.parse_service(stamps.orders.bulk_update.domestic_service.select(service)) #todo-Rob what is this?
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nternational [Ss]ervice to (.*)$/ do |service|
  test_param[:int_service]=test_helper.parse_service(stamps.orders.bulk_update.international_service.select(service))
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nsurance to (.+)$/ do |str|
  stamps.orders.bulk_update.insurance.select(str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nsure [Aa]mount to (.+)$/ do |str|
  stamps.orders.bulk_update.insurance.select(str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Tt]racking to (.+)$/ do |str|
  #step "set Order Details form Tracking to \"USPS Tracking\""
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set bulk update length to #{length}"
  step "set bulk update width to #{width}"
  step "set bulk update height to #{height}"
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ll]ength to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.length.set(test_param[:bulk_length]=str)
  step "expect bulk update length is correct"
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Ll]ength by (.*)$/ do |str|
  (test_param[:bulk_length_increment]=str).to_i.times {stamps.orders.bulk_update.dimensions.length.increment.click}
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Ll]ength by (.*)$/ do |str|
  (test_param[:bulk_length_decrement]=str).to_i.times {stamps.orders.bulk_update.dimensions.length.decrement.click}
end
#todo-ORDERSAUTO-2261
Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Ll]ength is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.length.text).to eql((str.nil?)?test_param[:bulk_length]:str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ww]idth to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.width.set(test_param[:bulk_width]=str)
  step "expect bulk update width is correct"
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Ww]idth by (.*)$/ do |str|
  (test_param[:bulk_width_increment]=str).to_i.times {stamps.orders.bulk_update.dimensions.width.increment.click}
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Ww]idth by (.*)$/ do |str|
  (test_param[:bulk_width_decrement]=str).to_i.times {stamps.orders.bulk_update.dimensions.width.decrement.click}
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Ww]idth is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.width.text).to eql((str.nil?)?test_param[:bulk_width]:str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Hh]eight to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.height.set(test_param[:bulk_height]=str)
  step "expect bulk update height is correct"
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Hh]eight by (.*)$/ do |str|
  (test_param[:bulk_height_increment]=str).to_i.times {stamps.orders.bulk_update.dimensions.height.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Hh]eight by (.*)$/ do |str|
  (test_param[:bulk_height_decrement]=str).to_i.times {stamps.orders.bulk_update.dimensions.height.decrement.click}
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Hh]eight is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.height.text).to eql((str.nil?)?test_param[:bulk_height]:str)
end

Then /^[Cc]lick [Bb]ulk [Uu]pdate [Uu]pdate [Oo]rder [Bb]utton$/ do
  stamps.orders.bulk_update.update_orders
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate is present$/ do
  expect(stamps.orders.bulk_update).to be_present, "Multi Order Details form is not present"
end