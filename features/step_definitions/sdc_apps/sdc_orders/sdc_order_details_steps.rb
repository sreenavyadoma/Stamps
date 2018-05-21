
Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  step 'show order details form ship-to fields'
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(TestHelper.address_helper_zone(address, SdcEnv.env))
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    domestic = order_details.ship_to.domestic
    domestic.address.click
    domestic.address.set(TestData.hash[:ship_to_domestic])
  else
    stamps.orders.order_details.ship_to.domestic.set(TestData.hash[:ship_to_domestic])
  end
  step 'Save Order Details data'
  step 'hide order details form Ship-To fields'
end

Then /^set order details service to (.*)$/ do |str|
  step 'expect order details is present'
  TestData.hash[:service] = str
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    service = order_details.service
    service.selection(name: :selection_element, str: str)
    service.text_field.scroll_into_view
    service.drop_down.scroll_into_view
    service.drop_down.click
    service.drop_down.click unless service.selection_element.present?
    service.selection_element.click unless service.selection_element.class_disabled?
    expect('expect Order Details service is correct')
    order_details.weight_label.blur_out(ctr: 2)
    order_details.service_label.blur_out(ctr: 2)
    order_details.reference_num.blur_out(ctr: 2)
    order_details.ship_to_label.blur_out(ctr: 2)
    order_details.order_id.blur_out(ctr: 2)
    order_details.title.blur_out(ctr: 2)

    service.wait_until(timeout: 15) { service.cost.text_value.dollar_amount_str.to_f.round(2) > 0 }

  else
    TestData.hash[:service] = stamps.orders.order_details.service.select(str).parse_service_name
    expect(TestData.hash[:service]).to eql(str)
    20.times do
      step 'blur out on order details form'
      sleep(0.015)
      break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
    end
  end
  step 'Save Order Details data'
end

Then /^set order details pounds to (\d+\.?\d*)$/ do |str|
  TestData.hash[:pounds] = str
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    weight = order_details.weight
    weight.lbs.set(TestData.hash[:pounds])
    order_details.weight_label.blur_out(ctr: 2)
  else
    stamps.orders.order_details.weight.lb.set(TestData.hash[:pounds])
  end
end

Then /^set order details ounces to (\d+\.?\d*)$/ do |str|
  TestData.hash[:pounds] = str
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    weight = order_details.weight
    weight.oz.set(TestData.hash[:pounds])
    order_details.weight_label.blur_out(ctr: 2)
  else
    stamps.orders.order_details.weight.oz.set(TestData.hash[:ounces])
  end
end

Then /^set order details length to (\d*)$/ do |number|
  TestData.hash[:length] = number
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    dimensions = order_details.dimensions
    expect(dimensions.length).to be_present, 'Order Details form Length is not present'
    dimensions.length.set(TestData.hash[:length])
    order_details.service_label.blur_out(ctr: 2)
  else
    expect(stamps.orders.order_details.dimensions.length).to be_present, 'Order Details form Length is not present'
    stamps.orders.order_details.dimensions.length.set(TestData.hash[:length])
  end
  step 'Save Order Details data'
end

Then /^set order details width to (\d*)$/ do |number|
  if SdcEnv.new_framework
    TestData.hash[:width] = number
    order_details = SdcOrders.order_details
    dimensions = order_details.dimensions
    expect(dimensions.width).to be_present, 'Order Details form Width is not present'
    dimensions.width.set(TestData.hash[:width])
    order_details.service_label.blur_out(ctr: 2)
  else
    expect(stamps.orders.order_details.dimensions.width).to be_present, 'Order Details form Width is not present'
    stamps.orders.order_details.dimensions.width.set(TestData.hash[:width])
  end
  step 'Save Order Details data'
end

Then /^set order details height to (\d*)$/ do |number|
  if SdcEnv.new_framework
    order_details = SdcOrders.order_details
    dimensions = order_details.dimensions
    expect(dimensions.height).to be_present, 'Order Details form Height is not present'
    dimensions.height.set(TestData.hash[:height] = number)
    order_details.service_label.blur_out(ctr: 2)
  else
    expect(stamps.orders.order_details.dimensions.height).to be_present, 'Order Details form Height is not present'
    stamps.orders.order_details.dimensions.height.set(TestData.hash[:height] = number)
  end
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  service = str || TestData.hash[:service]
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.service.text_field.text_value).to include(service)
  else
    expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((service.nil?) ? TestData.hash[:service] : service)
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice to (.*)$/ do |str|
  step 'expect order details is present'
  TestData.hash[:int_service] = stamps.orders.order_details.service.select(str).parse_service_name
  20.times do
    step 'blur out on order details form'
    sleep(0.015)
    break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
  end
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nternational [Ss]ervice is (?:correct|(.*))$/ do |expectation|
  step 'expect order details is present'
  expect(stamps.orders.order_details.service.textbox.text.parse_service_name).to eql((expectation.nil?) ? TestData.hash[:int_service] : expectation)
end



Then /^[Ww]ait [Uu]ntil [Oo]rder [Dd]etails [Pp]resent(?: (\d+), (.+)|)$/ do |iteration, delay|
  (iteration.zero? ? 20 : iteration).times do
    break if SdcOrders.order_details.order_id.present?
    sleep(delay.to_f.zero? ? 0.2 : delay.to_f)
  end
end

Then /^[Ww]ait [Uu]ntil [Oo]rder [Tt]oolbar [Pp]resent(?: (\d+), (.+)|)$/ do |iteration, delay|
  (iteration.zero? ? 20 : iteration).times do
    break unless SdcOrders.loading_popup.present?
    sleep(delay.to_f.zero? ? 0.2 : delay.to_f)
  end
end

Then /^[Hh]ide [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  if SdcEnv.new_framework
    domestic = SdcOrders.order_details.ship_to.domestic
    domestic.show_less.click if domestic.show_less.present?
  else
    stamps.orders.order_details.ship_to.domestic.hide_ship_to_details
  end
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  if SdcEnv.new_framework
    ship_to = SdcOrders.order_details.ship_to
    ship_to.show_more.click if ship_to.show_more.present?
  else
    stamps.orders.order_details.ship_to.domestic.show_ship_to_details
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]omestic [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  if SdcEnv.new_framework
    dom_country = SdcOrders.order_details.ship_to.domestic.country
    dom_country.selection(country)
    dom_country.drop_down.click unless dom_country.selection_obj.present?
    dom_country.selection_obj.click unless dom_country.selection_obj.class_disabled?
    if dom_country.text_field.text_value && dom_country.text_field.text_value.include?(country)
      TestData.hash[:ship_to_country] = dom_country.text_field.text_value
    end
    TestData.hash[:ship_to_country] ||= ''
    expect(TestData.hash[:ship_to_country]).to eql(country)
  else
    expect(stamps.orders.order_details.ship_to.domestic.country.select(TestData.hash[:ship_to_country] = country)).to eql(TestData.hash[:ship_to_country])
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  if SdcEnv.new_framework
    intl_country = SdcOrders.order_details.ship_to.international.country
    intl_country.selection(country)
    intl_country.drop_down.click unless intl_country.selection_obj.present?
    intl_country.selection_obj.click unless intl_country.selection_obj.class_disabled?
    if intl_country.text_field.text_value && intl_country.text_field.text_value.include?(country)
      TestData.hash[:ship_to_country] = intl_country.text_field.text_value
    end
    TestData.hash[:ship_to_country] ||= ''
    expect(TestData.hash[:ship_to_country]).to eql(country)
  else
    expect(stamps.orders.order_details.ship_to.international.country.select(TestData.hash[:ship_to_country] = country)).to eql(TestData.hash[:ship_to_country])
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Nn]ame to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_name] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    name = SdcOrders.order_details.ship_to.international.name
    if str.length.zero?
      name.click
    else
      name.set(TestData.hash[:int_ship_to_name])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.name.click
    else
      stamps.orders.order_details.ship_to.international.name.set TestData.hash[:int_ship_to_name]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ompany to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_company] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.company.click
    else
      SdcOrders.order_details.ship_to.international.company.set(TestData.hash[:int_ship_to_company])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.company.click
    else
      stamps.orders.order_details.ship_to.international.company.set TestData.hash[:int_ship_to_company]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 1 to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_address_1] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.address1.click
    else
      SdcOrders.order_details.ship_to.international.address1.set(TestData.hash[:int_ship_to_address_1])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.address_1.click
    else
      stamps.orders.order_details.ship_to.international.address_1.set TestData.hash[:int_ship_to_address_1]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 2 to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_address_2] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.address2.click
    else
      SdcOrders.order_details.ship_to.international.address2.set(TestData.hash[:int_ship_to_address_2])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.address_2.click
    else
      stamps.orders.order_details.ship_to.international.address_2.set TestData.hash[:int_ship_to_address_2]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o City to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_city] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.city.click
    else
      SdcOrders.order_details.ship_to.international.city.set(TestData.hash[:int_ship_to_city])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.city.click
    else
      stamps.orders.order_details.ship_to.international.city.set TestData.hash[:int_ship_to_city]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Province to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_province] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.province.click
    else
      SdcOrders.order_details.ship_to.international.province.set(TestData.hash[:int_ship_to_province])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.province.click
    else
      stamps.orders.order_details.ship_to.international.province.set TestData.hash[:int_ship_to_province]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Postal Code to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_postal_code] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.postal_code.click
    else
      SdcOrders.order_details.ship_to.international.postal_code.set(TestData.hash[:int_ship_to_postal_code])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.postal_code.click
    else
      stamps.orders.order_details.ship_to.international.postal_code.set TestData.hash[:int_ship_to_postal_code]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Phone to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_phone] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.phone.click
    else
      SdcOrders.order_details.ship_to.international.phone.set(TestData.hash[:int_ship_to_phone])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.phone.click
    else
      stamps.orders.order_details.ship_to.international.phone.set TestData.hash[:int_ship_to_phone]
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Email to \"(.*)\"$/ do |str|
  TestData.hash[:int_ship_to_email] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if SdcEnv.new_framework
    if str.length.zero?
      SdcOrders.order_details.ship_to.international.email.click
    else
      SdcOrders.order_details.ship_to.international.email.set(TestData.hash[:int_ship_to_email])
    end
  else
    if str.length.zero?
      stamps.orders.order_details.ship_to.international.email.click
    else
      stamps.orders.order_details.ship_to.international.email.set TestData.hash[:int_ship_to_email]
    end
  end
end

Then /^blur out on order details form$/ do
  count ||= 1
  if SdcEnv.new_framework
    count.to_i.times do
      SdcOrders.order_details.service_label.click
      SdcOrders.order_details.weight_label.double_click
      SdcOrders.order_details.weight_label.click
      SdcOrders.order_details.service_label.double_click
    end
  else
    stamps.orders.order_details.blur_out(3)
  end
end

Then /^[Cc]heck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  if SdcEnv.new_framework
    SdcOrders.order_details.insure_for.checkbox.check
  else
    stamps.orders.order_details.insure_for.checkbox.check
  end
end

Then /^[Uu]ncheck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^set order details insure-for to \$(\d+\.\d{2})$/ do |str|
  step 'check order details insure-for checkbox'
  if SdcEnv.new_framework
    SdcOrders.order_details.insure_for.amount.set(TestData.hash[:insured_value] = str.to_f)
    10.times do
      break if SdcOrders.order_details.insure_for.cost.text_value.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on order details form'
    end
  else
    stamps.orders.order_details.insure_for.textbox.set(TestData.hash[:insured_value] = str.to_f)
    3.times do
      step 'blur out on order details form'
      stamps.orders.modals.insurance_terms_conditions.agree if stamps.orders.modals.insurance_terms_conditions.present?
      break unless stamps.orders.modals.insurance_terms_conditions.present?
    end

    10.times do
      break if stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on order details form'
    end
  end
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Tt]racking to (.*)$/ do |str|
  if SdcEnv.new_framework
    SdcOrders.order_details.service.selection(str)
    5.times do
      SdcOrders.order_details.tracking.drop_down.click unless SdcOrders.order_details.tracking.selection_obj.present?
      SdcOrders.order_details.tracking.selection_obj.safe_click unless SdcOrders.order_details.tracking.selection_obj.class_disabled?
      break if SdcOrders.order_details.tracking.text_field.text_value == str
    end
    expect(SdcOrders.order_details.tracking.text_field.text_value).to eql(str)
    10.times do
      break if SdcOrders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on order details form'
    end
  else
    stamps.orders.order_details.tracking.select(TestData.hash[:tracking] = str)
    10.times do
      break if stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on order details form'
    end
  end
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Ff]rom to (?:Manage Shipping Addresses\.\.\.|(.*))$/ do |str|
  if SdcEnv.new_framework
    str ||= 'Manage Shipping Addresses...'
    ship_from = SdcOrders.order_details.ship_from
    ship_from.selection_element(str)
    ship_from.drop_down.click unless ship_from.selection.present?
    ship_from.selection.click unless ship_from.selection.class_disabled?
    if ship_from.text_field.text_value == str || str == 'default'
      TestData.hash[:ship_from] = ship_from.text_field.text_value unless str == 'Manage Shipping Addresses...'
    end
  else
    if str.nil?
      expect(stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses...')).to eql("Manage Shipping Addresses")
    else
      TestData.hash[:ship_from] = stamps.orders.order_details.single_ship_from.select(str)
    end
  end
end
# @service_blur_out_field = StampsField.new(driver.label(text: 'Service:')) if @service_blur_out_field.nil? || !@service_blur_out_field.present?
# @weight_blur_out_field = StampsField.new(driver.label(text: 'Weight:')) if @weight_blur_out_field.nil? || !@weight_blur_out_field.present?


