Then /^[Ss]et [Bb]ulk [Uu]pdate [Ss]hip [Ff]rom to (.*)$/ do |str|
  test_param[:bulk_ship_from] = stamps.orders.bulk_update.ship_from.select(str)
end

Then /^[Bb]lur [Oo]ut on [Mm]ulti [Oo]rder [Dd]etails [Ff]orm(?:| (\d+)(?:| times))$/ do |count|
  stamps.orders.bulk_update.blur_out(count)
end

Then /^[Ss]ave [Mm]ulti [Oo]rder [Dd]etails [Dd]ata$/ do
  #pending
end

# Update bulk orders
Then /^[Cc]lick [Bb]ulk [Uu]pdate [Oo]rders [Bb]utton$/ do
  step 'expect bulk update orders button is present'
  5.times do
    stamps.orders.bulk_update.update_orders.click
    stamps.orders.bulk_update.updating_orders.wait_while_present(3)
    break unless stamps.orders.bulk_update.updating_orders.present?
  end
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Oo]rders [Bb]utton is present$/ do
  expect(stamps.orders.bulk_update.update_orders).to be_present
end

# Begin Bulk Update Weight steps
Then /^[Ss]et [Bb]ulk [Uu]pdate [Pp]ounds to (.*)$/ do |str|
  stamps.orders.bulk_update.weight.lbs.set(test_param[:bulk_lbs] = str)
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Pp]ounds is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.weight.lbs.text).to eql((str.nil?) ? test_param[:bulk_lbs] : str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Oo]unces to (.*)$/ do |str|
  stamps.orders.bulk_update.weight.oz.set(test_param[:bulk_oz] = str)
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Oo]unces is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.weight.oz.text).to eql((str.nil?) ? test_param[:bulk_oz] : str)
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Ww]eight is (checked|unchecked)$/ do |str|
  expect(checked = stamps.orders.bulk_update.weight.checkbox.checked?).to be((str == 'checked') ? true : false), "Expectation: #{str}, got #{(checked) ? 'checked' : 'uncheck'}"
end

Then /^[Cc]heck [Bb]ulk [Uu]pdate [Ww]eight$/ do
  stamps.orders.bulk_update.weight.checkbox.check
end

Then /^[Uu]ncheck [Bb]ulk [Uu]pdate [Ww]eight$/ do
  stamps.orders.bulk_update.weight.checkbox.uncheck
end

Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Pp]ounds by (.*)$/ do |str|
  (test_param[:bulk_lb_inc] = str).to_i.times {stamps.orders.bulk_update.weight.lbs.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Pp]ounds by (.*)$/ do |str|
  (test_param[:bulk_lb_dec] = str).to_i.times { stamps.orders.bulk_update.weight.lbs.decrement.click }
end

Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Oo]unces by (.*)$/ do |str|
  (test_param[:bulk_oz_inc] = str).to_i.times {stamps.orders.bulk_update.weight.oz.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Oo]unces by (.*)$/ do |str|
  (test_param[:bulk_oz_dec] = str).to_i.times {stamps.orders.bulk_update.weight.oz.decrement.click}
end
# End Bulk Update Weight steps

Then /^[Ss]et [Bb]ulk [Uu]pdate (?:[Dd]omestic |)[Ss]ervice to (.*)$/ do | service |
  test_param[:service] = stamps.orders.bulk_update.domestic_service.select(service).parse_orders_service
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nternational [Ss]ervice to (.*)$/ do |service|
  test_param[:int_service] = stamps.orders.bulk_update.international_service.select(service).parse_orders_service
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nsurance to (.+)$/ do |str|
  stamps.orders.bulk_update.insurance.select(str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ii]nsure [Aa]mount to (.+)$/ do |str|
  stamps.orders.bulk_update.insurance.select(str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Tt]racking to (.+)$/ do |str|
  #step "set Order Details Tracking to \"USPS Tracking\""
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set bulk update length to #{length}"
  step "set bulk update width to #{width}"
  step "set bulk update height to #{height}"
end

Then /^[Cc]heck [Bb]ulk [Uu]pdate [Dd]imensions$/ do
  stamps.orders.bulk_update.dimensions.checkbox.check
end

Then /^[Uu]ncheck [Bb]ulk [Uu]pdate [Dd]imensions$/ do
  stamps.orders.bulk_update.dimensions.checkbox.uncheck
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Dd]imensions is (checked|unchecked)$/ do |str|
  expect(checked = stamps.orders.bulk_update.dimensions.checkbox.checked?).to be((str == 'checked') ? true : false), "Expectation: #{str}, got #{(checked) ? 'checked' : 'uncheck'}"
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ll]ength to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.length.set(test_param[:bulk_length] = str)
  step "expect bulk update length is correct"
end

Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Ll]ength by (.*)$/ do |str|
  (test_param[:bulk_length_inc] = str).to_i.times {stamps.orders.bulk_update.dimensions.length.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Ll]ength by (.*)$/ do |str|
  (test_param[:bulk_length_dec] = str).to_i.times {stamps.orders.bulk_update.dimensions.length.decrement.click}
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Ll]ength is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.length.text).to eql((str.nil?) ? test_param[:bulk_length] : str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Ww]idth to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.width.set(test_param[:bulk_width] = str)
  step "expect bulk update width is correct"
end

Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Ww]idth by (.*)$/ do |str|
  (test_param[:bulk_width_inc] = str).to_i.times {stamps.orders.bulk_update.dimensions.width.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Ww]idth by (.*)$/ do |str|
  (test_param[:bulk_width_dec] = str).to_i.times {stamps.orders.bulk_update.dimensions.width.decrement.click}
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Ww]idth is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.width.text).to eql((str.nil?) ? test_param[:bulk_width] : str)
end

Then /^[Ss]et [Bb]ulk [Uu]pdate [Hh]eight to (.*)$/ do |str|
  stamps.orders.bulk_update.dimensions.height.set(test_param[:bulk_height] = str)
  step "expect bulk update height is correct"
end

Then /^[Ii]ncrement [Bb]ulk [Uu]pdate [Hh]eight by (.*)$/ do |str|
  (test_param[:bulk_height_inc] = str).to_i.times {stamps.orders.bulk_update.dimensions.height.increment.click}
end

Then /^[Dd]ecrement [Bb]ulk [Uu]pdate [Hh]eight by (.*)$/ do |str|
  (test_param[:bulk_height_dec] = str).to_i.times {stamps.orders.bulk_update.dimensions.height.decrement.click}
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate [Hh]eight is (?:correct|(.*))$/ do |str|
  expect(stamps.orders.bulk_update.dimensions.height.text).to eql((str.nil?) ? test_param[:bulk_height] : str)
end

Then /^[Cc]lick [Bb]ulk [Uu]pdate [Uu]pdate [Oo]rder [Bb]utton$/ do
  stamps.orders.bulk_update.update_orders
end

Then /^[Ee]xpect [Bb]ulk [Uu]pdate is present$/ do
  expect(stamps.orders.bulk_update).to be_present, "Multi Order Details form is not present"
end