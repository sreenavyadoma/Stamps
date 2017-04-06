Then /^[Ss]et Order Details form Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  @auto_suggest = stamps.orders.order_details.ship_to.domestic.auto_suggest.set @auto_suggest_partial_name
end

Then /^[Ss]et Order Details form International Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  @auto_suggest = stamps.orders.order_details.ship_to.international.auto_suggest.set @auto_suggest_partial_name
end

Then /^[Oo]n Order Details form, select Ship-To auto-suggest item (\d+)$/ do |item_number|
  step "set Order Details form Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?
  @auto_suggest.select(item_number)
end

Then /^[Ee]xpect Order Details form auto-suggest pop-up entry for Firstname (.*), Lastname (.*), Company (.*)$/ do |firstname, lastname, company|
  step "set Order Details form Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?
  @found_item = false
  selection = "#{firstname} #{lastname}, #{company}"
  @auto_suggest.name_fields.each do |field|
    @found_item = true  if field.text.eql? selection
  end
  expect(@found_item).to be(true)
end

Then /^[Ee]xpect Auto Suggest name shows (.*) for entry (.*)$/ do |value, entry|
  actual =  stamps.orders.order_details.get_auto_suggest_name entry
  expect(actual).to eql value
end

Then /^[Ee]xpect Auto Suggest location shows (.*) for entry (.*)$/ do |value, entry|
  actual =  stamps.orders.order_details.get_auto_suggest_location entry
  expect(actual).to eql value
end

Then /^[Ss]elect entry (.*) in the auto suggest drop down list$/ do |entry|
  stamps.orders.order_details.click_auto_suggest_name entry
end

Then /^[Ee]xpect Domestic Address is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  5.times{
  begin
    actual = stamps.orders.order_details.ship_to.domestic.text_area.text
    actual_stripped = actual.gsub(/\n/,", ")
    break if actual_stripped == value
    sleep(2)
  end}
  actual =  stamps.orders.order_details.ship_to.domestic.text_area.text
  actual_stripped = actual.gsub(/\n/,", ")
  expect(actual_stripped).to eql value
end

Then /^[Ee]xpect Domestic Phone is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.phone.text
  expect(actual).to eql value
end

Then /^[Ee]xpect Domestic Email is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Name is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.phone.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Company is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.phone.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Address 1 is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Address 2 is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International City is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Province is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Postal Code is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Phone is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end

Then /^[Ee]xpect International Email is (.*)$/ do |value|
  stamps.orders.order_details.ship_to.domestic.show_address
  actual =  stamps.orders.order_details.ship_to.domestic.email.text
  expect(actual).to eql value
end
