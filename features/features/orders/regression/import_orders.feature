
@import_orders
Feature: Import Orders

  Background:
    Given a valid user is signed in to Web Apps

  @import_orders_ship_from
  Scenario:  Import Orders
    Then in Orders Toolbar, Import
    Then Import Orders: Cancel
    Then in Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_test_100.csv
    Then pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_test_100.csv
    Then pause for 1 second
    Then Import Orders: Import
    Then pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then pause for 1 second
    Then sign out
    Then pause for 1 second

  @import_orders_ship_from_test
  Scenario:  Import Orders
    Then in Orders Toolbar, Import
    Then Import Orders: Cancel
    Then in Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_ship_from_test.csv
    Then pause for 2 seconds
    Then Import Orders: Import
    Then pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then pause for 1 second
    Then sign out
    Then pause for 1 second

  @import_updated_orders
  Scenario:  Import Updated Orders

    Then Import Orders: Randomize data in import_orders_new.csv
    Then in Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_new.csv
    Then pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_new.csv
    Then pause for 1 second
    Then Import Orders: Import Existing Orders
    Then pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK

    Then pause for 1 second
    Then Import Orders: Expect first 2 orders in CSV file import_orders_new.csv match orders in grid
    Then sign out
    Then pause for 1 second