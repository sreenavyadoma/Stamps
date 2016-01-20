
Feature: Postage Balance

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    Given I am signed in to Orders
    When Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Order Details - Set Service to "Priority Mail Package"
    Then Order Details - Set Insure For to $10.00
    Then Order Details - Set Tracking to "USPS Tracking"
    And Save Shipping Costs Data
    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Print
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    And Sign out

#todo-eva Re-run this test and create jenkins job for it.