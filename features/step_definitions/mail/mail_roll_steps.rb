Then /^Mail Roll: Set service to (.*)$/ do |service|
  #logger.step "Roll - Set Print Mail service to: \n #{service}"
  stamps.mail.print_form.service.select service
end

Then /^Mail Roll: Select service First-Class Mail Large Envelope-Flat$/ do
  step "Mail Roll: Set service to FCM Package"
end

Then /^Mail Roll: Select service First-Class Mail Package-Thick Envelope$/ do
  step "Mail Roll: Set service to First Class Mail Package/Thick Envelope"
end

Then /^Mail Roll: Select service Priority Mail Large-Thick Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Large/Thick Envelope"
end

Then /^Mail Roll: Select service Priority Mail Package$/ do
  step "Mail Roll: Set service to Priority Mail Package"
end

Then /^Mail Roll: Select service Priority Mail Large Package$/ do
  step "Mail Roll: Set service to Priority Mail Large Package"
end

Then /^Mail Roll: Select service Priority Mail Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Padded Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Padded Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Legal Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Legal Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Small Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail Small Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail Medium Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail Medium Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail Large Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail Medium Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail Regional Rate Box A$/ do
  step "Mail Roll: Set service to Priority Mail Regional Rate Box A"
end

Then /^Mail Roll: Select service Priority Mail Regional Rate Box B$/ do
  step "Mail Roll: Set service to Priority Mail Regional Rate Box B"
end

Then /^Mail Roll: Select service Priority Mail Express Package$/ do
  step "Mail Roll: Set service to Priority Mail Express Package"
end

Then /^Mail Roll: Select service Priority Mail Express Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Express Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Express Padded Flat Rate Envelope/ do
  step "Mail Roll: Set service to Priority Mail Express Padded Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Express Legal Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Express Legal Flat Rate Envelope"
end

Then /^Mail Roll: Select service Media Mail Package$/ do
  step "Mail Roll: Set service to Media Mail Package"
end

Then /^Mail Roll: Select service Parcel Select Ground Package$/ do
  step "Mail Roll: Set service to Parcel Select Ground Package"
end

Then /^Mail Roll: Select service Parcel Select Ground Large Package/ do
  step "Mail Roll: Set service to Parcel Select Ground Large Package"
end

Then /^Mail Roll: Select service Parcel Select Ground Oversized Package$/ do
  step "Mail Roll: Set service to Parcel Select Ground Oversized Package"
end

Then /^Mail Roll: Select service First-Class Mail International Large Envelope-Flat$/ do
  step "Mail Roll: Set service to FCM Package"
end

Then /^Mail Roll: Select service First-Class Mail International Package$/ do
  step "Mail Roll: Set service to First-Class Mail International Package"
end

Then /^Mail Roll: Select service Priority Mail International Package$/ do
  step "Mail Roll: Set service to Priority Mail International Package"
end

Then /^Mail Roll: Select service Priority Mail International Large Package$/ do
  step "Mail Roll: Set service to Priority Mail International Large Package"
end

Then /^Mail Roll: Select service Priority Mail International Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail International Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail International Padded Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail International Padded Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail International Legal Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail International Legal Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail International Small Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail International Small Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail International Medium Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail International Medium Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail International Large Flat Rate Box$/ do
  step "Mail Roll: Set service to Priority Mail International Medium Flat Rate Box"
end

Then /^Mail Roll: Select service Priority Mail Express International Package$/ do
  step "Mail Roll: Set service to Priority Mail Express International Package"
end

Then /^Mail Roll: Select service Priority Mail Express International Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Express International Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Express International Padded Flat Rate Envelope/ do
  step "Mail Roll: Set service to Priority Mail Express International Padded Flat Rate Envelope"
end

Then /^Mail Roll: Select service Priority Mail Express International Legal Flat Rate Envelope$/ do
  step "Mail Roll: Set service to Priority Mail Express International Legal Flat Rate Envelope"
end

Then /^Mail Roll: Edit Customs Form$/ do
  #logger.step "Mail Roll: Edit Customs Form"
  @customs_form = stamps.mail.customs.edit_form
end

Then /^Mail Roll: Open Contacts modal/ do
  #logger.step "Mail Roll: Open Contacts Modal"
  @contacts = stamps.mail.print_form.mail_to.contacts.open
end

Then /^Mail Roll: Expect Domestic Address field displays (.*)$/ do |value|
  #logger.step "Shipping Label: Expect Domestic Address is #{value}"

  5.times{
    begin
      actual = stamps.mail.print_form.mail_to.text_area.text
      actual_stripped = actual.gsub(/ \n/,", ")
      actual_stripped_final = actual_stripped.gsub(/\n/,", ")
      break if actual_stripped_final == value
      sleep(2)
    end
  }
  actual = stamps.mail.print_form.mail_to.text_area.text
  actual_stripped = actual.gsub(/ \n/,", ")
  actual_stripped_final = actual_stripped.gsub(/\n/,", ")
  expect(actual_stripped_final).to eql value
  logger.step 'Address Cleansed -- Expected Result Confirmed'
end

Then /^Mail Roll: Set Hide Mail Value to Checked$/ do
  #logger.step "Mail Roll: Check Hide Mail Value"

  stamps.mail.form_view.hide_postage_value.check
end

Then /^Mail Roll: Set Hide Mail Value to Unchecked$/ do
  #logger.step "Mail Roll: Uncheck Hide Mail Value"

  stamps.mail.form_view.hide_postage_value.uncheck
end

Then /^Mail Roll: Set Print Reference Number to Checked$/ do
  #logger.step "Mail Roll: Check Print Reference Number"

  stamps.mail.form_view.print_reference_number.check
end

Then /^Mail Roll: Set Print Reference Number to Unchecked$/ do
  #logger.step "Mail Roll: Uncheck Print Reference Number"

  stamps.mail.form_view.print_reference_number.uncheck
end

Then /^Mail Roll: Set Reference Number to (.*)$/ do |ref_no|
  #logger.step "Set Shipping Label Reference Number to #{ref_no}"

  stamps.mail.form_view.reference_number.set ref_no
end

Then /^Mail Roll: Set Cost Code to (.*)$/ do |code|
  #logger.step "Mail Roll: Set Cost Code to \n #{code}"

  stamps.mail.form_view.cost_code.select code
end