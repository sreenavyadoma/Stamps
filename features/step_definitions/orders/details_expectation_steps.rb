
Then /^Details: Expect Item (\d+) Qty to be (\d+)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} Qty to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  quantity = item.qty.text_box.text
  logger.info "Test #{(quantity == expectation)?"Passed":"Failed"}"
  quantity.should eql expectation
end

Then /^Details: Expect Item (\d+) ID to be (.*)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} ID to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.id.text
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Description to be (.*)$/ do |item_number, expectation|
  logger.info "^Details: Expect Item #{item_number} ID to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.description.text
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Qty Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item Qty Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.qty.text_box.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
end

Then /^Details: Expect Item (\d+) ID Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item ID# Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.id.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Item (\d+) Description Placeholder to be (.*)$/ do |item_number, expectation|
  logger.info "Details: Expect Item Description Placeholder to be #{expectation}"
  item = web_apps.orders.details.item_grid.item item_number.to_i
  actual_value = item.description.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Address Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Address Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.text_area.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Phone Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.phone.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ship-To Email Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.email.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Service Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.service.text_box.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Name to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Name to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.name.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Company to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Company to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.company.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Address 1 to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Address 1 to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.address_1.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Address 2 to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To address 2 to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.address_2.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Province to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To province to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.province.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Postal Code to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To postal code to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.postal_code.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Phone to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To phone to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.phone.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To Email to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To Email to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.email.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect Ship-To Country to be (.*)/ do |value|
  logger.info "Details: Expect Ship-To Country to be #{value}"
  actual_value = web_apps.orders.details.ship_to.country.text_box.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Ship-To City to be (.*)/ do |value|
  logger.info "Details: Expect International Ship-To City to be #{value}"
  actual_value = web_apps.orders.details.ship_to.international.city.text
  logger.info "Test #{(actual_value == value)?"Passed":"Failed"}"
  actual_value.should eql value
end

Then /^Details: Expect International Address fields are visible$/ do
  logger.info "Details: Expect International Address fields are visible"
  web_apps.orders.details.ship_to.international.name.present?.should be true
  web_apps.orders.details.ship_to.international.company.present?.should be true
  web_apps.orders.details.ship_to.international.address_1.present?.should be true
  web_apps.orders.details.ship_to.international.address_2.present?.should be true
  web_apps.orders.details.ship_to.international.city.present?.should be true
  web_apps.orders.details.ship_to.international.province.present?.should be true
  web_apps.orders.details.ship_to.international.postal_code.present?.should be true
  web_apps.orders.details.ship_to.international.phone.present?.should be true
  web_apps.orders.details.ship_to.international.email.present?.should be true
end

Then /^Details: Expect Domestic Ship-To fields are hidden$/ do
  logger.info "Details: Expect Domestic Ship-To fields are hidden"
  order_details = web_apps.orders.details
  order_details.ship_to.address.text_area.present?.should be false
end

Then /^Details: Expect Customs Restrictions button is visible/ do
  logger.info "Details: Expect Customs Restrictions button is visible"
  order_details = web_apps.orders.details
  order_details.customs.browser_restrictions_button.present?.should be true
  order_details.customs.restrictions.ok
end

Then /^Details: Expect Customs Restrictions button is hidden/ do
  logger.info "Details: Expect Customs Restrictions button is hidden"
  order_details = web_apps.orders.details
  order_details.customs.browser_restrictions_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is visible/ do
  logger.info "Details: Expect Customs Edit Form button is visible"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is hidden/ do
  logger.info "Details: Expect Customs Edit Form button is hidden"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect Customs Edit Form button is enabled/ do
  logger.info "Details: Expect Customs Edit Form button is enabled"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be true
end

Then /^Details: Expect Customs Edit Form button is disabled/ do
  logger.info "Details: Expect Customs Edit Form button is disabled"
  order_details = web_apps.orders.details
  order_details.customs.browser_edit_form_button.present?.should be false
end

Then /^Details: Expect International Ship-To Name Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ship-To Email Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.name.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Company Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.company.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Address 1 Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.address_1.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Address 2 Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.address_2.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To City Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.city.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Province Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.province.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Postal Code Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.postal_code.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.phone.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect International Ship-To Email Placeholder to be (.*)$/ do |expectation|
  logger.info "Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  actual_value = web_apps.orders.details.ship_to.international.email.placeholder
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Collapse Panel$/ do
  logger.info "Details: Collapse Panel"
  web_apps.orders.details.toolbar.menu.collapse
end

Then /^Details: Expect Panel Expanded$/ do
  logger.info "Details: Expect Panel Expanded"
  web_apps.orders.details.present?.should be true
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  logger.info "Expect \"Exact Address Not Found\" module to appear"
  address_not_found = web_apps.orders.details.ship_to.address.ambiguous.address_not_found
  logger.info "Test #{(address_not_found.present?)?"Passed":"Failed"}"
  address_not_found.window_title.text.should eql "Exact Address Not Found"
end

Then /^Details: Expect Reference Number to be (.*)$/ do |expectation|
  reference_no = (expectation.downcase.include? "random") ? @details_form_data[:reference_no] : expectation
  logger.info "Details: Expect Reference Number to be #{reference_no}"
  actual_value = web_apps.orders.details.reference_no.text
  logger.info "Test #{(actual_value==reference_no)?"Passed":"Failed"}"
  actual_value.should eql reference_no
end

Then /^Details: Expect Insure-For to be \$(.*)$/ do |expectation|
  logger.info "Details: Set Insure-For to #{expectation}"
  5.times do
    actual_value = web_apps.orders.details.insure_for.text_box.text
    if actual_value==expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Insure-For Cost to be \$(.*)$/ do |expectation|
  logger.info "Details: Expect Insure-For Cost to be #{expectation}"
  5.times do
    actual_value = web_apps.orders.details.insure_for.cost
    if actual_value==expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.cost
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Insure-For Cost to be greater than \$(.*)$/ do |expectation|
  logger.info "Details: Expect Insure-For Cost to be greater than #{expectation}"
  expectation = expectation.to_f
  15.times do
    actual_value = web_apps.orders.details.insure_for.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.insure_for.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Service \"(.*)\" to be disabled/ do |service|
  logger.info "Details: Expect Service \"#{service}\" to be disabled"
  actual_value = web_apps.orders.details.service.disabled? service
  logger.info "Test #{(actual_value)?"Passed":"Failed"}"
  actual_value.should be true
end

Then /^Details: Expect Service \"(.*)\" to be enabled/ do |expectation|
  logger.info "Details: Expect Service \"#{expectation}\" to be enabled"
  actual_value = web_apps.orders.details.service.enabled? expectation
  logger.info "Test #{(actual_value)?"Passed":"Failed"}"
  actual_value.should be true
end

Then /^Details: Expect Ship-From selection has (.*)$/ do |address|
  logger.info "Expect #{address} Ship-From address was added"
  raise "Unsupported Ship-From address:  #{address}" unless address.downcase.include? "random"
  begin
    logger.info "Search for \n#{@ship_from_address}.  Address was #{(web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address))?'Located':'Not Located'}"
  end unless @ship_from_address.nil?
end

Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.info "Expect Pounds tooltip to display - The maximum value for this field is #{expectation}"
  actual_value = web_apps.orders.details.pounds_max_value
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expectation|
  logger.info "Expect Ounces tooltip to display - The maximum value for this field is #{expectation}"
  actual_value = web_apps.orders.details.ounces_max_value
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Cost inline price for "([a-zA-Z -\/]+)" to be greater than \$([0-9.]*)$/ do |service, expectation|
  logger.info "Details: Expect Service Cost inline price for #{service} to be greater than #{expectation}"
  actual_value = web_apps.orders.details.service.inline_cost service
  10.times do
    break if actual_value.to_f >= expectation.to_f
    actual_value = web_apps.orders.details.service.inline_cost service
  end
  logger.info "Test #{(actual_value.to_f > expectation.to_f)?"Passed":"Failed"}"
  actual_value.to_f.should be >= expectation.to_f
end

Then /^Details: Expect Service Tooltip for "(.*)" to include "(.*)"$/ do |service, tooltip_content|
  logger.info "Details: Expect Service Tooltip for \"#{service}\" to include \"#{tooltip_content}\""
  tooltips = tooltip_content.split "||"
  actual_tooltip = web_apps.orders.details.service.tooltip service
  tooltips.each do |tooltip|
    logger.info "Does #{tooltip} exist in tooltip?  #{(actual_tooltip.include? tooltip)?"Yes.":"No."}"
    actual_tooltip.should include tooltip
  end
end

Then /^Details: Expect Service Cost is the same as saved value$/ do
  logger.info "Details: Expect Service Cost is the same as saved value"
  step "Details: Expect Service Cost to be $#{@details_form_data[:service_cost]}"
end

Then /^Details: Expect Service Cost to be \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Service Cost to be $#{expectation}"
  actual_value = web_apps.orders.details.service.cost
  logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Service Cost to be greater than \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Service Cost to be greater than $#{expectation}"
  expectation = expectation.to_f
  10.times do
    actual_value = web_apps.orders.details.service.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.service.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Tracking Cost to be \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Tracking Cost to be #{expectation}"
  10.times do
    actual_value = web_apps.orders.details.tracking.cost
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.tracking.cost
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Tracking Cost to be greater than \$([0-9.]*)$/ do |expectation|
  logger.info "Details: Expect Tracking Cost to be #{expectation}"
  expectation = expectation.to_f
  10.times do
    actual_value = web_apps.orders.details.tracking.cost.to_f
    if actual_value>expectation
      break
    else
      sleep 1
    end
  end
  actual_value = web_apps.orders.details.tracking.cost.to_f
  logger.info "Test #{(actual_value>expectation)?"Passed":"Failed"}"
  actual_value.should be > expectation
end

Then /^Details: Expect Pounds to be (.*)$/ do |expectation|
  logger.info "Details: Expect Pounds to be #{expectation}"
  text_box = web_apps.orders.details.weight.lbs.text_box
  text_box.present?.should be true
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Ounces to be (.*)$/ do |expectation|
  logger.info "Details: Expect Ounces to be  #{expectation}"
  text_box = web_apps.orders.details.weight.oz.text_box
  text_box.present?.should be true
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Length to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Length to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.length.text_box
  text_box.present?.should be true
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Width to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Width to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.width.text_box
  text_box.present?.should be true
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Height to be (\d+)$/ do |expectation|
  logger.info "Details: Expect Height to be #{expectation}"
  text_box = web_apps.orders.details.dimensions.height.text_box
  text_box.present?.should be true
  10.times do
    actual_value = text_box.text
    if actual_value == expectation
      break
    else
      sleep 1
    end
  end
  actual_value = text_box.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Details: Expect Tracking to be Signature Required$/ do
  step "Details: Expect Tracking to be \"Signature Required\""
end

Then /^Details: Expect Tracking to be USPS Tracking$/ do
  step "Details: Expect Tracking to be \"USPS Tracking\""
end

Then /^Details: Expect Tracking to be \"([\w\s]*)\"$/ do |expectation|
  logger.info "Details: Expect Tracking to be #{expectation}"
  begin
    text_box = web_apps.orders.details.tracking.text_box
    10.times do
      sleep 2
      actual_value = text_box.text
      break if actual_value.include? expectation
    end
    sleep 2
    actual_value = text_box.text
    logger.info "Test #{(actual_value == expectation)?"Passed":"Failed"}"
    actual_value.should eql expectation
  end unless expectation.length == 0
end

Then /^Details: Expect Total to be \$(.*)$/ do |expectation|
  logger.info "Details: Expect Total to be $#{expectation}"
  begin
    10.times do
      web_apps.orders.details.blur_out
      sleep 1
      actual_value = web_apps.orders.details.footer.total_ship_cost
      web_apps.orders.details.blur_out
      sleep 1
      break if actual_value.eql? expectation
    end
    actual_value = web_apps.orders.details.footer.total_ship_cost
    actual_value.should eql expectation
  end unless expectation.length == 0
end

Then /^Expect (\d+) orders selected$/ do |expectation|
  logger.info "Expect #{expectation} orders selected"
  web_apps.orders.multi_web_apps.orders.order_count.should eql expectation
end

And /^Details: Expect Ship-From Textbox to be enabled$/ do
  logger.info "Details: Expect Ship-From Textbox to be enabled"
  enabled = web_apps.orders.details.ship_from.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-From drop-down be enabled$/ do
  logger.info "Details: Expect Ship-From drop-down be enabled"
  enabled = web_apps.orders.details.ship_from.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To Textbox to be enabled$/ do
  logger.info "Details: Expect Ship-To Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.text_area.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To drop-down to be enabled$/ do
  logger.info "Details: Expect Ship-To drop-down to be enabled"
  enabled = web_apps.orders.details.ship_to.country.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ship-To text area to be enabled$/ do
  logger.info "Details: Expect Ship-To text area to be enabled"
  enabled = web_apps.orders.details.ship_to.address.text_area.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Phone Textbox to be enabled$/ do
  logger.info "Details: Expect Phone Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.phone.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Email Textbox to be enabled$/ do
  logger.info "Details: Expect Email Textbox to be enabled"
  enabled = web_apps.orders.details.ship_to.address.email.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Pounds Textbox to be enabled$/ do
  logger.info "Details: Expect Pounds Textbox to be enabled"
  enabled = web_apps.orders.details.weight.lbs.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Ounces Textbox to be enabled$/ do
  logger.info "Details: Expect Ounces Textbox to be enabled"
  enabled = web_apps.orders.details.weight.oz.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Service Textbox to be enabled$/ do
  logger.info "Details: Expect Service Textbox to be enabled"
  enabled = web_apps.orders.details.service.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Service drop-down to be enabled$/ do
  logger.info "Details: Expect Service drop-down to be enabled"
  enabled = web_apps.orders.details.service.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Insure-For Textbox to be enabled$/ do
  logger.info "Details: Expect Insure-For Textbox to be enabled"
  enabled = web_apps.orders.details.insure_for.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Insure-For Textbox to be disabled$/ do
  logger.info "Details: Expect Insure-For Textbox to be enabled"
  enabled = web_apps.orders.details.insure_for.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="disabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Expect Order Detials Form Tracking Textbox to be enabled$/ do
  logger.info "Expect Order Detials Form Tracking Textbox to be enabled"
  enabled = web_apps.orders.details.tracking.text_box.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end

And /^Details: Expect Tracking drop-down to be enabled$/ do
  logger.info "Details: Expect Tracking drop-down to be enabled"
  enabled = web_apps.orders.details.tracking.drop_down.element.visible?
  expectation = "enabled"
  expectation = "disabled" unless enabled
  logger.info "Test #{(expectation=="enabled")?"Passed":"Failed"}"
  expectation.should eql "enabled"
end




