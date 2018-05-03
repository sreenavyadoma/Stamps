



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
    show_less = SdcOrders.order_details.ship_to.domestic.show_less
    show_less.click if show_less.present?
  else
    stamps.orders.order_details.ship_to.domestic.hide_ship_to_details
  end
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  if SdcEnv.new_framework
    show_more = SdcOrders.order_details.ship_to.show_more
    show_more.click if show_more.present?
  else
    stamps.orders.order_details.ship_to.domestic.show_ship_to_details
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]omestic [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  if SdcEnv.new_framework
    domestic = SdcOrders.order_details.ship_to.domestic
    domestic.selection(country)
    5.times do
      domestic.country.drop_down.click unless domestic.country.selection_obj.present?
      domestic.country.selection_obj.safe_click unless domestic.country.selection_obj.class_disabled?
      if domestic.country.text_field.text_value && domestic.country.text_field.text_value.include?(str)
        TestData.hash[:ship_to_country] = domestic.country.text_field.text_value
        break
      end
      TestData.hash[:ship_to_country] = ''
    end
    expect(TestData.hash[:ship_to_country]).to eql(country)
  else
    expect(stamps.orders.order_details.ship_to.domestic.country.select(TestData.hash[:ship_to_country] = country)).to eql(TestData.hash[:ship_to_country])
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  if SdcEnv.new_framework
    SdcOrders.order_details.ship_to.international.selection(country)
    5.times do
      SdcOrders.order_details.ship_to.international.country.drop_down.click unless SdcOrders.order_details.ship_to.international.country.selection_obj.present?
      SdcOrders.order_details.ship_to.international.country.selection_obj.safe_click unless SdcOrders.order_details.ship_to.international.country.selection_obj.class_disabled?
      if SdcOrders.order_details.ship_to.international.country.text_field.text_value && SdcOrders.order_details.ship_to.international.country.text_field.text_value.include?(str)
        TestData.hash[:ship_to_country] = SdcOrders.order_details.ship_to.international.country.text_field.text_value
        break
      end
      TestData.hash[:ship_to_country] ||= ''
    end
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
      SdcOrders.order_details.ship_to.international.company.safe_click
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
      SdcOrders.order_details.ship_to.international.address1.safe_click
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
      SdcOrders.order_details.ship_to.international.address2.safe_click
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
      SdcOrders.order_details.ship_to.international.city.safe_click
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
      SdcOrders.order_details.ship_to.international.province.safe_click
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
      SdcOrders.order_details.ship_to.international.postal_code.safe_click
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
      SdcOrders.order_details.ship_to.international.phone.safe_click
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
      SdcOrders.order_details.ship_to.international.email.safe_click
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

Then /^[Ss]et [Oo]rder [Dd]etails Pounds to (\d+\.?\d*)$/ do |str|
  if SdcEnv.new_framework
    SdcOrders.order_details.weight.lbs.set(TestData.hash[:pounds] = str)
  else
    stamps.orders.order_details.weight.lb.set(TestData.hash[:pounds] = str)
  end
  step 'blur out on Order Details form'
end

Then /^[Ss]et [Oo]rder [Dd]etails Ounces to (\d+\.?\d*)$/ do |str|
  if SdcEnv.new_framework
    SdcOrders.order_details.weight.oz.set(TestData.hash[:pounds] = str)
  else
    stamps.orders.order_details.weight.oz.set(TestData.hash[:ounces] = str)
  end
  step 'blur out on Order Details form'
end

Then /^[Bb]lur out on [Oo]rder [Dd]etails form(?:| (\d+)(?:| times))$/ do |count|
  if SdcEnv.new_framework
    (count.zero? ? 2 : count.to_i).times do
      SdcOrders.order_details.service_label.safe_click
      SdcOrders.order_details.weight_label.safe_double_click
      SdcOrders.order_details.weight_label.safe_click
      SdcOrders.order_details.service_label.safe_double_click
    end
  else
    stamps.orders.order_details.blur_out(count)
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ll]ength to (\d*)$/ do |number|
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.dimensions.length).to be_present, 'Order Details form Length is not present'
    SdcOrders.order_details.dimensions.length.set(TestData.hash[:length] = number)
  else
    expect(stamps.orders.order_details.dimensions.length).to be_present, 'Order Details form Length is not present'
    stamps.orders.order_details.dimensions.length.set(TestData.hash[:length] = number)
  end
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ww]idth to (\d*)$/ do |number|
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.dimensions.width).to be_present, 'Order Details form Width is not present'
    SdcOrders.order_details.dimensions.width.set(TestData.hash[:width] = number)
  else
    expect(stamps.orders.order_details.dimensions.width).to be_present, 'Order Details form Width is not present'
    stamps.orders.order_details.dimensions.width.set(TestData.hash[:width] = number)
  end
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Hh]eight to (\d*)$/ do |number|
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.dimensions.height).to be_present, 'Order Details form Height is not present'
    SdcOrders.order_details.dimensions.height.set(TestData.hash[:height] = number)
  else
    expect(stamps.orders.order_details.dimensions.height).to be_present, 'Order Details form Height is not present'
    stamps.orders.order_details.dimensions.height.set(TestData.hash[:height] = number)
  end
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Cc]heck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  if SdcEnv.new_framework
    SdcOrders.order_details.insurance.checkbox.check
  else
    stamps.orders.order_details.insure_for.checkbox.check
  end
end

Then /^[Uu]ncheck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nsure-[Ff]or to \$(\d+\.\d{2})$/ do |str|
  step 'check order details insure-for checkbox'
  if SdcEnv.new_framework
    SdcOrders.order_details.insurance.amount.set(TestData.hash[:insured_value] = str.to_f)
    10.times do
      break if SdcOrders.order_details.insurance.cost.text_value.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on Order Details form 3'
    end
  else
    stamps.orders.order_details.insure_for.textbox.set(TestData.hash[:insured_value] = str.to_f)
    3.times do
      step 'blur out on Order Details form 2 times'
      stamps.orders.modals.insurance_terms_conditions.agree if stamps.orders.modals.insurance_terms_conditions.present?
      break unless stamps.orders.modals.insurance_terms_conditions.present?
    end

    10.times do
      break if stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on Order Details form 3'
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
      step 'blur out on Order Details form'
    end
  else
    stamps.orders.order_details.tracking.select(TestData.hash[:tracking] = str)
    10.times do
      break if stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2) > 0
      step 'blur out on Order Details form'
    end
  end
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Ff]rom to (?:Manage Shipping Addresses\.\.\.|(.*))$/ do |str|
  if SdcEnv.new_framework
    str ||= 'Manage Shipping Addresses...'
    SdcOrders.order_details.ship_from.selection(str)
    5.times do
      SdcOrders.order_details.ship_from.drop_down.click unless SdcOrders.order_details.ship_from.selection_obj.present?
      SdcOrders.order_details.ship_from.selection_obj.safe_click unless SdcOrders.order_details.ship_from.selection_obj.class_disabled?
      break if str == 'default' && SdcOrders.order_details.ship_from.text_field.text_value != ''
      #break if str == 'Manage Shipping Addresses...' && SdcOrders.modals.manage_shipping_addresses.title.present?
      if SdcOrders.order_details.ship_from.text_field.text_value == str
        TestData.hash[:ship_from] = SdcOrders.order_details.ship_from.text_field.text_value unless str == 'Manage Shipping Addresses...'
        break
      end
    end
  else
    if str.nil?
      expect(stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses...')).to eql("Manage Shipping Addresses")
    else
      TestData.hash[:ship_from] = stamps.orders.order_details.single_ship_from.select(str)
    end
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  step 'show order details form ship-to fields'
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(TestHelper.address_helper_zone(address, SdcEnv.env))
  if SdcEnv.new_framework
    address = SdcOrders.order_details.ship_to.domestic.address
    address.set(TestData.hash[:ship_to_domestic])

  else
    stamps.orders.order_details.ship_to.domestic.set(TestData.hash[:ship_to_domestic])
  end
  #step 'blur out on Order Details form'
  step 'Save Order Details data'
  step 'hide order details form Ship-To fields'
end

# @service_blur_out_field = StampsField.new(driver.label(text: 'Service:')) if @service_blur_out_field.nil? || !@service_blur_out_field.present?
# @weight_blur_out_field = StampsField.new(driver.label(text: 'Weight:')) if @weight_blur_out_field.nil? || !@weight_blur_out_field.present?


