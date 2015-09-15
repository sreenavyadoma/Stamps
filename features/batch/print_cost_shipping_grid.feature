
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper ie

  @print_costs @regression
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Click Ship-To Less link
    Then Set Ounces to 1
    Then Set Insured Value to $10.00
    Then Set Service to Priority Mail Small Flat Rate Box
    Then Expect Ship Cost equals Total amount
    And Sign out
