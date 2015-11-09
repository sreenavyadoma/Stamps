
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper ff

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    And I Add a new order
    Then Set Order Form Ship-From to default
    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields
    Then Set Order Form Ounces to 1
    Then Set Order Form Insured Value to $10.00
    Then Set Order Form Service to "Priority Mail Small Flat Rate Box"
    Then Expect Ship Cost equals Total amount
    And Sign out
