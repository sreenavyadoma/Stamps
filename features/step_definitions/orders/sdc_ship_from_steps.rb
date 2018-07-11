
Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Ship-From address (\w+)$/ do |address|
  # pending
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal, delete all addresses$/ do
  step 'Open Manage Shipping Address modal'
  step 'On Manage Shipping Address modal, delete all rows'
  step 'Close Manage Shipping Address modal'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal, delete all rows$/ do
  while SdcOrders.modals.manage_shipping_addresses.addresses.count > 1 do
    step "On Manage Shipping Address modal, delete row #{1}"
  end
  step 'Expect Manage Shipping Address all rows deleted'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal, delete row (\d)$/ do |row_num|
  address_count = SdcOrders.modals.manage_shipping_addresses.addresses.count
  step "On Manage Shipping Address modal select row #{row_num}"
  step 'On Manage Shipping Address modal click delete button'
  step 'On Delete Shipping Address modal click delete button'
  expect(SdcOrders.modals.manage_shipping_addresses.addresses.count).to eql(address_count - 1), 'Address hasn\'t been removed!'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal select row (\d)$/ do |row_num|
  SdcOrders.modals.manage_shipping_addresses.address_element(row_num).click
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal click delete button$/ do
  SdcOrders.modals.manage_shipping_addresses.delete.click
  step 'expect Delete Shipping Address modal is present'
end

Then /^[Oo]n [Dd]elete [Ss]hipping [Aa]ddress [Mm]odal click delete button$/ do
  SdcOrders.modals.delete_shipping_address.delete.click
  step 'expect Delete Shipping Address modal is not present'
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress all rows deleted$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.addresses.count).to eql(1)
end

Then /^[Oo]pen [Mm]anage [Ss]hipping [Aa]ddress modal$/ do
  step 'set order details ship-from to Manage Shipping Addresses...'
  step 'expect Manage Shipping Address modal is present'
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress modal is present$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.title).to be_present
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress modal is not present$/ do
  expect(SdcOrders.modals.manage_shipping_addresses.title).not_to be_present
end

Then /^[Ee]xpect Delete [Ss]hipping [Aa]ddress modal is present$/ do
  expect(SdcOrders.modals.delete_shipping_address.title).to be_present
end

Then /^[Ee]xpect Delete [Ss]hipping [Aa]ddress modal is not present$/ do
  SdcOrders.modals.delete_shipping_address.title.wait_while_present(timeout: 3)
  expect(SdcOrders.modals.delete_shipping_address.title).not_to be_present
end

Then /^[Cc]lick [Mm]anage [Ss]hipping [Aa]ddress [Aa]dd button$/ do
  SdcOrders.modals.manage_shipping_addresses.add.click
  step 'expect Add Shipping Address modal is present'
end

Then /^[Ee]xpect [Aa]dd [Ss]hipping [Aa]ddress [Mm]odal is present$/ do
  expect(SdcOrders.modals.add_edit_shipping_address.title).to be_present
end

Then /^[Cc]lose [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal$/ do
  SdcOrders.modals.manage_shipping_addresses.x_btn.click
  step 'expect Manage Shipping Address modal is not present'
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

Then /^on manage shipping address modal, add address$/ do |ship_from|
  TestData.hash[:ship_from_address] = ship_from.hashes.first
  TestData.hash[:ship_from_zip] = TestData.hash[:ship_from_address]['ship_from_zip']
  TestData.hash[:full_name] = TestData.hash[:ship_from_address][:full_name]
  TestData.hash[:company] = TestData.hash[:ship_from_address]['company']
  TestData.hash[:street_address] = TestData.hash[:ship_from_address]['street_address']
  TestData.hash[:street_address2] = TestData.hash[:ship_from_address]['street_address2']
  TestData.hash[:city] = TestData.hash[:ship_from_address]['city']
  TestData.hash[:state] = TestData.hash[:ship_from_address]['state']
  TestData.hash[:zip] = TestData.hash[:ship_from_address]['zip']
  TestData.hash[:phone] = TestData.hash[:ship_from_address][:phone]
  step 'Open Manage Shipping Address modal'
  step 'Click Manage Shipping Address Add button'
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
  step 'Close Manage Shipping Address modal'
end

# this step step def is only for private use - DO NOT use it in any feature file
# address = '90245,Automation,1990 E Grand Avenue,El Segundo,California,90245,United States,4157944522'
Then /^on manage shipping address modal, add address from string (.+)$/ do |ship_from|
  ship_from_zip, company, street_address, city, state, zip, phone = ship_from.split(',')
  TestData.hash[:ship_from_zip] = ship_from_zip
  TestData.hash[:company] = company
  TestData.hash[:street_address] = street_address
  TestData.hash[:city] = city
  TestData.hash[:state] = state
  TestData.hash[:zip] = zip
  TestData.hash[:phone] = phone

  step 'Open Manage Shipping Address modal'
  step 'Click Manage Shipping Address Add button'
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
  step 'Close Manage Shipping Address modal'
end




Then /^[Oo]n Manage Shipping Address modal, add address (\w+)$/ do |address|
  # TestData.hash[:ship_from_address] = address.include?('random ship from zone 1 through 4') ? TestHelper.rand_ship_from_zone_1_4(SdcEnv.env) : address
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