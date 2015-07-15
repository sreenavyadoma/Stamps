
Feature: Purchasing

  Background:
    Given I am signed in as a batch shipper


  Scenario: $20
    * Expect $10 is added to customer balance
    * Buy $25 postage
    * Expect $25 is added to customer balance
    * Buy $50 postage
    * Expect $50 is added to customer balance
    * Buy $100 postage
    * Expect $100 is added to customer balance
    * Buy $150 postage
    * Expect $150 is added to customer balance

  @purchasing10
  Scenario: $10
    * Buy ten postage
    * Expect $10 is added to customer balance

