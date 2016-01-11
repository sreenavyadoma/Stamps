
Feature: Print Multiple Orders

  Background:
    Given I am signed in to Orders

  @print_multiple_orders @print
  Scenario:  Print 2 Orders
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1

    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4
    Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Set Order Details Ounces to 1

    And Check Orders Grid row 1
    And Check Orders Grid row 2

    Then Print
    And Sign out
