
Feature: Postage Balance

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    Given I am signed in to Orders
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Service to "Priority Mail Package"
    Then Set Order Details Insure For to $10.00
    Then Set Order Details Tracking to "USPS Tracking"
    And Save Shipping Costs Data
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Print
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    And Sign out

#todo-eva Re-run this test and create jenkins job for it.