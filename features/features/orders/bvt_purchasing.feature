
Feature: BVT Purchasing

  Background:
    Given I am signed in to Orders

  @orders_bvt_purchasing
  Scenario: Purchasing $10
    Then Buy Postage: Purchase $10
    Then Buy Postage: Expect customer balance increased by $10
    Then Sign out

