
Feature: Import Updated Orders

  Background:
    Given a valid user is signed in to Web Apps

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
