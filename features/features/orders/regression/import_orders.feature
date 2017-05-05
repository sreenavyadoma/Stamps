
Feature: Import Orders

  Background:
    Given a valid user is signed in to Web Apps

  @import_orders
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

