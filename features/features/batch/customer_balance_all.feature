
Feature: Postage Balance

  @update_postage_balance @regression @regression
  Scenario: Update Postage Balance After Each Print
    Given I am signed in as a batch shipper
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Service to "Priority Mail Package"
    Then Set single-order form Insured Value to $10.00
    Then Set single-order form Tracking to "USPS Tracking"
    And Save Shipping Costs Data
    Then Print
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    And Sign out

