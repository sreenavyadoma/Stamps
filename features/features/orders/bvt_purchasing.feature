
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @orders_bvt_purchasing
  Scenario: Purchasing $10
    Then Purchase Postage for $10
    Then Expect $10 is added to customer balance
    Then Sign out

