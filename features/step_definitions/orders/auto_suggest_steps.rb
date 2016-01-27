Then /^Order Details: Set Ship-To address for auto-suggest (.*)$/ do |address|

  orders.details.ship_to.auto_suggest.set address
end

Then /^Expect Auto Suggest name shows (.*) for entry (.*)$/ do |value, entry|
  log.info "Step: Expect Auto Suggest name shows #{value} for entry #{entry}"
  actual =  orders.details.get_auto_suggest_name entry
  #todo-eva Set expectionations in logs
  #log_expectation_eql "Auto Suggest Name", value, actual
  actual.should eql value

end

Then /^Expect Auto Suggest location shows (.*) for entry (.*)$/ do |value, entry|
  log.info "Step: Expect Auto Suggest location shows #{value} for entry #{entry}"
  actual =  orders.details.get_auto_suggest_location entry
  #log_expectation_eql "Auto Suggest Name", value, actual
  actual.should eql value
end

Then /^Select entry (.*) in the auto suggest drop down list$/ do |entry|
  log.info "Step: Select entry #{entry} in the auto suggest drop down list"
  orders.details.click_auto_suggest_name entry
end

Then /^Expect Domestic Address field displays (.*)$/ do |value|
  log.info "Step: Expect Domestic Address field displays #{value}"
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
  #log_expectation_eql "Address text", value, actual_stripped
  actual_stripped.should eql value
end

Then /^Expect Domestic Phone field displays (.*)$/ do |value|
  log.info "Step: Expect Domestic Phone field displays #{value}"
  actual =  orders.details.ship_to.address.phone.text
  #log_expectation_eql "Phone text", value, actual
  actual.should eql value
end

Then /^Expect Domestic Email field displays (.*)$/ do |value|
  log.info "Step: Expect Domestic Email field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Email text", value, actual
  actual.should eql value
end

Then /^Expect International Name field displays (.*)$/ do |value|
  log.info "Step: Expect International Name field displays #{value}"
  actual =  orders.details.ship_to.address.phone.text
  #log_expectation_eql "Name text", value, actual
  actual.should eql value
end

Then /^Expect International Company field displays (.*)$/ do |value|
  log.info "Step: Expect International Company field displays #{value}"
  actual =  orders.details.ship_to.address.phone.text
  #log_expectation_eql "Company text", value, actual
  actual.should eql value
end

Then /^Expect International Address 1 field displays (.*)$/ do |value|
  log.info "Step: Expect International Address 1 field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Address 1 text", value, actual
  actual.should eql value
end

Then /^Expect International Address 2 field displays (.*)$/ do |value|
  log.info "Step: Expect International Address 2 field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Address 2 text", value, actual
  actual.should eql value
end

Then /^Expect International City field displays (.*)$/ do |value|
  log.info "Step: Expect International City field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "City text", value, actual
  actual.should eql value
end

Then /^Expect International Province field displays (.*)$/ do |value|
  log.info "Step: Expect International Province field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Province text", value, actual
  actual.should eql value
end

Then /^Expect International Postal Code field displays (.*)$/ do |value|
  log.info "Step: Expect International Postal Code field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Postal Code text", value, actual
  actual.should eql value
end

Then /^Expect International Phone field displays (.*)$/ do |value|
  log.info "Step: Expect International Postal Code field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Phone text", value, actual
  actual.should eql value
end

Then /^Expect International Email field displays (.*)$/ do |value|
  log.info "Step: Expect International Email field displays #{value}"
  actual =  orders.details.ship_to.address.email.text
  #log_expectation_eql "Email text", value, actual
  actual.should eql value
end
