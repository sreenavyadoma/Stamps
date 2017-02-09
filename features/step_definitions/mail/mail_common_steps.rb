

Then /^on Print form, set Mail From to (.*)/ do |value|
  test_data[:ship_from] = value
  stamps.mail.ship_from.select(value)
end

Then /^on Print form, set Ship-To to Random Address in Zone 1$/ do
  step "on Print form, set Ship-To address to zone 1"
end

Then /^on Print form, set Ship-To to Random Address in Zone 2$/ do
  step "on Print form, set Ship-To address to zone 2"
end

Then /^on Print form, set Ship-To to Random Address in Zone 3$/ do
  step "on Print form, set Ship-To address to zone 3"
end

Then /^on Print form, set Ship-To to Random Address in Zone 4$/ do
  step "on Print form, set Ship-To address to zone 4"
end

Then /^on Print form, set Ship-To to Random Address in Zone 5$/ do
  step "on Print form, set Ship-To address to zone 5"
end

Then /^on Print form, set Ship-To to Random Address in Zone 6$/ do
  step "on Print form, set Ship-To address to zone 6"
end

Then /^on Print form, set Ship-To to Random Address in Zone 7$/ do
  step "on Print form, set Ship-To address to zone 7"
end

Then /^on Print form, set Ship-To to Random Address in Zone 8$/ do
  step "on Print form, set Ship-To address to zone 8"
end

Then /^on Print form, set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "on Print form, set Ship-To address to zone 1 through 4"
end

Then /^on Print form, set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "on Print form, set Ship-To address to zone 5 through 8"
end

#todo-rob refactor
Then /^on Print form, set Ship-To to$/ do |table|
  address = table.hashes.first
  #logger.step "on Print form, set Ship-To to \n#{address}"

  test_data[:ship_to_country] = address['country']
  #logger.step "Ship-To Country:  #{test_data[:ship_to_country]}"

  test_data[:ship_to_name] = (address['name'].downcase.include? 'random') ? ParameterHelper.random_name : address['name']
  test_data[:ship_to_company] = (address['company'].downcase.include? 'random') ? ParameterHelper.random_company_name : address['company']
  test_data[:ship_to_city] = (address['city'].downcase.include? 'random') ? ParameterHelper.random_string : address['city']

  if test_data[:ship_to_country].downcase.include? "united states"
    test_data[:ship_to_street_address] = (address['street_address'].downcase.include? 'random') ? ParameterHelper.random_string : address['street_address']
    ship_to_state = (address['state'].downcase.include? 'random') ? ParameterHelper.random_string : address['state']
    ship_to_zip = (address['zip'].downcase.include? 'random') ? ParameterHelper.random_string : address['zip']

    ship_to_address = "#{test_data[:ship_to_name]},#{test_data[:ship_to_company]},#{ship_to_street_address},#{test_data[:ship_to_city]} #{ship_to_state} #{ship_to_zip}"
    #logger.step "Ship-To Address:  #{ship_to_address}"
    step "on Print form, set Ship-To address to #{ship_to_address}"
  else
    ship_to_street_address_1 = (address['street_address_1'].downcase.include? 'random') ? ParameterHelper.random_string : address['street_address_1']
    ship_to_street_address_2 = (address['street_address_2'].downcase.include? 'random') ? ParameterHelper.random_suite : address['street_address_2']
    ship_to_province = (address['province'].downcase.include? 'random') ? ParameterHelper.random_string : address['province']
    ship_to_postal_code = (address['postal_code'].downcase.include? 'random')?ParameterHelper.random_alpha_numeric : address['postal_code']
    ship_to_phone = (address['phone'].downcase.include? 'random') ? ParameterHelper.random_phone : address['phone']

    #logger.step "Ship-To Name: #{test_data[:ship_to_name]}"
    #logger.step "Ship-To Company: #{test_data[:ship_to_company]}"
    #logger.step "Ship-To Address 1: #{ship_to_street_address_1}"
    #logger.step "Ship-To Address 2: #{ship_to_street_address_2}"
    #logger.step "Ship-To City: #{test_data[:ship_to_city]}"
    #logger.step "Ship-To Province: #{ship_to_province}"
    #logger.step "Ship-To Postal Code: #{ship_to_postal_code}"
    #logger.step "Ship-To Phone: #{ship_to_phone}"

    step "on Print form, set Ship-To country to #{test_data[:ship_to_country]}"
    step "Mail International: Set Ship-To Name to \"#{test_data[:ship_to_name]}\""
    step "Mail International: Set Ship-To Company to \"#{ship_to_company}\""
    step "Mail International: Set Ship-To Address 1 to \"#{ship_to_street_address_1}\""
    step "Mail International: Set Ship-To Address 2 to \"#{ship_to_street_address_2}\""
    step "Mail International: Set Ship-To City to \"#{ship_to_city}\""
    step "Mail International: Set Ship-To Province to \"#{ship_to_province}\""
    step "Mail International: Set Ship-To Postal Code to \"#{ship_to_postal_code}\""
    step "Mail International: Set Ship-To Phone to \"#{ship_to_phone}\""
  end
end

#todo-rob refactor ship-to random address
Then /^on Print form, set Ship-To address to (.*)$/ do |address|
  #logger.step "on Print form, set Ship-To to \"#{address}\""
  case address.downcase
    when /zone 1 through 4/
      address = ParameterHelper.rand_zone_1_4
      formatted_address = ParameterHelper.format_address address
      #logger.step "Envelopes: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = ParameterHelper.rand_zone_5_8
      formatted_address = ParameterHelper.format_address address
      #logger.step "Envelopes: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = ParameterHelper.rand_zone_1
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = ParameterHelper.rand_zone_2
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = ParameterHelper.rand_zone_3
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = ParameterHelper.rand_zone_4
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = ParameterHelper.rand_zone_5
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = ParameterHelper.rand_zone_6
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = ParameterHelper.rand_zone_7
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = ParameterHelper.rand_zone_8
      formatted_address = ParameterHelper.format_address address
      #logger.step "on Print form, set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = ParameterHelper.format_address address
  end
  ship_to_dd = ShipTo::PostageCountry.new(param)
  ship_to_dd.select "United States"
  stamps.mail.ship_to.set formatted_address
end

Then /^on Print form, set Ounces to (.*)/ do |ounces|
  #logger.step "Envelopes: Set Print Mail Ounces to: \n #{ounces}"
  stamps.mail.weight.oz.set ounces
end

Then /^on Print form, set Pounds to (.*)/ do |pounds|
  #logger.step "Envelopes: Set Print Mail Pounds to: \n #{pounds}"
  stamps.mail.weight.lb.set pounds
end

Then /^on Print form, expect Print Media Tooltip is (.*)$/ do |selection|
  stamps.mail.print_on.tooltip selection
end

Then /^on Print form, expect Print Media (.*) is disabled$/ do |selection|
  stamps.mail.print_on.disabled? selection
end

Then /^on Print form, expect Print Media (.*) is enabled$/ do |selection|
  stamps.mail.print_on.enabled? selection
end

Then /^on Print form, expect Ship-To address is (.*)/ do |address|

end
#todo major rework here
Then /^on Print form, expect Print On Field is present$/ do
  print_on = PrintOn.new(param)
  expect(print_on.text_box.present?).to be true
end

Then /^on Print form, expect Ship From Field is present$/ do
  expect(stamps.mail.ship_from.text_box.present?).to be true
end

Then /^on Print form, expect Ship To Link is present$/ do
  expect(stamps.mail.ship_to.contacts.link.present?).to be true
end

Then /^on Print form, expect Ship To Country Field is present$/ do
  expect(stamps.mail.ship_to.country.text_box.present?).to be true
end

Then /^on Print form, expect Domestic Address Field is present$/ do
  expect(stamps.mail.ship_to.text_area.present?).to be true
end

Then /^on Print form, expect International Name Field is present$/ do
  expect(stamps.mail.ship_to.name.present?).to be true
end

Then /^on Print form, expect International Company Field is present$/ do
  expect(stamps.mail.ship_to.company.present?).to be true
end

Then /^on Print form, expect International Address 1 Field is present$/ do
  expect(stamps.mail.ship_to.address_1.present?).to be true
end

Then /^on Print form, expect International Address 2 Field is present$/ do
  expect(stamps.mail.ship_to.address_2.present?).to be true
end

Then /^on Print form, expect International City Field is present$/ do
  expect(stamps.mail.ship_to.city.present?).to be true
end

Then /^on Print form, expect International Province Field is present$/ do
  expect(stamps.mail.ship_to.province.present?).to be true
end

Then /^on Print form, expect International Postcode Field is present$/ do
  expect(stamps.mail.ship_to.postal_code.present?).to be true
end

Then /^on Print form, expect International Phone Field is present$/ do
  expect(stamps.mail.ship_to.phone.present?).to be true
end

Then /^on Print form, expect Email Check Box is present$/ do
  expect(stamps.mail.ship_to.email.checkbox.present?).to be true
end

Then /^on Print form, expect Email Field is present$/ do
  expect(stamps.mail.ship_to.email.text_box.present?).to be true
end

Then /^on Print form, expect Pounds Field is present$/ do
  expect(stamps.mail.weight.oz.text_box.present?).to be true
end

Then /^on Print form, expect Ounces Field is present$/ do
  expect(stamps.mail.weight.lb.text_box.present?).to be true
end

Then /^on Print form, expect Weigh Button is present$/ do
  expect(stamps.mail.weight.weigh_button.present?).to be true
end

Then /^on Print form, expect Auto Weigh check box is present$/ do
  expect(stamps.mail.weight.auto_weigh.present?).to be true
end

Then /^on Print form, expect service Field is present$/ do
  expect(stamps.mail.service.text_box.present?).to be true
end

Then /^on Print form, expect service Price is present$/ do
  expect(stamps.mail.service.price.present?).to be true
end

Then /^on Print form, expect Insure For Field is present$/ do
  expect(stamps.mail.shipping_label.insure_for.text_box.present?).to be true
end

Then /^on Print form, expect Insure For Price is present$/ do
  expect(stamps.mail.shipping_label.insure_for.price.present?).to be true
end

Then /^on Print form, expect Tracking Field is present$/ do
  expect(stamps.mail.shipping_label.tracking.text_box.present?).to be true
end

Then /^on Print form, expect Tracking Price is present$/ do
  expect(stamps.mail.shipping_label.tracking.price.present?).to be true
end

Then /^on Print form, expect Extra Services Button is present$/ do
  expect(stamps.mail.shipping_label.extra_services.present?).to be true
end

Then /^on Print form, expect Label Image Preview is present$/ do
  sleep(1)
  expect(stamps.mail.shipping_label.form_view.starting_label.left_label.present?).to be true
  expect(stamps.mail.shipping_label.form_view.starting_label.right_label.present?).to be true
end

Then /^on Print form, expect Hide Mail Value check box is present$/ do
  expect(stamps.mail.shipping_label.form_view.hide_postage_value.present?).to be true
end

Then /^on Print form, expect Print Receipt check box is present$/ do
  expect(stamps.mail.shipping_label.form_view.print_receipt.present?).to be true
end

Then /^on Print form, expect Print Reference Number check box is present$/ do
  expect(stamps.mail.shipping_label.form_view.print_reference_number.present?).to be true
end

Then /^on Print form, expect Reference Number field is present$/ do
  expect(stamps.mail.form_view.reference_number.present?).to be true
end

Then /^on Print form, expect Cost Code Field is present$/ do
  expect(stamps.mail.form_view.cost_code.text_box.present?).to be true
end

Then /^on Print form, expect Reset Button is present$/ do
  #logger.step "on Print form, expect Reset Button is present"
  toolbar = Toolbar.new(param)
  expect(toolbar.reset.present?).to be true
end

Then /^on Print form, expect Settings Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.settings.present?).to be true
end

Then /^on Print form, expect Help Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.help.present?).to be true
end

Then /^on Print form, expect Reprint Banner is present$/ do

end

Then /^on Print form, expect System Notification Banner is present$/ do

end

Then /^on Print form, expect Feedback Button is present$/ do
  toolbar = Toolbar.new(param) # STUPID!
  expect(toolbar.feedback.present?).to be true
end

Then /^on Print form, expect Classic Button is present$/ do
  toolbar = Toolbar.new(param)
  expect(toolbar.classic.present?).to be true
end

Then /^on Print form, expect Mail Total is present$/ do
  expect(stamps.mail.footer.total.present?).to be true
end

Then /^on Print form, expect Print Sample Button is present$/ do
  expect(stamps.mail.footer.print_button.present?).to be true
end

Then /^on Print form, expect Print Button is present$/ do
  expect(stamps.mail.footer.sample_button.present?).to be true
end


