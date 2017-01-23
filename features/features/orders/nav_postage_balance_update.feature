
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given I am signed in to Orders
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Pounds to 1
    Then Order Details: Select Service PM Package
    Then Order Details: Set Insure-For to $10.00
    Then Order Details: Set Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Test Data
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
