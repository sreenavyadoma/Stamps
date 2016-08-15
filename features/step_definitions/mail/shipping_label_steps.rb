
Then /^Postage Shipping Labels: Set Service to (.*)/ do |service|
  logger.info "Shipping Labels - Set Print Postage Service to: \n #{service}"
  web_apps.mail.service.select service
end

Then /^Postage Shipping Labels: Select Service First-Class Mail Large Envelope-Flat$/ do
  step "Postage Shipping Labels: Set Service to First-Class Mail Large Envelope/Flat"
end

Then /^Postage Shipping Labels: Select Service First-Class Mail Package-Thick Envelope$/ do
  step "Postage Shipping Labels: Set Service to First Class Mail Package/Thick Envelope"
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

Then /^Postage Shipping Labels: Select Service Priority Mail Large Flat Rate Box$/ do
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

Then /^Postage Shipping Labels: Open Extra Services$/ do
  logger.info "Postage Shipping Labels: Open Extra Services"
  @extra_services = web_apps.mail.open_extra_services
end

Then /^Postage Shipping Labels: Edit Customs Form$/ do
  logger.info "Postage Shipping Labels: Edit Customs Form"
  @customs_form = web_apps.mail.customs.edit_form
end

Then /^Postage Shipping Labels: Open Contacts modal/ do
  logger.info "Postage Shipping Labels: Open Contacts Modal"
  @contacts = web_apps.mail.ship_to.contacts.open
end

Then /^Postage Shipping Labels: Select left side starting label/ do
  logger.info "Postage Shipping Labels: Select - Left side label"
  selected = web_apps.mail.shipping_label.form_view.starting_label.left
  logger.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Postage Shipping Labels: Select right side starting label/ do
  logger.info "Postage Shipping Labels: Select - Right side label"
  
  selected = web_apps.mail.shipping_label.form_view.starting_label.right
  logger.info "right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Postage Shipping Labels: Expect Domestic Address field displays (.*)$/ do |value|
  logger.info "Shipping Label: Expect Domestic Address to be #{value}"
  
  5.times{
    begin
      actual = web_apps.mail.ship_to.text_area.text
      actual_stripped = actual.gsub(/ \n/,", ")
      actual_stripped_final = actual_stripped.gsub(/\n/,", ")
      break if actual_stripped_final == value
      sleep 2
    end
  }
  actual = web_apps.mail.ship_to.text_area.text
  actual_stripped = actual.gsub(/ \n/,", ")
  actual_stripped_final = actual_stripped.gsub(/\n/,", ")
  actual_stripped_final.should eql value
  logger.info 'Address Cleansed -- Expected Result Confirmed'
end

Then /^Postage Shipping Labels: Set Hide Postage Value to Checked$/ do
  logger.info "Postage Shipping Labels: Check Hide Postage Value"
  
  web_apps.mail.shipping_label.form_view.hide_postage_value.check
end

Then /^Postage Shipping Labels: Set Hide Postage Value to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Hide Postage Value"
  
  web_apps.mail.shipping_label.form_view.hide_postage_value.uncheck
end

Then /^Postage Shipping Labels: Set Print Receipt to Checked$/ do
  logger.info "Postage Shipping Labels: Check Print Receipt"
  
  web_apps.mail.shipping_label.form_view.print_receipt.check
end

Then /^Postage Shipping Labels: Set Print Receipt to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Print Receipt"
  
  web_apps.mail.shipping_label.form_view.print_receipt.uncheck
end

Then /^Postage Shipping Labels: Set Print Reference Number to Checked$/ do
  logger.info "Postage Shipping Labels: Check Print Reference Number"
  
  web_apps.mail.shipping_label.form_view.print_reference_number.check
end

Then /^Postage Shipping Labels: Set Print Reference Number to Unchecked$/ do
  logger.info "Postage Shipping Labels: Uncheck Print Reference Number"
  
  web_apps.mail.shipping_label.form_view.print_reference_number.uncheck
end

Then /^Postage Shipping Labels: Set Reference Number to (.*)/ do |ref_no|
  logger.info "Set Shipping Label Reference Number to #{ref_no}"
  
  web_apps.mail.shipping_label.form_view.reference_number.set ref_no
end

Then /^Postage Shipping Labels: Set Cost Code to (.*)/ do |code|
  logger.info "Postage Shipping Labels: Set Cost Code to \n #{code}"
  
  web_apps.mail.shipping_label.form_view.cost_code.select code
end