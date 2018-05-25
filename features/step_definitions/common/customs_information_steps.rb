
Then /^click (?:order details|print) form (?:edit customs|edit|customs) form button$/ do
  if SdcEnv.new_framework
    SdcOrders.order_details.ship_to.international.customs_form.click
  else
    10.times do
      if SdcEnv.sdc_app == :orders
        stamps.orders.order_details.contents.customs_form.scroll_into_view
        stamps.orders.order_details.contents.customs_form.click
      end
      stamps.common_modals.customs_form.wait_until_present(2)
      break if stamps.common_modals.customs_form.present?
    end
    stamps.mail.print_form.mail_customs.edit_customs_form if SdcEnv.sdc_app == :mail
  end
  step 'expect customs form is present'
end

Then /^[Ee]xpect [Cc]ustoms [Ff]orm is [Pp]resent$/ do
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.title).to be_present, 'Customs form did not open'
  else
    expect(stamps.common_modals.customs_form).to be_present, 'Customs form did not open'
  end
end

Then /^[Bb]lur [Oo]ut [Oo]n [Cc]ustoms [Ff]orm$/ do
  if SdcEnv.new_framework
    SdcWebsite.customs_form.total.blur_out
    SdcWebsite.customs_form.title.blur_out
  else
    count.to_i.times { stamps.common_modals.customs_form.blur_out } if SdcEnv.sdc_app == :orders
    count.to_i.times { stamps.mail.print_form.mail_customs.edit_customs_form.blur_out } if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs package contents to (.*)$/ do |value|
  if SdcEnv.new_framework
    package_contents = SdcWebsite.customs_form.package_contents
    package_contents.selection_element(name: :selection, value: value)
    package_contents.drop_down.click unless package_contents.selection.present?
    package_contents.selection.click unless package_contents.selection.class_disabled?
    step "expect customs package contents is #{value}"
  else
    stamps.common_modals.customs_form.package_contents.select(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.select(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_package_contents] = value
end

Then /^expect customs package contents is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_package_contents]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.package_contents.text_field.text_value).to eql(expectation), 'Package Content is incorrect'
  else
    sleep(0.15)
    expect(stamps.common_modals.customs_form.package_contents.combobox.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.combobox.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs non-delivery options to (.*)$/ do |value|
  if SdcEnv.new_framework
    non_delivery = SdcWebsite.customs_form.non_delivery
    non_delivery.selection_element(name: :selection, value: value)
    non_delivery.drop_down.click unless non_delivery.selection.present?
    non_delivery.selection.click unless non_delivery.selection.class_disabled?
    step "expect customs non-delivery options is #{value}"
  else
    stamps.common_modals.customs_form.non_delivery_options.select(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.select(value) if SdcEnv.sdc_app == :mail
  end
  TestData.hash[:customs_non_delivery_options] = value
end

Then /^expect customs non-delivery options is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_non_delivery_options]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.non_delivery.text_field.text_value).to eql(expectation), 'Package Content is incorrect'
  else
    actual = ''
    10.times do
      if SdcEnv.sdc_app == :orders
        actual = stamps.common_modals.customs_form.non_delivery_options.textbox.text
        break if actual == expectation
      end
      if SdcEnv.sdc_app == :mail
        actual = stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.textbox.text
        break if actual == expectation
      end
    end
    expect(stamps.common_modals.customs_form.non_delivery_options.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs internal transaction number to (.*)$/ do |value|
  if SdcEnv.new_framework
    internal_transaction = SdcWebsite.customs_form.internal_transaction
    internal_transaction.selection_element(name: :selection, value: value)
    internal_transaction.drop_down.click unless internal_transaction.selection.present?
    internal_transaction.selection.click unless internal_transaction.selection.class_disabled?
    step "expect customs internal transaction number is #{value}"
  else
    stamps.common_modals.customs_form.internal_transaction.select(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.internal_transaction.select(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_internal_transaction_no] = value
end

Then /^expect customs internal transaction number is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_internal_transaction_no]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.internal_transaction.text_field.text_value).to eql(expectation), 'Internal Transaction Number value is incorrect'
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ss]et Customs More Info to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(6, 18)
  if SdcEnv.new_framework
    SdcWebsite.customs_form.more_info.set(value) if SdcWebsite.customs_form.more_info.present?
    step "expect Customs More Info is #{value}"
  else
    stamps.common_modals.customs_form.package_contents.contents.more_info.set(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.set(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_more_info] = value
end

Then /^ [Ss]et Customs More Info to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(6, 18)
  if SdcEnv.new_framework
    SdcWebsite.customs_form.more_info.set(value) if SdcWebsite.customs_form.more_info.present?
    step "expect Customs More Info is #{value}"
  else
    stamps.common_modals.customs_form.package_contents.contents.more_info.set(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.set(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_more_info] = value
end

Then /^[Ee]xpect Customs More Info is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_more_info]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.more_info).to be_present, 'More Info field is not present'
    expect(SdcWebsite.customs_form.more_info.text_value).to eql(expectation), 'More Info value is incorrect'
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.more_info.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs itn number to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(8, 50)
  if SdcEnv.new_framework
    SdcWebsite.customs_form.itn.set(value) unless SdcWebsite.customs_form.itn.class_disabled?
    step "expect Customs ITN Number is #{value}"
  else
    stamps.common_modals.customs_form.itn_number.set(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.set(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_itn_no] = value
end

Then /^[Ee]xpect Customs ITN Number is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_itn_no]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.itn.class_disabled?).to be(false), 'ITN number is disabled'
    expect(SdcWebsite.customs_form.itn.text_value).to eql(expectation), 'ITN number is incorrect'
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.itn_number.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs license number to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(min: 2, max: 6)
  SdcWebsite.customs_form.license.set(value) if SdcWebsite.customs_form.license.present?
  step "expect customs license number is #{value}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_license_no] = value
end

Then /^expect customs license number is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_license_no]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.license).to be_present, 'License field is not present'
    expect(SdcWebsite.customs_form.license.text_value).to eql(expectation)
  else
    sleep(1)
    expect(stamps.common_modals.customs_form.license.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.license.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'
end

Then /^set customs certificate number to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(min: 2, max: 8)
  if SdcEnv.new_framework
    SdcWebsite.customs_form.certificate.set(value) if SdcWebsite.customs_form.certificate.present?
    step "expect customs certificate number is #{value}"
  else
    stamps.common_modals.customs_form.certificate.set(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.certificate.set(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_certificate_no] = value
end

Then /^expect customs certificate number is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_certificate_no]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.certificate).to be_present, 'Certificate Number is not present'
    expect(SdcWebsite.customs_form.certificate.text_value).to eql(expectation), 'Certificate Number is incorrect'
    expect(SdcWebsite.customs_form.certificate.text_value).to eql(expectation)
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.certificate.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.certificate.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^set customs invoice number to (?:(?:a|some) random string|(.*))$/ do |value|
  value ||= TestHelper.rand_alpha_numeric(min: 2, max: 10)
  if SdcEnv.new_framework
    SdcWebsite.customs_form.invoice.set(value) if SdcWebsite.customs_form.invoice.present?
    step "expect customs invoice number is #{value}"
  else
    stamps.common_modals.customs_form.invoice.set(value) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.invoice.set(value) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_invoice_no] = value
end

Then /^expect customs invoice number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.hash[:customs_invoice_no] : expectation
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.invoice).to be_present, 'Customs Invoice is not present'
    expect(SdcWebsite.customs_form.invoice.text_value).to eql(expectation), 'Customs Invoice is incorrect'
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.invoice.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.invoice.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Dd]elete Customs Associated Item (\d+)$/ do |item_number|
  if SdcEnv.new_framework
    SdcWebsite.customs_form.item.delete(item_number).click
  else
    if SdcEnv.sdc_app == :orders
      field = stamps.common_modals.customs_form.associated_items
    else
      field = stamps.mail.print_form.mail_customs.edit_customs_form.associated_items
    end
    if field.size > 1
      field.item_number(item_number.to_i).delete.click_while_present
    else
      field.item_number(item_number.to_i).delete.click
    end
  end

end

Then /^check customs form i agree to the usps privacy act statement$/ do
  if SdcEnv.new_framework
    SdcWebsite.customs_form.agree.check
  else
    stamps.common_modals.customs_form.agree_to_terms.check if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.check if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs I agree to the USPS Privacy Act Statement is checked$/ do
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.agree.checked?).to be(true), 'I agree to the USPS Privacy Act Statement is not checked'
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.agree_to_terms.checked?).to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.checked?).to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Uu]ncheck customs form i agree to the usps privacy act statement$/ do
  if SdcEnv.new_framework
    SdcWebsite.customs_form.agree.uncheck
  else
    stamps.common_modals.customs_form.agree_to_terms.uncheck if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.uncheck if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs i agree to the usps privacy act statement is unchecked$/ do
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.agree.checked?).to be(false), 'I agree to the USPS Privacy Act Statement is not unchecked'
  else
    sleep(0.05)
    expect(stamps.common_modals.customs_form.agree_to_terms.checked?).not_to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.checked?).not_to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^close customs information form$/ do
  step 'pause for 4 seconds'
  step 'Blur out on Customs form'
  step 'Save Customs Information form Total amount'
  if SdcEnv.new_framework
    SdcWebsite.customs_form.close.click
  else
    if SdcEnv.sdc_app == :orders
      stamps.common_modals.customs_form.close
      step 'blur out on order details form'
      step 'Save Order Details data'
    end
    stamps.mail.print_form.mail_customs.edit_customs_form.close if SdcEnv.sdc_app == :mail
  end
end

Then /^Cancel Customs Form$/ do
  if SdcEnv.new_framework
    SdcWebclient.customs_form.x_btn.click
  else
    step 'Blur out on Customs form'
    expect(stamps.common_modals.customs_form.cancel).to be(false) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.cancel).to be(false) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs USPS Privacy Act Warning is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.usps_warning).to be_present, 'USPS Warning is not present'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.usps_privacy_act_warning.visible?).to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.usps_privacy_act_warning.visible?).to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs USPS Privacy Act Warning is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.usps_warning).not_to be_present, 'USPS Warning is present'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.usps_privacy_act_warning.visible?).to be(false) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.usps_privacy_act_warning.visible?).to be(false) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs More Info is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.more_info).not_to be_present, 'More Info is present'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.more_info.present?).not_to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.common_modals.customs_form.package_contents.contents.more_info).not_to be_present if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.present?).not_to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs More Info is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.more_info).to be_present, 'More Info is not present'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.more_info).to be_present if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info).to be_present if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs License Number is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.license).to be_present, 'License number field is not present'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.license).to be_present if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.license).to be_present if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs License Number is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.license).not_to be_present, 'License number field is not hidden'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.license.present?).not_to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.license.present?).not_to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs Certificate Number is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.certificate).not_to be_present, 'Certificate Number field is not hidden'
  else
    expect(stamps.common_modals.customs_form.package_contents.contents.certificate.present?).not_to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.common_modals.customs_form.package_contents.contents.certificate.present?).not_to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs Certificate Number is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.certificate).to be_present, 'Certificate Number field is not visible'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.certificate).to be_present if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.certificate).to be_present if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs Invoice Number is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.invoice).not_to be_present, 'Invoice Number field is not hidden'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.invoice.present?).not_to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.invoice.present?).not_to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs Invoice Number is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.invoice).to be_present, 'Invoice Number field is not visible'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.package_contents.contents.invoice).to be_present if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.invoice).to be_present if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs ITN Number is hidden$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.itn).not_to be_present, 'Invoice Number field is not hidden'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.itn_number.enabled?).to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.enabled?).to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs ITN Number is visible$/ do
  if SdcEnv.new_framework
    expect(SdcWebclient.customs_form.itn).to be_present, 'Invoice Number field is not visible'
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.itn_number.enabled?).to be(true) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.enabled?).to be(true) if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs associated item grid count is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.associated_items.size).to eql(expectation.to_i)
  else
    step 'Blur out on Customs form'
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.size).to eql(expectation.to_i) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.size).to eql(expectation.to_i) if SdcEnv.sdc_app == :mail
  end

end

Then /^[Ss]ave Customs Information form [Tt]otal amount$/ do
  if SdcEnv.new_framework
    TestData.hash[:customs_total_value] = SdcWebsite.customs_form.total.text_value.dollar_amount_str.to_f.round(2)
  else
    TestData.hash[:customs_total_value] = stamps.common_modals.customs_form.total_cost.text.dollar_amount_str.to_f.round(2) if SdcEnv.sdc_app == :orders
    TestData.hash[:customs_total_value] = stamps.mail.print_form.mail_customs.edit_customs_form.total_cost.text.dollar_amount_str.to_f.round(2) if SdcEnv.sdc_app == :mail
  end
end

Then /^[Ee]xpect Customs Total Value is (?:correct|(.*))$/ do |expectation|
  step 'Blur out on Customs form'
  expectation = expectation.nil? ? TestData.hash[:customs_total_value] : expectation.to_f.round(2)
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.total.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation)
  else
    if SdcEnv.sdc_app == :orders
      expect(stamps.common_modals.customs_form.total_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation)
    end
    if SdcEnv.sdc_app == :mail
      expect(stamps.mail.print_form.mail_customs.edit_customs_form.total_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation)
    end
  end
end

Then /^add customs associated item (\d+), description (.*), qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "add customs associated item #{item_number}" if item_number > 1
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Description to #{description}"
  step "set Customs Associated Item #{item_number} Qty to #{qty}"
  step "set Customs Associated Item #{item_number} Unit Price to #{price}"
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Made In is Country to #{made_in}"
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^edit customs associated item (\d+), description (.*), qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Description to #{description}"
  step "set Customs Associated Item #{item_number} Qty to #{qty}"
  step "set Customs Associated Item #{item_number} Unit Price to #{price}"
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Made In is Country to #{made_in}"
  step "scroll into view customs associated item #{item_number}"
  step "set Customs Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^add customs associated item (\d+)$/ do |item_number|
  if SdcEnv.new_framework
    SdcWebsite.customs_form.add_item.click
  else
    stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i) if SdcEnv.sdc_app == :mail
  end
end

Then /^scroll into view customs associated item (\d+)$/ do |item_number|
  SdcWebsite.customs_form.item.made_in.drop_down(item_number).scroll_into_view
  SdcWebsite.customs_form.item.item_description(item_number).scroll_into_view
  SdcWebsite.customs_form.item.hs_tariff(item_number).scroll_into_view
  SdcWebsite.customs_form.item.qty(item_number).scroll_into_view
  SdcWebsite.customs_form.item.unit_price(item_number).scroll_into_view
  SdcWebsite.customs_form.item.delete(item_number).scroll_into_view
end

Then /^[Ss]et Customs Associated Item (\d+) Description to (.*)$/ do |item_number, value|
  TestData.hash[:customs_associated_items][item_number] ||= {}
  value = TestHelper.rand_alpha_numeric if value.casecmp('random').zero?
  if SdcEnv.new_framework
    SdcWebsite.customs_form.item.item_description(item_number).scroll_into_view.set(value)
  else
    stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_description.set(TestData.hash[:customs_associated_items][item_number][:description]) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_description.set(TestData.hash[:customs_associated_items][item_number][:description]) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_associated_items][item_number][:description] = value
end

Then /^[Ss]et Customs Associated Item (\d+) Qty to (\d+)$/ do |item_number, value|
  if SdcEnv.new_framework
    qty = SdcWebsite.customs_form.item.qty(item_number)
    qty.scroll_into_view
    qty.set(value)
  else
    stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_qty.set(TestData.hash[:customs_associated_items][item_number][:quantity]) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_qty.set(TestData.hash[:customs_associated_items][item_number][:quantity]) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:quantity] = value
end

Then /^[Ss]et Customs Associated Item (\d+) Unit Price to (.*)$/ do |item_number, value|
  if SdcEnv.new_framework
    unit_price = SdcWebsite.customs_form.item.unit_price(item_number)
    unit_price.scroll_into_view
    unit_price.set(value)
  else
    stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).unit_price.set(TestData.hash[:customs_associated_items][item_number][:price]) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).unit_price.set(TestData.hash[:customs_associated_items][item_number][:price]) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:price] = value
end

Then /^[Ss]et Customs Associated Item (\d+) Made In is Country to (.*)$/ do |item_number, value|
  if SdcEnv.new_framework
    made_in = SdcWebsite.customs_form.item.made_in
    drop_down = made_in.drop_down(item_number)
    text_field = made_in.text_field(item_number)
    selection = made_in.selection(item_number, value)

    drop_down.scroll_into_view
    text_field.scroll_into_view
    drop_down.click
    selection.safe_wait_until_present(timeout: 2)
    drop_down.click unless selection.present?
    selection.scroll_into_view
    selection.click
    drop_down.scroll_into_view
    text_field.scroll_into_view
    text_field.wait_until_present(timeout: 2)
    expect(text_field.text_value).to include value
  else
    if SdcEnv.sdc_app == :orders
      expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).made_in.select(
          TestData.hash[:customs_associated_items][item_number][:made_in])).to eql(TestData.hash[:customs_associated_items][item_number][:made_in])
    end
    if SdcEnv.sdc_app == :mail
      expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).made_in.select(
          TestData.hash[:customs_associated_items][item_number][:made_in])).to eql(TestData.hash[:customs_associated_items][item_number][:made_in])
    end
  end

  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:made_in] = value
end

Then /^[Ss]et Customs Associated Item (\d+) Tarriff to (.*)$/ do |item_number, value|
  if SdcEnv.new_framework
    SdcWebsite.customs_form.item.hs_tariff(item_number).scroll_into_view.set(value)
  else
    stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).hs_tariff.set(TestData.hash[:customs_associated_items][item_number][:tarriff]) if SdcEnv.sdc_app == :orders
    stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).hs_tariff.set(TestData.hash[:customs_associated_items][item_number][:tarriff]) if SdcEnv.sdc_app == :mail
  end
  step 'Save Customs Information form Total amount'

  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:tarriff] = value
end

Then /^expect customs associated item (\d+) Description is (.*)$/ do |item_number, expectation|
  expectation = expectation.eql?('correct') ? TestData.hash[:customs_associated_items][item_number][:description] : expectation
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.item.item_description(item_number).text_value).to eql(expectation), "Description of Item ##{item_number} is incorrect"
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_description.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_description.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs associated item (\d+) Quantity is (.*)$/ do |item_number, expectation|
  expectation = expectation.is_a?(Numeric) ? expectation : TestData.hash[:customs_associated_items][item_number][:quantity]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.item.qty(item_number).text_value.to_i).to eql(expectation.to_i), "Qty of Item ##{item_number} is incorrect"
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_qty.textbox.text.to_i).to eql(expectation.to_i) if SdcEnv.sdc_app == :orders
    expect(expectation.to_i).to eql(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_qty.textbox.text.to_i) if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs associated item (\d+) Unit Price is (.*)$/ do |item_number, expectation|
  expectation = expectation.is_a?(Numeric) ? expectation : TestData.hash[:customs_associated_items][item_number][:price]
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.item.unit_price(item_number).text_value.to_f).to eql(expectation.to_f), "Unit Price of Item ##{item_number} is incorrect"
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).unit_price.textbox.text.to_f).to eql(expectation.to_f) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).unit_price.textbox.text.to_f).to eql(expectation.to_f) if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs associated item (\d+) Made In is (.*)$/ do |item_number, expectation|
  expectation = expectation.eql?('correct') ? TestData.hash[:customs_associated_items][item_number][:made_in] : expectation
  if SdcEnv.new_framework
    expect(SdcWebsite.customs_form.item.made_in.text_field(item_number).text_value).to eql(expectation), "Made In of Item ##{item_number} is incorrect"
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).made_in.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).made_in.textbox.text).to eql(expectation) if SdcEnv.sdc_app == :mail
  end
end

Then /^expect customs associated item (\d+) Tariff is (.*)$/ do |item_number, expectation|
  expectation = expectation.eql?('correct') ? TestData.hash[:customs_associated_items][item_number][:tarriff] : expectation
  if SdcEnv.new_framework
    expect(dcWebsite.customs_form.item.hs_tariff(item_number).text_value.to_f).to eql(expectation.to_f), "Made In of Item ##{item_number} is incorrect"
  else
    sleep(0.5)
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).hs_tariff.text.to_f).to eql(expectation.to_f) if SdcEnv.sdc_app == :orders
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).hs_tariff.text.to_f).to eql(expectation.to_f) if SdcEnv.sdc_app == :mail
  end
end

