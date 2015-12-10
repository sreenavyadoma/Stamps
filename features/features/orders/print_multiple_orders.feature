
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders @print
  Scenario:  Print 2 Orders
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Medium Flat Rate Box"
    Then Set Order Details Ounces to 1

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Medium Flat Rate Box"
    Then Set Order Details Ounces to 1

    And Edit row 1 on the order grid
    And Edit row 2 on the order grid

    Then Print
    And Sign out
