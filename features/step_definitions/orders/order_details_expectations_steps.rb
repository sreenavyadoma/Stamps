
Then /^[Ee]xpect [Oo]rder [Dd]etails form Ship-From and Ship-From saved values are the same$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.text_box.text).to eql(test_param[:ship_from])
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) Qty is (?:correct|(\d+))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expectation = (expectation.nil?)?test_param[:details_associated_items][item_number][:item_qty] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_qty.text_box.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) ID is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expectation = (expectation.nil?)?test_param[:details_associated_items][item_number][:item_id] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_id.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) Description is (?:correct|(.*))$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expectation = (expectation.nil?)?test_param[:details_associated_items][item_number][:item_description] : expectation
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).item_description.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).qty.text_box.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).id.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Associated Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.items_ordered.item(item_number.to_i).description.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.email.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form service Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.text_box.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To Country is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_param[:country] : expectation
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.country.text_box.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Name is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:full_name] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.name.text).to eql(expectation)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Company is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:company] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.company.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Address 1 is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:street_address_1] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_1.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Address 2 is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:street_address_2] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_2.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To City is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:city] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.city.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Province is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:state] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Postal Code is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:zip] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Phone is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:phone] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Email is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:email] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.email.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Address fields are visible$/ do
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

Then /^[Ee]xpect [Oo]rder [Dd]etails form Domestic Ship-To fields are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Restrictions button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).to be(true)
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Restrictions button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.browser_restrictions_button.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Edit Form button is visible/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.edit_form_btn.present?).to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Edit Form button is hidden/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.edit_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Edit Form button is enabled/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.edit_form_btn.present?).to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Customs Edit Form button is disabled/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.customs.edit_form_btn.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Name Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.name.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Company Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.company.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_1.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.address_2.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To City Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.city.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Province Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.province.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.postal_code.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.phone.placeholder).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form International Ship-To Email Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.international.email.placeholder).to eql expectation
end

Then /^[Oo]n [Oo]rder [Dd]etails form, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Panel is present$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.present?).to be(true)
end

Then /^[Ee]xpect Exact Address Not Found module to appear/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.window_title.text).to eql "Exact Address Not Found"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Reference Number is (?:correct|(.*))$/ do |expectation|
  expectation = test_param[:reference_no] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.reference_no.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Insure-For is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = test_param[:insure_for] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.text_box.text.to_f.round(2)).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Insure-For Cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = test_param[:insure_for_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.cost).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Insure-For Cost is greater than \$(.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form service \"(.*)\" is disabled/ do |service|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.disabled?(service)).to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form service \"(.*)\" is enabled/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.enabled?(expectation)).to be(true)
end

Then /^[Ee]xpect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.pounds_max_value).to eql expectation
end

Then /^[Ee]xpect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ounces_max_value).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Service Cost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.inline_cost(service).to_f).to be >= expectation.to_f
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.order_details.service.tooltip service
  tooltips.each do |tooltip|
    expect(actual_tooltip).to include tooltip
  end
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Service Cost saved value is the same$/ do
  step "expect Order Details form Service Cost is #{test_param[:service_cost]}"
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Service Cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = test_param[:service_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.cost.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Service Cost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.cost).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Tracking Cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = test_param[:tracking_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.cost).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Tracking Cost is greater than \$([0-9.]*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.cost.to_f).to be > expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Pounds? (?:is (\d+)|and saved Pounds? are the same)$/ do |expectation|
  expectation = test_param[:pounds] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.lb.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Ounces? (?:is (\d+)|and saved Ounces? are the same)$/ do |expectation|
  expectation = test_param[:ounces] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.oz.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Dimensions are hidden$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.dimensions.present?).not_to be(true)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Length is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.dimensions.length.text_box.text.to_f).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Width is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Height is (\d+)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.dimensions.height.text_box.text.to_i).to eql expectation.to_i
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Tracking is (.*)$/ do |expectation|
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.text_box.text).to eql expectation
end

Then /^[Ee]xpect [Oo]rder [Dd]etails form Total Ship Cost is (?:correct|(\d+.\d*))$/ do |expectation|
  expectation = test_param[:total_ship_cost] if expectation.nil?
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(expectation.to_f.round(2))
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ship-From Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.text_box.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ship-From drop-down be enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_from.drop_down.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.country.drop_down.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ship-To text area is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.text_area.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Phone Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  stamps.orders.order_details.ship_to.domestic.show_address
  expect(stamps.orders.order_details.ship_to.domestic.phone.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Email Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.ship_to.domestic.email.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Pounds Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.lb.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Ounces Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.weight.oz.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form service Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.text_box.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form service drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.service.drop_down.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Insure-For Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Insure-For Textbox is disabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.insure_for.text_box.element.visible?).to be(true)
end

And /^[Ee]xpect Order Detials Form Tracking Textbox is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.text_box.element.visible?).to be(true)
end

And /^[Ee]xpect [Oo]rder [Dd]etails form Tracking drop-down is enabled$/ do
  stamps.orders.order_details.wait_until_present(2)
  expect(stamps.orders.order_details.tracking.drop_down.element.visible?).to be(true)
end


Then /^[Ee]xpect (\d+) orders selected$/ do |expectation|
  expect(stamps.orders.multi_web_apps.orders.order_count).to eql expectation
end


