Feature: Purchasing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt_purchasing
  Scenario: Purchasing $10
    Then Buy Postage: Purchase $10
    Then Buy Postage: Expect customer balance increased by $10
    Then Buy Postage: Purchase $25
    Then Buy Postage: Expect customer balance increased by $25
    Then Buy Postage: Purchase $50
    Then Buy Postage: Expect customer balance increased by $50
    Then Buy Postage: Purchase $100
    Then Buy Postage: Expect customer balance increased by $100
    Then Buy Postage: Purchase $35
    Then Buy Postage: Expect customer balance increased by $35
    Then Sign out
