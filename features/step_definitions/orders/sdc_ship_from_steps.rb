
Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Ship-From address (\w+)$/ do |address|
  # pending
end

Then /^delete all addresses on manage shipping address modal$/ do
  step 'open manage shipping address'
  step 'delete all rows on manage shipping address modal'
  step 'close manage shipping address modal'
end

Then /^delete all rows on manage shipping address modal$/ do
  while SdcOrders.modals.manage_shipping_addresses.addresses.count > 1 do
    step 'delete manage shipping address row 1'
  end
  step 'expect all rows deleted on manage shipping address'
end

Then /^delete manage shipping address row (\d)$/ do |row_num|
  address_count = SdcOrders.modals.manage_shipping_addresses.addresses.count
  step "select manage shipping address row #{row_num}"
  step 'click manage shipping address delete button'
  step 'click delete shipping address modal delete button'
  expect(SdcOrders.modals.manage_shipping_addresses.addresses.count).to eql(address_count - 1), 'Address hasn\'t been removed!'
end

Then /^select manage shipping address row (\d)$/ do |row_num|
  SdcOrders.modals.manage_shipping_addresses.address_element(row_num).click
end

Then /^click manage shipping address delete button$/ do
  SdcOrders.modals.manage_shipping_addresses.delete.click
  step 'expect delete shipping address modal is present'
end

Then /^click delete shipping address modal delete button$/ do
  SdcOrders.modals.delete_shipping_address.delete.click
  step 'expect delete shipping address modal is not present'
end

Then /^expect all rows deleted on manage shipping address$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.addresses.count).to eql(1)
end

Then /^open manage shipping address$/ do
  step 'set order details ship-from to Manage Shipping Addresses...'
  step 'expect manage shipping address is present'
end

Then /^expect manage shipping address is present$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.title).to be_present
end

Then /^expect manage shipping address is not present$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.title).not_to be_present
end

Then /^expect delete shipping address modal is present$/ do
  expect(SdcOrders.modals.delete_shipping_address.title).to be_present
end

Then /^expect delete shipping address modal is not present$/ do
  SdcOrders.modals.delete_shipping_address.title.wait_while_present(timeout: 3)
  expect(SdcOrders.modals.delete_shipping_address.title).not_to be_present
end

Then /^click manage shipping address add button$/ do
  SdcOrders.modals.manage_shipping_addresses.add.click
  step 'expect add shipping address modal is present'
end

Then /^expect add shipping address modal is present$/ do
  expect(SdcOrders.modals.add_edit_shipping_address.title).to be_present
end

Then /^close manage shipping address modal$/ do
  SdcOrders.modals.manage_shipping_addresses.x_btn.click
  step 'expect manage shipping address is not present'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal, edit address for name=\"(.*)\", company=\"(.*)\" and city=\"(.*)\" to:$/ do |name, company, city, new_address|
  pending
  # step 'set order details ship-from to Manage Shipping Addresses...'
  # row_num = stamps.orders.modals.manage_shipping_addresses.locate_ship_from(name, company, city)
  # if row_num > 0
  #   stamps.orders.modals.manage_shipping_addresses.select_row(row_num)
  #   15.times do
  #     stamps.orders.modals.manage_shipping_addresses.edit_button.click
  #   end
  # else
  #   raise 'Can\'t select address!'
  # end
  # stamps.orders.modals.add_shipping_address.ship_from_address(new_address.hashes.first)
end

Then /^[Aa]dd random Ship-from address from (.*)$/ do |address|
  TestData.hash[:ship_from_address] = TestHelper.address_helper_zone(address)
  pending
  #stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add.ship_from_address(TestData.hash[:ship_from_address])
end

Then /^add new address to manage shipping address$/ do |ship_from|
  TestData.hash[:ship_from_address] = ship_from.hashes.first
  TestData.hash[:ship_from_zip] = TestData.hash[:ship_from_address][:ship_from_zip]
  TestData.hash[:full_name] = TestData.hash[:ship_from_address][:full_name]
  TestData.hash[:company] = TestData.hash[:ship_from_address][:company]
  TestData.hash[:street_address] = TestData.hash[:ship_from_address][:street_address]
  TestData.hash[:street_address2] = TestData.hash[:ship_from_address][:street_address2]
  TestData.hash[:city] = TestData.hash[:ship_from_address][:city]
  TestData.hash[:state] = TestData.hash[:ship_from_address][:state]
  TestData.hash[:zip] = TestData.hash[:ship_from_address][:zip]
  TestData.hash[:phone] = TestData.hash[:ship_from_address][:phone]
  step 'open manage shipping address'
  step 'click manage shipping address add button'
  modal = SdcOrders.modals.add_edit_shipping_address
  modal.ship_from_zip.set(TestData.hash[:ship_from_zip])
  modal.name.set(TestData.hash[:full_name])
  modal.company.set(TestData.hash[:company])
  modal.address.set(TestData.hash[:street_address])
  modal.address2.set(TestData.hash[:street_address2])
  modal.city.set(TestData.hash[:city])
  modal.zip.set(TestData.hash[:zip])
  modal.phone.set(TestData.hash[:phone])

  modal.state.selection_element(TestData.hash[:state])
  modal.state.drop_down.click unless modal.state.selection.present?
  modal.state.selection.scroll_into_view
  modal.state.selection.click unless modal.state.selection.class_disabled?
  expect(modal.state.text_field.text_value).to include(TestData.hash[:state])
  SdcOrders.modals.add_edit_shipping_address.save.click
  SdcOrders.modals.manage_shipping_addresses.title.safe_wait_while_present(timeout: 2)
  step 'close manage shipping address modal'
end

# this step step def is only for private use - DO NOT use it in any feature file
# address = '90245,Automation,1990 E Grand Avenue,El Segundo,California,90245,United States,4157944522'
Then /^add default ship-from shipping address (.+)$/ do |ship_from|
  ship_from_zip, company, street_address, city, state, zip, phone = ship_from.split(',')
  TestData.hash[:ship_from_zip] = ship_from_zip
  TestData.hash[:company] = company
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:zip] = zip
  TestData.hash[:phone] = phone

  step 'open manage shipping address'
  step 'click manage shipping address add button'
  modal = SdcOrders.modals.add_edit_shipping_address
  modal.ship_from_zip.set(TestData.hash[:ship_from_zip])
  modal.company.set(TestData.hash[:company])
  modal.address.set(TestData.hash[:street_address])
  modal.city.set(TestData.hash[:city])
  modal.zip.set(TestData.hash[:zip])
  modal.phone.set(TestData.hash[:phone])

  modal.state.selection_element(TestData.hash[:state])
  modal.state.drop_down.click unless modal.state.selection.present?
  modal.state.selection.scroll_into_view
  modal.state.selection.click unless modal.state.selection.class_disabled?
  expect(modal.state.text_field.text_value).to include(TestData.hash[:state])
  SdcOrders.modals.add_edit_shipping_address.save.click
  SdcOrders.modals.manage_shipping_addresses.title.safe_wait_while_present(timeout: 2)
  step 'close manage shipping address modal'
end




Then /^[Oo]n Manage Shipping Address modal, add address (\w+)$/ do |address|
  # TestData.hash[:ship_from_address] = address.include?('random ship from zone 1 through 4') ? TestHelper.rand_ship_from_zone_1_4(TestSession.env.url) : address
  pending
    #stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add(TestData.hash[:ship_from_address])
end

Then /^[Oo]n Manage Shipping Address modal, set Manage Shipping Addresses to$/ do
  pending
  #stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add table.hashes.first
end

Then /^[Oo]n Manage Shipping Address modal, expect selection has (.*)$/ do |address|
  pending
  #step "blur out on order details form"
  #stamps.orders.order_details.single_ship_from.select("Manage Shipping Addresses").address_located?(test_data[:ship_from_address])).to be(true)
end