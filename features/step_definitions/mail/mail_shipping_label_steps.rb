

Then /^on Shipping Label Print form, select Shipping Label - 8 ½” x 11” Paper$/ do
  step "on Print form, set Print On to Shipping Label - 8 x 11 Paper"
end

Then /^on Shipping Label Print form, select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”$/ do
  step "on Print form, set Print On to Shipping Label - SDC-1200"
end

Then /^on Shipping Label Print form, select Shipping Label - 5 ½” x 8 ½”$/ do
  step "on Print form, set Print On to Shipping Label - 5 x 8"
end

Then /^on Shipping Label Print form, set service to (.*)/ do |service|
  #logger.step "Shipping Labels - Set Print Mail service to: \n #{service}"
  stamps.mail.service.select service
end

Then /^on Shipping Label Print form, select service First-Class Mail Large Envelope-Flat$/ do
  step "on Shipping Label Print form, set service to FCM Package"
end

Then /^on Shipping Label Print form, select service First-Class Mail Package-Thick Envelope$/ do
  step "on Shipping Label Print form, set service to First Class Mail Package/Thick Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Large-Thick Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Large/Thick Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail Package"
end

Then /^on Shipping Label Print form, select service Priority Mail Large Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail Large Package"
end

Then /^on Shipping Label Print form, select service Priority Mail Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Padded Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Padded Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Legal Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Legal Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Small Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail Small Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail Medium Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail Medium Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail Large Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail Medium Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail Regional Rate Box A$/ do
  step "on Shipping Label Print form, set service to Priority Mail Regional Rate Box A"
end

Then /^on Shipping Label Print form, select service Priority Mail Regional Rate Box B$/ do
  step "on Shipping Label Print form, set service to Priority Mail Regional Rate Box B"
end

Then /^on Shipping Label Print form, select service Priority Mail Express Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express Package"
end

Then /^on Shipping Label Print form, select service Priority Mail Express Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Express Padded Flat Rate Envelope/ do
  step "on Shipping Label Print form, set service to Priority Mail Express Padded Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Express Legal Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express Legal Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Media Mail Package$/ do
  step "on Shipping Label Print form, set service to Media Mail Package"
end

Then /^on Shipping Label Print form, select service Parcel Select Ground Package$/ do
  step "on Shipping Label Print form, set service to Parcel Select Ground Package"
end

Then /^on Shipping Label Print form, select service Parcel Select Ground Large Package/ do
  step "on Shipping Label Print form, set service to Parcel Select Ground Large Package"
end

Then /^on Shipping Label Print form, select service Parcel Select Ground Oversized Package$/ do
  step "on Shipping Label Print form, set service to Parcel Select Ground Oversized Package"
end

Then /^on Shipping Label Print form, select service First-Class Mail International Large Envelope-Flat$/ do
  step "on Shipping Label Print form, set service to FCM Package"
end

Then /^on Shipping Label Print form, select service First-Class Mail International Package$/ do
  step "on Shipping Label Print form, set service to First-Class Mail International Package"
end

Then /^on Shipping Label Print form, select service Priority Mail International Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Package"
end

Then /^on Shipping Label Print form, select service Priority Mail International Large Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Large Package"
end

Then /^on Shipping Label Print form, select service Priority Mail International Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail International Padded Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Padded Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail International Legal Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Legal Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail International Small Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Small Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail International Medium Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Medium Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail International Large Flat Rate Box$/ do
  step "on Shipping Label Print form, set service to Priority Mail International Medium Flat Rate Box"
end

Then /^on Shipping Label Print form, select service Priority Mail Express International Package$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express International Package"
end

Then /^on Shipping Label Print form, select service Priority Mail Express International Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express International Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Express International Padded Flat Rate Envelope/ do
  step "on Shipping Label Print form, set service to Priority Mail Express International Padded Flat Rate Envelope"
end

Then /^on Shipping Label Print form, select service Priority Mail Express International Legal Flat Rate Envelope$/ do
  step "on Shipping Label Print form, set service to Priority Mail Express International Legal Flat Rate Envelope"
end

Then /^on Shipping Label Print form, Edit Customs Form$/ do
  #logger.step "on Shipping Label Print form, Edit Customs Form"
  @customs_form = stamps.mail.customs.edit_form
end

Then /^on Shipping Label Print form, Open Contacts modal/ do
  #logger.step "on Shipping Label Print form, Open Contacts Modal"
  @contacts = stamps.mail.ship_to.contacts.open
end

Then /^on Shipping Label Print form, select left side starting label/ do
  #logger.step "on Shipping Label Print form, select - Left side label"
  selected = stamps.mail.shipping_label.form_view.starting_label.left
  #logger.step "left-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^on Shipping Label Print form, select right side starting label/ do
  #logger.step "on Shipping Label Print form, select - Right side label"
  
  selected = stamps.mail.shipping_label.form_view.starting_label.right
  #logger.step "right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^on Shipping Label Print form, Expect Domestic Address field displays (.*)$/ do |value|
  #logger.step "Shipping Label: Expect Domestic Address is #{value}"
  
  5.times{
    begin
      actual = stamps.mail.ship_to.text_area.text
      actual_stripped = actual.gsub(/ \n/,", ")
      actual_stripped_final = actual_stripped.gsub(/\n/,", ")
      break if actual_stripped_final == value
      sleep(2)
    end
  }
  actual = stamps.mail.ship_to.text_area.text
  actual_stripped = actual.gsub(/ \n/,", ")
  actual_stripped_final = actual_stripped.gsub(/\n/,", ")
  expect(actual_stripped_final).to eql value
  logger.step 'Address Cleansed -- Expected Result Confirmed'
end

Then /^on Shipping Label Print form, set Hide Mail Value to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Hide Mail Value"
  
  stamps.mail.shipping_label.form_view.hide_postage_value.check
end

Then /^on Shipping Label Print form, set Hide Mail Value to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Hide Mail Value"
  
  stamps.mail.shipping_label.form_view.hide_postage_value.uncheck
end

Then /^on Shipping Label Print form, set Print Receipt to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Print Receipt"
  
  stamps.mail.shipping_label.form_view.print_receipt.check
end

Then /^on Shipping Label Print form, set Print Receipt to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Print Receipt"
  
  stamps.mail.shipping_label.form_view.print_receipt.uncheck
end

Then /^on Shipping Label Print form, set Print Reference Number to Checked$/ do
  #logger.step "on Shipping Label Print form, Check Print Reference Number"
  
  stamps.mail.shipping_label.form_view.print_reference_number.check
end

Then /^on Shipping Label Print form, set Print Reference Number to Unchecked$/ do
  #logger.step "on Shipping Label Print form, Uncheck Print Reference Number"
  
  stamps.mail.shipping_label.form_view.print_reference_number.uncheck
end

Then /^on Shipping Label Print form, set Reference Number to (.*)/ do |ref_no|
  #logger.step "Set Shipping Label Reference Number to #{ref_no}"
  
  stamps.mail.shipping_label.form_view.reference_number.set ref_no
end

Then /^on Shipping Label Print form, set Cost Code to (.*)/ do |code|
  #logger.step "on Shipping Label Print form, set Cost Code to \n #{code}"
  
  stamps.mail.shipping_label.form_view.cost_code.select code
end