@regression
Feature: B-01634 As a batch shipper, I want to be able to print postage for multiple orders

  Background:
    Given I am signed in as a batch shipper

  @print_multiple_orders
  Scenario:  Print 2 Orders
    And I Add a new order
    And I Add a second order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Service to Priority Mail Package

    And I Add a new order
    Then Set Ship From to default
    Then Set Ship-To address to random
    And Collapse Ship-To Address
    Then Set Service to Priority Mail Package

    And Edit row 1 on the order grid
    And Edit row 2 on the order grid
    Then Expect 2 orders selected
    Then Print
    And Sign out