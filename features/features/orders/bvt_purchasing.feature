
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @orders_bvt_purchasing
  Scenario: Purchasing $10
    Then Purchasing: Purchase Postage for $10
    Then Purchasing: Expect customer balance increased by $10
    Then Sign out

