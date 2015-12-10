
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in to Orders as ff

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Ounces to 1
    Then Set Order Details Insured Value to $10.00
    Then Set Order Details Service to "Priority Mail Small Flat Rate Box"
    Then Expect Ship Cost equals Total amount
    And Sign out
