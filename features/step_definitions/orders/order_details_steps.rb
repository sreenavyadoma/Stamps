
Then /^[Hh]ide [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  stamps.orders.single_order_details.ship_to.domestic.hide_ship_to_details
end

Then /^[Ss]how [Oo]rder [Dd]etails [Ff]orm [Ss]hip-[Tt]o [Ff]ields$/ do
  stamps.orders.single_order_details.ship_to.domestic.show_ship_to_details
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Manual Items Ordered pane$/ do
  stamps.orders.single_order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Manual Items Ordered pane$/ do
  stamps.orders.single_order_details.items_ordered.collapse
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Store Items Ordered pane$/ do
  stamps.orders.single_order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Store Items Ordered pane$/ do
  stamps.orders.single_order_details.items_ordered.collapse_store_item
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Add Item (\d+), Qty (\d+), ID (.+), Description (.*)$/ do |item_number, qty, id, description|
  step "set Order Details Associated Item #{item_number} Qty to #{qty}"
  step "set Order Details Associated Item #{item_number} ID to #{id}"
  step "set Order Details Associated Item #{item_number} Description to #{description}"
end

Then /^[Aa]dd [Oo]rder [Dd]etails form Associated Item (\d+)$/ do |item_number|
  stamps.orders.single_order_details.items_ordered.item(item_number.to_i)
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) Qty to (.*)$/ do |item_number, qty|
  step "expect Order Details is present"
  test_param[:details_associated_items][item_number]={} unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_qty]=qty
  stamps.orders.single_order_details.items_ordered.item(item_number.to_i).item_qty.set(test_param[:details_associated_items][item_number][:item_qty] )
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) ID to (.*)$/ do |item_number, str|
  step "expect Order Details is present"
  test_param[:details_associated_items][item_number]={} unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_id]=(str.downcase.include?('random')?(test_helper.random_alpha_numeric):str)
  stamps.orders.single_order_details.items_ordered.item(item_number.to_i).item_id.set(test_param[:details_associated_items][item_number][:item_id])
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Associated Item (\d+) Description to (.*)$/ do |item_number, str|
  step "expect Order Details is present"
  test_param[:details_associated_items][item_number]={} unless test_param[:details_associated_items].has_key?(item_number)
  test_param[:details_associated_items][item_number][:item_description]=(str.downcase.include?('random')?(test_helper.random_alpha_numeric):str)
  stamps.orders.single_order_details.items_ordered.item(item_number.to_i).item_description.set(test_param[:details_associated_items][item_number][:item_description])
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to (.*)$/ do |country|
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.country.select(test_param[:ship_to_country]=country)).to eql(test_param[:ship_to_country])
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Nn]ame to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_name]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.name.click
  else
    stamps.orders.single_order_details.ship_to.international.name.set test_param[:int_ship_to_name]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o [Cc]ompany to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_company]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.company.click
  else
    stamps.orders.single_order_details.ship_to.international.company.set test_param[:int_ship_to_company]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 1 to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_address_1]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.address_1.click
  else
    stamps.orders.single_order_details.ship_to.international.address_1.set test_param[:int_ship_to_address_1]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Address 2 to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_address_2]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.address_2.click
  else
    stamps.orders.single_order_details.ship_to.international.address_2.set test_param[:int_ship_to_address_2]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o City to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_city]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.city.click
  else
    stamps.orders.single_order_details.ship_to.international.city.set test_param[:int_ship_to_city]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Province to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_province]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.province.click
  else
    stamps.orders.single_order_details.ship_to.international.province.set test_param[:int_ship_to_province]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Postal Code to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_postal_code]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.postal_code.click
  else
    stamps.orders.single_order_details.ship_to.international.postal_code.set test_param[:int_ship_to_postal_code]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Phone to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_phone]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.phone.click
  else
    stamps.orders.single_order_details.ship_to.international.phone.set test_param[:int_ship_to_phone]
  end
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nternational [Ss]hip-[Tt]o Email to \"(.*)\"$/ do |str|
  test_param[:int_ship_to_email]=((str.downcase=='random')? test_helper.random_full_name : str)
  if str.length==0
    stamps.orders.single_order_details.ship_to.international.email.click
  else
    stamps.orders.single_order_details.ship_to.international.email.set test_param[:int_ship_to_email]
  end
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand panel$/ do
  stamps.orders.single_order_details.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Item (\d+)$/ do |item_number|
  item=stamps.orders.single_order_details.items_ordered.item item_number.to_i
  item.delete.click
end

Then /^[Ss]et [Oo]rder [Dd]etails Weight to (\d+) lb (\d+) oz$/ do |pounds, ounces|
  step "set Order Details Pounds to #{pounds}"
  step "set Order Details Ounces to #{ounces}"
end

Then /^[Ss]et [Oo]rder [Dd]etails Pounds to (\d+)$/ do |str|
  stamps.orders.single_order_details.weight.lb.set(test_param[:pounds]=str)
  step "blur out on Order Details form"
end

Then /^[Ss]et [Oo]rder [Dd]etails Ounces to (\d+)$/ do |str|
  stamps.orders.single_order_details.weight.oz.set(test_param[:ounces]=str)
  step "blur out on Order Details form"
end

Then /^[Bb]lur out on [Oo]rder [Dd]etails form(?:| (\d+)(?:| times))$/ do |count|
  stamps.orders.single_order_details.blur_out(count)
end

Then /^[Ss]et [Oo]rder [Dd]etails [Dd]imensions to [Ll]ength (\d+) [Ww]idth (\d+) [Hh]eight (\d+)$/ do |length, width, height|
  step "set Order Details Length to #{length}"
  step "set Order Details Width to #{width}"
  step "set Order Details Height to #{height}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ll]ength to (\d*)$/ do |str|
  expect(stamps.orders.single_order_details.dimensions.length).to be_present, "Order Details form Length is not present"
  stamps.orders.single_order_details.dimensions.length.set(test_param[:length]=str)
  step "blur out on Order Details form"
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ww]idth to (\d*)$/ do |str|
  expect(stamps.orders.single_order_details.dimensions.width).to be_present, "Order Details form Width is not present"
  stamps.orders.single_order_details.dimensions.width.set(test_param[:width]=str)
  step "blur out on Order Details form"
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Hh]eight to (\d*)$/ do |str|

  expect(stamps.orders.single_order_details.dimensions.height).to be_present, "Order Details form Height is not present"
  stamps.orders.single_order_details.dimensions.height.set(test_param[:height]=str)
  step "blur out on Order Details form"
  step "Save Order Details data"
end

Then /^[Oo]n [Oo]rder [Dd]etails form, check Insure-For checkbox$/ do
  stamps.orders.single_order_details.insure_for.checkbox.check
end

Then /^[Oo]n [Oo]rder [Dd]etails form, uncheck Insure-For checkbox$/ do
  stamps.orders.single_order_details.insure_for.checkbox.uncheck
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ii]nsure-[Ff]or to \$(.*)$/ do |str|
  stamps.orders.single_order_details.insure_for.set_and_agree_to_terms(test_param[:insure_for]=str.to_f.round(2))
  10.times do
    break if stamps.orders.single_order_details.insure_for.cost > 0
    step "blur out on Order Details form 3"
  end
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Tracking to (.*)$/ do |str|
  stamps.orders.single_order_details.tracking.select(test_param[:tracking]=str)
  10.times do
    break if stamps.orders.single_order_details.tracking.cost > 0
    step "blur out on Order Details form"
  end
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Ship-From to (.+)$/ do |str|
  test_param[:ship_from]=stamps.orders.single_order_details.single_ship_from.select(str)
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list=data_for(:country_groups_PMEI_flat_rate, {})["group" + group].values
  test_param[:country]=country_list[rand(country_list.size)]
  test_config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMEI price group (.*)$/ do |group|
  country_list=data_for(:country_groups_PMEI, {})["group" + group].values
  country_array=(country_list[rand(country_list.size)]).split("|")
  country_name=country_array[0]
  country_pounds=country_array[1].to_i
  200.times do
    if !test_param[:pounds].nil?
      if test_param[:pounds] > country_pounds
        country_array=country_list[rand(country_list.size)].split("|")
        country_name=country_array[0]
        country_pounds=country_array[1].to_i
      else
        break
      end
    end
  end
  test_param[:country]=country_name
  test_config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list=data_for(:country_groups_PMI_flat_rate, {})["group" + group].values
  test_param[:country]=country_list[rand(country_list.size)]
  test_config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Country to a random country in PMI price group (.*)$/ do |group|
  country_list=data_for(:country_groups_PMI, {})["group" + group].values
  country_array=(country_list[rand(country_list.size)]).split("|")
  country_name=country_array[0]
  country_pounds=country_array[1].to_i
  200.times do
    if !test_param[:pounds].nil?
      if test_param[:pounds] > country_pounds
        country_array=country_list[rand(country_list.size)].split("|")
        country_name=country_array[0]
        country_pounds=country_array[1].to_i
      else
        break
      end
    end
  end
  test_param[:country]=country_name
  test_config.logger.step "#{"#"*10} Desired Country: #{test_param[:country]}"
  step "set Order Details Ship-To Country to #{test_param[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o International address to$/ do |table|
  address_table=table.hashes.first

  test_param[:country]=address_table['country']
  test_param[:full_name]=(address_table['full_name'].downcase.include?('random')) ? test_helper.random_full_name : address_table['full_name']
  test_param[:company]=(address_table['company'].downcase.include?('random')) ? test_helper.random_company_name : address_table['company']
  test_param[:street_address_1]=(address_table['street_address_1'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['street_address_1']
  test_param[:street_address_2]=(address_table['street_address_2'].downcase.include?('random')) ? test_helper.random_suite : address_table['street_address_2']
  test_param[:city]=(address_table['city'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['city']
  test_param[:state]=(address_table['province'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['province']
  test_param[:zip]=(address_table['postal_code'].downcase.include?('random'))?test_helper.random_alpha_numeric : address_table['postal_code']
  test_param[:phone]=(address_table['phone'].downcase.include?('random')) ? test_helper.random_phone_number : address_table['phone']
  test_param[:email]=(address_table['email'].downcase.include?('random')) ? test_helper.random_email : address_table['email']

  step "set Order Details Ship-To Country to #{test_param[:country]}"
  step "set Order Details International Ship-To Name to \"#{test_param[:full_name]}\""
  step "set Order Details International Ship-To Company to \"#{test_param[:company]}\""
  step "set Order Details International Ship-To Address 1 to \"#{test_param[:street_address_1]}\""
  step "set Order Details International Ship-To Address 2 to \"#{test_param[:street_address_2]}\""
  step "set Order Details International Ship-To City to \"#{test_param[:city]}\""
  step "set Order Details International Ship-To Province to \"#{test_param[:state]}\""
  step "set Order Details International Ship-To Postal Code to \"#{test_param[:zip]}\""
  step "set Order Details International Ship-To Phone to \"#{test_param[:phone]}\""
  step "set Order Details International Ship-To Email to \"#{test_param[:email]}\""
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  step "show order details form ship-to fields"
  stamps.orders.single_order_details.ship_to.domestic.set(test_param[:ship_to_domestic]=test_helper.format_address(test_helper.address_helper_zone(address)))
  step "Save Order Details data"
  step "hide order details form Ship-To fields"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o Domestic address to$/ do |table|
  address_table=table.hashes.first
  test_param[:full_name]=(address_table['full_name'].downcase.include?('random')) ? test_helper.random_full_name : address_table['full_name']
  test_param[:company]=(address_table['company'].downcase.include?('random')) ? test_helper.random_company_name : address_table['company']
  test_param[:street_address]=address_table['street_address']
  if address_table['street_address_2'].nil?
    test_param[:street_address_2]=""
  else
    test_param[:street_address_2]=(address_table['street_address_2'].downcase.include?('random')) ? test_helper.random_alpha_numeric(2, 7) : address_table['street_address_2']
  end
  test_param[:city]=(address_table['city'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['city']
  test_param[:state]=(address_table['state'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['state']
  test_param[:zip]=(address_table['zip'].downcase.include?('random')) ? test_helper.random_alpha_numeric : address_table['zip']
  test_param[:country]=(address_table['country'].size==0)?"United States":address_table['country']
  test_param[:ship_to]="#{test_param[:full_name]},#{test_param[:company]},#{test_param[:street_address]},#{test_param[:street_address_2]} ,#{test_param[:city]} #{test_param[:state]} #{test_param[:zip]}"

  step "set Order Details Ship-To Country to #{test_param[:country]}"
  step "set Order Details Ship-To text area to #{test_param[:ship_to]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o text area to (.*)$/ do |address|
  test_param[:ship_to_domestic]=test_helper.format_address(address)
  step "show order details form ship-to fields"
  stamps.orders.single_order_details.ship_to.domestic.set(test_param[:ship_to_domestic])
  step "Save Order Details data"
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Hide [Ii]nternational [Ss]hip-[Tt]o fields$/ do
  stamps.orders.single_order_details.ship_to.international.hide_ship_to_details
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is truthy$/ do
  expect(test_param[:order_id].values.last.to_i).to be > 0
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID equals Grid Oder ID in row (\d+)$/ do |row|
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql stamps.orders.orders_grid.grid_column(:order_id).row(row)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Order ID is the same as saved Order ID$/ do
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql test_param[:order_id].values.last
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Name is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.recipient_name).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Company Name is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.company_name).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Street Address is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.street_address).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed City is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.city).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed State is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.state).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Zip Plus 4 Code is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.zip_plus_4).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Cleansed Zip Code is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.zip_code).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Phone is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.phone.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ss]hip-[Tt]o Email is (.*)$/ do |expectation|
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.email.text).to eql expectation
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o to ambiguous address$/ do |table|
  step "expect Order Details is present"
  stamps.orders.single_order_details.ship_to.domestic.set_ambiguous(test_helper.format_address(table.hashes.first))
end

Then /^[Ii]n Exact Address Not Found module, select row (\d+)$/ do |row|
  stamps.orders.single_order_details.ship_to.domestic.ambiguous.address_not_found.row row
end

Then /^[Ss]et [Oo]rder [Dd]etails Phone to (.*)$/ do |phone|
  test_param[:phone]=(phone.to_s.strip.downcase.include?('random'))?(test_helper.random_phone_number):phone
  step "show order details form ship-to fields"
  stamps.orders.single_order_details.ship_to.domestic.phone.set(test_param[:phone]) unless test_param[:phone].length==0
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Email to (.*)$/ do |email|
  test_param[:email]=(email.to_s.strip.downcase.include?('random'))?(test_helper.random_email):email
  step "show order details form ship-to fields"
  stamps.orders.single_order_details.ship_to.domestic.email.set(test_param[:email]) unless test_param[:email].length==0
  step "Save Order Details data"
end

#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.weight.lb.increment}
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.weight.lb.decrement}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.weight.oz.increment}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.weight.oz.decrement}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.length.increment}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.length.decrement}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.width.increment}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.width.decrement}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.height.increment}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.dimensions.height.decrement}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Increment [Oo]rder [Dd]etails Insure-For by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.insure_for.increment}
  step "Save Order Details data"
end
#todo-ORDERSAUTO-2261
Then /^Decrement [Oo]rder [Dd]etails Insure-For by (\d*)$/ do |str|
  str.to_i.times {stamps.orders.single_order_details.insure_for.decrement}
  step "Save Order Details data"
end

Then /^[Ss]et [Oo]rder [Dd]etails Reference Number to (.*)$/ do |str|
  stamps.orders.single_order_details.reference_no.set(test_param[:reference_no]=(str.downcase.include?('random'))?test_helper.random_alpha_numeric : str)
  step "Save Order Details data"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Company is (.*)$/ do |str| #todo-Rob add is 'correct'
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.text).to include(str)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Name is (.*)$/ do |str|  #todo-Rob add is 'correct'
  step "show order details form ship-to fields"
  expect(stamps.orders.single_order_details.ship_to.domestic.textarea.text).to include(str)
end

#validating
Then /^[E|e]xpect [Oo]rder [Dd]etails form Ship From is (?:correct|(.*))$/ do |expectation|
  expect(stamps.orders.single_order_details.single_ship_from.textbox.text).to include((expectation.nil?)?test_param[:ship_from]:expectation)
end
