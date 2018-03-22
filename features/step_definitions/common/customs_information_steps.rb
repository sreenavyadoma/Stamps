
Then /^[Cc]lick (?:Order Details|Print) [Ff]orm (?:[Ee]dit [Cc]ustoms|[Ee]dit|[Cc]ustoms) [Ff]orm [Bb]utton$/ do
  10.times do
    if SdcEnv.web_app == :orders
      stamps.orders.order_details.contents.customs_form.scroll_into_view
      stamps.orders.order_details.contents.customs_form.click
    end
    stamps.common_modals.customs_form.wait_until_present(2)
    break if stamps.common_modals.customs_form.present?
  end
  stamps.mail.print_form.mail_customs.edit_customs_form if SdcEnv.web_app == :mail
  step 'expect customs form is present'
end

Then /^[Ee]xpect [Cc]ustoms [Ff]orm is [Pp]resent$/ do
  expect(stamps.common_modals.customs_form).to be_present, 'Customs form did not open'
end

Then /^[Bb]lur [Oo]ut [Oo]n [Cc]ustoms [Ff]orm(?:| (\d+)(?:| times))$/ do |count|
  count = count.nil? ? 1 : count.to_i
  count.times { stamps.common_modals.customs_form.blur_out } if SdcEnv.web_app == :orders
  count.times { stamps.mail.print_form.mail_customs.edit_customs_form.blur_out } if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs Package Contents to (.*)$/ do |value|
  TestData.store[:customs_package_contents] = value
  stamps.common_modals.customs_form.package_contents.select(TestData.store[:customs_package_contents]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.select(TestData.store[:customs_package_contents]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs Package Contents is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_package_contents] : expectation
  sleep(0.15)
  expect(stamps.common_modals.customs_form.package_contents.combobox.textbox.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.combobox.textbox.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs Non-Delivery Options to (.*)$/ do |value|
  TestData.store[:customs_non_delivery_options] = value
  stamps.common_modals.customs_form.non_delivery_options.select(TestData.store[:customs_non_delivery_options]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.select(TestData.store[:customs_non_delivery_options]) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Non-Delivery Options is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_non_delivery_options] : expectation
  actual = ""
  10.times do
    if SdcEnv.web_app == :orders
      actual = stamps.common_modals.customs_form.non_delivery_options.textbox.text
      break if actual == expectation
    end
    if SdcEnv.web_app == :mail
      actual = stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.textbox.text
      break if actual == expectation
    end
  end
  SdcTest.log.info "Expectation: #{expectation}"
  SdcTest.log.info "Got: #{actual}"
  expect(stamps.common_modals.customs_form.non_delivery_options.textbox.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.non_delivery_options.textbox.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs Internal Transaction Number to (.*)$/ do |value|
  TestData.store[:customs_internal_transaction_no] = value
  stamps.common_modals.customs_form.internal_transaction.select(TestData.store[:customs_internal_transaction_no]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.internal_transaction.select(TestData.store[:customs_internal_transaction_no]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs Internal Transaction Number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_internal_transaction_no] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.web_app == :mail
end

# duplicate
# Then /^[Ee]xpect Customs Internal Transaction Number is (.+)$/ do |expectation|
#   step "Blur out on Customs form"
#   sleep(0.5)
#   expect(stamps.common_modals.customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.web_app == :orders
#   expect(stamps.mail.print_form.mail_customs.edit_customs_form.internal_transaction.textbox.text).to eql(expectation) if SdcEnv.web_app == :mail
# end

Then /^[Ss]et Customs More Info to (?:(?:a|some) random string|(.*))$/ do |value|
  TestData.store[:customs_more_info] = value.nil? ? TestHelper.rand_alpha_numeric(6, 18) : value
  stamps.common_modals.customs_form.package_contents.contents.more_info.set(TestData.store[:customs_more_info]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.set(TestData.store[:customs_more_info]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs More Info is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_more_info] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.more_info.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs ITN Number to (?:(?:a|some) random string|(.*))$/ do |value|
  TestData.store[:customs_itn_no] = value.nil? ? TestHelper.rand_alpha_numeric(8, 50) : value
  stamps.common_modals.customs_form.itn_number.set(TestData.store[:customs_itn_no]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.set(TestData.store[:customs_itn_no]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs ITN Number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_itn_no] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.itn_number.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs License Number to (?:(?:a|some) random string|(.*))$/ do |value|
  TestData.store[:customs_license_no] = ((value.nil? ? TestHelper.rand_alpha_numeric(2, 6) : value)[0, 5])
  stamps.common_modals.customs_form.license.set(TestData.store[:customs_license_no]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.license.set(TestData.store[:customs_license_no]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs License Number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_license_no] : expectation
  sleep(1)
  expect(stamps.common_modals.customs_form.license.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.license.text).to eql(expectation) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ss]et Customs Certificate Number to (?:(?:a|some) random string|(.*))$/ do |value|
  TestData.store[:customs_certificate_no] = (((value.nil? ? TestHelper.rand_alpha_numeric(2, 8) : value))[0, 7])
  stamps.common_modals.customs_form.certificate.set(TestData.store[:customs_certificate_no]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.certificate.set(TestData.store[:customs_certificate_no]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs Certificate Number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_certificate_no] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.certificate.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.certificate.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs Invoice Number to (?:(?:a|some) random string|(.*))$/ do |value|
  TestData.store[:customs_invoice_no] = ((value.nil? ? TestHelper.rand_alpha_numeric(2, 10) : value)[0, 9])
  stamps.common_modals.customs_form.invoice.set(TestData.store[:customs_invoice_no]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.invoice.set(TestData.store[:customs_invoice_no]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs Invoice Number is (?:correct|(.*))$/ do |expectation|
  expectation = expectation.nil? ? TestData.store[:customs_invoice_no] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.invoice.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.invoice.text).to eql(expectation) if SdcEnv.web_app == :mail
end

#todo-Rob revisit customs form
Then /^[Dd]elete Customs Associated Item (\d+)$/ do |item_number|
  if SdcEnv.web_app == :orders
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

Then /^[Cc]heck Customs form I agree to the USPS Privacy Act Statement$/ do
  stamps.common_modals.customs_form.agree_to_terms.check if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.check if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs I agree to the USPS Privacy Act Statement is checked$/ do
  sleep(0.5)
  expect(stamps.common_modals.customs_form.agree_to_terms.checked?).to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.checked?).to be(true) if SdcEnv.web_app == :mail
end

Then /^[Uu]ncheck Customs form I agree to the USPS Privacy Act Statement$/ do
  stamps.common_modals.customs_form.agree_to_terms.uncheck if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.uncheck if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs I agree to the USPS Privacy Act Statement is unchecked$/ do
  sleep(0.05)
  expect(stamps.common_modals.customs_form.agree_to_terms.checked?).not_to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.agree_to_terms.checked?).not_to be(true) if SdcEnv.web_app == :mail
end

Then /^[Cc]lose Customs Information form$/ do
  step "Pause for 4 seconds"
  step "Blur out on Customs form 20 times"
  step "Save Customs Information form Total amount"
  if SdcEnv.web_app == :orders
    stamps.common_modals.customs_form.close
    step "blur out on Order Details form"
    step "Save Order Details data"
  end
  stamps.mail.print_form.mail_customs.edit_customs_form.close if SdcEnv.web_app == :mail
end

Then /^Cancel Customs Form$/ do
  step "Blur out on Customs form"
  expect(stamps.common_modals.customs_form.cancel).to be(false) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.cancel).to be(false) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs USPS Privacy Act Warning is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.usps_privacy_act_warning.visible?).to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.usps_privacy_act_warning.visible?).to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs USPS Privacy Act Warning is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.usps_privacy_act_warning.visible?).to be(false) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.usps_privacy_act_warning.visible?).to be(false) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs More Info is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.more_info.present?).not_to be(true) if SdcEnv.web_app == :orders
  expect(stamps.common_modals.customs_form.package_contents.contents.more_info).not_to be_present if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info.present?).not_to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs More Info is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.more_info).to be_present if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.more_info).to be_present if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs License Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.license).to be_present if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.license).to be_present if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs License Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.license.present?).not_to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.license.present?).not_to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Certificate Number is hidden$/ do
  expect(stamps.common_modals.customs_form.package_contents.contents.certificate.present?).not_to be(true) if SdcEnv.web_app == :orders
  expect(stamps.common_modals.customs_form.package_contents.contents.certificate.present?).not_to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Certificate Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.certificate).to be_present if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.certificate).to be_present if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Invoice Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.invoice.present?).not_to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.invoice.present?).not_to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Invoice Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.package_contents.contents.invoice).to be_present if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.package_contents.contents.invoice).to be_present if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs ITN Number is hidden$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.itn_number.enabled?).to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.enabled?).to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs ITN Number is visible$/ do
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.itn_number.enabled?).to be(true) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.itn_number.enabled?).to be(true) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Associated Item Grid count is (.+)$/ do |expectation|
  step "Blur out on Customs form"
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.size).to eql(expectation.to_i) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.size).to eql(expectation.to_i) if SdcEnv.web_app == :mail
end

Then /^[Ss]ave Customs Information form [Tt]otal amount$/ do
  TestData.store[:customs_total_value] = stamps.common_modals.customs_form.total_cost.text.dollar_amount_str.to_f.round(2) if SdcEnv.web_app == :orders
  TestData.store[:customs_total_value] = stamps.mail.print_form.mail_customs.edit_customs_form.total_cost.text.dollar_amount_str.to_f.round(2) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Total Value is (?:correct|(.*))$/ do |expectation|
  step "Blur out on Customs form"
  if SdcEnv.web_app == :orders
    expect(stamps.common_modals.customs_form.total_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.store[:customs_total_value] : expectation.to_f.round(2))
  end
  if SdcEnv.web_app == :mail
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.total_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.store[:customs_total_value] : expectation.to_f.round(2))
  end
end

Then /^[Aa]dd Customs Associated Item (\d+), Description (.*), Qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "add Customs Associated Item #{item_number}"
  step "set Customs Associated Item #{item_number} Description to #{description}"
  step "set Customs Associated Item #{item_number} Qty to #{qty}"
  step "set Customs Associated Item #{item_number} Unit Price to #{price}"
  step "set Customs Associated Item #{item_number} Made In is Country to #{made_in}"
  step "set Customs Associated Item #{item_number} Tarriff to #{tariff}"
end

Then /^[Aa]dd Customs Associated Item (\d+)$/ do |item_number|
  stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i) if SdcEnv.web_app == :mail
end

Then /^[Ss]et Customs Associated Item (\d+) Description to (.*)$/ do |item_number, value|
  TestData.store[:customs_associated_items][item_number] = {} unless TestData.store[:customs_associated_items].has_key?(item_number)
  TestData.store[:customs_associated_items][item_number][:description] = (value.downcase.include?('random') ? TestHelper.rand_alpha_numeric : value)
  stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_description.set(TestData.store[:customs_associated_items][item_number][:description]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_description.set(TestData.store[:customs_associated_items][item_number][:description]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ss]et Customs Associated Item (\d+) Qty to (\d+)$/ do |item_number, value|
  TestData.store[:customs_associated_items][item_number] = {} unless TestData.store[:customs_associated_items].has_key?(item_number)
  TestData.store[:customs_associated_items][item_number][:quantity] = value
  stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_qty.set(TestData.store[:customs_associated_items][item_number][:quantity]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_qty.set(TestData.store[:customs_associated_items][item_number][:quantity]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ss]et Customs Associated Item (\d+) Unit Price to (.*)$/ do |item_number, value|
  TestData.store[:customs_associated_items][item_number] = {} unless TestData.store[:customs_associated_items].has_key?(item_number)
  TestData.store[:customs_associated_items][item_number][:price] = value
  stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).unit_price.set(TestData.store[:customs_associated_items][item_number][:price]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).unit_price.set(TestData.store[:customs_associated_items][item_number][:price]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ss]et Customs Associated Item (\d+) Made In is Country to (.*)$/ do |item_number, value|
  TestData.store[:customs_associated_items][item_number] = {} unless TestData.store[:customs_associated_items].has_key?(item_number)
  TestData.store[:customs_associated_items][item_number][:made_in] = value
  if SdcEnv.web_app == :orders
    expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).made_in.select(
        TestData.store[:customs_associated_items][item_number][:made_in])).to eql(TestData.store[:customs_associated_items][item_number][:made_in])
  end
  if SdcEnv.web_app == :mail
    expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).made_in.select(
        TestData.store[:customs_associated_items][item_number][:made_in])).to eql(TestData.store[:customs_associated_items][item_number][:made_in])
  end
end

Then /^[Ss]et Customs Associated Item (\d+) Tarriff to (.*)$/ do |item_number, value|
  TestData.store[:customs_associated_items][item_number] = {} unless TestData.store[:customs_associated_items].has_key?(item_number)
  TestData.store[:customs_associated_items][item_number][:tarriff] = value
  stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).hs_tariff.set(TestData.store[:customs_associated_items][item_number][:tarriff]) if SdcEnv.web_app == :orders
  stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).hs_tariff.set(TestData.store[:customs_associated_items][item_number][:tarriff]) if SdcEnv.web_app == :mail
  step "Save Customs Information form Total amount"
end

Then /^[Ee]xpect Customs Associated Item (\d+) Description is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = expectation.nil? ? TestData.store[:customs_associated_items][item_number][:description] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_description.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_description.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Associated Item (\d+) Quantity is (?:correct|(\d+))$/ do |item_number, expectation|
  expectation = expectation.nil? ? TestData.store[:customs_associated_items][item_number][:quantity] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).item_qty.textbox.text.to_i).to eql(expectation.to_i) if SdcEnv.web_app == :orders
  expect(expectation.to_i).to eql(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).item_qty.textbox.text.to_i) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Associated Item (\d+) Unit Price is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = expectation.nil? ? TestData.store[:customs_associated_items][item_number][:price] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).unit_price.textbox.text.to_f).to eql(expectation.to_f) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).unit_price.textbox.text.to_f).to eql(expectation.to_f) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Associated Item (\d+) Made In is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = expectation.nil? ? TestData.store[:customs_associated_items][item_number][:made_in] : expectation
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).made_in.textbox.text).to eql(expectation) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).made_in.textbox.text).to eql(expectation) if SdcEnv.web_app == :mail
end

Then /^[Ee]xpect Customs Associated Item (\d+) Tariff is (?:correct|(.*))$/ do |item_number, expectation|
  expectation = (expectation.nil? ? TestData.store[:customs_associated_items][item_number][:tarriff] : expectation).to_f
  sleep(0.5)
  expect(stamps.common_modals.customs_form.associated_items.item_number(item_number.to_i).hs_tariff.text.to_f).to eql(expectation.to_f) if SdcEnv.web_app == :orders
  expect(stamps.mail.print_form.mail_customs.edit_customs_form.associated_items.item_number(item_number.to_i).hs_tariff.text.to_f).to eql(expectation.to_f) if SdcEnv.web_app == :mail
end

