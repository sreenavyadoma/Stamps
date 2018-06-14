# encoding: utf-8


Then /^[Ss]et Print form Mail-From to (.*)$/ do |str|
  mail_from = SdcMail.print_form.mail_from
  mail_from.selection(:selection_element, str)
  text = mail_from.text_field.text_value
  unless text.eql? str
    mail_from.drop_down.click
    mail_from.selection_element.click unless mail_from.selection_element.present?
    mail_from.selection_element.safe_click
  end
end

Then /^[Cc]heck Print form [Ee]mail [Tt]racking checkbox$/ do
  stamps.mail.print_form.email_tracking.email_checkbox.click
end

Then /^set print form weight to lbs (\d+) oz (\d+)$/ do |lbs, oz|
  step "set print form pounds to #{lbs}"
  step "set print form ounces to #{oz}"
end

Then /^set print form pounds to (\d+\.?\d*)$/ do |lbs|
  SdcMail.print_form.weight.lbs.set(lbs)
  step "expect print form pounds is #{lbs}"
  TestData.hash[:lbs] = lbs
end

Then /^set print form ounces to (\d+\.?\d*)$/ do |oz|
  SdcMail.print_form.weight.oz.set(oz)
  TestData.hash[:oz] = oz
end

Then /^expect print form pounds is (?:correct|(\d+))$/ do |lbs|
  lbs = lbs.nil? ? TestData.hash[:lbs] : lbs
  expect(SdcMail.print_form.weight.lbs.value.to_i).to eql lbs
end

Then /^expect print form ounce is (?:correct|(\d+))$/ do |oz|
  oz = oz.nil? ? TestData.hash[:oz] : oz
  expect(SdcMail.print_form.weight.oz.value.to_i).to eql oz
end

Then /^set print form dimensions to length (\d+) width (\d+) height (\d+)$/ do |l, w, h|
  step "set print form length to #{l}"
  step "set print form width to #{w}"
  step "set print form height to #{h}"
end

Then /^set print form length to (\d+)$/ do |l|
  length = SdcMail.print_form.dimensions.length
  expect(length).to be_present, 'Length text field is not present'
  length.set(l)
  expect(length.value.to_i).to eql l
  TestData.hash[:length] = l
end

Then /^set print form width to (\d+)$/ do |w|
  width = SdcMail.print_form.dimensions.width
  expect(width).to be_present, 'Width text field is not present'
  width.set(w)
  expect(width.value.to_i).to eql w
  TestData.hash[:width] = w
end

Then /^set print form height to (\d+)$/ do |h|
  height = SdcMail.print_form.dimensions.height
  expect(height).to be_present, 'Height text field is not present'
  height.set(h)
  expect(height.value.to_i).to eql h
  TestData.hash[:height] = h
end

Then /^expect print form length is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:length] : h
  expect(SdcMail.print_form.dimensions.length.value.to_i).to eql h
end

Then /^expect print form width is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:width] : h
  expect(SdcMail.print_form.dimensions.width.value.to_i).to eql h
end

Then /^expect print form height is (?:correct|(\d+))$/ do |h|
  h = h.nil? ? TestData.hash[:height] : h
  expect(SdcMail.print_form.dimensions.height.value.to_i).to eql h
end

# dimension expectations
Then /^[Ee]xpect Print form Length is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql((str.nil? ? TestData.hash[:length] : str).to_i)
end

Then /^[Ee]xpect Print form width is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql((str.nil? ? TestData.hash[:width] : str).to_i)
end

Then /^[Ee]xpect Print form height is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql((str.nil? ? TestData.hash[:height] : str).to_i)
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice (.*) is not present in dropdown list$/ do |service|
  expect(stamps.mail.print_form.service.select_service(TestData.hash[:service] = service).present?).to be(false)
end

Then /^select print form service (.*)$/ do |str|
  SdcLogger.debug "service: #{str}"
  TestData.hash[:service] = str
  if SdcEnv.new_framework
    service = SdcMail.print_form.service
    service.drop_down.click
    service.service_element(:service, str)
    service.inline_cost_element(:inline_cost, str)
    service.drop_down.click unless service.service.present?
    expect(service.service.present?).to be(true), "Service #{str} is not on list of values"

    service_inline_cost = service.inline_cost.text_value.dollar_amount_str
    SdcLogger.debug "service_inline_cost: #{service_inline_cost}"
    expect(service_inline_cost.to_f).to be > 0

    service.service.click
    service.cost.wait_until_present(timeout: 3)
    TestData.hash[:service_cost] = service.cost.text_value.dollar_amount_str

    SdcLogger.debug "service_cost: #{TestData.hash[:service_cost]}"
    expect(service.text_field.text_value).to include str
  else
    stamps.mail.print_form.service.select_service(str)
  end
end

Then /^select print form service for stamps (.*)$/ do |str|
  service = SdcMail.print_form.service
  service.service_element(:service, str)
  service.drop_down.click unless service.service.present?
  expect(service.service.present?).to be(true), "Service #{str} is not on list of values"
  service.service.click
  expect(service.text_field.text_value).to include(str)
  step 'blur out on print form'
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Cc]ost [Ff]or (.*) is (.*)$/ do |service, cost|
  step 'blur out on print form'
  stamps.mail.print_form.service.service_cost(TestData.hash[:service] = service).to eql("$#{cost}")
end

When /^[Pp]rint [Ll]abel$/ do
  stamps.mail.mail_toolbar.print_label
end

When /^[Cc]lick Print Sample button on Print form$/ do
  @print_window = stamps.mail.mail_toolbar.print_sample
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Ll]eft side starting label$/ do
  stamps.mail.print_preview.select_left_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, left side label is selected$/ do
  expect(stamps.mail.print_preview.left_selected?).to be(true), "Left Label image doesn't exists on Print form"
end

When /^[Ss]elect on [Pp]rint [Pp]review [Pp]anel, [Rr]ight side starting label$/ do
  stamps.mail.print_preview.select_right_label
end

Then /^[Ee]xpect on [Pp]rint [Pp]review [Pp]anel, right side label is selected$/ do
  expect(stamps.mail.print_preview.right_selected?).to be(true), "Right Label image doesn't exists on Print form"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})["group" + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  step "set print form mail-to country to #{TestData.hash[:country]}"
end

Then /^set print form ship-to to international address$/ do |table|
  hash = table.hashes.first
  step "set print form mail-to country to #{hash['country']}"
  step "set print form name to #{hash['name']}"
  step "set print form company to #{hash['company']}"
  step "set print form address 1 to #{hash['street_address_1']}"
  step "set print form address 2 to #{hash['street_address_2']}"
  step "set print form province to #{hash['province']}"
  step "set print form city to #{hash['city']}"
  step "set print form postal code to #{hash['postal_code']}"
  step "set print form phone to #{hash['phone']}"
  TestData.hash[:address_hash] = hash
end

Then /^set print form mail-to country to (.*)$/ do |str|
  mail_to = SdcMail.print_form.mail_to
  mail_to.selection(:selection_element, str)
  text_field = mail_to.dom_text_field
  text_field.safe_wait_until_present(timeout: 1)
  text_field = mail_to.int_text_field if mail_to.int_text_field.present?
  unless text_field.text_value.eql? str
    text_field.set str
    mail_to.selection_element.safe_wait_until_present(timeout: 2)
    mail_to.selection_element.safe_click
  end
  expect(text_field.text_value).to eql str
end

Then /^set print form name to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.name.wait_until_present(timeout: 4)
  mail_to.name.click
  mail_to.name.set(str)
  TestData.hash[:name] = str
end

Then /^set print form company to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.company.wait_until_present(timeout: 4)
  mail_to.company.click
  mail_to.company.set(str)
  TestData.hash[:company] = str
end

Then /^set print form address 1 to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.address_1.wait_until_present(timeout: 4)
  mail_to.address_1.click
  mail_to.address_1.set(str)
  TestData.hash[:address_1] = str
end

Then /^set print form address 2 to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.address_2.wait_until_present(timeout: 4)
  mail_to.address_2.click
  mail_to.address_2.set(str)
  TestData.hash[:address_2] = str
end

Then /^set print form city to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.city.wait_until_present(timeout: 4)
  mail_to.city.click
  mail_to.city.set(str)
  TestData.hash[:city] = str
end

Then /^set print form province to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.province.wait_until_present(timeout: 4)
  mail_to.province.click
  mail_to.province.set(str)
  TestData.hash[:province] = str
end

Then /^set print form postal code to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_full_name : str
  mail_to = SdcMail.print_form.mail_to
  mail_to.postal_code.wait_until_present(timeout: 4)
  mail_to.postal_code.click
  mail_to.postal_code.set(str)
  TestData.hash[:postal_code] = str
end

Then /^set print form phone to (.*)$/ do |str|
  str = str.casecmp('random').zero? ? TestHelper.rand_phone : str
  mail_to = SdcMail.print_form.mail_to
  phone = mail_to.phone
  phone = mail_to.int_phone if mail_to.int_phone.present?
  phone.wait_until_present(timeout: 4)
  phone.click
  phone.set(str)
  TestData.hash[:phone] = str
end

Then /^click print form edit customs form button$/ do
  SdcMail.print_form.contents.customs_form.click
end

##
#
#
#
#
#
#
#
#
Then /^[Ee]xpect Print form Domestic Address Field is present$/ do
  expect(stamps.mail.print_form.mail_to.mail_address.textarea).to be_present, "Print form Domestic Address Field is NOT present"
end

Then /^[Ee]xpect Print form International Name Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.name).to be_present, "Print form International Name Field is NOT present"
end

Then /^[Ee]xpect Print form International Company Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.company).to be_present, "Print form International Company Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 1 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.address_1).to be_present, "Print form International Address 1 Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 2 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.address_2).to be_present, "Print form International Address 2 Field is NOT present"
end

Then /^[Ee]xpect Print form International City Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.city).to be_present, "Print form International City Field is NOT present"
end

Then /^[Ee]xpect Print form International Province Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.province).to be_present, "Print form International Province Field is NOT present"
end

Then /^[Ee]xpect Print form International Postcode Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.postal_code).to be_present, "Print form International Postcode Field is NOT present"
end

Then /^[Ee]xpect Print form International Phone Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.phone).to be_present, "Print form International Phone Field is NOT present"
end

Then /^[Ss]ave Print Form Total Cost$/ do
  TestData.hash[:total_ship_cost] = stamps.mail.mail_toolbar.total
end

Then /^[Ss]ave Print Form Mail From$/ do
  TestData.hash[:ship_from] = stamps.mail.print_form.mail_from.textbox.text
end

Then /^[Cc]lick on [Bb]uy [Mm]ore [Ll]abels link$/ do
  stamps.mail.print_preview.buy_more_labels.link.click
end

#AB_ORDERSAUTO_3516
Then /^[Ee]xpect Print form service is empty$/ do
  expect(stamps.mail.print_form.service.textbox.text).eql?("")
end



