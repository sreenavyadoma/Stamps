
Feature: Postage Balance

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    Given I am signed in to Orders
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Hide Ship-To fields
    Then Order Details: Set Pounds to 1
    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Set Insure For to $10.00
    Then Order Details: Set Tracking to "USPS Tracking"
    Then Pause for 1 seconds
    Then Save Shipping Costs Data
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Toolbar: Print
    Then Pause for 3 seconds
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    Then Sign out
