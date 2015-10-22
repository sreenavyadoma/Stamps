
Feature: Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper ff

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    And Hide single-order form Ship-To fields
    Then Set single-order form Ounces to 1
    Then Set single-order form Insured Value to $10.00
    Then Set single-order form Service to "Priority Mail Small Flat Rate Box"
    Then Expect Ship Cost equals Total amount
    And Sign out
