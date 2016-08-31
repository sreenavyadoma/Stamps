Feature: Purchasing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt_purchasing
  Scenario: Purchasing $10
    Then Buy Mail: Purchase $10
    Then Buy Mail: Expect customer balance increased by $10
    Then Buy Mail: Purchase $25
    Then Buy Mail: Expect customer balance increased by $25
    Then Buy Mail: Purchase $50
    Then Buy Mail: Expect customer balance increased by $50
    Then Buy Mail: Purchase $100
    Then Buy Mail: Expect customer balance increased by $100
    Then Buy Mail: Purchase $35
    Then Buy Mail: Expect customer balance increased by $35
    Then Sign out
