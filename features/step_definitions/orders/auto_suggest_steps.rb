Then /^Details: Set Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  log.info "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}"
  @auto_suggest = orders.details.ship_to.address.auto_suggest.set @auto_suggest_partial_name
end

Then /^Details: Set International Ship-To auto-suggest address to partial name (.*)$/ do |partial_name|
  @auto_suggest_partial_name = partial_name
  log.info "Details: Set International Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}"
  @auto_suggest = orders.details.ship_to.international.auto_suggest.set @auto_suggest_partial_name
end

Then /^Details: Select Ship-To auto-suggest item (\d+)$/ do |item_number|
  log.info "Details: Select Ship-To auto-suggest item #{item_number}"
  step "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?

  @auto_suggest.select item_number
end

Then /^Details: Expect auto-uggest pop-up entry for Firstname (.*), Lastname (.*), Company (.*)$/ do |firstname, lastname, company|
  step "Details: Set Ship-To auto-suggest address to partial name #{@auto_suggest_partial_name}" unless @auto_suggest.present?
  @found_item = false
  selection = "#{firstname} #{lastname}, #{company}"
  @auto_suggest.name_fields.each do |field|
    @found_item = true  if field.text.eql? selection
  end
  log.info "Test #{(@found_item)?"passed":"failed"}"
  @found_item.should be true
end

Then /^Details: Expect Domestic Ship-To Company to be (.*)$/ do |company|
  ship_to = orders.details.ship_to.address.text_area.text
  log.info "Test #{(company.include? company)?"Passed":"Failed"} - #{company}"
  ship_to.should include company
end

Then /^Details: Expect Domestic Ship-To Name to be (.*)$/ do |name|
  ship_to = orders.details.ship_to.address.text_area.text
  log.info "Test #{(ship_to.include? name)?"Passed":"Failed"} "
  ship_to.should include name
end

Then /^Expect Auto Suggest name shows (.*) for entry (.*)$/ do |value, entry|
  log.info "Step: Expect Auto Suggest name shows #{value} for entry #{entry}"
  actual =  orders.details.get_auto_suggest_name entry
  actual.should eql value

end

Then /^Expect Auto Suggest location shows (.*) for entry (.*)$/ do |value, entry|
  log.info "Step: Expect Auto Suggest location shows #{value} for entry #{entry}"
  actual =  orders.details.get_auto_suggest_location entry
  actual.should eql value
end

Then /^Select entry (.*) in the auto suggest drop down list$/ do |entry|
  log.info "Step: Select entry #{entry} in the auto suggest drop down list"
  orders.details.click_auto_suggest_name entry
end

Then /^Expect Domestic Address to be (.*)$/ do |value|
  log.info "Step: Expect Domestic Address to be #{value}"
  5.times{
  begin
    #actual =  orders.order_details.get_address_text
    actual = orders.details.ship_to.address.text_area.text
    actual_stripped = actual.gsub(/\n/,", ")
    break if actual_stripped == value
    sleep 2
  end}
  actual =  orders.details.ship_to.address.text_area.text
  actual_stripped = actual.gsub(/\n/,", ")
  actual_stripped.should eql value
end

Then /^Expect Domestic Phone to be (.*)$/ do |value|
  log.info "Step: Expect Domestic Phone to be #{value}"
  actual =  orders.details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect Domestic Email to be (.*)$/ do |value|
  log.info "Step: Expect Domestic Email to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Name to be (.*)$/ do |value|
  log.info "Step: Expect International Name to be #{value}"
  actual =  orders.details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect International Company to be (.*)$/ do |value|
  log.info "Step: Expect International Company to be #{value}"
  actual =  orders.details.ship_to.address.phone.text
  actual.should eql value
end

Then /^Expect International Address 1 to be (.*)$/ do |value|
  log.info "Step: Expect International Address 1 to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Address 2 to be (.*)$/ do |value|
  log.info "Step: Expect International Address 2 to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International City to be (.*)$/ do |value|
  log.info "Step: Expect International City to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Province to be (.*)$/ do |value|
  log.info "Step: Expect International Province to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Postal Code to be (.*)$/ do |value|
  log.info "Step: Expect International Postal Code to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Phone to be (.*)$/ do |value|
  log.info "Step: Expect International Postal Code to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end

Then /^Expect International Email to be (.*)$/ do |value|
  log.info "Step: Expect International Email to be #{value}"
  actual =  orders.details.ship_to.address.email.text
  actual.should eql value
end
