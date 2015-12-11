
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    And Hide Order Details Form Ship-To fields
    Then Set Order Details Form Ounces to 1
    Then Set Order Details Form Insured Value to $10.00
    Then Set Order Details Form Service to "Priority Mail Small Flat Rate Box"
    Then Expect Ship Cost equals Total amount
    And Sign out
