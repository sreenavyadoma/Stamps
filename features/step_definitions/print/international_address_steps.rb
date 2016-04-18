
Then /^Postage: Set Ship-To country to (.*)/ do |country|
  log.info "Postage: Set Ship-To country to #{country}"
  @international_ship_to = @print_postage.ship_to.country country
end

Then /^Postage International Address: Set Ship-To Name to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Name to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.name.send_keys :enter
  else
    @international_ship_to.name.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Company to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Company to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.company.send_keys :enter
  else
    @international_ship_to.company.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Address 1 to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Address 1 to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_1.send_keys :enter
  else
    @international_ship_to.address_1.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Address 2 to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Address 2 to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.address_2.send_keys :enter
  else
    @international_ship_to.address_2.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To City to \"(.*)\"$/ do |value|
  log.info "Set Ship-To City to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.city.send_keys :enter
  else
    @international_ship_to.city.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Province to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Province to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.province.send_keys :enter
  else
    @international_ship_to.province.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Postal Code to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Postal Code to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.postal_code.send_keys :enter
  else
    @international_ship_to.postal_code.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

Then /^Postage International Address: Set Ship-To Phone to \"(.*)\"$/ do |value|
  log.info "Set Ship-To Phone to #{value}"
  raise "International Ship-To fields are not set, make sure Country is selected correctly." if @international_ship_to.nil?
  if value.length == 0
    @international_ship_to.phone.send_keys :enter
  else
    @international_ship_to.phone.set ((value.downcase == "random")? test_helper.random_name : value)
  end
end

