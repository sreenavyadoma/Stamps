
Then /^(?:O|o)n Order Details form, expect Ship-From and Ship-From saved values are the same$/ do
  expect(stamps.orders.order_details.ship_from.text_box.text).to eql test_parameter[:ship_from]
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) Qty is (\d+)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.text_box.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) ID is (.*)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).qty.text_box.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).id.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).description.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Ship-To Email Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect service Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.service.text_box.placeholder).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Country is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_parameter[:country] : expectation
  expect(stamps.orders.order_details.ship_to.country.text_box.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Name is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:name] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.name.text).to eql(expectation)
end

Then /^(?:E|e)xpect Order Details form Ship-To Company is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:company] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.company.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Address 1 is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:street_address_1] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.address_1.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Address 2 is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:street_address_2] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.address_2.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To City is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:city] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.city.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Province is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:state] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.province.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Postal Code is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:zip] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.postal_code.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Phone is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:phone] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.phone.text).to eql expectation
end

Then /^(?:E|e)xpect Order Details form Ship-To Email is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:email] if expectation.nil?
  expect(stamps.orders.order_details.ship_to.international.email.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Address fields are visible$/ do
  expect(stamps.orders.order_details.ship_to.international.name.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.company.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.address_1.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.address_2.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.city.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.province.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.postal_code.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.phone.present?).to be true
  expect(stamps.orders.order_details.ship_to.international.email.present?).to be true
end

Then /^(?:O|o)n Order Details form, expect Domestic Ship-To fields are hidden$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.present?).to be false
end

Then /^(?:O|o)n Order Details form, expect Customs Restrictions button is visible/ do
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).to be true
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^(?:O|o)n Order Details form, expect Customs Restrictions button is hidden/ do
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).to be false
end

Then /^(?:O|o)n Order Details form, expect Customs Edit Form button is visible/ do
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be true
end

Then /^(?:O|o)n Order Details form, expect Customs Edit Form button is hidden/ do
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be false
end

Then /^(?:O|o)n Order Details form, expect Customs Edit Form button is enabled/ do
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be true
end

Then /^(?:O|o)n Order Details form, expect Customs Edit Form button is disabled/ do
  expect(stamps.orders.order_details.customs.browser_edit_form_button.present?).to be false
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Name Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Company Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.address_1.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.address_2.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To City Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Province Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect International Ship-To Email Placeholder is (.*)$/ do |expectation|
  expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^(?:O|o)n Order Details form, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^(?:O|o)n Order Details form, expect Panel is present$/ do
  expect(stamps.orders.order_details.present?).to be true
end

Then /^Expect Exact Address Not Found module to appear/ do
  expect(stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.window_title.text).to eql "Exact Address Not Found"
end

Then /^(?:O|o)n Order Details form, expect Reference Number (?:is (.*)|and saved Reference Number are the same)$/ do |expectation|
  expectation = test_parameter[:reference_no] if expectation.nil?
  expect(stamps.orders.order_details.reference_no.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Insure-For (?:is \$(.*)|and saved Insure-For values are the same)$/ do |expectation|
  expectation = test_parameter[:insure_for] if expectation.nil?
  10.times do
    break if stamps.orders.order_details.insure_for.text_box.text.to_f.round(2) == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.text_box.text.to_f.round(2)).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Insure-For Cost (?:is \$(.*)|and saved Insure-For Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:insure_for_cost] if expectation.nil?
  5.times do
    break if stamps.orders.order_details.insure_for.cost == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.cost).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Insure-For Cost is greater than \$(.*)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.insure_for.cost.to_f > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.insure_for.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect service \"(.*)\" is disabled/ do |service|
  expect(stamps.orders.order_details.service.disabled?(service)).to be true
end

Then /^(?:O|o)n Order Details form, expect service \"(.*)\" is enabled/ do |expectation|
  expect(stamps.orders.order_details.service.enabled?(expectation)).to be true
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Service Cost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  10.times do
    break if stamps.orders.order_details.service.inline_cost(service).to_f >= expectation.to_f
  end
  expect(stamps.orders.order_details.service.inline_cost(service).to_f).to be >= expectation.to_f
end

Then /^(?:O|o)n Order Details form, expect service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.order_details.service.tooltip service
  tooltips.each do |tooltip|
    expect(actual_tooltip).to include tooltip
  end
end

Then /^(?:O|o)n Order Details form, expect Service Cost saved value is the same$/ do
  step "On Order Details form, expect Service Cost is $#{test_parameter[:service_cost]}"
end

Then /^(?:O|o)n Order Details form, expect Service Cost (?:is \$(.*)|and saved Service Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:service_cost] if expectation.nil?
  10.times do
    sleep(0.25)
    break if stamps.orders.order_details.service.cost.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.service.cost.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Service Cost is greater than \$([0-9.]*)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.service.cost > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.service.cost).to be > expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Tracking Cost (?:is \$([0-9.]*)|and saved Tracking Cost values are the same)$/ do |expectation|
  expectation = test_parameter[:tracking_cost] if expectation.nil?
  10.times do
    break if stamps.orders.order_details.tracking.cost == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.tracking.cost).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Tracking Cost is greater than \$([0-9.]*)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.tracking.cost.to_f > expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.tracking.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |expectation|
  expectation = test_parameter[:pounds] if expectation.nil?
  10.times { break if stamps.orders.order_details.weight.lb.text_box.text.to_f == expectation.to_f.round(2) }
  expect(stamps.orders.order_details.weight.lb.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |expectation|
  expectation = test_parameter[:ounces] if expectation.nil?
  10.times { break if stamps.orders.order_details.weight.oz.text_box.text.to_f == expectation.to_f.round(2) }
  expect(stamps.orders.order_details.weight.oz.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Dimensions are hidden$/ do
  expect(stamps.orders.order_details.dimensions.present?).to be false
end

Then /^(?:O|o)n Order Details form, expect Length is (\d+)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.dimensions.length.text_box.text.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.dimensions.length.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Width is (\d+)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.dimensions.width.text_box.text.to_f == expectation.to_f.round(2)
  end
  expect(stamps.orders.order_details.dimensions.width.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^(?:O|o)n Order Details form, expect Height is (\d+)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.dimensions.height.text_box.text.to_i == expectation.to_i
  end
  expect(stamps.orders.order_details.dimensions.height.text_box.text.to_i).to eql expectation.to_i
end

Then /^(?:O|o)n Order Details form, expect Tracking is Signature Required$/ do
  step "On Order Details form, expect Tracking is \"Signature Required\""
end

Then /^(?:O|o)n Order Details form, expect Tracking is USPS Tracking$/ do
  step "On Order Details form, expect Tracking is \"USPS Tracking\""
end

Then /^(?:O|o)n Order Details form, expect Tracking is \"([\w\s]*)\"$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.tracking.text_box.text.include? expectation
  end
  expect(stamps.orders.order_details.tracking.text_box.text).to eql expectation
end

Then /^(?:O|o)n Order Details form, expect Total Ship Cost saved value is correct$/ do
  step "On Order Details form, expect Tracking Cost is $#{test_parameter[:tracking_cost]}"
end

Then /^(?:O|o)n Order Details form, expect Total Ship Cost is \$(.*)$/ do |expectation|
  10.times do
    break if stamps.orders.order_details.footer.total_ship_cost.eql?(expectation.to_f.round(2))
  end
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(expectation.to_f.round(2))
end

And /^(?:O|o)n Order Details form, expect Ship-From Textbox is enabled$/ do
  expect(stamps.orders.order_details.ship_from.text_box.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Ship-From drop-down be enabled$/ do
  expect(stamps.orders.order_details.ship_from.drop_down.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Ship-To drop-down is enabled$/ do
  expect(stamps.orders.order_details.ship_to.country.drop_down.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Ship-To text area is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Phone Textbox is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Email Textbox is enabled$/ do
  expect(stamps.orders.order_details.ship_to.domestic.email.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Pounds Textbox is enabled$/ do
  expect(stamps.orders.order_details.weight.lb.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Ounces Textbox is enabled$/ do
  expect(stamps.orders.order_details.weight.oz.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect service Textbox is enabled$/ do
  expect(stamps.orders.order_details.service.text_box.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect service drop-down is enabled$/ do
  expect(stamps.orders.order_details.service.drop_down.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Insure-For Textbox is enabled$/ do
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Insure-For Textbox is disabled$/ do
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be true
end

And /^Expect Order Detials Form Tracking Textbox is enabled$/ do
  expect(stamps.orders.order_details.tracking.text_box.element.visible?).to be true
end

And /^(?:O|o)n Order Details form, expect Tracking drop-down is enabled$/ do
  expect(stamps.orders.order_details.tracking.drop_down.element.visible?).to be true
end


Then /^Expect (\d+) orders selected$/ do |expectation|
  expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


