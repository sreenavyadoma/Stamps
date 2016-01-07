Feature: Purchasing BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @buy_postage
  Scenario: Purchasing $10
    And Buy $10 postage
    Then Expect $10 is added to customer balance
    And Sign out