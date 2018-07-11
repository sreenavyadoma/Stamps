
Then /^expect order details associated item (\d+) qty placeholder is (.*)$/ do |item, str|
  pending
  #expect(stamps.orders.order_details.items_ordered.item(item.to_i).qty.textbox.placeholder).to eql str
end

Then /^expect order details associated item (\d+) ID Placeholder is (.*)$/ do |item, str|
  pending
  #expect(stamps.orders.order_details.items_ordered.item(item.to_i).id.placeholder).to eql str
end

Then /^expect order details associated item (\d+) Description Placeholder is (.*)$/ do |item, str|
  pending
  # expect(stamps.orders.order_details.items_ordered.item(item.to_i).description.placeholder).to eql str
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Manual Items Ordered pane$/ do
  pending
  #stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Manual Items Ordered pane$/ do
  pending
  #stamps.orders.order_details.items_ordered.collapse
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Expand Store Items Ordered pane$/ do
  pending
  #stamps.orders.order_details.items_ordered.expand
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Store Items Ordered pane$/ do
  pending
  #stamps.orders.order_details.items_ordered.collapse_store_item
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
  step "set order details domestic ship-to country to #{TestData.hash[:country]}"
end

Then /^[Ss]et [Oo]rder [Dd]etails [Ss]hip-[Tt]o [Cc]ountry to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})['group' + group].values
  TestData.hash[:country] = country_list[rand(country_list.size)]
  SdcLogger.debug "#{"#" * 10} Desired Country: #{TestData.hash[:country]}"
  step "set order details domestic ship-to country to #{TestData.hash[:country]}"
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
  step "set order details domestic ship-to country to #{TestData.hash[:country]}"
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
  pending
  #str.to_i.times { stamps.orders.order_details.weight.lb.increment.click }
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Pounds by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.weight.lb.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.weight.oz.increment.click }
  # step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Ounces by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.weight.oz.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.length.increment.click }
  # step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Length by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.length.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.width.increment.click }
  # step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Width by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.width.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.height.increment.click }
  # step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails Height by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.dimensions.height.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ii]ncrement [Oo]rder [Dd]etails [Ii]nsure-[Ff]or by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.insure_for.increment.click }
  # step 'Save Order Details data'
end

Then /^[Dd]ecrement [Oo]rder [Dd]etails [Ii]nsure-[Ff]or by (\d*)$/ do |str|
  pending
  #str.to_i.times { stamps.orders.order_details.insure_for.decrement.click }
  # step 'Save Order Details data'
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Company is (.*)$/ do |str| #todo-Rob add is 'correct'
  pending
  #step 'show order ship-to details'
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.text).to include(str)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic [Ss]hip-[Tt]o Name is (.*)$/ do |str|  #todo-Rob add is 'correct'
  pending
  #step 'show order ship-to details'
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.text).to include(str)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails is not present$/ do
  pending
  #expect(stamps.orders.order_details.present?).to be(false), "Order Details form is present"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Address Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Phone Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Email Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.service.textbox.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Address fields are visible$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.name).to be_present
  # expect(stamps.orders.order_details.ship_to.international.company).to be_present
  # expect(stamps.orders.order_details.ship_to.international.address1).to be_present
  # expect(stamps.orders.order_details.ship_to.international.address2).to be_present
  # expect(stamps.orders.order_details.ship_to.international.city).to be_present
  # expect(stamps.orders.order_details.ship_to.international.province).to be_present
  # expect(stamps.orders.order_details.ship_to.international.postal_code).to be_present
  # expect(stamps.orders.order_details.ship_to.international.phone).to be_present
  # expect(stamps.orders.order_details.ship_to.international.email).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Domestic Ship-To fields are hidden$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is visible/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.browser_restrictions_button).to be_present
  # stamps.orders.order_details.customs.restrictions.ok
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is hidden/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is visible/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is hidden/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is enabled/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is disabled/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Name Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Company Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.address1.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.address2.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To City Placeholder is (.*)$/ do |expectation|
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Province Placeholder is (.*)$/ do |expectation|
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Email Placeholder is (.*)$/ do |expectation|
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^[Oo]n [Oo]rder [Dd]etails [Ff]orm, Collapse Panel$/ do
  pending
  #stamps.orders.order_details.toolbar.menu.collapse
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Panel is present$/ do
  pending
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details).to be_present
end

Then /^expect exact address not found module to appear/ do
  pending
  #step 'expect order details is present'
  # expect(SdcWebsite.exact_address_not_found.title).to be_present, "Exact Address Not Found modal is not present!"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is (?:correct|(\d+\.\d{2}))$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.hash[:insured_value] : expectation.to_f)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is greater than \$(.*)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is disabled/ do | service |
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.service.disabled?(service)).to be(true)
end

#TODO define method to check if service is enabled!
Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is enabled/ do | expectation |
  pending
  ## stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  #  expect(stamps.orders.order_details.service.enabled?(expectation)).to be(true)
end

Then /^[Ee]xpect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^[Ee]xpect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.service.inline_cost(service).to_f).to be >= expectation.to_f
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  pending
  #tooltips = tooltip_content.split "||"
  # actual_tooltip = stamps.orders.order_details.service.tooltip service
  # tooltips.each do |tooltip|
  #   expect(actual_tooltip).to include tooltip
  # end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost saved value is the same$/ do
  # step "expect Order Details Service [Cc]ost is #{TestData.hash[:service_cost]}"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Tracking [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions are hidden$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.dimensions.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Total [Ss]hip [Cc]ost is (?:correct|(\d+.\d*))$/ do |expectation|
  pending
  #expectation = TestData.hash[:total_ship_cost] if expectation.nil?
  # stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.single_ship_from.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From drop-down be enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.single_ship_from.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To drop-down is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.domestic.country.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To text area is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Phone Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # step "show order ship-to details"
  # expect(stamps.orders.order_details.ship_to.domestic.phone.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Email Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.ship_to.domestic.email.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Pounds Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.weight.lb.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ounces Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.weight.oz.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails service Textbox is enabled$/ do
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.service.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails service drop-down is enabled$/ do
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.service.drop_down.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or Textbox is enabled$/ do
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.insure_for.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or Textbox is disabled$/ do
  pending
  # #stamps.orders.order_details.wait_until_present(2)
  # expect(stamps.orders.order_details.insure_for.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Tracking Textbox is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.tracking.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Tracking drop-down is enabled$/ do
  pending
  #stamps.orders.order_details.wait_until_present(2)
  # step 'expect order details is present'
  # expect(stamps.orders.order_details.tracking.drop_down.field.visible?).to be(true)
end


Then /^[Ee]xpect (\d+) orders selected$/ do |expectation|
  pending
  #expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


Then /^[Ee]xpect USPS Terms modal appears$/ do
  #SdcLog.step "Expect USPS Terms modal appears"
  actual = stamps.orders.orders_toolbar.usps_intl_terms.is_usps_terms_modal_present
  expect(actual).to be(true)
end

Then /^[Cc]lick Cancel on USPS Terms modal$/ do
  #StampsTest.log.step "Click Cancel on USPS Terms modal"
  stamps.orders.orders_toolbar.usps_intl_terms.click_cancel_button
end

Then /^[Cc]lick I Agree on USPS Terms modal$/ do
  #StampsTest.log.step "Click I Agree on USPS Terms modal"
  stamps.orders.orders_toolbar.usps_intl_terms.click_i_agree_button
end

Then /^Check Do Not Show Again checkbox in USPS Terms modal$/ do
  #SdcLog.step "Check Do Not Show Again checkbox in USPS Terms modal"
  sleep(2)
  stamps.orders.orders_toolbar.usps_intl_terms.check_dont_show_again_checkbox
  sleep(2)
end
