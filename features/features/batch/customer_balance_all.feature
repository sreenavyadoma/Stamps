
Feature: Postage Balance

  @update_postage_balance
  Scenario: Update Postage Balance After Each Print
    Given I am signed in as a batch shipper
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Service to "Priority Mail Package"
    Then Set Order Form Insured Value to $10.00
    Then Set Order Form Tracking to "USPS Tracking"
    And Save Shipping Costs Data
    Then Print
    Then Expect Printing cost is deducted from customer balance if there were no printing errors
    And Sign out

