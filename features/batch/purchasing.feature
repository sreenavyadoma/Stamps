
Feature: Purchasing

  Background:
    Given I am signed in as a batch shipper

  @purchasing
  Scenario: $10
    * Buy $10 postage
    * Expect $10 is added to customer balance
    * Buy $25 postage
    * Expect $25 is added to customer balance
    * Buy $50 postage
    * Expect $50 is added to customer balance
    * Buy $100 postage
    * Expect $100 is added to customer balance
    * Buy $35 postage
    * Expect $35 is added to customer balance
    * Sign out






