# encoding: utf-8

Then /^Postage: Select Stamps$/ do
  step "Postage: Set Print On Stamps"
end

Then /^Postage: Select Roll 4 ⅛ x 6 ¼$/ do
  step "Postage: Set Print On Roll - 4 ⅛” x 6 ¼” Shipping Label"
end

Then /^Postage: Select Roll 4 x 6$/ do
  step "Postage: Set Print On Roll - 4” x 6” Shipping Label"
end

Then /^Postage: Select Shipping Label 8 x 11$/ do
  step "Postage: Set Print On Shipping Label - 8 ½” x 11” Paper"
end

Then /^Postage: Select Shipping Label SDC-1200$/ do
  step "Postage: Set Print On Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
end

Then /^Postage: Select Shipping Label 5 x 8$/ do
  step "Postage: Set Print On Shipping Label - 5 ½” x 8 ½”"
end

Then /^Postage: Select Envelope - #10$/ do
  step "Postage: Set Print On Envelope - #10, 4 ⅛” x 9 ½”"
end

Then /^Postage: Select Envelope - #6$/ do
  step "Postage: Set Print On Envelope - #6, 3 ⅝” x 6 ½”"
end

Then /^Postage: Select Envelope - #7$/ do
  step "Postage: Set Print On Envelope - #7, 3 ⅞” x 7 ½”"
end

Then /^Postage: Select Envelope - #9$/ do
  step "Postage: Set Print On Envelope - #9, 3 ⅞” x 8 ⅞”"
end

Then /^Postage: Select Envelope - #11$/ do
  step "Postage: Set Print On Envelope - #11, 4 ½” x 10 ⅜”"
end

Then /^Postage: Select Envelope - #12$/ do
  step "Postage: Set Print On Envelope - #12, 4 ¾” x 11”"
end

Then /^Postage: Select Envelope - #A2$/ do
  step "Postage: Set Print On Envelope - #A2, 4 ⅜” x 5 ¾”"
end

Then /^Postage: Select Envelope - #A9$/ do
  step "Postage: Set Print On Envelope - #A9, 5 ¾” x 8 ¾”"
end

Then /^Postage: Select Certified Mail SDC-3610$/ do
  step "Postage: Set Print On Certified Mail Label - Stamps.com SDC-3610"
end

Then /^Postage: Select Certified Mail SDC-3710$/ do
  step "Postage: Set Print On Certified Mail Label - Stamps.com SDC-3710"
end

Then /^Postage: Select Certified Mail SDC-3910$/ do
  step "Postage: Set Print On Certified Mail Label - Stamps.com SDC-3910"
end

Then /^Postage: Select Certified Mail SDC-3810$/ do
  step "Postage: Set Print On Certified Mail #11 Envelope - Stamps.com SDC-3810"
end

Then /^Postage: Set Print On (.*)/ do |media|
  logger.info "Postage: Set Print On #{media}"
  web_apps.mail.print_on media
end

Then /^Postage: Set Ship-From to (.*)/ do |value|
  logger.info "Postage: Set Ship-From to #{value}"
  web_apps.mail.ship_from.select value
end

Then /^Postage: Set Ship-To to Random Address in Zone 1$/ do
  step "Postage: Set Ship-To address to zone 1"
end

Then /^Postage: Set Ship-To to Random Address in Zone 2$/ do
  step "Postage: Set Ship-To address to zone 2"
end

Then /^Postage: Set Ship-To to Random Address in Zone 3$/ do
  step "Postage: Set Ship-To address to zone 3"
end

Then /^Postage: Set Ship-To to Random Address in Zone 4$/ do
  step "Postage: Set Ship-To address to zone 4"
end

Then /^Postage: Set Ship-To to Random Address in Zone 5$/ do
  step "Postage: Set Ship-To address to zone 5"
end

Then /^Postage: Set Ship-To to Random Address in Zone 6$/ do
  step "Postage: Set Ship-To address to zone 6"
end

Then /^Postage: Set Ship-To to Random Address in Zone 7$/ do
  step "Postage: Set Ship-To address to zone 7"
end

Then /^Postage: Set Ship-To to Random Address in Zone 8$/ do
  step "Postage: Set Ship-To address to zone 8"
end

Then /^Postage: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Postage: Set Ship-To address to zone 1 through 4"
end

Then /^Postage: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Postage: Set Ship-To address to zone 5 through 8"
end

Then /^Postage: Set Ship-To to$/ do |table|
  address = table.hashes.first
  logger.info "Postage: Set Ship-To to \n#{address}"

  @ship_to_country = address['country']
  logger.info "Ship-To Country:  #{@ship_to_country}"

  @ship_to_name = (address['name'].downcase.include? "random") ? ParameterHelper.random_name : address['name']
  @ship_to_company = (address['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address['company']
  @ship_to_city = (address['city'].downcase.include? "random") ? ParameterHelper.random_string : address['city']

  if @ship_to_country.downcase.include? "united states"
    @ship_to_street_address = (address['street_address'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address']
    @ship_to_state = (address['state'].downcase.include? "random") ? ParameterHelper.random_string : address['state']
    @ship_to_zip = (address['zip'].downcase.include? "random") ? ParameterHelper.random_string : address['zip']

    ship_to_address = "#{@ship_to_name},#{@ship_to_company},#{@ship_to_street_address},#{@ship_to_city} #{@ship_to_state} #{@ship_to_zip}"
    logger.info "Ship-To Address:  #{ship_to_address}"
    step "Postage: Set Ship-To address to #{ship_to_address}"
  else
    @ship_to_street_address_1 = (address['street_address_1'].downcase.include? "random") ? ParameterHelper.random_string : address['street_address_1']
    @ship_to_street_address_2 = (address['street_address_2'].downcase.include? "random") ? ParameterHelper.random_suite : address['street_address_2']
    @ship_to_province = (address['province'].downcase.include? "random") ? ParameterHelper.random_string : address['province']
    @ship_to_postal_code = (address['postal_code'].downcase.include? "random") ? ParameterHelper.random_alpha_numeric : address['postal_code']
    @ship_to_phone = (address['phone'].downcase.include? "random") ? ParameterHelper.random_phone : address['phone']

    logger.info "Ship-To Name: #{@ship_to_name}"
    logger.info "Ship-To Company: #{@ship_to_company}"
    logger.info "Ship-To Address 1: #{@ship_to_street_address_1}"
    logger.info "Ship-To Address 2: #{@ship_to_street_address_2}"
    logger.info "Ship-To City: #{@ship_to_city}"
    logger.info "Ship-To Province: #{@ship_to_province}"
    logger.info "Ship-To Postal Code: #{@ship_to_postal_code}"
    logger.info "Ship-To Phone: #{@ship_to_phone}"

    step "Postage: Set Ship-To country to #{@ship_to_country}"
    step "Postage International: Set Ship-To Name to \"#{@ship_to_name}\""
    step "Postage International: Set Ship-To Company to \"#{@ship_to_company}\""
    step "Postage International: Set Ship-To Address 1 to \"#{@ship_to_street_address_1}\""
    step "Postage International: Set Ship-To Address 2 to \"#{@ship_to_street_address_2}\""
    step "Postage International: Set Ship-To City to \"#{@ship_to_city}\""
    step "Postage International: Set Ship-To Province to \"#{@ship_to_province}\""
    step "Postage International: Set Ship-To Postal Code to \"#{@ship_to_postal_code}\""
    step "Postage International: Set Ship-To Phone to \"#{@ship_to_phone}\""
  end
end

Then /^Postage: Set Ship-To address to (.*)$/ do |address|
  logger.info "Postage: Set Ship-To to \"#{address}\""
  case address.downcase
    when /zone 1 through 4/
      address = ParameterHelper.rand_zone_1_4
      formatted_address = ParameterHelper.format_address address
      logger.info "Envelopes: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = ParameterHelper.rand_zone_5_8
      formatted_address = ParameterHelper.format_address address
      logger.info "Envelopes: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = ParameterHelper.rand_zone_1
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = ParameterHelper.rand_zone_2
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = ParameterHelper.rand_zone_3
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = ParameterHelper.rand_zone_4
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = ParameterHelper.rand_zone_5
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = ParameterHelper.rand_zone_6
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = ParameterHelper.rand_zone_7
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = ParameterHelper.rand_zone_8
      formatted_address = ParameterHelper.format_address address
      logger.info "Postage: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = ParameterHelper.format_address address
  end
  ship_to_dd = ShipTo::PostageCountry.new param
  ship_to_dd.select "United States"
  web_apps.mail.ship_to.set formatted_address
end

Then /^Postage: Set Ounces to (.*)/ do |ounces|
  logger.info "Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  web_apps.mail.weight.oz.set ounces
end

Then /^Postage: Set Pounds to (.*)/ do |pounds|
  logger.info "Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  web_apps.mail.weight.lbs.set pounds
end

Then /^Postage: Expect Print Media Tooltip to be (.*)$/ do |selection|
  web_apps.mail.print_on.tooltip selection
end

Then /^Postage: Expect Print Media (.*) to be disabled$/ do |selection|
  web_apps.mail.print_on.disabled? selection
end

Then /^Postage: Expect Print Media (.*) to be enabled$/ do |selection|
  web_apps.mail.print_on.enabled? selection
end

Then /^Postage: Expect Ship-To address to be (.*)/ do |address|

end

Then /^Postage: Expect Print On Field is present$/ do
  logger.info "Postage: Expect Print On Field is present"
  print_on = PrintOn.new param
  print_on.text_box.present?.should be true
end

Then /^Postage: Expect Ship From Field is present$/ do
  logger.info "Postage: Expect Ship From Field is present"
  web_apps.mail.ship_from.text_box.present?.should be true
end

Then /^Postage: Expect Ship To Link is present$/ do
  logger.info "Postage: Expect Ship To Link is present"
  web_apps.mail.ship_to.contacts.link.present?.should be true
end

Then /^Postage: Expect Ship To Country Field is present$/ do
  logger.info "Postage: Expect Ship To Country Field is present"
  web_apps.mail.ship_to.country.text_box.present?.should be true
end

Then /^Postage: Expect Domestic Address Field is present$/ do
  logger.info "Postage: Expect Domestic Address Field is present"
  web_apps.mail.ship_to.text_area.present?.should be true
end

Then /^Postage: Expect International Name Field is present$/ do
  logger.info "Postage: Expect International Name Field is present"
  web_apps.mail.ship_to.name.present?.should be true
end

Then /^Postage: Expect International Company Field is present$/ do
  logger.info "Postage: Expect International Company Field is present"
  web_apps.mail.ship_to.company.present?.should be true
end

Then /^Postage: Expect International Address 1 Field is present$/ do
  logger.info "Postage: Expect International Address 1 Field is present"
  web_apps.mail.ship_to.address_1.present?.should be true
end

Then /^Postage: Expect International Address 2 Field is present$/ do
  logger.info "Postage: Expect International Address 2 Field is present"
  web_apps.mail.ship_to.address_2.present?.should be true
end

Then /^Postage: Expect International City Field is present$/ do
  logger.info "Postage: Expect International City Field is present"
  web_apps.mail.ship_to.city.present?.should be true
end

Then /^Postage: Expect International Province Field is present$/ do
  logger.info "Postage: Expect International Province Field is present"
  web_apps.mail.ship_to.province.present?.should be true
end

Then /^Postage: Expect International Postcode Field is present$/ do
  logger.info "Postage: Expect International Postcode Field is present"
  web_apps.mail.ship_to.postal_code.present?.should be true
end

Then /^Postage: Expect International Phone Field is present$/ do
  logger.info "Postage: Expect International Phone Field is present"
  web_apps.mail.ship_to.phone.present?.should be true
end

Then /^Postage: Expect Email Check Box is present$/ do
  logger.info "Postage: Expect Email Check Box is present"
  web_apps.mail.ship_to.email.checkbox_element.present?.should be true
end

Then /^Postage: Expect Email Field is present$/ do
  logger.info "Postage: Expect Email Field is present"
  web_apps.mail.ship_to.email.text_box.present?.should be true
end

Then /^Postage: Expect Pounds Field is present$/ do
  logger.info "Postage: Expect Pounds Field is present"
  web_apps.mail.weight.oz.text_box.present?.should be true
end

Then /^Postage: Expect Ounces Field is present$/ do
  logger.info "Postage: Expect Ounces Field is present"
  web_apps.mail.weight.lbs.text_box.present?.should be true
end

Then /^Postage: Expect Weigh Button is present$/ do
  logger.info "Postage: Expect Weigh Button is present"
  web_apps.mail.weight.weigh_button.present?.should be true
end

Then /^Postage: Expect Auto Weigh check box is present$/ do
  logger.info "Postage: Expect Auto Weigh check box is present"
  web_apps.mail.weight.auto_weigh.checkbox_element.present?.should be true
end

Then /^Postage: Expect Service Field is present$/ do
  logger.info "Postage: Expect Service Field is present"
  web_apps.mail.service.text_box.present?.should be true
end

Then /^Postage: Expect Service Price is present$/ do
  logger.info "Postage: Expect Service Price is present"
  web_apps.mail.service.price.present?.should be true
end

Then /^Postage: Expect Insure For Field is present$/ do
  logger.info "Postage: Expect Insure For Field is present"
  web_apps.mail.insure_for.text_box.present?.should be true
end

Then /^Postage: Expect Insure For Price is present$/ do
  logger.info "Postage: Expect Insure For Price is present"
  web_apps.mail.insure_for.price.present?.should be true
end

Then /^Postage: Expect Tracking Field is present$/ do
  logger.info "Postage: Expect Tracking Field is present"
  web_apps.mail.tracking.text_box.present?.should be true
end

Then /^Postage: Expect Tracking Price is present$/ do
  logger.info "Postage: Expect Tracking Price is present"
  web_apps.mail.tracking.price.present?.should be true
end

Then /^Postage: Expect Extra Services Button is present$/ do
  logger.info "Postage: Expect Extra Services Button is present"
  web_apps.mail.extra_services.present?.should be true
end

Then /^Postage: Expect Label Image Preview is present$/ do
  logger.info "Postage: Expect Label Image Preview is present"
  sleep 2
  web_apps.mail.form_view.starting_label.left_label_div.present?.should be true
  web_apps.mail.form_view.starting_label.right_label_div.present?.should be true
end

Then /^Postage: Expect Hide Postage Value check box is present$/ do
  logger.info "Postage: Expect Hide Postage Value check box is present"
  web_apps.mail.form_view.hide_postage_value_checkbox.present?.should be true
end

Then /^Postage: Expect Print Receipt check box is present$/ do
  logger.info "Postage: Expect Print Receipt check box is present"
  web_apps.mail.form_view.print_receipt_checkbox.present?.should be true
end

Then /^Postage: Expect Print Reference Number check box is present$/ do
  logger.info "Postage: Expect Print Reference Number check box is present"
  web_apps.mail.form_view.print_reference_number_checkbox.present?.should be true
end

Then /^Postage: Expect Reference Number field is present$/ do
  logger.info "Postage: Expect Reference Number field is present"
  web_apps.mail.form_view.reference_number.present?.should be true
end

Then /^Postage: Expect Cost Code Field is present$/ do
  logger.info "Postage: Expect Cost Code Field is present"
  web_apps.mail.form_view.cost_code.text_box.present?.should be true
end

Then /^Postage: Expect Reset Button is present$/ do
  logger.info "Postage: Expect Reset Button is present"
  toolbar = Toolbar.new param
  toolbar.reset.present?.should be true
end

Then /^Postage: Expect Settings Button is present$/ do
  logger.info "Postage: Expect Settings Button is present"
  toolbar = Toolbar.new param
  toolbar.settings.present?.should be true
end

Then /^Postage: Expect Help Button is present$/ do
  logger.info "Postage: Expect Help Button is present"
  toolbar = Toolbar.new param
  toolbar.help.present?.should be true
end

Then /^Postage: Expect Reprint Banner is present$/ do

end

Then /^Postage: Expect System Notification Banner is present$/ do

end

Then /^Postage: Expect Feedback Button is present$/ do
  logger.info "Postage: Expect Feedback Button is present"
  toolbar = Toolbar.new param
  toolbar.feedback.present?.should be true
end

Then /^Postage: Expect Classic Button is present$/ do
  logger.info "Postage: Expect Classic Button is present"
  toolbar = Toolbar.new param
  toolbar.classic.present?.should be true
end

Then /^Postage: Expect Postage Total is present$/ do
  logger.info "Postage: Expect Postage Total is present"
  web_apps.mail.footer.total.present?.should be true
end

Then /^Postage: Expect Print Sample Button is present$/ do
  logger.info "Postage: Expect Print Sample Button is present"
  web_apps.mail.footer.print_button.present?.should be true
end

Then /^Postage: Expect Print Button is present$/ do
  logger.info "Postage: Expect Print Button is present"
  web_apps.mail.footer.sample_button.present?.should be true
end

