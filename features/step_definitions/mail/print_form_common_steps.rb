# encoding: utf-8


Then /^[Bb]lur out on [Pp]rint [Ff]orm$/ do
  stamps.mail.print_form.blur_out
end

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
  expect(stamps.mail.print_form.dimensions.length.text.to_i).to eql(((str.nil?) ? TestData.hash[:length] : str).to_i)
end

Then /^[Ee]xpect Print form width is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.width.text.to_i).to eql(((str.nil?) ? TestData.hash[:width] : str).to_i)
end

Then /^[Ee]xpect Print form height is (?:correct|(\d+))$/ do |str|
  expect(stamps.mail.print_form.dimensions.height.text.to_i).to eql(((str.nil?) ? TestData.hash[:height] : str).to_i)
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

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ss]ervice [Cc]ost [Ff]or (.*) is (.*)$/ do |service, cost|
  step "blur out on print form"
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

Then /^set print form mail-to [Cc]ountry to (.*)$/ do |str|
  if SdcEnv.new_framework
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
    sleep 2
  else
    20.times do
      stamps.mail.print_form.mail_to.mail_to_country.select_country(TestData.hash[:country] = str)
      break if stamps.mail.print_form.mail_to.mail_to_country.textbox.text.include?(TestData.hash[:country]) && stamps.mail.print_form.service.has_rates?
    end
    expect(stamps.mail.print_form.service).to be_has_rates, "Mail service list of values does not have rates."
    expect(stamps.mail.print_form.mail_to.mail_to_country.textbox.text).to eql(TestData.hash[:country])
  end
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



