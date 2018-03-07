
Then /^[Oo]n [Oo]rder [Dd]etails form, Delete Ship-From address (\w+)$/ do |address|
  # pending
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal, delete all addresses$/ do
  step 'Open Manage Shipping Address modal'
  step 'On Manage Shipping Address modal, delete all rows'
  step 'Close Manage Shipping Address modal'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal, delete all rows$/ do
  while stamps.orders.modals.manage_shipping_addresses.shipping_address_count > 1 do
    step "On Manage Shipping Address modal, delete row #{1}"
  end
  step 'Expect Manage Shipping Address all rows deleted'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal, delete row (\d)$/ do |row_num|
  address_count = stamps.orders.modals.manage_shipping_addresses.shipping_address_count
  step "On Manage Shipping Address modal select row #{row_num}"
  step 'On Manage Shipping Address modal click delete button'
  step 'On Delete Shipping Address modal click delete button'
  expect(stamps.orders.modals.manage_shipping_addresses.shipping_address_count).to eql(address_count - 1), 'Address wasn\'t removed!'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal select row (\d)$/ do |row_num|
  stamps.orders.modals.manage_shipping_addresses.select_row(row_num)
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress modal click delete button$/ do
  stamps.orders.modals.manage_shipping_addresses.delete_row #todo-ORDERSAUTO-3738
  step 'expect Delete Shipping Address modal is present'
end

Then /^[Oo]n [Dd]elete [Ss]hipping [Aa]ddress [Mm]odal click delete button$/ do
  5.times do
    stamps.orders.modals.delete_shipping_address.delete_btn.click
    break unless stamps.orders.modals.delete_shipping_address.present?
  end
  step 'expect Delete Shipping Address modal is not present'
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress all rows deleted$/ do
  expect(stamps.orders.modals.manage_shipping_addresses.shipping_address_count).to eql(1), 'Not all addresses were deleted!'
end

Then /^[Oo]pen [Mm]anage [Ss]hipping [Aa]ddress modal$/ do
  step 'set Order Details Ship-From to Manage Shipping Addresses...'
  step 'expect Manage Shipping Address modal is present'
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress modal is present$/ do
  expect(stamps.orders.modals.manage_shipping_addresses.present?).to be(true), 'Manage Shipping Address modal is not present!'
end

Then /^[Ee]xpect [Mm]anage [Ss]hipping [Aa]ddress modal is not present$/ do
  expect(stamps.orders.modals.manage_shipping_addresses.present?).to be(false), 'Manage Shipping Address modal is present!'
end

Then /^[Ee]xpect Delete [Ss]hipping [Aa]ddress modal is present$/ do
  expect(stamps.orders.modals.delete_shipping_address.present?).to be(true), 'Delete Shipping Address modal is not present!'
end

Then /^[Ee]xpect Delete [Ss]hipping [Aa]ddress modal is not present$/ do
  expect(stamps.orders.modals.delete_shipping_address.present?).to be(false), 'Delete Shipping Address modal is present!'
end

Then /^[Cc]lick [Mm]anage [Ss]hipping [Aa]ddress [Aa]dd button$/ do
  stamps.orders.modals.manage_shipping_addresses.add_button.click
  step 'expect Add Shipping Address modal is present'
end

Then /^[Ee]xpect [Aa]dd [Ss]hipping [Aa]ddress [Mm]odal is present$/ do
  expect(stamps.orders.modals.add_shipping_address.present?).to be(true), 'Add Shipping Address modal is not present!'
end

Then /^[Cc]lose [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal$/ do
  stamps.orders.modals.manage_shipping_addresses.close_window
  step 'expect Manage Shipping Address modal is not present'
end

Then /^[Oo]n [Mm]anage [Ss]hipping [Aa]ddress [Mm]odal, edit address for name=\"(.*)\", company=\"(.*)\" and city=\"(.*)\" to:$/ do |name, company, city, new_address|
  step 'set Order Details Ship-From to Manage Shipping Addresses...'
  row_num = stamps.orders.modals.manage_shipping_addresses.locate_ship_from(name, company, city)
  if row_num > 0
    stamps.orders.modals.manage_shipping_addresses.select_row(row_num)
    15.times do
      stamps.orders.modals.manage_shipping_addresses.edit_button.click
    end
  else
    raise 'Can\'t select address!'
  end
  stamps.orders.modals.add_shipping_address.ship_from_address(new_address.hashes.first)
end

Then /^[Aa]dd random Ship-from address from (.*)$/ do |address|
  test_param[:ship_from_address] = TestHelper.address_helper_zone(address, modal_param.test_env)
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add.ship_from_address(test_param[:ship_from_address])
end

Then /^[Oo]n Manage Shipping Address modal, add address$/ do |ship_from|
  test_param[:ship_from_address]=ship_from.hashes.first
  test_param[:ship_from_zip]=test_param[:ship_from_address]['ship_from_zip']
  test_param[:full_name]=test_param[:ship_from_address][:full_name]
  test_param[:company]=test_param[:ship_from_address]['company']
  test_param[:street_address]=test_param[:ship_from_address]['street_address']
  test_param[:street_address2]=test_param[:ship_from_address]['street_address2']
  test_param[:city]=test_param[:ship_from_address]['city']
  test_param[:state]=test_param[:ship_from_address]['state']
  test_param[:zip]=test_param[:ship_from_address]['zip']
  test_param[:phone]=test_param[:ship_from_address][:phone]
  step 'Open Manage Shipping Address modal'
  step 'Click Manage Shipping Address Add button'
  stamps.orders.modals.add_shipping_address.ship_from_address(test_param[:ship_from_address])
  step 'Close Manage Shipping Address modal'
end

Then /^[Oo]n Manage Shipping Address modal, add address (\w+)$/ do |address|
  test_param[:ship_from_address] = address.include?('random ship from zone 1 through 4') ? TestHelper.rand_ship_from_zone_1_4(modal_param.test_env) : address
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add(test_param[:ship_from_address])
end

Then /^[Oo]n Manage Shipping Address modal, set Manage Shipping Addresses to$/ do
  stamps.orders.order_details.single_ship_from.select('Manage Shipping Addresses').add table.hashes.first
end

Then /^[Oo]n Manage Shipping Address modal, expect selection has (.*)$/ do |address|
  step "blur out on Order Details form"
  #stamps.orders.order_details.single_ship_from.select("Manage Shipping Addresses").address_located?(test_data[:ship_from_address])).to be(true)
end