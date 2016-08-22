
Feature: Purchasing

  Background:
    Given I am signed in to Orders

  @purchasing
  Scenario:
    Then Purchasing: Purchase Postage for $10
    Then Purchasing: Expect customer balance increased by $10
    Then Purchasing: Purchase Postage for $25
    Then Purchasing: Expect customer balance increased by $25
    Then Purchasing: Purchase Postage for $50
    Then Purchasing: Expect customer balance increased by $50
    Then Purchasing: Purchase Postage for $100
    Then Purchasing: Expect customer balance increased by $100
    Then Purchasing: Purchase Postage for $35
    Then Purchasing: Expect customer balance increased by $35
    Then Sign out
