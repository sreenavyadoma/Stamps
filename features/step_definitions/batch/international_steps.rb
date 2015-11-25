Then /^Set Order Details Form Ship-To country to (.*)$/ do |country|
  log.info "Step: Set Order Details Form Ship-To country to #{country}"
  @international_ship_to = batch.order_details.ship_to.country.select country
end

# random, random, 234 Laurier Avenue West, Suite 100, Ottawa, Ontario, K1A, 0G9, random, random
Given /^Set Ship-To to international address$/ do |table|
  log.info "Step: Set Ship-To to international address..."
  param_hash = table.hashes.first

  name = (param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
  company = (param_hash["company"].downcase.include? "random") ? test_helper.random_company_name : param_hash["company"]
  street_address_1 = (param_hash["street_address_1"].downcase.include? "random") ? test_helper.random_string : param_hash["street_address_1"]
  street_address_2 = (param_hash["street_address_2"].downcase.include? "random") ? test_helper.random_suite : param_hash["street_address_2"]
  city = (param_hash["city"].downcase.include? "random") ? test_helper.random_string : param_hash["city"]
  province = (param_hash["province"].downcase.include? "random") ? test_helper.random_string : param_hash["province"]
  postal_code = (param_hash["postal_code"].downcase.include? "random") ? test_helper.random_alpha_numeric : param_hash["postal_code"]
  country = param_hash["country"]
  phone_num = param_hash["phone"]
  phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : param_hash["phone"]
  email_addy = param_hash["email"]
  email = (email_addy.downcase.include? "random") ? test_helper.random_email : param_hash["email"]

  log.info "International Ship-To Name: #{name}"
  log.info "International Ship-To Company: #{company}"
  log.info "International Ship-To Address 1: #{street_address_1}"
  log.info "International Ship-To Address 2: #{street_address_2}"
  log.info "International Ship-To City: #{city}"
  log.info "International Ship-To Province: #{province}"
  log.info "International Ship-To Postal Code: #{postal_code}"
  log.info "International Ship-To Phone: #{phone}"
  log.info "International Ship-To Email: #{email}"

  step "Set Order Details Form Ship-To country to #{country}"
  step "Set International Ship-To Name to \"#{name}\""
  step "Set International Ship-To Company to \"#{company}\""
  step "Set International Ship-To Address 1 to \"#{street_address_1}\""
  step "Set International Ship-To Address 2 to \"#{street_address_2}\""
  step "Set International Ship-To City to \"#{city}\""
  step "Set International Ship-To Province to \"#{province}\""
  step "Set International Ship-To Postal Code to \"#{postal_code}\""
  step "Set International Ship-To Phone to \"#{phone}\""
  step "Set International Ship-To Email to \"#{email}\""
end

Then /^Expect International Ship-To ([\w \d]+) field displays (.*)/ do |ship_to_field, value|
  log.info "Expectation: Expect International Ship-To #{ship_to_field} field displays #{value}"

  @international_ship_to = batch.order_details.ship_to.international if @international_ship_to.nil?

  case ship_to_field.downcase
    when "name"
      actual = @international_ship_to.name.text
      #log_expectation_eql "Name", value, actual
      actual.should eql value
    when "company"
      actual = @international_ship_to.company.text
      #log_expectation_eql "Company", value, actual
      actual.should eql value
    when "address 1"
      actual = @international_ship_to.address_1.text
      #log_expectation_eql "Address 1", value, actual
      actual.should eql value
      sleep 5
    when "address 2"
      actual = @international_ship_to.address_2.text
      #log_expectation_eql "Address 2", value, actual
      actual.should eql value    when "city"
    when "province"
      actual = @international_ship_to.province.text
      #log_expectation_eql "Province", value, actual
      actual.should eql value    when "city"
    when "postal code"
      actual = @international_ship_to.postal_code.text
      #log_expectation_eql "Postal Code", value, actual
      actual.should eql value
    when "phone"
      actual = @international_ship_to.phone.text
      #log_expectation_eql "Phone", value, actual
      actual.should eql value
    when "email"
      actual = @international_ship_to.email.text
      #log_expectation_eql "Email", value, actual
      actual.should eql value
    when "country"
      actual = @international_ship_to.country.text
      if actual[-1] == ' '
        actual = actual.chomp(' ')
      end
      #log_expectation_eql "Country", value, actual
      actual.should eql value
    else
      raise "Illegal Argument Exception.  #{ship_to_field} is not a valid Ship-To field"
  end
end

Then /^Set International Ship-To ([\w \d]+) to \"(.*)\"$/ do |ship_to_field, value|
  log.info "Step: Set International Ship-To #{ship_to_field} to #{value}"
  @international_ship_to = batch.order_details.ship_to.international if @international_ship_to.nil?

  case ship_to_field.downcase

    when "name"
      if value.length == 0
        @international_ship_to.name.send_keys :tab
      else
        @international_ship_to.name.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "company"
      if value.length == 0
        @international_ship_to.company.send_keys :tab
      else
        @international_ship_to.company.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "address 1"
      if value.length == 0
        @international_ship_to.address_1.send_keys :tab
      else
        @international_ship_to.address_1.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "address 2"
      if value.length == 0
        @international_ship_to.address_2.send_keys :tab
      else
        @international_ship_to.address_2.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "city"
      if value.length == 0
        @international_ship_to.city.send_keys :tab
      else
        @international_ship_to.city.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "province"
      if value.length == 0
        @international_ship_to.province.send_keys :tab
      else
        @international_ship_to.province.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "postal code"
      if value.length == 0
        @international_ship_to.postal_code.send_keys :tab
      else
        @international_ship_to.postal_code.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "phone"
      if value.length == 0
        @international_ship_to.phone.send_keys :tab
      else
        @international_ship_to.phone.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    when "email"
      if value.length == 0
        @international_ship_to.email.send_keys :tab
      else
        @international_ship_to.email.set ((value.downcase == "random")? test_helper.random_name : value)
      end

    else
      raise "Illegal Argument Exception.  #{ship_to_field} is not a valid Ship-To field"
  end
end

Given /^Expect Order Details Form International Address fields are visible$/ do
  log.info "Expectation: Expect Order Details Form International Address fields are visible"
  @international_ship_to = batch.order_details.ship_to.international if @international_ship_to.nil?
  @international_ship_to.name.present?.should be true
  @international_ship_to.company.present?.should be true
  @international_ship_to.address_1.present?.should be true
  @international_ship_to.address_2.present?.should be true
  @international_ship_to.city.present?.should be true
  @international_ship_to.province.present?.should be true
  @international_ship_to.postal_code.present?.should be true
  @international_ship_to.phone.present?.should be true
  @international_ship_to.email.present?.should be true
end

Then /^Expect Order Details Form Domestic Ship-To fields are hidden$/ do
  log.info "Expectation: Expect Order Details Form Domestic Ship-To fields are hidden"
  @single_order_form = batch.order_details
  @single_order_form.ship_to.present?.should be false
  @single_order_form.email.present?.should be false
  @single_order_form.phone.present?.should be false
end

Then /^Expect Order Details Form Customs (.+) button is (.+)/ do |button, expectation|
  log.info "Expectation: Expect Order Details Form Customs #{button} button is #{expectation}"
  @single_order_form = batch.order_details
  case button.downcase
    when "restrictions"
      case expectation.downcase
        when "visible"
          @single_order_form.customs.browser_restrictions_button.present?.should be true
          @single_order_form.customs.restrictions.ok
        when "hidden"
          @single_order_form.customs.browser_restrictions_button.present?.should be false
        else
          raise "Illegal argument exception"
      end
    when "edit form"
      case expectation.downcase
        when "visible"
          @single_order_form.customs.browser_edit_form_button.present?.should be true
        when "hidden"
          @single_order_form.customs.browser_edit_form_button.present?.should be false
        when "enabled"
          @single_order_form.customs.browser_edit_form_button.present?.should be true
        when "disabled"
          @single_order_form.customs.browser_edit_form_button.present?.should be false
        else
          raise "Illegal argument exception"
      end
    else
      raise "Illegal argument exception"
  end
end

Given /^Open customs form$/ do
  log.info "Step: Open customs form"
  @customs_form = @single_order_form.customs.edit_form
end

Given /^Set customs form Package Contents to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Package Contents to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.package_contents.select value
  contents = @customs_form.package_contents.text_box.text
  contents.should include value
end

Given /^Set customs form Non-Delivery Options to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Non-Delivery Options to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.non_delivery_options.select value
end

Given /^Set customs form Internal Transaction Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Internal Transaction Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.internal_transaction.select (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
  sleep 1
end

Given /^Set customs form More Info to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form More Info to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.more_info.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Given /^Set customs form ITN# to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form ITN# to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.itn_number.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Given /^Set customs form License# to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form License# to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.license.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Given /^Set customs form Certificate Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Certificate Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.certificate.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Given /^Set customs form Invoice Number to \"(.+)\"$/ do |value|
  log.info "Step: Set customs form Invoice Number to #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  step "Open customs form" unless @customs_form.present?

  @customs_form.invoice.set (value.downcase.include? "random") ? test_helper.random_alpha_numeric : value
end

Given /^Add or Edit Customs Form Item (\d+); Description=(\w+), Qty (\d+), Unit Price ([\d.]+), Weight\(lbs\) (\d+), Weight\(oz\) (\d+) Origin ([\w ]+), Tariff (\d+)$/ do |item_number, description, qty, price, lbs, oz, origin_country, tariff|
  log.info "Step: Add or Edit Customs Form Item #{item_number}; Description=#{description}, Qty #{qty}, Unit Price #{price}, Weight\(lbs\) #{lbs}, Weight\(oz\) #{oz} Origin #{origin_country}, Tariff #{tariff}"
  @customs_item_grid = @customs_form.item_grid
  item = @customs_item_grid.item item_number.to_i
  item.item_description.set (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
  item.qty.set qty
  item.unit_price.set price
  item.lbs.set lbs
  item.oz.set oz
  item.origin_country.select origin_country
  item.hs_tariff.set tariff
end

Given /^Delete Customs Form Item (\d+)$/ do |item_number|
  log.info "Step: Delete Customs Form Item #{item_number}"
  count = @customs_item_grid.line_item_count
  item = @customs_item_grid.item item_number.to_i
  if count > 1
    item.delete.click_while_present
  else
    item.delete.safe_click
  end
end

Given /^Set customs form I agree to (\w+)$/ do |agree_str|
  log.info "Step: Set customs form I agree to #{agree_str}"
  agree = agree_str.downcase == "true"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.i_agree agree
end

Given /^Add Order Details Form Item - Quantity (\d+), ID ([\w ]+), Description ([\w ]+)$/ do |qty, id, description|
  log.info "Step: Add Order Details Form Item - Quantity #{qty}, ID #{id}, Description #{description}"
  line_item = batch.order_details.add_item
  line_item.qty qty
  line_item.id (id.downcase.include? "random") ? test_helper.random_alpha_numeric : id
  line_item.description (description.downcase.include? "random") ? test_helper.random_alpha_numeric : description
end

Given /^Expect Customs Form More Info to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form More Info to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  case value.downcase
    when "hidden"
      @customs_form.more_info.present?.should be false
    when "visible"
      @customs_form.more_info.present?.should be true
    else
      raise "Illegal Parameter Exception. Customs Form More Info \"#{value}\" is not a valid test parameter"
  end
end

Given /^Expect Customs Form License# to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form License# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  case value.downcase
    when "hidden"
      @customs_form.license.present?.should be false
    when "visible"
      @customs_form.license.present?.should be true
    else
      raise "Illegal Parameter Exception. Customs Form More Info \"#{value}\" is not a valid test parameter"
  end
end

Given /^Expect Customs Form Certificate# to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Certificate# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  case value.downcase
    when "hidden"
      @customs_form.certificate.present?.should be false
    when "visible"
      @customs_form.certificate.present?.should be true
    else
      raise "Illegal Parameter Exception. Customs Form More Info \"#{value}\" is not a valid test parameter"
  end
end

Given /^Expect Customs Form Invoice# to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Invoice# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  case value.downcase
    when "hidden"
      @customs_form.invoice.present?.should be false
    when "visible"
      @customs_form.invoice.present?.should be true
    else
      raise "Illegal Parameter Exception. Customs Form More Info \"#{value}\" is not a valid test parameter"
  end
end

Given /^Expect Customs Form ITN# to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form ITN# to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  case value.downcase
    when "hidden"
      @customs_form.itn_number.present?.should be false
    when "visible"
      @customs_form.itn_number.present?.should be true
    else
      raise "Illegal Parameter Exception. Customs Form More Info \"#{value}\" is not a valid test parameter"
  end
end

Given /^Expect Customs Form Internal Transaction # to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Customs Form Internal Transaction # to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  text = @customs_form.internal_transaction.text_box.text
  log.info "Internal Transaction # is #{text}.  Test #{(text.include? "Required")?'Passed':'Failed'}"
  text.should eql value
end

Given /^Expect Customs Form Item Grid count to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Item Grid count to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.item_grid.line_item_count.should eql value.to_i
end

Given /^Expect Customs Form Total Value to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Total Value to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_value
  log.info "Custom Info Actual Total Value: #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Given /^Expect Customs Form Total Pounds to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Total Pounds to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight_lbs
  log.info "Custom Info Actual Total Weight(lbs): #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Given /^Expect Customs Form Total Ounces to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Total Ounces to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight_oz
  log.info "Custom Info Actual Total Weight(Oz): #{browser_value}.  Expected:  #{value}.  Test #{(browser_value == value)?'Passed':'Failed'}"
  browser_value.should eql value
end

Given /^Expect Customs Form Total Weight Data Error to be (.+)$/ do |value|
  log.info "Expectation: Expect Customs Form Total Weight Data Error to be #{value}"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?

  browser_value = @customs_form.total_weight.data_error
  log.info "Total Weight Data Error - #{(browser_value.include? value)?'Passed':'Failed'}.  Expectation:  #{value}, Actual Result:  #{browser_value}"
  browser_value.should include value
end

Given /^Close customs form$/ do
  log.info "Step: Closing customs form"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.close
  log.info "Customs form #{(@customs_form.present?)?'closed':'is still open.'}"
end

Given /^Cancel Customs Form$/ do
  log.info "Step: Cancel customs form"
  @customs_form = @single_order_form.customs_form if @customs_form.nil?
  @customs_form.cancel
end