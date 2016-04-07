
Feature: Postage Balance

  @postage_balance_update
  Scenario: Update Postage Balance After Each Print
    Given I am signed in to Orders
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Hide Ship-To fields
    Then Details: Set Pounds to 1
    Then Details: Set Service to "Priority Mail Package"
    Then Details: Set Insure-For to $10.00
    Then Details: Set Tracking to "USPS Tracking"
    Then Pause for 1 second
    Then Save Shipping Costs Data
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Pause for 3 seconds
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    Then Sign out
