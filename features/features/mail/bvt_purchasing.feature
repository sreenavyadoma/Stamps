Feature: Purchasing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_purchasing
  Scenario: Purchasing $10
    Then Purchasing: Purchase Postage for $10
    Then Purchasing: Expect customer balance increased by $10
    Then Sign out