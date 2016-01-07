
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders @print
  Scenario:  Print 2 Orders
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1

    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1

    And Edit row 1 on the Orders Grid
    And Edit row 2 on the Orders Grid

    Then Print
    And Sign out
