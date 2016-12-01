Then /^Details: Set Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  logger.step "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}"
  @auto_suggest = stamps.orders.order_details.ship_to.address.auto_suggest.set @auto_suggest_partial_name
end

Then /^Details: Set International Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  logger.step "Details: Set International Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}"
  @auto_suggest = stamps.orders.order_details.ship_to.international.auto_suggest.set @auto_suggest_partial_name
end

Then /^Details: Select Ship-To auto-suggest item (\d+)$/ do |item_number|
  logger.step "Details: Select Ship-To auto-suggest item #{item_number}"
  step "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?

  @auto_suggest.select item_number
end

Then /^Details: Expect auto-suggest pop-up entry for Firstname (.*), Lastname (.*), Company (.*)$/ do |firstname, lastname, company|
  step "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?
  @found_item = false
  selection = "#{firstname} #{lastname}, #{company}"
  @auto_suggest.name_fields.each do |field|
    @found_item = true  if field.text.eql? selection
  end
  @found_item.should be true
end

Then /^Expect Auto Suggest name shows (.*) for entry (.*)$/ do |value, entry|
  logger.step "Expect Auto Suggest name shows #{value} for entry #{entry}"
  actual =  stamps.orders.order_details.get_auto_suggest_name entry
  actual.should eql value
end

Then /^Expect Auto Suggest location shows (.*) for entry (.*)$/ do |value, entry|
  logger.step "Expect Auto Suggest location shows #{value} for entry #{entry}"
  actual =  stamps.orders.order_details.get_auto_suggest_location entry
  actual.should eql value
end

Then /^Select entry (.*) in the auto suggest drop down list$/ do |entry|
  logger.step "Select entry #{entry} in the auto suggest drop down list"
  stamps.orders.order_details.click_auto_suggest_name entry
end

Then /^Expect Domestic Address is (.*)$/ do |value|
  logger.step "Expect Domestic Address is #{value}"
  5.times{
  begin
    #actual =  web_apps.orders.order_details.get_address_text
    actual = stamps.orders.order_details.ship_to.address.text_area.text
    actual_stripped = actual.gsub(/\n/,", ")
    break if actual_stripped == value
    sleep 2
  end}
  actual =  stamps.orders.order_details.ship_to.address.text_area.text
  actual_stripped = actual.gsub(/\n/,", ")
  actual_stripped.should eql value
end

Then /^Expect Domestic Phone is (.*)$/ do |value|
  logger.step "Expect Domestic Phone is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect Domestic Email is (.*)$/ do |value|
  logger.step "Expect Domestic Email is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Name is (.*)$/ do |value|
  logger.step "Expect International Name is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect International Company is (.*)$/ do |value|
  logger.step "Expect International Company is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect International Address 1 is (.*)$/ do |value|
  logger.step "Expect International Address 1 is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Address 2 is (.*)$/ do |value|
  logger.step "Expect International Address 2 is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International City is (.*)$/ do |value|
  logger.step "Expect International City is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Province is (.*)$/ do |value|
  logger.step "Expect International Province is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Postal Code is (.*)$/ do |value|
  logger.step "Expect International Postal Code is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Phone is (.*)$/ do |value|
  logger.step "Expect International Postal Code is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Email is (.*)$/ do |value|
  logger.step "Expect International Email is #{value}"
  actual =  stamps.orders.order_details.ship_to.address.email.text
  actual.should eql value
end
