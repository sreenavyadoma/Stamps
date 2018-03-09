
Then /^[Hh]ide [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  stamps.orders.order_details.ship_to.domestic.hide_ship_to_details
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  stamps.orders.order_details.ship_to.domestic.show_ship_to_details
end

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

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]omestic [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.domestic.country.select(TestData.store[:ship_to_country] = country)).to eql(TestData.store[:ship_to_country])
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step 'show order details form ship-to fields'
  expect(stamps.orders.order_details.ship_to.international.country.select(TestData.store[:ship_to_country] = country)).to eql(TestData.store[:ship_to_country])
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Nn]ame to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_name] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.name.click
  else
    stamps.orders.order_details.ship_to.international.name.set TestData.store[:int_ship_to_name]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ompany to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_company] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.company.click
  else
    stamps.orders.order_details.ship_to.international.company.set TestData.store[:int_ship_to_company]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 1 to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_address_1] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.address_1.click
  else
    stamps.orders.order_details.ship_to.international.address_1.set TestData.store[:int_ship_to_address_1]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 2 to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_address_2] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.address_2.click
  else
    stamps.orders.order_details.ship_to.international.address_2.set TestData.store[:int_ship_to_address_2]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o City to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_city] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.city.click
  else
    stamps.orders.order_details.ship_to.international.city.set TestData.store[:int_ship_to_city]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Province to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_province] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.province.click
  else
    stamps.orders.order_details.ship_to.international.province.set TestData.store[:int_ship_to_province]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Postal Code to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_postal_code] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.postal_code.click
  else
    stamps.orders.order_details.ship_to.international.postal_code.set TestData.store[:int_ship_to_postal_code]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Phone to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_phone] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.phone.click
  else
    stamps.orders.order_details.ship_to.international.phone.set TestData.store[:int_ship_to_phone]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Email to \"(.*)\"$/ do |str|
  TestData.store[:int_ship_to_email] = ((str.downcase == 'random') ? TestHelper.rand_full_name : str)
  if str.length == 0
    stamps.orders.order_details.ship_to.international.email.click
  else
    stamps.orders.order_details.ship_to.international.email.set TestData.store[:int_ship_to_email]
  end
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand panel$/ do
  stamps.orders.order_details.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Item (\d+)$/ do |item_number|
  item = stamps.orders.order_details.items_ordered.item item_number.to_i
  item.delete.click
end

Then /^[Ss]et [Oo]rder [Dd]etails Weight to (\d+) lb (\d+) oz$/ do |pounds, ounces|
  step "set Order Details Pounds to #{pounds}"
  step "set Order Details Ounces to #{ounces}"
end

Then /^[Ss]et [Oo]rder [Dd]etails Pounds to (\d+)$/ do |str|
  stamps.orders.order_details.weight.lb.set(TestData.store[:pounds] = str)
  step 'blur out on Order Details form'
end

Then /^[Ss]et [Oo]rder [Dd]etails Ounces to (\d+)$/ do |str|
  stamps.orders.order_details.weight.oz.set(TestData.store[:ounces] = str)
  step 'blur out on Order Details form'
end

Then /^[Bb]lur out on [Oo]rder [Dd]etails form(?:| (\d+)(?:| times))$/ do |count|
  stamps.orders.order_details.blur_out(count)
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set Order Details Length to #{length}"
  step "set Order Details Width to #{width}"
  step "set Order Details Height to #{height}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ll]ength to (\d*)$/ do |str|
  expect(stamps.orders.order_details.dimensions.length).to be_present, 'Order Details form Length is not present'
  stamps.orders.order_details.dimensions.length.set(TestData.store[:length] = str)
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ww]idth to (\d*)$/ do |str|
  expect(stamps.orders.order_details.dimensions.width).to be_present, 'Order Details form Width is not present'
  stamps.orders.order_details.dimensions.width.set(TestData.store[:width] = str)
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Hh]eight to (\d*)$/ do |str|

  expect(stamps.orders.order_details.dimensions.height).to be_present, 'Order Details form Height is not present'
  stamps.orders.order_details.dimensions.height.set(TestData.store[:height] = str)
  step 'blur out on Order Details form'
  step 'Save Order Details data'
end

Then /^[Cc]heck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  stamps.orders.order_details.insure_for.checkbox.check
end

Then /^[Uu]ncheck [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]heckbox$/ do
  stamps.orders.order_details.insure_for.checkbox.uncheck
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nsure-[Ff]or to \$(\d+\.\d{2})$/ do |str|
  step 'check order details insure-for checkbox'
  stamps.orders.order_details.insure_for.textbox.set(TestData.store[:insured_value] = str.to_f)
  3.times do
    step 'blur out on Order Details form 2 times'
    stamps.orders.modals.insurance_terms_conditions.agree if stamps.orders.modals.insurance_terms_conditions.present?
    break unless stamps.orders.modals.insurance_terms_conditions.present?
  end
  # wait until insurance price is updated before proceeding to next step
  10.times do
    break if stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2) > 0
    step 'blur out on Order Details form 3'
  end
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Tt]racking to (.*)$/ do |str|
  stamps.orders.order_details.tracking.select(TestData.store[:tracking] = str)
  10.times do
    break if stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2) > 0
    step 'blur out on Order Details form'
  end
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Ff]rom to (?:Manage Shipping Addresses\.\.\.|(.*))$/ do |str|
  if str.nil?
    expect(stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses...')).to eql("Manage Shipping Addresses")
  else
    TestData.store[:ship_from] = stamps.orders.order_details.single_ship_from.select(str)
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})['group' + group].values
  TestData.store[:country] = country_list[rand(country_list.size)]
  SdcTest.log.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
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
  SdcTest.log.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.store[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})['group' + group].values
  TestData.store[:country] = country_list[rand(country_list.size)]
  SdcTest.log.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
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
  SdcTest.log.step "#{"#" * 10} Desired Country: #{TestData.store[:country]}"
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
  TestData.store[:email] = table.hashes.first['email'].downcase.include?('random') ? TestHelper.rand_email(modal_param.env) : table.hashes.first['email']

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

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.set(TestData.store[:ship_to_domestic] = TestHelper.format_address(TestHelper.address_helper_zone(address, modal_param.env)))
  step 'Save Order Details data'
  step 'hide order details form Ship-To fields'
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
  stamps.orders.order_details.ship_to.domestic.phone.set(TestData.store[:phone]) unless TestData.store[:phone].length == 0
  step 'Save Order Details data'
end

Then /^[Ss]et [Oo]rder [Dd]etails Email to (.*)$/ do |email|
  TestData.store[:email] = email.to_s.strip.downcase.include?('random') ? TestHelper.rand_email(modal_param.env) : email
  step 'show order details form ship-to fields'
  stamps.orders.order_details.ship_to.domestic.email.set(TestData.store[:email]) unless TestData.store[:email].length == 0
  step 'Save Order Details data'
end

#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.lb.increment.click }
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.lb.decrement.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.oz.increment.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.weight.oz.decrement.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.length.increment.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.length.decrement.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.width.increment.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.width.decrement.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.height.increment.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Dd]ecrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.dimensions.height.decrement.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
Then /^[Ii]ncrement [Oo]rder [Dd]etails [Ii]nsure-[Ff]or by (\d*)$/ do |str|
  str.to_i.times { stamps.orders.order_details.insure_for.increment.click }
  step 'Save Order Details data'
end
#todo-ORDERSAUTO-2261
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
