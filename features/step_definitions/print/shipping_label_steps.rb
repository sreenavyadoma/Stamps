
Then /^Postage Shipping Labels: Set Service to (.*)/ do |service|
  log.info "Step: Shipping Labels - Set Print Postage Service to: \n #{service}"
  @print_postage.service.select service
end

Then /^Postage Shipping Labels: Select Service First-Class Mail Large Envelope-Flat $/ do
  step "Postage Shipping Labels: Set Service to First-Class Mail Large Envelope/Flat"
end

Then /^Postage Shipping Labels: Select Service First-Class Mail Package-Thick Envelope$/ do
  step "Postage Shipping Labels: Set Service to First-Class Mail Package/Thick Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Large-Thick Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Large/Thick Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Large Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Large Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Padded Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Padded Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Legal Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Legal Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Small Flat Rate Box$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Small Flat Rate Box"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Medium Flat Rate Box$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Medium Flat Rate Box"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Regional Rate Box A$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Regional Rate Box A"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Regional Rate Box B$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Regional Rate Box B"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express Padded Flat Rate Envelope/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express Padded Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express Legal Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express Legal Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Media Mail Package$/ do
  step "Postage Shipping Labels: Set Service to Media Mail Package"
end

Then /^Postage Shipping Labels: Select Service Parcel Select Ground Package$/ do
  step "Postage Shipping Labels: Set Service to Parcel Select Ground Package"
end

Then /^Postage Shipping Labels: Select Service Parcel Select Ground Large Package/ do
  step "Postage Shipping Labels: Set Service to Parcel Select Ground Large Package"
end

Then /^Postage Shipping Labels: Select Service Parcel Select Ground Oversized Package$/ do
  step "Postage Shipping Labels: Set Service to Parcel Select Ground Oversized Package"
end

Then /^Postage Shipping Labels: Select Service First-Class Mail International Large Envelope-Flat$/ do
  step "Postage Shipping Labels: Set Service to First-Class Mail Large Envelope/Flat"
end

Then /^Postage Shipping Labels: Select Service First-Class Mail International Package$/ do
  step "Postage Shipping Labels: Set Service to First-Class Mail International Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Large Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Large Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Padded Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Padded Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Legal Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Legal Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Small Flat Rate Box$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Small Flat Rate Box"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Medium Flat Rate Box$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Medium Flat Rate Box"
end

Then /^Postage Shipping Labels: Select Service Priority Mail International Large Flat Rate Box$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail International Medium Flat Rate Box"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express International Package$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express International Package"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express International Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express International Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express International Padded Flat Rate Envelope/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express International Padded Flat Rate Envelope"
end

Then /^Postage Shipping Labels: Select Service Priority Mail Express International Legal Flat Rate Envelope$/ do
  step "Postage Shipping Labels: Set Service to Priority Mail Express International Legal Flat Rate Envelope"
end

Then /^Shipping Labels: Open Extra Services$/ do
  log.info "Shipping Labels: Open Extra Services"
  @extra_services = @print_postage.extra_services
end

Then /^Postage Shipping Labels: Edit Customs Form$/ do
  log.info "Postage Shipping Labels: Edit Customs Form"
  @customs_form = @print_postage.customs
end

Then /^Shipping Labels: Open Contacts modal/ do
  log.info "Shipping Labels: Open Contacts Modal"
  @contacts = @print_postage.contacts.open
end

Then /^Shipping Labels: Select left side starting label/ do
  log.info "Shipping Labels: Select - Left side label"
  selected = @print_postage.form_view.starting_label.left
  log.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Shipping Labels: Select right side starting label/ do
  log.info "Shipping Labels: Select - Right side label"
  
  selected = @print_postage.form_view.starting_label.right
  log.info "right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 1$/ do
  step "Postage: Set Ship-To to zone 1"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 2$/ do
  step "Postage: Set Ship-To to zone 2"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 3$/ do
  step "Postage: Set Ship-To to zone 3"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 4$/ do
  step "Postage: Set Ship-To to zone 4"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 5$/ do
  step "Postage: Set Ship-To to zone 5"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 6$/ do
  step "Postage: Set Ship-To to zone 6"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 7$/ do
  step "Postage: Set Ship-To to zone 7"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 8$/ do
  step "Postage: Set Ship-To to zone 8"
end

Then /^Shipping Labels: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Postage: Set Ship-To to zone 1 through 4"
end

Then /^Shipping Labels: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Postage: Set Ship-To to zone 5 through 8"
end

Then /^Postage: Set Ship-To to (.*)$/ do |address|
  log.info "Postage: Set Ship-To to \"#{address}\""

  case address.downcase
    when /zone 1 through 4/
      address = test_helper.rand_zone_1_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = test_helper.rand_zone_5_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = test_helper.rand_zone_1
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = test_helper.rand_zone_2
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = test_helper.rand_zone_3
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = test_helper.rand_zone_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = test_helper.rand_zone_5
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = test_helper.rand_zone_6
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = test_helper.rand_zone_7
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = test_helper.rand_zone_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  @print_postage.ship_to.set formatted_address

end

Then /^Postage Shipping Labels: Expect Domestic Address field displays (.*)$/ do |value|
  log.info "Shipping Label: Expect Domestic Address to be #{value}"
  
  5.times{
    begin
      actual = @print_postage.ship_to.text_area.text
      actual_stripped = actual.gsub(/ \n/,", ")
      actual_stripped_final = actual_stripped.gsub(/\n/,", ")
      break if actual_stripped_final == value
      sleep 2
    end
  }
  actual = @print_postage.ship_to.text_area.text
  actual_stripped = actual.gsub(/ \n/,", ")
  actual_stripped_final = actual_stripped.gsub(/\n/,", ")
  actual_stripped_final.should eql value
  log.info 'Address Cleansed -- Expected Result Confirmed'
end

Then /^Shipping Labels: Set Hide Postage Value to Checked$/ do
  log.info "Shipping Labels: Check Hide Postage Value"
  
  @print_postage.form_view.hide_postage_value.check
end

Then /^Shipping Labels: Set Hide Postage Value to Unchecked$/ do
  log.info "Shipping Labels: Uncheck Hide Postage Value"
  
  @print_postage.form_view.hide_postage_value.uncheck
end

Then /^Shipping Labels: Set Print Receipt to Checked$/ do
  log.info "Shipping Labels: Check Print Receipt"
  
  @print_postage.form_view.print_receipt.check
end

Then /^Shipping Labels: Set Print Receipt to Unchecked$/ do
  log.info "Shipping Labels: Uncheck Print Receipt"
  
  @print_postage.form_view.print_receipt.uncheck
end

Then /^Shipping Labels: Set Print Reference Number to Checked$/ do
  log.info "Shipping Labels: Check Print Reference Number"
  
  @print_postage.form_view.print_reference_number.check
end

Then /^Shipping Labels: Set Print Reference Number to Unchecked$/ do
  log.info "Shipping Labels: Uncheck Print Reference Number"
  
  @print_postage.form_view.print_reference_number.uncheck
end

Then /^Shipping Labels: Set Reference Number to (.*)/ do |ref_no|
  log.info "Set Shipping Label Reference Number to #{ref_no}"
  
  @print_postage.form_view.reference_number.set ref_no
end

Then /^Shipping Labels: Set Cost Code to (.*)/ do |code|
  log.info "Shipping Labels: Set Cost Code to \n #{code}"
  
  @print_postage.form_view.cost_code.select code
end