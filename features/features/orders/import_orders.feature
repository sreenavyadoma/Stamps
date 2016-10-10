
Feature: Import Orders

  Background:
    Given I am signed in to Orders

  @import_orders
  Scenario:  Import Orders
    Then Toolbar: Import
    #Then Import Orders: Download sample file
    Then Import Orders: Cancel
    Then Toolbar: Import
    Then Import Orders: Select CSV File
    Then Import Orders: File Upload: Set Filename to import_orders_test.csv
    Then Pause for 1 second
    Then Import Orders: Expect Imported Filename is import_orders_test.csv
    Then Pause for 1 second
    Then Import Orders: Import
    Then Pause for 1 second
    Then Import Orders: Expect Import is successful
    Then Import Orders: Success: OK
    Then Pause for 1 second
    Then Sign out
    Then Pause for 1 second

