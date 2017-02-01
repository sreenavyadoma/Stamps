

Then /^Mail: Set Mail From to (.*)/ do |value|
  #logger.step "Mail: Set Mail From to #{value}"
  stamps.mail.ship_from.select(value)
  test_data[:ship_from] = value
end

Then /^Mail: Set Ship-To to Random Address in Zone 1$/ do
  step "Mail: Set Ship-To address to zone 1"
end

Then /^Mail: Set Ship-To to Random Address in Zone 2$/ do
  step "Mail: Set Ship-To address to zone 2"
end

Then /^Mail: Set Ship-To to Random Address in Zone 3$/ do
  step "Mail: Set Ship-To address to zone 3"
end

Then /^Mail: Set Ship-To to Random Address in Zone 4$/ do
  step "Mail: Set Ship-To address to zone 4"
end

Then /^Mail: Set Ship-To to Random Address in Zone 5$/ do
  step "Mail: Set Ship-To address to zone 5"
end

Then /^Mail: Set Ship-To to Random Address in Zone 6$/ do
  step "Mail: Set Ship-To address to zone 6"
end

Then /^Mail: Set Ship-To to Random Address in Zone 7$/ do
  step "Mail: Set Ship-To address to zone 7"
end

Then /^Mail: Set Ship-To to Random Address in Zone 8$/ do
  step "Mail: Set Ship-To address to zone 8"
end

Then /^Mail: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Mail: Set Ship-To address to zone 1 through 4"
end

Then /^Mail: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Mail: Set Ship-To address to zone 5 through 8"
end

#todo-rob refactor
Then /^Mail: Set Ship-To to$/ do |table|
  address = table.hashes.first
  #logger.step "Mail: Set Ship-To to \n#{address}"

  test_data[:ship_to_country] = address['country']
  #logger.step "Ship-To Country:  #{test_data[:ship_to_country]}"

  test_data[:ship_to_name] = (address['name'].downcase.include? "random") ? ParameterHelper.random_name : address['name']
  test_data[:ship_to_company] = (address['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address['company']
  test_data[:ship_to_city] = (address['city'].downcase.include? "random") ? ParameterHelper.random_string : address['city']

  if test_data[:ship_to_country].downcase.include? "united states"
    test_data[:ship_to_street_address] = (address['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address']
    ship_to_state = (address['state'].downcase.include? "random") ? ParameterHelper.random_string : address['state']
    ship_to_zip = (address['zip'].downcase.include? "random") ? ParameterHelper.random_string : address['zip']

    ship_to_address = "#{test_data[:ship_to_name]},#{test_data[:ship_to_company]},#{ship_to_street_address},#{test_data[:ship_to_city]} #{ship_to_state} #{ship_to_zip}"
    #logger.step "Ship-To Address:  #{ship_to_address}"
    step "Mail: Set Ship-To address to #{ship_to_address}"
  else
    ship_to_street_address_1 = (address['street_address_1'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address_1']
    ship_to_street_address_2 = (address['street_address_2'].downcase.include? "random") ? ParameterHelper.random_suite : address['street_address_2']
    ship_to_province = (address['province'].downcase.include? "random") ? ParameterHelper.random_string : address['province']
    ship_to_postal_code = (address['postal_code'].downcase.include? "random") ? ParameterHelper.random_alpha_numeric : address['postal_code']
    ship_to_phone = (address['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address['phone']

    #logger.step "Ship-To Name: #{test_data[:ship_to_name]}"
    #logger.step "Ship-To Company: #{test_data[:ship_to_company]}"
    #logger.step "Ship-To Address 1: #{ship_to_street_address_1}"
    #logger.step "Ship-To Address 2: #{ship_to_street_address_2}"
    #logger.step "Ship-To City: #{test_data[:ship_to_city]}"
    #logger.step "Ship-To Province: #{ship_to_province}"
    #logger.step "Ship-To Postal Code: #{ship_to_postal_code}"
    #logger.step "Ship-To Phone: #{ship_to_phone}"

    step "Mail: Set Ship-To country to #{test_data[:ship_to_country]}"
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
Then /^Mail: Set Ship-To address to (.*)$/ do |address|
  #logger.step "Mail: Set Ship-To to \"#{address}\""
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
      #logger.step "Mail: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = ParameterHelper.rand_zone_2
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = ParameterHelper.rand_zone_3
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = ParameterHelper.rand_zone_4
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = ParameterHelper.rand_zone_5
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = ParameterHelper.rand_zone_6
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = ParameterHelper.rand_zone_7
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = ParameterHelper.rand_zone_8
      formatted_address = ParameterHelper.format_address address
      #logger.step "Mail: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = ParameterHelper.format_address address
  end
  ship_to_dd = ShipTo::PostageCountry.new(param)
  ship_to_dd.select "United States"
  stamps.mail.ship_to.set formatted_address
end

Then /^Mail: Set Ounces to (.*)/ do |ounces|
  #logger.step "Envelopes: Set Print Mail Ounces to: \n #{ounces}"
  stamps.mail.weight.oz.set ounces
end

Then /^Mail: Set Pounds to (.*)/ do |pounds|
  #logger.step "Envelopes: Set Print Mail Pounds to: \n #{pounds}"
  stamps.mail.weight.lb.set pounds
end

Then /^Mail: Expect Print Media Tooltip is (.*)$/ do |selection|
  stamps.mail.print_on.tooltip selection
end

Then /^Mail: Expect Print Media (.*) is disabled$/ do |selection|
  stamps.mail.print_on.disabled? selection
end

Then /^Mail: Expect Print Media (.*) is enabled$/ do |selection|
  stamps.mail.print_on.enabled? selection
end

Then /^Mail: Expect Ship-To address is (.*)/ do |address|

end
#todo major rework here
Then /^Mail: Expect Print On Field is present$/ do
  #logger.step "Mail: Expect Print On Field is present"
  print_on = PrintOn.new(param)
  print_on.text_box.present?.should be true
end

Then /^Mail: Expect Ship From Field is present$/ do
  #logger.step "Mail: Expect Ship From Field is present"
  stamps.mail.ship_from.text_box.present?.should be true
end

Then /^Mail: Expect Ship To Link is present$/ do
  #logger.step "Mail: Expect Ship To Link is present"
  stamps.mail.ship_to.contacts.link.present?.should be true
end

Then /^Mail: Expect Ship To Country Field is present$/ do
  #logger.step "Mail: Expect Ship To Country Field is present"
  stamps.mail.ship_to.country.text_box.present?.should be true
end

Then /^Mail: Expect Domestic Address Field is present$/ do
  #logger.step "Mail: Expect Domestic Address Field is present"
  stamps.mail.ship_to.text_area.present?.should be true
end

Then /^Mail: Expect International Name Field is present$/ do
  #logger.step "Mail: Expect International Name Field is present"
  stamps.mail.ship_to.name.present?.should be true
end

Then /^Mail: Expect International Company Field is present$/ do
  #logger.step "Mail: Expect International Company Field is present"
  stamps.mail.ship_to.company.present?.should be true
end

Then /^Mail: Expect International Address 1 Field is present$/ do
  #logger.step "Mail: Expect International Address 1 Field is present"
  stamps.mail.ship_to.address_1.present?.should be true
end

Then /^Mail: Expect International Address 2 Field is present$/ do
  #logger.step "Mail: Expect International Address 2 Field is present"
  stamps.mail.ship_to.address_2.present?.should be true
end

Then /^Mail: Expect International City Field is present$/ do
  #logger.step "Mail: Expect International City Field is present"
  stamps.mail.ship_to.city.present?.should be true
end

Then /^Mail: Expect International Province Field is present$/ do
  #logger.step "Mail: Expect International Province Field is present"
  stamps.mail.ship_to.province.present?.should be true
end

Then /^Mail: Expect International Postcode Field is present$/ do
  #logger.step "Mail: Expect International Postcode Field is present"
  stamps.mail.ship_to.postal_code.present?.should be true
end

Then /^Mail: Expect International Phone Field is present$/ do
  #logger.step "Mail: Expect International Phone Field is present"
  stamps.mail.ship_to.phone.present?.should be true
end

Then /^Mail: Expect Email Check Box is present$/ do
  #logger.step "Mail: Expect Email Check Box is present"
  stamps.mail.ship_to.email.checkbox.present?.should be true
end

Then /^Mail: Expect Email Field is present$/ do
  #logger.step "Mail: Expect Email Field is present"
  stamps.mail.ship_to.email.text_box.present?.should be true
end

Then /^Mail: Expect Pounds Field is present$/ do
  #logger.step "Mail: Expect Pounds Field is present"
  stamps.mail.weight.oz.text_box.present?.should be true
end

Then /^Mail: Expect Ounces Field is present$/ do
  #logger.step "Mail: Expect Ounces Field is present"
  stamps.mail.weight.lb.text_box.present?.should be true
end

Then /^Mail: Expect Weigh Button is present$/ do
  #logger.step "Mail: Expect Weigh Button is present"
  stamps.mail.weight.weigh_button.present?.should be true
end

Then /^Mail: Expect Auto Weigh check box is present$/ do
  #logger.step "Mail: Expect Auto Weigh check box is present"
  stamps.mail.weight.auto_weigh.present?.should be true
end

Then /^Mail: Expect service Field is present$/ do
  #logger.step "Mail: Expect service Field is present"
  stamps.mail.service.text_box.present?.should be true
end

Then /^Mail: Expect service Price is present$/ do
  #logger.step "Mail: Expect service Price is present"
  stamps.mail.service.price.present?.should be true
end

Then /^Mail: Expect Insure For Field is present$/ do
  #logger.step "Mail: Expect Insure For Field is present"
  stamps.mail.shipping_label.insure_for.text_box.present?.should be true
end

Then /^Mail: Expect Insure For Price is present$/ do
  #logger.step "Mail: Expect Insure For Price is present"
  stamps.mail.shipping_label.insure_for.price.present?.should be true
end

Then /^Mail: Expect Tracking Field is present$/ do
  #logger.step "Mail: Expect Tracking Field is present"
  stamps.mail.shipping_label.tracking.text_box.present?.should be true
end

Then /^Mail: Expect Tracking Price is present$/ do
  #logger.step "Mail: Expect Tracking Price is present"
  stamps.mail.shipping_label.tracking.price.present?.should be true
end

Then /^Mail: Expect Extra Services Button is present$/ do
  #logger.step "Mail: Expect Extra Services Button is present"
  stamps.mail.shipping_label.extra_services.present?.should be true
end

Then /^Mail: Expect Label Image Preview is present$/ do
  #logger.step "Mail: Expect Label Image Preview is present"
  sleep(2)
  stamps.mail.shipping_label.form_view.starting_label.left_label.present?.should be true
  stamps.mail.shipping_label.form_view.starting_label.right_label.present?.should be true
end

Then /^Mail: Expect Hide Mail Value check box is present$/ do
  #logger.step "Mail: Expect Hide Mail Value check box is present"
  stamps.mail.shipping_label.form_view.hide_postage_value.present?.should be true
end

Then /^Mail: Expect Print Receipt check box is present$/ do
  #logger.step "Mail: Expect Print Receipt check box is present"
  stamps.mail.shipping_label.form_view.print_receipt.present?.should be true
end

Then /^Mail: Expect Print Reference Number check box is present$/ do
  #logger.step "Mail: Expect Print Reference Number check box is present"
  stamps.mail.shipping_label.form_view.print_reference_number.present?.should be true
end

Then /^Mail: Expect Reference Number field is present$/ do
  #logger.step "Mail: Expect Reference Number field is present"
  stamps.mail.form_view.reference_number.present?.should be true
end

Then /^Mail: Expect Cost Code Field is present$/ do
  #logger.step "Mail: Expect Cost Code Field is present"
  stamps.mail.form_view.cost_code.text_box.present?.should be true
end

Then /^Mail: Expect Reset Button is present$/ do
  #logger.step "Mail: Expect Reset Button is present"
  toolbar = Toolbar.new(param)
  toolbar.reset.present?.should be true
end

Then /^Mail: Expect Settings Button is present$/ do
  #logger.step "Mail: Expect Settings Button is present"
  toolbar = Toolbar.new(param)
  toolbar.settings.present?.should be true
end

Then /^Mail: Expect Help Button is present$/ do
  #logger.step "Mail: Expect Help Button is present"
  toolbar = Toolbar.new(param)
  toolbar.help.present?.should be true
end

Then /^Mail: Expect Reprint Banner is present$/ do

end

Then /^Mail: Expect System Notification Banner is present$/ do

end

Then /^Mail: Expect Feedback Button is present$/ do
  #logger.step "Mail: Expect Feedback Button is present"
  toolbar = Toolbar.new(param)
  toolbar.feedback.present?.should be true
end

Then /^Mail: Expect Classic Button is present$/ do
  #logger.step "Mail: Expect Classic Button is present"
  toolbar = Toolbar.new(param)
  toolbar.classic.present?.should be true
end

Then /^Mail: Expect Mail Total is present$/ do
  #logger.step "Mail: Expect Mail Total is present"
  stamps.mail.footer.total.present?.should be true
end

Then /^Mail: Expect Print Sample Button is present$/ do
  #logger.step "Mail: Expect Print Sample Button is present"
  stamps.mail.footer.print_button.present?.should be true
end

Then /^Mail: Expect Print Button is present$/ do
  #logger.step "Mail: Expect Print Button is present"
  stamps.mail.footer.sample_button.present?.should be true
end


