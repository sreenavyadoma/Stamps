
Then /^set order details ship-to to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  step 'show order details form ship-to fields'
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(TestHelper.address_helper_zone(address))
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.address.click
  domestic.address.set(TestData.hash[:ship_to_domestic])
  step 'wait for js to stop'
  step 'blur out on order details form'
  step 'Save Order Details data'
  step 'hide order details form Ship-To fields'
end

Then /^on order details form, add item (\d+), qty (\d+), id (.+), description (.*)$/ do |item_number, qty, id, description|
  step "add order details associated item #{item_number}"
  step "scroll into view order details associated item #{item_number}"
  step "set Order Details Associated Item #{item_number} qty to #{qty}"
  step "set Order Details Associated Item #{item_number} ID to #{id}"
  step "set Order Details Associated Item #{item_number} description to #{description}"
end

Then /^add order details associated item (\d+)$/ do |item_number|
  SdcOrders.order_details.add_item.click
end

Then /^scroll into view order details associated item (\d+)$/ do |item_number|
  associated_item = SdcOrders.order_details.associated_item
  associated_item.item_qty(item_number).scroll_into_view
  associated_item.description(item_number).scroll_into_view
  associated_item.id(item_number).scroll_into_view
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) qty to (.*)$/ do |item_number, qty|
  step 'expect order details is present'
  TestData.hash[:details_associated_items][item_number] = {} unless TestData.hash[:details_associated_items].has_key?(item_number)
  SdcOrders.order_details.associated_item.item_qty(item_number).set(qty)
  TestData.hash[:details_associated_items][item_number][:item_qty] = qty
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  step 'expect order details is present'
  TestData.hash[:details_associated_items][item_number] = {} unless TestData.hash[:details_associated_items].has_key?(item_number)
  str = str.casecmp('random').zero? ? TestHelper.rand_alpha_numeric : str
  SdcOrders.order_details.associated_item.id(item_number).set(str)
  TestData.hash[:details_associated_items][item_number][:item_id] = str
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) description to (.*)$/ do |item_number, str|
  step 'expect order details is present'
  TestData.hash[:details_associated_items][item_number] = {} unless TestData.hash[:details_associated_items].has_key?(item_number)
  str = str.casecmp('random').zero? ? TestHelper.rand_alpha_numeric : str
  SdcOrders.order_details.associated_item.description(item_number).set(str)
  TestData.hash[:details_associated_items][item_number][:item_description] = str
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set order details length to #{length}"
  step "set order details width to #{width}"
  step "set order details height to #{height}"
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand panel$/ do
  stamps.orders.order_details.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Item (\d+)$/ do |item_number|
  item = stamps.orders.order_details.items_ordered.item item_number.to_i
  item.delete.click
end

Then /^set order details weight to (\d+\.?\d*) lb (\d+\.?\d*) oz$/ do |lbs, oz|
  step "set order details pounds to #{lbs}"
  step "set order details ounces to #{oz}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})['group' + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
end

Then /^set order details ship-to international address to$/ do |table|
  TestData.hash[:country] = table.hashes.first['country']
  TestData.hash[:full_name] = table.hashes.first[:full_name].downcase.include?('random') ? TestHelper.rand_full_name : table.hashes.first['full_name']
  TestData.hash[:company] = table.hashes.first['company'].downcase.include?('random') ? TestHelper.rand_comp_name : table.hashes.first['company']
  TestData.hash[:street_address_1] = table.hashes.first['street_address_1'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['street_address_1']
  TestData.hash[:street_address_2] = table.hashes.first['street_address_2'].downcase.include?('random') ? TestHelper.rand_suite : table.hashes.first['street_address_2']
  TestData.hash[:city] = table.hashes.first['city'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['city']
  TestData.hash[:state] = table.hashes.first['province'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['province']
  TestData.hash[:zip] = table.hashes.first['postal_code'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['postal_code']
  TestData.hash[:phone] = table.hashes.first[:phone].downcase.include?('random') ? TestHelper.rand_phone : table.hashes.first['phone']
  TestData.hash[:email] = table.hashes.first['email'].downcase.include?('random') ? TestHelper.rand_email : table.hashes.first['email']

  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
  step "set Order Details International Ship-To Name to \"#{TestData.hash[:full_name]}\""
  step "set Order Details International Ship-To Company to \"#{TestData.hash[:company]}\""
  step "set Order Details International Ship-To Address 1 to \"#{TestData.hash[:street_address_1]}\""
  step "set Order Details International Ship-To Address 2 to \"#{TestData.hash[:street_address_2]}\""
  step "set Order Details International Ship-To City to \"#{TestData.hash[:city]}\""
  step "set Order Details International Ship-To Province to \"#{TestData.hash[:state]}\""
  step "set Order Details International Ship-To Postal Code to \"#{TestData.hash[:zip]}\""
  step "set Order Details International Ship-To Phone to \"#{TestData.hash[:phone]}\""
  step "set Order Details International Ship-To Email to \"#{TestData.hash[:email]}\""
end

Then /^set order details ship-to domestic address to$/ do |table|
  TestData.hash[:full_name] = table.hashes.first[:full_name].downcase.include?('random') ? TestHelper.rand_full_name : table.hashes.first['full_name']
  TestData.hash[:company] = table.hashes.first['company'].downcase.include?('random') ? TestHelper.rand_comp_name : table.hashes.first['company']
  TestData.hash[:street_address] = table.hashes.first['street_address']
  if table.hashes.first['street_address_2'].nil?
    TestData.hash[:street_address_2] = ''
  else
    TestData.hash[:street_address_2] = table.hashes.first['street_address_2'].downcase.include?('random') ? TestHelper.rand_alpha_numeric(min: 2, max: 7) : table.hashes.first['street_address_2']
  end
  TestData.hash[:city] = table.hashes.first['city'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['city']
  TestData.hash[:state] = table.hashes.first['state'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['state']
  TestData.hash[:zip] = table.hashes.first['zip'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['zip']
  TestData.hash[:country] = table.hashes.first['country'].size==0 ? 'United States' : table.hashes.first['country']
  TestData.hash[:ship_to] = "#{TestData.hash[:full_name]},#{TestData.hash[:company]},#{TestData.hash[:street_address]},#{TestData.hash[:street_address_2]} ,#{TestData.hash[:city]} #{TestData.hash[:state]} #{TestData.hash[:zip]}"

  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
  step "set Order Details Ship-To text area to #{TestData.hash[:ship_to]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Aa]mbiguous [Aa]ddress to$/ do |table|
  step 'expect order details is present'
  stamps.orders.order_details.ship_to.domestic.set_ambiguous(TestHelper.format_address(table.hashes.first))
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o text area to (.*)$/ do |address|
  TestData.hash[:ship_to_domestic] = TestHelper.format_address(address)
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.set(TestData.hash[:ship_to_domestic])
  step 'Save Order Details data'
end

Then /^set order details phone to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  str = str.casecmp('random').zero? ? TestHelper.rand_phone : str
  SdcOrders.order_details.ship_to.domestic.phone.set(str)
  TestData.hash[:phone] = str
  step 'Save Order Details data'
end

Then /^set order details email to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  str = str.casecmp('random').zero? ? TestHelper.rand_email : str
  SdcOrders.order_details.ship_to.domestic.email.set(str)
  TestData.hash[:email] = str
  step 'Save Order Details data'
end

Then /^[Oo]n [Oo]rder [Dd]etails form, [Hh]ide [Ii]nternational [Ss]hip-[Tt]o fields$/ do
  stamps.orders.order_details.ship_to.international.hide_ship_to_details
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is truthy$/ do
  expect(TestData.hash[:order_id].values.last.to_i).to be > 0
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID equals Grid Order ID in row (\d+)$/ do |row|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(stamps.orders.order_details.toolbar.order_id.text.parse_digits).to eql stamps.orders.orders_grid.grid_column(:order_id).row(row)
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is the same as saved Order ID$/ do
  if SdcEnv.new_framework
    # todo - orders grid implementation , only uncomment
    # expect(SdcOrders.order_details.order_id.text_value.parse_digits).to eql(TestData.hash[:order_id].values.last)
  else
    expect(stamps.orders.order_details.toolbar.order_id.text.parse_digits).to eql TestData.hash[:order_id].values.last
  end
end

Then /^expect order details ship-to name is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:name]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to company name is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:company]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to cleansed street address is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:street]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to cleansed city is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:city]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to cleansed state is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:state]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to cleansed zip plus 4 code is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:zip_full]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to cleansed zip code is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  address = SdcOrders.order_details.ship_to.domestic.address.text_value
  expectation = TestHelper.address_str_to_hash(address)[:zip]
  expect(expectation).to eql(str)
end

Then /^expect order details ship-to phone is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  expect(SdcOrders.order_details.ship_to.domestic.phone.text_value).to eql(str)
end

Then /^expect order details ship-to email is (.*)$/ do |str|
  step 'expect order details is present'
  step 'show order details form ship-to fields'
  expect(SdcOrders.order_details.ship_to.domestic.email.text_value).to eql(str)
end

Then /^set order details service to (.*)$/ do |str|
  step 'expect order details is present'
  TestData.hash[:service] = str
  order_details = SdcOrders.order_details
  service = order_details.service
  service.selection(name: :selection_element, str: str)
  service.text_field.scroll_into_view
  service.drop_down.scroll_into_view
  service.drop_down.click
  service.drop_down.click unless service.selection_element.present?
  service.selection_element.click unless service.selection_element.class_disabled?
  expect(service.text_field.text_value).to include(str)
  order_details.weight_label.blur_out(ctr: 2)
  order_details.service_label.blur_out(ctr: 2)
  order_details.reference_num.blur_out(ctr: 2)
  order_details.ship_to_label.blur_out(ctr: 2)
  order_details.order_id.blur_out(ctr: 2)
  order_details.title.blur_out(ctr: 2)
  service.wait_until(timeout: 15) { service.cost.text_value.dollar_amount_str.to_f.round(2) > 0 }
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
  order_details = SdcOrders.order_details
  weight = order_details.weight
  weight.oz.set(str)
  order_details.weight_label.blur_out(ctr: 2)
  TestData.hash[:ounces] = str
end

Then /^set order details length to (\d*)$/ do |str|
  TestData.hash[:length] = str
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.length.wait_until_present(timeout: 5)
  dimensions.length.set(TestData.hash[:length])
  order_details.service_label.blur_out(ctr: 2)
  step 'Save Order Details data'
end

Then /^set order details width to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.width.wait_until_present(timeout: 5)
  dimensions.width.set(str)
  order_details.service_label.blur_out(ctr: 2)
  TestData.hash[:width] = str
  step 'Save Order Details data'
end

Then /^set order details height to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.height.wait_until_present(timeout: 5)
  dimensions.height.set(TestData.hash[:height] = str)
  order_details.service_label.blur_out(ctr: 2)
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  expect(SdcOrders.order_details.service.text_field.text_value).to include(str || TestData.hash[:service])
end

Then /^set order details international service to (.*)$/ do |str|
  step 'expect order details is present'
  TestData.hash[:int_service] = stamps.orders.order_details.service.select(str).parse_service_name
  20.times do
    step 'blur out on order details form'
    sleep(0.015)
    break if stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2) > 0
  end
  step 'Save Order Details data'
end

Then /^expect order details international service is (?:correct|(.*))$/ do |expectation|
  step 'expect order details is present'
  expect(SdcOrders.order_details.service.text_field.text_value).to include(expectation || TestData.hash[:int_service])
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
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.show_less.click if domestic.show_less.present?
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  ship_to = SdcOrders.order_details.ship_to
  ship_to.show_more.click if ship_to.show_more.present?
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]omestic [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  dom_country = SdcOrders.order_details.ship_to.domestic.country
  dom_country.selection(country)
  dom_country.drop_down.click unless dom_country.selection_obj.present?
  dom_country.selection_obj.click unless dom_country.selection_obj.class_disabled?
  if dom_country.text_field.text_value && dom_country.text_field.text_value.include?(country)
    TestData.hash[:ship_to_country] = dom_country.text_field.text_value
  end
  TestData.hash[:ship_to_country] ||= ''
  expect(TestData.hash[:ship_to_country]).to eql(country)
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

Then /^check order details insure-for checkbox$/ do
  SdcOrders.order_details.insure_for.checkbox.check
end

Then /^uncheck order details insure-for checkbox$/ do
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^set order details insure-for to \$(\d+\.\d{2})$/ do |str|
  insure_for = SdcOrders.order_details.insure_for
  insure_for.checkbox.check
  insure_for.checkbox.safe_wait_until_chosen(timeout: 3)
  expect(insure_for.checkbox.checked?). to be(true), 'Cannot check Insure-for checkbox'
  insure_for.amount.set(TestData.hash[:insured_value] = str.to_f)
  # 10.times do
  #   break if SdcOrders.order_details.insure_for.cost.text_value.dollar_amount_str.to_f.round(2) > 0
  #   step 'blur out on order details form'
  # end
  step 'blur out on order details form'
  step 'Save Order Details data'
end

Then /^set order details tracking to (.*)$/ do |str|
  SdcOrders.order_details.tracking.selection_element(value: str)
  SdcOrders.order_details.tracking.drop_down.click unless SdcOrders.order_details.tracking.selection.present?
  SdcOrders.order_details.tracking.selection.safe_click unless SdcOrders.order_details.tracking.selection.class_disabled?
  expect(SdcOrders.order_details.tracking.text_field.text_value).to eql(str)
  # 10.times do
  #   break if SdcOrders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2) > 0
  #   step 'blur out on order details form'
  # end
  step 'Save Order Details data'
end

Then /^set order details reference to (.*)$/ do |str|
  SdcOrders.order_details.reference_num.set(str)
  expect(SdcOrders.order_details.reference_num.text_value).to eql(str)
  step 'Save Order Details data'
end

Then /^set order details ship-from to (?:Manage Shipping Addresses\.\.\.|(.*)|default)$/ do |str|
  if str.eql?('default')
    str = 'Automation - El Segundo, CA'
  elsif str.nil? || str.eql?('')
    str = 'Manage Shipping Addresses...'
  end
  ship_from = SdcOrders.order_details.ship_from
  ship_from.selection_element(str)
  ship_from.drop_down.scroll_into_view.click
  unless ship_from.selection.scroll_into_view.present?
    ship_from.drop_down.scroll_into_view.click
    step "on manage shipping address modal, add address from string 90245,Automation,1990 E Grand Avenue,El Segundo,California,90245,United States,4157944522"
    ship_from.drop_down.scroll_into_view.click
  end
  ship_from.selection_element(str) unless ship_from.selection.present?
  ship_from.selection.scroll_into_view.click
  if ship_from.text_field.text_value == str || str == 'default'
    TestData.hash[:ship_from] = ship_from.text_field.text_value unless str == 'Manage Shipping Addresses...'
  end
end
# @service_blur_out_field = StampsField.new(driver.label(text: 'Service:')) if @service_blur_out_field.nil? || !@service_blur_out_field.present?
# @weight_blur_out_field = StampsField.new(driver.label(text: 'Weight:')) if @weight_blur_out_field.nil? || !@weight_blur_out_field.present?


