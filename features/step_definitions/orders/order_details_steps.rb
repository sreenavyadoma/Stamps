

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Manual Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Manual Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.collapse
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Store Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Store Items Ordered pane$/ do
  stamps.orders.order_details.items_ordered.collapse_store_item
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  step "set Order Details Associated Item #{item_number} Qty to #{qty}"
  step "set Order Details Associated Item #{item_number} ID to #{id}"
  step "set Order Details Associated Item #{item_number} Description to #{description}"
end

Then /^[Aa]dd [Oo]rder [Dd]etails Associated Item (\d+)$/ do |item_number|
  stamps.orders.order_details.items_ordered.item(item_number.to_i)
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) Qty to (.*)$/ do |item_number, qty|
  step 'expect Order Details is present'
  TestData.store[:details_associated_items][item_number] = {} unless TestData.store[:details_associated_items].has_key?(item_number)
  TestData.store[:details_associated_items][item_number][:item_qty] = qty
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.set(TestData.store[:details_associated_items][item_number][:item_qty] )
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  step 'expect Order Details is present'
  TestData.store[:details_associated_items][item_number] = {} unless TestData.store[:details_associated_items].has_key?(item_number)
  TestData.store[:details_associated_items][item_number][:item_id] = (str.downcase.include?('random') ? TestHelper.rand_alpha_numeric : str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.set(TestData.store[:details_associated_items][item_number][:item_id])
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) Description to (.*)$/ do |item_number, str|
  step 'expect Order Details is present'
  TestData.store[:details_associated_items][item_number] = {} unless TestData.store[:details_associated_items].has_key?(item_number)
  TestData.store[:details_associated_items][item_number][:item_description] = (str.downcase.include?('random') ? TestHelper.rand_alpha_numeric : str)
  stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.set(TestData.store[:details_associated_items][item_number][:item_description])
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set Order Details Length to #{length}"
  step "set Order Details Width to #{width}"
  step "set Order Details Height to #{height}"
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand panel$/ do
  stamps.orders.order_details.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Item (\d+)$/ do |item_number|
  item = stamps.orders.order_details.items_ordered.item item_number.to_i
  item.delete.click
end

Then /^[Ss]et [Oo]rder [Dd]etails Weight to (\d+\.?\d*) lb (\d+\.?\d*) oz$/ do |pounds, ounces|
  step "set Order Details Pounds to #{pounds}"
  step "set Order Details Ounces to #{ounces}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})['group' + group].values
  TestData.store[:country] = country_list[rand(country_list.size)]
  SdcLogger.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})['group' + group].values
  country_array = (country_list[rand(country_list.size)]).split('|')
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !TestData.store[:pounds].nil?
      if TestData.store[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split('|')
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  TestData.store[:country] = country_name
  SdcLogger.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})['group' + group].values
  TestData.store[:country] = country_list[rand(country_list.size)]
  SdcLogger.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI, {})['group' + group].values
  country_array = (country_list[rand(country_list.size)]).split('|')
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !TestData.store[:pounds].nil?
      if TestData.store[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split('|')
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  TestData.store[:country] = country_name
  SdcLogger.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Ii]nternational address to$/ do |table|
  TestData.store[:country] = table.hashes.first['country']
  TestData.store[:full_name] = table.hashes.first[:full_name].downcase.include?('random') ? TestHelper.rand_full_name : table.hashes.first['full_name']
  TestData.store[:company] = table.hashes.first['company'].downcase.include?('random') ? TestHelper.rand_comp_name : table.hashes.first['company']
  TestData.store[:street_address_1] = table.hashes.first['street_address_1'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['street_address_1']
  TestData.store[:street_address_2] = table.hashes.first['street_address_2'].downcase.include?('random') ? TestHelper.rand_suite : table.hashes.first['street_address_2']
  TestData.store[:city] = table.hashes.first['city'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['city']
  TestData.store[:state] = table.hashes.first['province'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['province']
  TestData.store[:zip] = table.hashes.first['postal_code'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['postal_code']
  TestData.store[:phone] = table.hashes.first[:phone].downcase.include?('random') ? TestHelper.rand_phone : table.hashes.first['phone']
  TestData.store[:email] = table.hashes.first['email'].downcase.include?('random') ? TestHelper.rand_email(SdcEnv.env) : table.hashes.first['email']

  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
  step "set Order Details International Ship-To Name to \"#{TestData.store[:full_name]}\""
  step "set Order Details International Ship-To Company to \"#{TestData.store[:company]}\""
  step "set Order Details International Ship-To Address 1 to \"#{TestData.store[:street_address_1]}\""
  step "set Order Details International Ship-To Address 2 to \"#{TestData.store[:street_address_2]}\""
  step "set Order Details International Ship-To City to \"#{TestData.store[:city]}\""
  step "set Order Details International Ship-To Province to \"#{TestData.store[:state]}\""
  step "set Order Details International Ship-To Postal Code to \"#{TestData.store[:zip]}\""
  step "set Order Details International Ship-To Phone to \"#{TestData.store[:phone]}\""
  step "set Order Details International Ship-To Email to \"#{TestData.store[:email]}\""
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Dd]omestic address to$/ do |table|
  TestData.store[:full_name] = table.hashes.first[:full_name].downcase.include?('random') ? TestHelper.rand_full_name : table.hashes.first['full_name']
  TestData.store[:company] = table.hashes.first['company'].downcase.include?('random') ? TestHelper.rand_comp_name : table.hashes.first['company']
  TestData.store[:street_address] = table.hashes.first['street_address']
  if table.hashes.first['street_address_2'].nil?
    TestData.store[:street_address_2] = ''
  else
    TestData.store[:street_address_2] = table.hashes.first['street_address_2'].downcase.include?('random') ? TestHelper.rand_alpha_numeric(2, 7) : table.hashes.first['street_address_2']
  end
  TestData.store[:city] = table.hashes.first['city'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['city']
  TestData.store[:state] = table.hashes.first['state'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['state']
  TestData.store[:zip] = table.hashes.first['zip'].downcase.include?('random') ? TestHelper.rand_alpha_numeric : table.hashes.first['zip']
  TestData.store[:country] = table.hashes.first['country'].size==0 ? 'United States' : table.hashes.first['country']
  TestData.store[:ship_to] = "#{TestData.store[:full_name]},#{TestData.store[:company]},#{TestData.store[:street_address]},#{TestData.store[:street_address_2]} ,#{TestData.store[:city]} #{TestData.store[:state]} #{TestData.store[:zip]}"

  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
  step "set Order Details Ship-To text area to #{TestData.store[:ship_to]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Aa]mbiguous [Aa]ddress to$/ do |table|
  step 'expect Order Details is present'
  stamps.orders.order_details.ship_to.domestic.set_ambiguous(TestHelper.format_address(table.hashes.first))
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o text area to (.*)$/ do |address|
  TestData.store[:ship_to_domestic] = TestHelper.format_address(address)
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.set(TestData.store[:ship_to_domestic])
  step 'Save Order Details data'
end

Then /^[Oo]n [Oo]rder [Dd]etails form, [Hh]ide [Ii]nternational [Ss]hip-[Tt]o fields$/ do
  stamps.orders.order_details.ship_to.international.hide_ship_to_details
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is truthy$/ do
  expect(TestData.store[:order_id].values.last.to_i).to be > 0
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID equals Grid Order ID in row (\d+)$/ do |row|
  expect(stamps.orders.order_details.toolbar.order_id.text.extract_numbers).to eql stamps.orders.orders_grid.grid_column(:order_id).row(row)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is the same as saved Order ID$/ do
  expect(stamps.orders.order_details.toolbar.order_id.text.extract_numbers).to eql TestData.store[:order_id].values.last
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Name is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.recipient_name).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Company Name is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.company_name).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Street Address is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.street_address).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed City is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.city).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed State is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.state).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Zip Plus 4 Code is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.zip_plus_4).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Zip Code is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.zip_code).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Phone is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.phone.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Email is (.*)$/ do |expectation|
  step 'expect Order Details is present'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.email.text).to eql expectation
end

Then /^[Ii]n Exact Address Not Found module, select row (\d+)$/ do |row|
  stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.row row
end

Then /^[Ss]et [Oo]rder [Dd]etails Phone to (.*)$/ do |phone|
  TestData.store[:phone] = phone.to_s.strip.downcase.include?('random') ? TestHelper.rand_phone : phone
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.phone.set(TestData.store[:phone]) unless TestData.store[:phone].length.zero?
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Email to (.*)$/ do |email|
  TestData.store[:email] = email.to_s.strip.downcase.include?('random') ? TestHelper.rand_email(SdcEnv.env) : email
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.email.set(TestData.store[:email]) unless TestData.store[:email].length.zero?
  step 'Save Order Details data'
end


Then /^[Ii]ncrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.lb.increment.click }
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.lb.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.oz.increment.click }
  step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.oz.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.length.increment.click }
  step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.length.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.width.increment.click }
  step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.width.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.height.increment.click }
  step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.height.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails [Ii]nsure-[Ff]or by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.insure_for.increment.click }
  step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails [Ii]nsure-[Ff]or by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.insure_for.decrement.click }
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Reference Number to (.*)$/ do |str|
  stamps.orders.order_details.reference_no.set(TestData.store[:reference_no] = str.downcase.include?('random') ? TestHelper.rand_alpha_numeric : str)
  step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Company is (.*)$/ do |str| #todo-Rob add is 'correct'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.text).to include(str)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Name is (.*)$/ do |str|  #todo-Rob add is 'correct'
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.textarea.text).to include(str)
end

#validating
Then /^[Ee]xpect [Oo]rder [Dd]etails Ship From is (?:correct|(.*))$/ do |expectation|
  expect(stamps.orders.order_details.single_ship_from.textbox.text).to include(expectation.nil? ? TestData.store[:ship_from] : expectation)
end
