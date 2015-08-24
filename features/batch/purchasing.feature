@regression
Feature: Purchasing

  Background:
    Given I am signed in as a batch shipper auto30/password1

  @purchasing
  Scenario:
    And Buy $10 postage
    Then Expect $10 is added to customer balance
    * Buy $25 postage
    Then Expect $25 is added to customer balance
    * Buy $50 postage
    Then Expect $50 is added to customer balance
    * Buy $100 postage
    Then Expect $100 is added to customer balance
    * Buy $35 postage
    Then Expect $35 is added to customer balance
    And Sign out






