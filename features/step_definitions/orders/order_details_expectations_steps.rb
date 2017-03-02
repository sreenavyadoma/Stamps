
Then /^(?:E|e)xpect Order Details form Ship-From and Ship-From saved values are the same$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.text_box.text).to eql test_parameter[:ship_from]
end

Then /^(?:E|e)xpect Order Details form Item (\d+) Qty is (\d+)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Item (\d+) ID is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Item (\d+) Description is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).qty.text_box.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).id.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).description.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form service Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.text_box.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Country is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:country] : expectation
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.country.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Name is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:name] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.name.text).to eql(expectation)
end

Then /^(?:E|e)xpect Order Details form Ship-To Company is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:company] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.company.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Address 1 is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:street_address_1] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_1.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Address 2 is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:street_address_2] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_2.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To City is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:city] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.city.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Province is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:state] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Postal Code is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:zip] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Phone is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:phone] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Email is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:email] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.email.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Address fields are visible$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.name.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.company.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.address_1.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.address_2.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.city.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.province.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.postal_code.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.phone.present?).to be(true)
  expect(stamps.orders.order_details.ship_to.international.email.present?).to be(true)
end

Then /^(?:E|e)xpect Order Details form Domestic Ship-To fields are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.present?).to be(false)
end

Then /^(?:E|e)xpect Order Details form Customs Restrictions button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).to be(true)
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^(?:E|e)xpect Order Details form Customs Restrictions button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).to be(false)
end

Then /^(?:E|e)xpect Order Details form Customs Edit Form button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be(true)
end

Then /^(?:E|e)xpect Order Details form Customs Edit Form button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be(false)
end

Then /^(?:E|e)xpect Order Details form Customs Edit Form button is enabled/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be(true)
end

Then /^(?:E|e)xpect Order Details form Customs Edit Form button is disabled/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be(false)
end

Then /^(?:E|e)xpect Order Details form International Ship-To Name Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Company Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_1.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_2.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To City Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Province Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form International Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^(?:E|e)xpect Order Details form Panel is present$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.present?).to be(true)
end

Then /^Expect Exact Address Not Found module to appear/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.window_title.text).to eql "Exact Address Not Found"
end

Then /^(?:E|e)xpect Order Details form Reference Number (?:is (.*)|and saved Reference Number are the same)$/ do |expectation|
  expectation = test_parameter[:reference_no] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.reference_no.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Insure-For (?:is \$(.*)|and saved Insure-For values are the same)$/ do |expectation|
  expectation = test_parameter[:insure_for] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.insure_for.text_box.text.to_f.round(2) == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.text_box.text.to_f.round(2)).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Insure-For Cost (?:is \$(.*)|and saved Insure-For Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:insure_for_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  5.times do
    break if stamps.orders.order_details.insure_for.cost == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.cost).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Insure-For Cost is greater than \$(.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.insure_for.cost.to_f > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form service \"(.*)\" is disabled/ do |service|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.disabled?(service)).to be(true)
end

Then /^(?:E|e)xpect Order Details form service \"(.*)\" is enabled/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.enabled?(expectation)).to be(true)
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Service Cost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.service.inline_cost(service).to_f >= expectation.to_f
  end
  expect(stamps.orders.order_details.service.inline_cost(service).to_f).to be >= expectation.to_f
end

Then /^(?:E|e)xpect Order Details form service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.order_details.service.tooltip service
  tooltips.each do |tooltip|
    expect(actual_tooltip).to include tooltip
  end
end

Then /^(?:E|e)xpect Order Details form Service Cost saved value is the same$/ do
  step "expect Order Details form Service Cost is $#{test_parameter[:service_cost]}"
end

Then /^(?:E|e)xpect Order Details form Service Cost (?:is \$(.*)|and saved Service Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:service_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    sleep(0.25)
    break if stamps.orders.order_details.service.cost.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.service.cost.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Service Cost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.service.cost > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.service.cost).to be > expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Tracking Cost (?:is \$([0-9.]*)|and saved Tracking Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:tracking_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.tracking.cost == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.tracking.cost).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Tracking Cost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.tracking.cost.to_f > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.tracking.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |expectation|
  expectation = test_parameter[:pounds] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  10.times { break if stamps.orders.order_details.weight.lb.text_box.text.to_f == expectation.to_f.round(2) }
  expect(stamps.orders.order_details.weight.lb.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |expectation|
  expectation = test_parameter[:ounces] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  10.times { break if stamps.orders.order_details.weight.oz.text_box.text.to_f == expectation.to_f.round(2) }
  expect(stamps.orders.order_details.weight.oz.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Dimensions are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.dimensions.present?).to be(false)
end

Then /^(?:E|e)xpect Order Details form Length is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.dimensions.length.text_box.text.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.dimensions.length.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Width is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.dimensions.width.text_box.text.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.dimensions.width.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:E|e)xpect Order Details form Height is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.dimensions.height.text_box.text.to_i == expectation.to_i
  end
  expect(stamps.orders.order_details.dimensions.height.text_box.text.to_i).to eql expectation.to_i
end

Then /^(?:E|e)xpect Order Details form Tracking is Signature Required$/ do
  step "expect Order Details form Tracking is \"Signature Required\""
end

Then /^(?:E|e)xpect Order Details form Tracking is USPS Tracking$/ do
  step "expect Order Details form Tracking is \"USPS Tracking\""
end

Then /^(?:E|e)xpect Order Details form Tracking is \"([\w\s]*)\"$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.tracking.text_box.text.include? expectation
  end
  expect(stamps.orders.order_details.tracking.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Total Ship Cost is \$(.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  10.times do
    break if stamps.orders.order_details.footer.total_ship_cost.eql?(expectation.to_f.round(2))
  end
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(expectation.to_f.round(2))
end

And /^(?:E|e)xpect Order Details form Ship-From Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.text_box.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Ship-From drop-down be enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.drop_down.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Ship-To drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.country.drop_down.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Ship-To text area is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Phone Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Email Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.email.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Pounds Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.lb.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Ounces Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.oz.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form service Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.text_box.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form service drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.drop_down.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Insure-For Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Insure-For Textbox is disabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be(true)
end

And /^Expect Order Detials Form Tracking Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.text_box.element.visible?).to be(true)
end

And /^(?:E|e)xpect Order Details form Tracking drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.drop_down.element.visible?).to be(true)
end


Then /^Expect (\d+) orders selected$/ do |expectation|
  expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


