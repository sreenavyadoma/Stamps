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

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})['group' + group].values
  country_array = (country_list[rand(country_list.size)]).split('|')
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !TestData.hash[:pounds].nil?
      if TestData.hash[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split('|')
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  TestData.hash[:country] = country_name
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})['group' + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI, {})['group' + group].values
  country_array = (country_list[rand(country_list.size)]).split('|')
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !TestData.hash[:pounds].nil?
      if TestData.hash[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split('|')
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  TestData.hash[:country] = country_name
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set Order Details Domestic Ship-To Country to #{TestData.hash[:country]}"
end

Then /^in exact address not found module, select row (\d+)$/ do |row|
  SdcWebsite.exact_address_not_found.address(row).set
  expect(SdcWebsite.exact_address_not_found.address(row)).to be_set, "Address row wasn't selected!"
end

Then /^in exact address not found module click accept$/ do
  SdcWebsite.exact_address_not_found.accept.click
  expect(SdcWebsite.exact_address_not_found.title).not_to be_present, "Address modal is still present"
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

Then /^set order details reference number to (.*)$/ do |str|
  str = /random/.match(str).to_s.casecmp('random').zero? ? TestHelper.rand_alpha_numeric : str
  SdcOrders.order_details.reference_num.set(str)
  TestData.hash[:reference_num] = str
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

Then /^expect order details ship from is (?:correct|(.*))$/ do |expectation|
  expect(SdcOrders.order_details.ship_from.text_field.text_value).to include(expectation.nil? ? TestData.hash[:ship_from] : expectation)
end

Then /^expect order details is present$/ do
  if SdcEnv.new_framework
    #step "wait until order details present"
    SdcWebsite.orders.order_details.wait_until_present(timeout: 10)
    expect(SdcWebsite.orders.order_details).to be_present, "Order Details form is not present"
  else
    stamps.orders.order_details.wait_until_present(4)
    expect(stamps.orders.order_details).to be_present, "Order Details form is not present"
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails is not present$/ do
  expect(stamps.orders.order_details.present?).to be(false), "Order Details form is present"
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

Then /^expect order details associated item (\d+) qty is (?:correct|(\d+))$/ do |item_number, expectation|
  expectation = (expectation.nil?) ? TestData.hash[:details_associated_items][item_number][:item_qty] : expectation
  step 'expect order details is present'
  expect(SdcOrders.order_details.associated_item.item_qty(item_number).value.to_i).to eql(expectation.to_i)    #todo Alex - change to .text_value once fixed
end

Then /^expect order details associated item (\d+) ID is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expectation = (expectation.nil?) ? TestData.hash[:details_associated_items][item_number][:item_id] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.text).to eql expectation
end

Then /^expect order details associated item (\d+) Description is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expectation = (expectation.nil?) ? TestData.hash[:details_associated_items][item_number][:item_description] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.text).to eql expectation
end

Then /^expect order details associated item (\d+) qty placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).qty.textbox.placeholder).to eql expectation
end

Then /^expect order details associated item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).id.placeholder).to eql expectation
end

Then /^expect order details associated item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).description.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.service.textbox.placeholder).to eql expectation
end

Then /^expect order details ship-to country is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?) ? TestData.hash[:country] : expectation
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.domestic.country.textbox.text).to eql expectation
end

Then /^expect order details international ship-to name is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:full_name] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.name.text).to eql(expectation)
end

Then /^expect order details international ship-to company is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:company] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.company.text).to eql expectation
end

Then /^expect order details international ship-to address 1 is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:street_address_1] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.address_1.text).to eql expectation
end

Then /^expect order details international ship-to address 2 is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:street_address_2] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.address_2.text).to eql expectation
end

Then /^expect order details international ship-to city is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:city] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.city.text).to eql expectation
end

Then /^expect order details international ship-to province is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:state] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.text).to eql expectation
end

Then /^expect order details international ship-to postal code is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:zip] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.text).to eql expectation
end

Then /^expect order details international ship-to phone is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:phone] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.text).to eql expectation
end

Then /^expect order details international ship-to email is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:email] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.email.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Address fields are visible$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.name).to be_present
  expect(stamps.orders.order_details.ship_to.international.company).to be_present
  expect(stamps.orders.order_details.ship_to.international.address_1).to be_present
  expect(stamps.orders.order_details.ship_to.international.address_2).to be_present
  expect(stamps.orders.order_details.ship_to.international.city).to be_present
  expect(stamps.orders.order_details.ship_to.international.province).to be_present
  expect(stamps.orders.order_details.ship_to.international.postal_code).to be_present
  expect(stamps.orders.order_details.ship_to.international.phone).to be_present
  expect(stamps.orders.order_details.ship_to.international.email).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic Ship-To fields are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.browser_restrictions_button).to be_present
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is enabled/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is disabled/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Name Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Company Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.address_1.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.address_2.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To City Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Province Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^[Oo]n [Oo]rder [Dd]etails [Ff]orm, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Panel is present$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details).to be_present
end

Then /^expect exact address not found module to appear/ do
  step 'expect order details is present'
  expect(SdcWebsite.exact_address_not_found.title).to be_present, "Exact Address Not Found modal is not present!"
end

Then /^expect order details reference number is (?:correct|(.*))$/ do |str|
  step 'expect order details is present'
  str ||= TestData.hash[:reference_num]
  expect(SdcOrders.order_details.reference_num.text_value).to eql(str)
end

Then /^expect order details insure-for is (?:correct|(\d+\.\d{2}))$/ do |expectation|
  step 'expect order details is present'
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.insure_for.amount.value.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:insured_value] : expectation.to_f)
  else
    expect(stamps.orders.order_details.insure_for.textbox.text.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:insured_value] : expectation.to_f)
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is (?:correct|(\d+\.\d{2}))$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:insured_value] : expectation.to_f)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is greater than \$(.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is disabled/ do | service |
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.service.disabled?(service)).to be(true)
end

#TODO define method to check if service is enabled!
Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is enabled/ do | expectation |
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  #  expect(stamps.orders.order_details.service.enabled?(expectation)).to be(true)
end

Then /^[Ee]xpect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^[Ee]xpect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.service.inline_cost(service).to_f).to be >= expectation.to_f
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.order_details.service.tooltip service
  tooltips.each do |tooltip|
    expect(actual_tooltip).to include tooltip
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost saved value is the same$/ do
  step "expect Order Details Service [Cc]ost is #{TestData.hash[:service_cost]}"
end

Then /^expect order details service cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.hash[:service_cost] if expectation.nil?
  step 'expect order details is present'
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.service.cost.text_value.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
  else
    expect(stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)).to eql expectation.to_f.round(2)
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^expect order details tracking cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.hash[:tracking_cost] if expectation.nil?
  step 'expect order details is present'
  if SdcEnv.new_framework
    expect(SdcOrders.order_details.tracking.cost.text_value.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:tracking_cost] : expectation)
  else
    expect(stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:tracking_cost] : expectation)
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Tracking [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
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

Then /^expect order details ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |str|
  str ||= TestData.hash[:ounces]
  step 'expect order details is present'
  expect(SdcOrders.order_details.weight.oz.value.to_f).to eql(str.to_f.round(2))
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.dimensions.present?).not_to be(true)
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

Then /^[Ee]xpect [Oo]rder [Dd]etails Total [Ss]hip [Cc]ost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.hash[:total_ship_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.single_ship_from.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From drop-down be enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.single_ship_from.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.domestic.country.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To text area is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Phone Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.phone.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Email Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.ship_to.domestic.email.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Pounds Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.lb.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ounces Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.oz.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails service Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails service drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or Textbox is disabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Tracking Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.tracking.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Tracking drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step 'expect order details is present'
  expect(stamps.orders.order_details.tracking.drop_down.field.visible?).to be(true)
end


Then /^[Ee]xpect (\d+) orders selected$/ do |expectation|
  expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


