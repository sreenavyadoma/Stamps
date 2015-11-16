
Feature: Print Multiple Orders

  Background:
    Given I am signed in as batch shipper ff

  @print_multiple_orders @print
  Scenario:  Print 2 Orders
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"

    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"

    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    Then Print
    And Sign out
