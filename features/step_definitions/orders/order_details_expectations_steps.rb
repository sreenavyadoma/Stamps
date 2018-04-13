
Then /^[Ee]xpect [Oo]rder [Dd]etails is present$/ do
  if SdcEnv.new_framework
    SdcWebsite.orders.order_details.wait_until_present(4)
    expect(SdcWebsite.orders.order_details).to be_present, "Order Details form is not present"
  else
    stamps.orders.order_details.wait_until_present(4)
    expect(stamps.orders.order_details).to be_present, "Order Details form is not present"
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails is not present$/ do
  expect(stamps.orders.order_details.present?).to be(false), "Order Details form is present"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-From and Ship-From saved values are the same$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.single_ship_from.textbox.text).to eql(TestData.store[:ship_from])
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) Qty is (?:correct|(\d+))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expectation = (expectation.nil?) ? TestData.store[:details_associated_items][item_number][:item_qty] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.textbox.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) ID is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expectation = (expectation.nil?) ? TestData.store[:details_associated_items][item_number][:item_id] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) Description is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expectation = (expectation.nil?) ? TestData.store[:details_associated_items][item_number][:item_description] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).qty.textbox.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).id.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Associated Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).description.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.service.textbox.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Country is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?) ? TestData.store[:country] : expectation
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.domestic.country.textbox.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Name is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:full_name] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.name.text).to eql(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Company is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:company] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.company.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 1 is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:street_address_1] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.address_1.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 2 is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:street_address_2] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.address_2.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To City is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:city] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.city.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Province is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:state] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Postal Code is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:zip] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Phone is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:phone] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Email is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:email] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.email.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Address fields are visible$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
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
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.browser_restrictions_button).to be_present
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Restrictions button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is enabled/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.custom_form_btn).to be_present
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Customs Customs Form button is disabled/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.customs.custom_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Name Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Company Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.address_1.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.address_2.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To City Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Province Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails International Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^[Oo]n [Oo]rder [Dd]etails [Ff]orm, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Panel is present$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details).to be_present
end

Then /^[Ee]xpect Exact Address Not Found module to appear/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.window_title.text).to eql "Exact Address Not Found"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Reference Number is (?:correct|(.*))$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.reference_no.text).to eql(expectation.nil? ? TestData.store[:reference_no] : expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or is (?:correct|(\d+\.\d{2}))$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.insure_for.textbox.text.to_f.round(2)).to eql(expectation.nil? ? TestData.store[:insured_value] : expectation.to_f)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is (?:correct|(\d+\.\d{2}))$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.store[:insured_value] : expectation.to_f)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails [Ii]nsure-[Ff]or [Cc]ost is greater than \$(.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is disabled/ do | service |
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.service.disabled?(service)).to be(true)
end

#TODO define method to check if service is enabled!
Then /^[Ee]xpect [Oo]rder [Dd]etails service \"(.*)\" is enabled/ do | expectation |
  # stamps.orders.order_details.wait_until_present(2)
  # step "expect Order Details is present"
  #  expect(stamps.orders.order_details.service.enabled?(expectation)).to be(true)
end

Then /^[Ee]xpect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^[Ee]xpect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
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
  step "expect Order Details Service [Cc]ost is #{TestData.store[:service_cost]}"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.store[:service_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Service [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Tracking [Cc]ost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.store[:tracking_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.nil? ? TestData.store[:tracking_cost] : expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Tracking [Cc]ost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |expectation|
  expectation = TestData.store[:pounds] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.weight.lb.textbox.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |expectation|
  expectation = TestData.store[:ounces] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.weight.oz.textbox.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Dimensions are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.dimensions.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Length is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.dimensions.length.textbox.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Width is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Height is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.dimensions.height.textbox.text.to_i).to eql expectation.to_i
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Tracking is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.store[:tracking] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.tracking.textbox.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails Total [Ss]hip [Cc]ost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = TestData.store[:total_ship_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2)).to eql(expectation.to_f.round(2))
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.single_ship_from.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-From drop-down be enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.single_ship_from.dropdown.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.ship_to.domestic.country.dropdown.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Ship-To text area is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.textarea.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Phone Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  step "show order details form ship-to fields"
  expect(stamps.orders.order_details.ship_to.domestic.phone.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Email Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
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
  expect(stamps.orders.order_details.service.dropdown.field.visible?).to be(true)
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
  step "expect Order Details is present"
  expect(stamps.orders.order_details.tracking.textbox.field.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails Tracking drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  step "expect Order Details is present"
  expect(stamps.orders.order_details.tracking.dropdown.field.visible?).to be(true)
end


Then /^[Ee]xpect (\d+) orders selected$/ do |expectation|
  expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


