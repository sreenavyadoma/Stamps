
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
  unless TestData.hash[:details_associated_items].has_key?(item_number)
    TestData.hash[:details_associated_items][item_number] = {}
  end
  SdcOrders.order_details.associated_item.item_qty(item_number).set(qty)
  TestData.hash[:details_associated_items][item_number][:item_qty] = qty
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  step 'expect order details is present'
  TestData.hash[:details_associated_items][item_number] = {} unless TestData.hash[:details_associated_items].has_key?(item_number)
  str = TestHelper.rand_alpha_numeric if str.downcase.include?('random')
  SdcOrders.order_details.associated_item.id(item_number).set(str)
  TestData.hash[:details_associated_items][item_number][:item_id] = str
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) description to (.*)$/ do |item_number, str|
  step 'expect order details is present'
  TestData.hash[:details_associated_items][item_number] = {} unless TestData.hash[:details_associated_items].has_key?(item_number)
  str = TestHelper.rand_alpha_numeric if str.downcase.include?('random')
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
  step "set order details domestic ship-to country to #{TestData.hash[:country]}"
end

Then /^set order details ship-to international address to$/ do |table|
  param = table.hashes.first
  country = param['country']
  full_name = param['full_name']
  company = param['company']
  street_address1 = param['street_address1']
  street_address2 = param['street_address2']
  city = param['city']
  province = param['province']
  postal_code = param['postal_code']
  phone = param['phone']
  email = param['email']

  full_name = full_name.downcase.include?('random') ? TestHelper.rand_full_name : full_name
  company = company.downcase.include?('random') ? TestHelper.rand_comp_name : company
  street_address1 = street_address1.downcase.include?('random') ? TestHelper.rand_alpha_numeric : street_address1
  street_address2 = street_address2.downcase.include?('random') ? TestHelper.rand_suite : street_address2
  city = city.downcase.include?('random') ? TestHelper.rand_alpha_numeric : city
  province = province.downcase.include?('random') ? TestHelper.rand_alpha_numeric : province
  postal_code = postal_code.downcase.include?('random') ? TestHelper.rand_alpha_numeric : postal_code
  phone = phone.downcase.include?('random') ? TestHelper.rand_phone : phone
  email = email.downcase.include?('random') ? TestHelper.rand_email : email

  step "set order details domestic ship-to country to #{country}"
  step "set order details international ship-to name to #{full_name}"
  step "set order details international ship-to company to #{company}"
  step "set order details international ship-to address 1 to #{street_address1}"
  step "set order details international ship-to address 2 to #{street_address2}"
  step "set order details international ship-to city to #{city}"
  step "set order details international ship-to province to #{province}"
  step "set order details international ship-to postal code to #{postal_code}"
  step "set order details international ship-to phone to #{phone}"
  step "set order details international ship-to email to #{email}"
end

Then /^set order details ship-to domestic address to$/ do |table|
  param = table.hashes.first
  country = param['country']
  full_name = param['full_name']
  company = param['company']
  street_address1 = param['street_address1']
  street_address2 = param['street_address2']
  city = param['city']
  phone = param['phone']
  email = param['email']

  full_name = full_name.downcase.include?('random') ? TestHelper.rand_full_name : full_name
  company = company.downcase.include?('random') ? TestHelper.rand_comp_name : company
  street_address2 ||= ''
  street_address2 = if street_address2.downcase.include?('random')
                      TestHelper.rand_alpha_numeric(min: 2, max: 7)
                    else
                      street_address2
                    end

  city = city.downcase.include?('random') ? TestHelper.rand_alpha_numeric : city
  state = state.downcase.include?('random') ? TestHelper.rand_alpha_numeric : state
  zip = zip.downcase.include?('random') ? TestHelper.rand_alpha_numeric : zip
  country = country.size.zero? ? 'United States' : country
  phone = phone.downcase.include?('random') ? TestHelper.rand_alpha_numeric : phone
  email = email.downcase.include?('random') ? TestHelper.rand_alpha_numeric : email
  ship_to = "#{full_name},#{company},#{street_address1},#{street_address2},#{city} #{state} #{zip}"

  step "set order details domestic ship-to country to #{country}"
  step "set Order Details Ship-To text area to #{ship_to}"

  TestData.hash[:full_name] = full_name
  TestData.hash[:company] = company
  TestData.hash[:street_address1] = street_address1
  TestData.hash[:street_address2] = street_address2
  TestData.hash[:city] = city
  TestData.hash[:phone] = phone
  TestData.hash[:email] = email
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Aa]mbiguous [Aa]ddress to$/ do |table|
  step 'expect order details is present'
  address = TestHelper.format_address(table.hashes.first)
  stamps.orders.order_details.ship_to.domestic.set_ambiguous(address)
  TestData.hash[:ship_to_domestic] = address
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o text area to (.*)$/ do |address|
  address = TestHelper.format_address(address)
  step 'show order details form ship-to fields'
  SdcOrders.order_details.ship_to.domestic.address.set(address)
  TestData.hash[:ship_to_domestic] = address
  step 'Save Order Details data'
end

Then /^set order details phone to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  str = str.downcase.include?('random') ? TestHelper.rand_phone : str
  SdcOrders.order_details.ship_to.domestic.phone.set(str)
  TestData.hash[:phone] = str
  step 'Save Order Details data'
end

Then /^set order details email to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  str = str.downcase.include?('random') ? TestHelper.rand_email : str
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

end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is the same as saved Order ID$/ do

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

Then /^set order details pounds to (.+)$/ do |str|
  order_details = SdcOrders.order_details
  weight = order_details.weight
  weight.lbs.set(str)
  TestData.hash[:pounds] = str
end

Then /^set order details ounces to (.+)$/ do |str|
  order_details = SdcOrders.order_details
  weight = order_details.weight
  weight.oz.set(str)
  TestData.hash[:ounces] = str
end

Then /^set order details length to (\d*)$/ do |str|
  TestData.hash[:length] = str
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.length.wait_until_present(timeout: 5)
  dimensions.length.set(TestData.hash[:length])
  step 'Save Order Details data'
end

Then /^set order details width to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.width.wait_until_present(timeout: 5)
  dimensions.width.set(str)
  TestData.hash[:width] = str
  step 'Save Order Details data'
end

Then /^set order details height to (\d*)$/ do |str|
  order_details = SdcOrders.order_details
  dimensions = order_details.dimensions
  dimensions.height.wait_until_present(timeout: 5)
  dimensions.height.set(TestData.hash[:height] = str)
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]ervice is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:service]
  result = SdcOrders.order_details.service.text_field.text_value
  expect(result).to include(str)
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

Then /^expect order details international service is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:int_service]
  result = SdcOrders.order_details.service.text_field.text_value
  expect(result).to include(str)
end

Then /^[Hh]ide [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  domestic = SdcOrders.order_details.ship_to.domestic
  domestic.show_less.click if domestic.show_less.present?
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  ship_to = SdcOrders.order_details.ship_to
  ship_to.show_more.click if ship_to.show_more.present?
end

Then /^set order details domestic ship-to country to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  country = SdcOrders.order_details.ship_to.domestic.country
  selection = country.selection(str)
  country.drop_down.click
  country.drop_down.click unless selection.present?
  selection.click
  actual_result = country.text_field.text_value
  expect(actual_result).to eql str
  TestData.hash[:country] = str
end

Then /^set order details international ship-to country to (.*)$/ do |str|
  step 'show order details form ship-to fields'
  country = SdcOrders.order_details.ship_to.international.country
  selection = country.selection(str)
  country.drop_down.click
  country.drop_down.click unless selection.present?
  selection.click
  actual_result = country.text_field.text_value
  expect(actual_result).to eql str
  TestData.hash[:country] = str
end

Then /^set order details international ship-to name to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.name.set(str)
  TestData.hash[:full_name] = str

end

Then /^set order details international ship-to company to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.company.set(str)
  TestData.hash[:company] = str
end

Then /^set order details international ship-to address 1 to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.address1.set(str)
  TestData.hash[:street_address1] = str
end

Then /^set order details international ship-to address 2 to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.address2.set(str)
  TestData.hash[:street_address2] = str
end

Then /^set order details international ship-to city to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.city.set(str)
  TestData.hash[:city] = str
end

Then /^set order details international ship-to province to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.province.set(str)
  TestData.hash[:province] = str
end

Then /^set order details international ship-to postal code to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.postal_code.set(str)
  TestData.hash[:postal_code] = str
end

Then /^set order details international ship-to phone to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.phone.set(str)
  TestData.hash[:phone] = str
end

Then /^set order details international ship-to email to (.*)$/ do |str|
  str = TestHelper.rand_full_name if str.downcase.include?('random')
  SdcOrders.order_details.ship_to.international.email.set(str)
  TestData.hash[:phone] = str
end

Then /^blur out on order details form$/ do
  SdcOrders.order_details.service_label.click
  SdcOrders.order_details.weight_label.double_click
  SdcOrders.order_details.weight_label.click
  SdcOrders.order_details.service_label.double_click
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
  insure_for.amount.set(str)
  TestData.hash[:insured_value] = str.to_f
  step 'blur out on order details form'
  step 'Save Order Details data'
end

Then /^set order details tracking to (.*)$/ do |str|
  tracking = SdcOrders.order_details.tracking
  tracking.selection_element(value: str)
  tracking.drop_down.click unless tracking.selection.present?
  tracking.selection.safe_click unless tracking.selection.class_disabled?
  expect(tracking.text_field.text_value).to eql(str)
  step 'Save Order Details data'
end

Then /^set order details reference to (.*)$/ do |str|
  SdcOrders.order_details.reference_num.set(str)
  TestData.hash[:reference_num] = str
  step 'Save Order Details data'
end

Then /^set order details ship-from to (.+)$/ do |str|
  TestData.hash[:ship_from] = str
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
  actual_result = ship_from.text_field.text_value
  expect(actual_result).to eql str unless str == 'Manage Shipping Addresses...'
end





# ---------------------------------------------------------------------------------------------------------














Then /^expect order details service cost is (?:correct|(\d+.\d*))$/ do |str|
  str ||= TestData.hash[:service_cost]
  actual_result = SdcOrders.order_details.service.cost.text_value
  expect(SdcOrders.order_details.service.cost.text_value.dollar_amount_str.to_f.round(2)).to eql(str.to_f.round(2))
end

Then /^expect order details pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |expectation|
  expectation ||= TestData.hash[:pounds]
  step 'expect order details is present'
  if SdcEnv.new_framework
    # expect(SdcOrders.order_details.weight.lbs.text_value.to_f).to eql(expectation.to_f.round(2))
    expect(SdcOrders.order_details.weight.lbs.value.to_f).to eql(expectation.to_f.round(2))
  else
    expect(stamps.orders.order_details.weight.lb.textbox.text.to_f).to eql expectation.to_f.round(2)
  end
end

Then /^expect order details tracking cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.hash[:tracking_cost] if expectation.nil?
  step 'expect order details is present'
  expect(SdcOrders.order_details.tracking.cost.text_value.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:tracking_cost] : expectation)
end

Then /^expect order details ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |str|
  str ||= TestData.hash[:ounces]
  step 'expect order details is present'
  expect(SdcOrders.order_details.weight.oz.value.to_f).to eql(str.to_f.round(2))
end

Then /^expect order details length is (\d+)$/ do |expectation|
  step 'expect order details is present'
  expect(SdcOrders.order_details.dimensions.length.value.to_f).to eql(expectation.to_f.round(2))
end

Then /^expect order details width is (\d+)$/ do |expectation|
  step 'expect order details is present'
  expect(SdcOrders.order_details.dimensions.width.value.to_f).to eql(expectation.to_f.round(2))
end

Then /^expect order details height is (\d+)$/ do |expectation|
  step 'expect order details is present'
  expect(SdcOrders.order_details.dimensions.height.value.to_f).to eql(expectation.to_f.round(2))
end

Then /^expect order details tracking is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:tracking] if expectation.nil?
  step 'expect order details is present'
  expect(SdcOrders.order_details.tracking.text_field.text_value).to eql(expectation)
end

Then /^expect order details is present$/ do
  SdcWebsite.orders.order_details.wait_until_present(timeout: 10)
  expect(SdcWebsite.orders.order_details).to be_present, "Order Details form is not present"
end

Then /^expect order details ship-from and ship-from saved values are the same$/ do
  if SdcEnv.new_framework
    #   todo - Alex complete this
  else
    stamps.orders.order_details.wait_until_present(2)
  end
  step 'expect order details is present'
  step "show order details form ship-to fields"
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.ship_from.text_field.text_value).to eql(TestData.hash[:ship_from])
  else
    expect(stamps.orders.order_details.single_ship_from.textbox.text).to eql(TestData.hash[:ship_from])
  end
end

Then /^expect order details reference number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:reference_num]
  expect(SdcOrders.order_details.reference_num.text_value).to eql(str)
end

Then /^expect order details insure-for is (?:correct|(\d+\.\d{2}))$/ do |str|
  str ||= TestData.hash[:insured_value]
  result = SdcOrders.order_details.insure_for.amount.value.to_f.round(2)
  expect(result).to eql(str.to_f)
end

Then /^set order details reference number to (.*)$/ do |str|
  str = str.downcase.include?('random') ? TestHelper.rand_alpha_numeric : str
  SdcOrders.order_details.reference_num.set(str)
  TestData.hash[:reference_num] = str
  step 'Save Order Details data'
end

Then /^expect order details ship from is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:ship_from]
  result = SdcOrders.order_details.ship_from.text_field.text_value
  expect(result).to include(str)
end

Then /^expect order details associated item (\d+) qty is (?:correct|(\d+))$/ do |item, str|
  str ||= TestData.hash[:details_associated_items][item][:item_qty]
  result = SdcOrders.order_details.associated_item.item_qty(item).value.to_i
  expect(result).to eql(str.to_i)
end

Then /^expect order details ship-to country is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:country]
  result = SdcOrders.order_details.ship_to.domestic.country.text_field.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to name is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:full_name]
  result = SdcOrders.order_details.ship_to.international.name.text_value
  expect(result).to eql(str)
end

Then /^expect order details international ship-to company is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:company]
  result = SdcOrders.order_details.ship_to.international.company.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to address 1 is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:street_address1]
  result = SdcOrders.order_details.ship_to.international.address1.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to address 2 is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:street_address2]
  result = SdcOrders.order_details.ship_to.international.address2.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to city is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:city]
  result = SdcOrders.order_details.ship_to.international.city.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to province is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:state]
  result = SdcOrders.order_details.ship_to.international.province.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to postal code is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:zip]
  result = SdcOrders.order_details.ship_to.international.postal_code.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to phone is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:phone]
  result = SdcOrders.order_details.ship_to.international.phone.text_value
  expect(result).to eql str
end

Then /^expect order details international ship-to email is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:email]
  result = SdcOrders.order_details.ship_to.international.email.text_value
  expect(result).to eql str
end

