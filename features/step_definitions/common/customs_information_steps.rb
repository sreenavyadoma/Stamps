
Then /^click order details form (?:edit customs|edit|customs) form button$/ do
  SdcOrders.order_details.contents.customs_form.click
end

Then /^[Ee]xpect [Cc]ustoms [Ff]orm is [Pp]resent$/ do
  expect(SdcWebsite.customs_form.title).to be_present, 'Customs form did not open'
end

Then /^[Bb]lur [Oo]ut [Oo]n [Cc]ustoms [Ff]orm$/ do
  SdcWebsite.customs_form.total.blur_out
  SdcWebsite.customs_form.title.blur_out
end

Then /^set customs package contents to (.*)$/ do |value|
  package_contents = SdcWebsite.customs_form.package_contents
  package_contents.selection_element(name: :selection, value: value)
  package_contents.drop_down.click unless package_contents.selection.present?
  package_contents.selection.click unless package_contents.selection.class_disabled?
  step "expect customs package contents is #{value}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_package_contents] = value
end

Then /^expect customs package contents is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:customs_package_contents]
  expect(SdcWebsite.customs_form.package_contents.text_field.text_value).to eql(expectation), 'Package Content is incorrect'
end

Then /^set customs non-delivery options to (.*)$/ do |value|
  non_delivery = SdcWebsite.customs_form.non_delivery
  non_delivery.selection_element(name: :selection, value: value)
  non_delivery.drop_down.click unless non_delivery.selection.present?
  non_delivery.selection.click unless non_delivery.selection.class_disabled?
  step "expect customs non-delivery options is #{value}"
  TestData.hash[:customs_non_delivery_options] = value
end

Then /^expect customs non-delivery options is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_non_delivery_options]
  expect(SdcWebsite.customs_form.non_delivery.text_field.text_value).to eql(str)
end

Then /^set customs internal transaction number to (.*)$/ do |value|
  internal_transaction = SdcWebsite.customs_form.internal_transaction
  internal_transaction.selection_element(name: :selection, value: value)
  internal_transaction.drop_down.click unless internal_transaction.selection.present?
  internal_transaction.selection.click unless internal_transaction.selection.class_disabled?
  step "expect customs internal transaction number is #{value}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_internal_transaction_no] = value
end

Then /^expect customs internal transaction number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_internal_transaction_no]
  expect(SdcWebsite.customs_form.internal_transaction.text_field.text_value).to eql(str)
end

Then /^[Ss]et Customs More Info to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 6, max: 18)
  SdcWebsite.customs_form.more_info.set(str) if SdcWebsite.customs_form.more_info.present?
  step "expect Customs More Info is #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_more_info] = str
end

Then /^ [Ss]et Customs More Info to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 6, max: 18)
  SdcWebsite.customs_form.more_info.set(str) if SdcWebsite.customs_form.more_info.present?
  step "expect Customs More Info is #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_more_info] = str
end

Then /^[Ee]xpect Customs More Info is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_more_info]
  customs_form = SdcWebsite.customs_form
  customs_form.more_info.wait_until_present(timeout: 5)
  expect(customs_form.more_info).to be_present, 'More Info field is not present'
  expect(customs_form.more_info.text_value).to eql(str), 'More Info value is incorrect'
end

Then /^set customs itn number to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 8, max: 50)
  customs_form = SdcWebsite.customs_form
  customs_form.itn.wait_until_present(timeout: 5)
  customs_form.itn.set(str) unless customs_form.itn.class_disabled?
  step "expect customs i agree to the usps privacy act statement is checked #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_itn_no] = str
end

Then /^expect customs i agree to the usps privacy act statement is checked (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_itn_no]
  customs_form = SdcWebsite.customs_form
  customs_form.itn.wait_until_present(timeout: 5)
  expect(customs_form.itn.class_disabled?).to be(false), 'ITN number is disabled'
  expect(customs_form.itn.text_value).to eql(str)
end

Then /^set customs license number to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 2, max: 6)
  customs_form = SdcWebsite.customs_form
  customs_form.license.wait_until_present(timeout: 5)
  customs_form.license.set(str) if customs_form.license.present?
  step "expect customs license number is #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_license_no] = str
end

Then /^expect customs license number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_license_no]
  expect(SdcWebsite.customs_form.license).to be_present, 'License field is not present'
  expect(SdcWebsite.customs_form.license.text_value).to eql(str)
  step 'Save Customs Information form Total amount'
end

Then /^set customs certificate number to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 2, max: 8)
  customs_form = SdcWebsite.customs_form
  customs_form.certificate.wait_until_present(timeout: 5)
  customs_form.certificate.set(str) if customs_form.certificate.present?
  step "expect customs certificate number is #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_certificate_no] = str
end

Then /^expect customs certificate number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_certificate_no]
  customs_form = SdcWebsite.customs_form
  customs_form.certificate.wait_until_present(timeout: 5)
  expect(customs_form.certificate.text_value).to eql(str)
  expect(customs_form.certificate.text_value).to eql(str)
end

Then /^set customs invoice number to (?:(?:a|some) random string|(.*))$/ do |str|
  str ||= TestHelper.rand_alpha_numeric(min: 2, max: 10)
  customs_form = SdcWebsite.customs_form
  customs_form.invoice.wait_until_present(timeout: 5)
  customs_form.invoice.set(str) if customs_form.invoice.present?
  step "expect customs invoice number is #{str}"
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_invoice_no] = str
end

Then /^expect customs invoice number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:customs_invoice_no]
  customs_form = SdcWebsite.customs_form
  customs_form.invoice.wait_until_present(timeout: 5)
  expect(customs_form.invoice.text_value).to eql(str)
end

Then /^[Dd]elete Customs Associated Item (\d+)$/ do |item|
  SdcWebsite.customs_form.item.delete(item).click
end

Then /^check customs form i agree to the usps privacy act statement$/ do
  customs_form = SdcWebsite.customs_form
  customs_form.agree.wait_until_present(timeout: 5)
  customs_form.agree.check
  step 'expect customs i agree to the usps privacy act statement is checked'
end

Then /^expect customs i agree to the usps privacy act statement is checked$/ do
  customs_form = SdcWebsite.customs_form
  customs_form.agree.wait_until_present(timeout: 5)
  expect(customs_form.agree.checked?).to be(true), 'I agree to the USPS Privacy Act Statement is not checked'
end

Then /^[Uu]ncheck customs form i agree to the usps privacy act statement$/ do
  customs_form = SdcWebsite.customs_form
  customs_form.agree.wait_until_present(timeout: 5)
  customs_form.agree.uncheck
  step 'expect customs i agree to the usps privacy act statement is unchecked'
end

Then /^expect customs i agree to the usps privacy act statement is unchecked$/ do
  customs_form = SdcWebsite.customs_form
  customs_form.agree.wait_until_present(timeout: 5)
  expect(customs_form.agree.checked?).to be(false), 'I agree to the USPS Privacy Act Statement is not unchecked'
end

Then /^close customs information form$/ do
  step 'pause for 4 seconds'
  step 'Blur out on Customs form'
  step 'Save Customs Information form Total amount'
  SdcWebsite.customs_form.close.click
end

Then /^Cancel Customs Form$/ do
  SdcWebclient.customs_form.x_btn.click
end

Then /^[Ee]xpect Customs USPS Privacy Act Warning is visible$/ do
  expect(SdcWebclient.customs_form.usps_warning).to be_present, 'USPS Warning is not present'
end

Then /^[Ee]xpect Customs More Info is hidden$/ do
  expect(SdcWebclient.customs_form.more_info).not_to be_present, 'More Info is present'
end

Then /^[Ee]xpect Customs More Info is visible$/ do
  expect(SdcWebclient.customs_form.more_info).to be_present, 'More Info is not present'
end

Then /^[Ee]xpect Customs License Number is visible$/ do
  expect(SdcWebclient.customs_form.license).to be_present, 'License number field is not present'
end

Then /^[Ee]xpect Customs License Number is hidden$/ do
  expect(SdcWebclient.customs_form.license).not_to be_present, 'License number field is not hidden'
end

Then /^[Ee]xpect Customs Certificate Number is hidden$/ do
  expect(SdcWebclient.customs_form.certificate).not_to be_present, 'Certificate Number field is not hidden'
end

Then /^[Ee]xpect Customs Certificate Number is visible$/ do
  expect(SdcWebclient.customs_form.certificate).to be_present, 'Certificate Number field is not visible'
end

Then /^[Ee]xpect Customs Invoice Number is hidden$/ do
  expect(SdcWebclient.customs_form.invoice).not_to be_present, 'Invoice Number field is not hidden'
end

Then /^[Ee]xpect Customs Invoice Number is visible$/ do
  expect(SdcWebclient.customs_form.invoice).to be_present, 'Invoice Number field is not visible'
end

Then /^[Ee]xpect Customs ITN Number is hidden$/ do
  expect(SdcWebclient.customs_form.itn).not_to be_present, 'Invoice Number field is not hidden'
end

Then /^[Ee]xpect Customs ITN Number is visible$/ do
  expect(SdcWebclient.customs_form.itn).to be_present, 'Invoice Number field is not visible'
end

Then /^expect customs associated item grid count is (.+)$/ do |str|
  expect(SdcWebsite.customs_form.associated_items.size).to eql(str.to_i)
end

Then /^[Ss]ave Customs Information form [Tt]otal amount$/ do
  customs_form = SdcWebsite.customs_form
  total = customs_form.total.text_value.dollar_amount_str.to_f.round(2)
  TestData.hash[:customs_total_value] = total
end

Then /^[Ee]xpect Customs Total Value is (?:correct|(.*))$/ do |str|
  step 'Blur out on Customs form'
  str ||= TestData.hash[:customs_total_value]
  customs_form = SdcWebsite.customs_form
  expect(customs_form.total.text_value.dollar_amount_str.to_f.round(2)).to eql(str)
end

Then /^add customs associated item (\d+), description (.*), qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "add customs associated item #{item_number}" if item_number > 1
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} description to #{description}"
  step "set customs associated item #{item_number} qty to #{qty}"
  step "set customs associated item #{item_number} unit price to #{price}"
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} made in #{made_in}"
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} Tarriff to #{tariff}"
end

Then /^edit customs associated item (\d+), description (.*), qty (\d+), Price (.+), Made In (.+), Tariff (.*)$/ do |item_number, description, qty, price, made_in, tariff|
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} description to #{description}"
  step "set customs associated item #{item_number} qty to #{qty}"
  step "set customs associated item #{item_number} unit price to #{price}"
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} made in #{made_in}"
  step "scroll into view customs associated item #{item_number}"
  step "set customs associated item #{item_number} Tarriff to #{tariff}"
end

Then /^add customs associated item (\d+)$/ do |item_number|
  SdcWebsite.customs_form.add_item.click
end

Then /^scroll into view customs associated item (\d+)$/ do |item_number|
  item = SdcWebsite.customs_form.item
  item.made_in.drop_down(item_number).scroll_into_view
  item.item_description(item_number).scroll_into_view
  item.hs_tariff(item_number).scroll_into_view
  item.qty(item_number).scroll_into_view
  item.unit_price(item_number).scroll_into_view
  item.delete(item_number).scroll_into_view
end

Then /^set customs associated item (\d+) description to (.*)$/ do |item_number, value|
  TestData.hash[:customs_associated_items][item_number] ||= {}
  value = TestHelper.rand_alpha_numeric if value.casecmp('random').zero?
  SdcWebsite.customs_form.item.item_description(item_number).scroll_into_view.set(value)
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_associated_items][item_number][:description] = value
end

Then /^set customs associated item (\d+) qty to (\d+)$/ do |item_number, value|
  qty = SdcWebsite.customs_form.item.qty(item_number)
  qty.scroll_into_view
  qty.set(value)
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:quantity] = value
end

Then /^set customs associated item (\d+) unit price to (.*)$/ do |item_number, value|
  unit_price = SdcWebsite.customs_form.item.unit_price(item_number)
  unit_price.scroll_into_view
  unit_price.set(value)
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:price] = value
end
# set customs associated item (\d+) made in (.*)
Then /^set customs associated item (\d+) made in (.*)$/ do |item_number, value|
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
  selection.safe_click
  drop_down.scroll_into_view
  text_field.scroll_into_view
  text_field.wait_until_present(timeout: 2)
  expect(text_field.text_value).to include value
  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:made_in] = value
end

Then /^set customs associated item (\d+) Tarriff to (.*)$/ do |item_number, value|
  SdcWebsite.customs_form.item.hs_tariff(item_number).scroll_into_view.set(value)
  step 'Save Customs Information form Total amount'
  TestData.hash[:customs_associated_items][item_number] ||= {}
  TestData.hash[:customs_associated_items][item_number][:tarriff] = value
end

Then /^expect customs associated item (\d+) Description is (?:correct|(.*))$/ do |item_number, str|
  str ||= TestData.hash[:customs_associated_items][item_number][:description]
  expect(SdcWebsite.customs_form.item.item_description(item_number).text_value).to eql(str)
end

Then /^expect customs associated item (\d+) Quantity is (?:correct|(.*))$/ do |item_number, str|
  str ||= TestData.hash[:customs_associated_items][item_number][:quantity]
  expect(SdcWebsite.customs_form.item.qty(item_number).value.to_i).to eql(str.to_i)
end

Then /^expect customs associated item (\d+) Unit Price is (?:correct|(.*))$/ do |item_number, str|
  str ||= TestData.hash[:customs_associated_items][item_number][:price]
  expect(SdcWebsite.customs_form.item.unit_price(item_number).value.to_f).to eql(str.to_f)
end

Then /^expect customs associated item (\d+) Made In is (?:correct|(.*))$/ do |item_number, str|
  str ||= TestData.hash[:customs_associated_items][item_number][:made_in]
  expect(SdcWebsite.customs_form.item.made_in.text_field(item_number).text_value).to eql(str)
end

Then /^expect customs associated item (\d+) Tariff is (?:correct|(.*))$/ do |item_number, str|
  str ||= TestData.hash[:customs_associated_items][item_number][:tarriff]
  expect(SdcWebsite.customs_form.item.hs_tariff(item_number).text_value.to_f).to eql(str.to_f)
end

