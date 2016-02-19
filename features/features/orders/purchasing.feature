
Feature: Purchasing

  Background:
    Given I am signed in to Orders

  @purchasing
  Scenario:
    Then Purchase Postage for $10
    Then Expect $10 is added to customer balance
    Then Purchase Postage for $25
    Then Expect $25 is added to customer balance
    Then Purchase Postage for $50
    Then Expect $50 is added to customer balance
    Then Purchase Postage for $100
    Then Expect $100 is added to customer balance
    Then Purchase Postage for $35
    Then Expect $35 is added to customer balance
    Then Sign out



