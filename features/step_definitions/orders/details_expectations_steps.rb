
Then /^On Order Details form, expect Ship-From saved value is the same$/ do
  stamps.orders.order_details.ship_from.text_box.text.should eql test_data[:ship_from]
end

Then /^On Order Details form, expect Item (\d+) Qty is (\d+)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).qty.text_box.text.should eql expectation
end

Then /^On Order Details form, expect Item (\d+) ID is (.*)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).id.text.should eql expectation
end

Then /^On Order Details form, expect Item (\d+) Description is (.*)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).description.text.should eql expectation
end

Then /^On Order Details form, expect Item (\d+) Qty Placeholder is (.*)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).qty.text_box.placeholder.should eql expectation
end

Then /^On Order Details form, expect Item (\d+) ID Placeholder is (.*)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).id.placeholder.should eql expectation
end

Then /^On Order Details form, expect Item (\d+) Description Placeholder is (.*)$/ do |item_number, expectation|
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  step "On Order Details form, Blur out"
  stamps.orders.order_details.item_grid.item(item_number.to_i).description.placeholder.should eql expectation
end

Then /^On Order Details form, expect Ship-To Address Placeholder is (.*)$/ do |expectation|
  stamps.orders.order_details.ship_to.domestic.show_address
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.domestic.text_area.placeholder.should eql expectation
end

Then /^On Order Details form, expect Ship-To Phone Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.phone.placeholder.should eql expectation
end

Then /^On Order Details form, expect Ship-To Email Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.domestic.email.placeholder.should eql expectation
end

Then /^On Order Details form, expect service Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.service.text_box.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Name is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.name.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Company is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.company.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Address 1 is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.address_1.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Address 2 is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.address_2.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Province is (.*)/ do |value|
  stamps.orders.order_details.ship_to.international.province.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Postal Code is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.postal_code.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Phone is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.phone.text.should eql value
end

Then /^On Order Details form, expect International Ship-To Email is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.email.text.should eql value
end

Then /^On Order Details form, expect Ship-To Country is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.country.text_box.text.should eql value
end

Then /^On Order Details form, expect International Ship-To City is (.*)/ do |value|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.city.text.should eql value
end

Then /^On Order Details form, expect International Address fields are visible$/ do
  stamps.orders.order_details.ship_to.international.name.present?.should be true
  stamps.orders.order_details.ship_to.international.company.present?.should be true
  stamps.orders.order_details.ship_to.international.address_1.present?.should be true
  stamps.orders.order_details.ship_to.international.address_2.present?.should be true
  stamps.orders.order_details.ship_to.international.city.present?.should be true
  stamps.orders.order_details.ship_to.international.province.present?.should be true
  stamps.orders.order_details.ship_to.international.postal_code.present?.should be true
  stamps.orders.order_details.ship_to.international.phone.present?.should be true
  stamps.orders.order_details.ship_to.international.email.present?.should be true
end

Then /^On Order Details form, expect Domestic Ship-To fields are hidden$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.domestic.text_area.present?.should be false
end

Then /^On Order Details form, expect Customs Restrictions button is visible/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_restrictions_button.present?.should be true
  stamps.orders.order_details.customs.restrictions.ok
end

Then /^On Order Details form, expect Customs Restrictions button is hidden/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_restrictions_button.present?.should be false
end

Then /^On Order Details form, expect Customs Edit Form button is visible/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^On Order Details form, expect Customs Edit Form button is hidden/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^On Order Details form, expect Customs Edit Form button is enabled/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^On Order Details form, expect Customs Edit Form button is disabled/ do
  step "On Order Details form, Blur out"
  stamps.orders.order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^On Order Details form, expect International Ship-To Name Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.name.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Company Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.company.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Address 1 Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.address_1.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Address 2 Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.address_2.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To City Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.city.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Province Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.province.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Postal Code Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.postal_code.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Phone Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.phone.placeholder.should eql expectation
end

Then /^On Order Details form, expect International Ship-To Email Placeholder is (.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.ship_to.international.email.placeholder.should eql expectation
end

Then /^On Order Details form, Collapse Panel$/ do
  stamps.orders.order_details.toolbar.menu.collapse
end

Then /^On Order Details form, expect Panel is present$/ do
  stamps.orders.order_details.present?.should be true
end

Then /^Expect Exact Address Not Found module to appear/ do
  stamps.orders.order_details.ship_to.domestic.ambiguous.address_not_found.window_title.text.should eql "Exact Address Not Found"
end

Then /^On Order Details form, expect Reference Number is (.*)$/ do |expectation|
  reference_no = (expectation.downcase.include? "random") ? test_data[:reference_no] : expectation
  stamps.orders.order_details.reference_no.text.should eql reference_no
end

Then /^On Order Details form, expect Insure-For is \$(.*)$/ do |expectation|
  stamps.orders.order_details.insure_for.checkbox.check
  step "On Order Details form, Blur out"
  10.times do
    break if stamps.orders.order_details.insure_for.text_box.text.to_f == expectation.to_f
  end
  stamps.orders.order_details.insure_for.text_box.text.to_f.should eql expectation.to_f
end

Then /^On Order Details form, expect Insure-For Cost saved value is the same$/ do
  step "On Order Details form, Blur out"
  step "On Order Details form, expect Insure-For Cost is $#{test_data[:insure_for_cost]}"
end

Then /^On Order Details form, expect Insure-For Cost is \$(.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  5.times do
    break if stamps.orders.order_details.insure_for.cost == expectation
  end
  stamps.orders.order_details.insure_for.cost.should eql expectation
end

Then /^On Order Details form, expect Insure-For Cost is greater than \$(.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  10.times do
    break if stamps.orders.order_details.insure_for.cost.to_f > expectation.to_f
  end
  stamps.orders.order_details.insure_for.cost.to_f.should be > expectation.to_f
end

Then /^On Order Details form, expect service \"(.*)\" is disabled/ do |service|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.service.disabled?(service).should be true
end

Then /^On Order Details form, expect service \"(.*)\" is enabled/ do |expectation|
  step "On Order Details form, Blur out"
  stamps.orders.order_details.service.enabled?(expectation).should be true
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.pounds_max_value.should eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  stamps.orders.order_details.ounces_max_value.should eql expectation
end

Then /^On Order Details form, expect service Cost inline price for "([a-zA-Z -\/]+)" is greater than \$([0-9.]*)$/ do |service, expectation|
  10.times do
    break if stamps.orders.order_details.service.inline_cost(service).to_f >= expectation.to_f
  end
  stamps.orders.order_details.service.inline_cost(service).to_f.should be >= expectation.to_f
end

Then /^On Order Details form, expect service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  tooltips = tooltip_content.split "||"
  actual_tooltip = stamps.orders.order_details.service.tooltip service
  tooltips.each do |tooltip|
    actual_tooltip.should include tooltip
  end
end

Then /^On Order Details form, expect service Cost saved value is the same$/ do
  step "On Order Details form, expect service Cost is $#{test_data[:service_cost]}"
end

Then /^On Order Details form, expect service Cost is \$(.*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    sleep 1
    break if stamps.orders.order_details.service.cost.to_f == expectation
  end
  stamps.orders.order_details.service.cost.to_f.should eql expectation
end

Then /^On Order Details form, expect service Cost is greater than \$([0-9.]*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.service.cost.to_f > expectation
  end
  stamps.orders.order_details.service.cost.to_f.should be > expectation
end

Then /^On Order Details form, expect Tracking Cost saved value is correct$/ do
  step "On Order Details form, expect Tracking Cost is $#{test_data[:tracking_cost]}"
end

Then /^On Order Details form, expect Tracking Cost is \$([0-9.]*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.tracking.cost.to_f == expectation
  end
  stamps.orders.order_details.tracking.cost.to_f.should eql expectation
end

Then /^On Order Details form, expect Tracking Cost is greater than \$([0-9.]*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.tracking.cost.to_f > expectation
  end
  stamps.orders.order_details.tracking.cost.to_f.should be > expectation
end

Then /^On Order Details form, expect Pounds? is (.*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.weight.lb.text_box.text.to_f == expectation
  end
  stamps.orders.order_details.weight.lb.text_box.text.to_f.should eql expectation
end

Then /^On Order Details form, expect Ounces? is (.*)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.weight.oz.text_box.text.to_f == expectation
  end
  stamps.orders.order_details.weight.oz.text_box.text.to_f.should eql expectation
end

Then /^On Order Details form, expect Dimensions are hidden$/ do
  stamps.orders.order_details.dimensions.present?.should be false
end

Then /^On Order Details form, expect Length is (\d+)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.dimensions.length.text_box.text.to_f == expectation
  end
  stamps.orders.order_details.dimensions.length.text_box.text.to_f.should eql expectation
end

Then /^On Order Details form, expect Width is (\d+)$/ do |expectation|
  expectation = expectation.to_f
  10.times do
    break if stamps.orders.order_details.dimensions.width.text_box.text.to_f == expectation
  end
  stamps.orders.order_details.dimensions.width.text_box.text.to_f.should eql expectation
end

Then /^On Order Details form, expect Height is (\d+)$/ do |expectation|
  expectation = expectation.to_i
  text_box = stamps.orders.order_details.dimensions.height.text_box
  10.times do
    break if text_box.text.to_i == expectation
  end
  text_box.text.to_i.should eql expectation
end

Then /^On Order Details form, expect Tracking is Signature Required$/ do
  step "On Order Details form, expect Tracking is \"Signature Required\""
end

Then /^On Order Details form, expect Tracking is USPS Tracking$/ do
  step "On Order Details form, expect Tracking is \"USPS Tracking\""
end

Then /^On Order Details form, expect Tracking is \"([\w\s]*)\"$/ do |expectation|
  step "On Order Details form, Blur out"
  10.times do
    break if stamps.orders.order_details.tracking.text_box.text.include? expectation
  end
  stamps.orders.order_details.tracking.text_box.text.should eql expectation
end

Then /^On Order Details form, expect Total Ship Cost saved value is correct$/ do
  step "On Order Details form, Blur out"
  step "On Order Details form, expect Tracking Cost is $#{test_data[:tracking_cost]}"
end

Then /^On Order Details form, expect Total Ship Cost is \$(.*)$/ do |expectation|
  step "On Order Details form, Blur out"
  10.times do
    break if stamps.orders.order_details.footer.total_ship_cost.eql? expectation
  end
  stamps.orders.order_details.footer.total_ship_cost.should eql expectation
end

And /^On Order Details form, expect Ship-From Textbox is enabled$/ do
  stamps.orders.order_details.ship_from.text_box.element.visible?.should be true
end

And /^On Order Details form, expect Ship-From drop-down be enabled$/ do
  stamps.orders.order_details.ship_from.drop_down.element.visible?.should be true
end

And /^On Order Details form, expect Ship-To Textbox is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.element.visible?.should be true
end

And /^On Order Details form, expect Ship-To drop-down is enabled$/ do
  stamps.orders.order_details.ship_to.country.drop_down.element.visible?.should be true
end

And /^On Order Details form, expect Ship-To text area is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.text_area.element.visible?.should be true
end

And /^On Order Details form, expect Phone Textbox is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.show_address
  stamps.orders.order_details.ship_to.domestic.phone.element.visible?.should be true
end

And /^On Order Details form, expect Email Textbox is enabled$/ do
  stamps.orders.order_details.ship_to.domestic.email.element.visible?.should be true
end

And /^On Order Details form, expect Pounds Textbox is enabled$/ do
  stamps.orders.order_details.weight.lb.element.visible?.should be true
end

And /^On Order Details form, expect Ounces Textbox is enabled$/ do
  stamps.orders.order_details.weight.oz.element.visible?.should be true
end

And /^On Order Details form, expect service Textbox is enabled$/ do
  stamps.orders.order_details.service.text_box.element.visible?.should be true
end

And /^On Order Details form, expect service drop-down is enabled$/ do
  stamps.orders.order_details.service.drop_down.element.visible?.should be true
end

And /^On Order Details form, expect Insure-For Textbox is enabled$/ do
  stamps.orders.order_details.insure_for.text_box.element.visible?.should be true
end

And /^On Order Details form, expect Insure-For Textbox is disabled$/ do
  stamps.orders.order_details.insure_for.text_box.element.visible?.should be true
end

And /^Expect Order Detials Form Tracking Textbox is enabled$/ do
  stamps.orders.order_details.tracking.text_box.element.visible?.should be true
end

And /^On Order Details form, expect Tracking drop-down is enabled$/ do
  stamps.orders.order_details.tracking.drop_down.element.visible?.should be true
end


Then /^Expect (\d+) orders selected$/ do |expectation|
  stamps.orders.multi_web_apps.orders.order_count.should eql expectation
end


