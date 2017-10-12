
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
    Then Pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_test_100.csv
    Then Pause for 1 second
    Then Import Orders: Import
    Then Pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then Pause for 1 second
    Then Sign out
    Then Pause for 1 second


  @import_orders_ship_from_test
  Scenario:  Import Orders
    Then in Orders Toolbar, Import
    Then Import Orders: Cancel
    Then in Orders Toolbar, Import
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


  @import_updated_orders
  Scenario:  Import Updated Orders

    Then Import Orders: Randomize data in import_orders_new.csv
    Then in Orders Toolbar, Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_new.csv
    Then Pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_new.csv
    Then Pause for 1 second
    Then Import Orders: Import Existing Orders
    Then Pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK

    Then Pause for 1 second
    Then Import Orders: Expect first 2 orders in CSV file import_orders_new.csv match orders in grid
    Then Sign out
    Then Pause for 1 second