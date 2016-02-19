Feature: Purchasing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_purchasing
  Scenario: Purchasing $10
    Then Purchase Postage for $10
    Then Expect $10 is added to customer balance
    Then Sign out