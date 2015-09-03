
Feature: BVT - Purchasing

  Background:
    Given I am signed in as a batch shipper auto30/password1

  @bvt_purchasing
  Scenario: Purchasing $10
    And Buy $10 postage
    Then Expect $10 is added to customer balance
    And Sign out