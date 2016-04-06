
Feature: ORDERS-24 ShipStation Orders Should Import with a Ship From Address
  Overview
  For users with more than one Ship From address, orders are being imported from ShipStation without a Ship From value. This is because we are not setting a Ship From as the default.
  We will fix this by marking a Ship From address as default on ShipStation.
  User changes their default Ship From on SDC and SS
  User changes their default Ship From in SDC (this is the top-most Ship From address in the Manage Shipping Addresses dialog.
  System sets the SS default Ship From address to the same address.
  Subsequently-imported orders will include the new default Ship From address.

  Background:
    Given I am signed in to Orders

  @import_orders_ship_from_test
  Scenario:  Import Orders
    Then Toolbar: Import
    Then Import Orders: Cancel
    Then Toolbar: Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_ship_from_test.csv
    Then Pause for 2 seconds
    Then Import Orders: Import
    Then Pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then Pause for 1 second
    Then Sign out
    Then Pause for 1 second

