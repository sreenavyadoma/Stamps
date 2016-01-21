@bvt
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @bvt_purchasing
  Scenario: Purchasing $10
    And Purchase Postage for $10
    Then Expect $10 is added to customer balance
    And Sign out