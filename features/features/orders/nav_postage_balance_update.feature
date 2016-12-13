
Feature: Mail Balance

  @nav_postage_balance_update
  Scenario: Update Mail Balance After Each Print
    Given I am signed in to Orders
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Set Pounds to 1
    Then Details: Select Service Priority Mail Package
    Then Details: Set Insure-For to $10.00
    Then Details: Set Tracking to USPS Tracking
    Then Pause for 1 second
    Then Save Shipping Costs Data
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Pause for 3 seconds
    Then NavBar: Expect Customer Balance is deducted the Printing Cost
    Then Sign out
